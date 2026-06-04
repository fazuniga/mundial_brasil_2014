-- Admin-controlled round gates for match predictions (sequential unlock by phase).

ALTER TABLE public.rounds
  ADD COLUMN IF NOT EXISTS predictions_enabled boolean NOT NULL DEFAULT false;

-- Default: only group stage open for betting
UPDATE public.rounds SET predictions_enabled = (id_round = 1);

DROP VIEW IF EXISTS public.v_round_of_32_teams;

CREATE OR REPLACE VIEW public.v_fixture
WITH (security_invoker = true) AS
SELECT
  m.id_match,
  m.id_round,
  r.name_round,
  COALESCE(g.group_code::text, '') AS group_code,
  TO_CHAR(m.match_date, 'Dy') AS dow,
  m.match_date,
  m.match_time,
  th.code AS home_code,
  th.country AS home_country,
  ta.code AS away_code,
  ta.country AS away_country,
  v.city,
  v.stadium,
  CASE
    WHEN NOT r.predictions_enabled THEN false
    WHEN EXTRACT(EPOCH FROM (
      (m.match_date + m.match_time) AT TIME ZONE 'America/New_York' - now()
    )) / 60 < 60 THEN false
    ELSE true
  END AS predictions_open,
  r.predictions_enabled AS round_predictions_enabled
FROM public.matches m
JOIN public.rounds r ON r.id_round = m.id_round
JOIN public.venues v ON v.id_venue = m.id_venue
JOIN public.teams th ON th.id_team = m.home_team_id
JOIN public.teams ta ON ta.id_team = m.away_team_id
LEFT JOIN public.groups g ON g.id_group = m.id_group;

CREATE OR REPLACE VIEW public.v_round_of_32_teams
WITH (security_invoker = true) AS
SELECT
  f.id_match,
  f.id_round,
  f.group_code,
  f.match_date,
  f.match_time,
  gq_home.id_team AS home_team_id,
  gq_home.code AS home_code,
  gq_home.country AS home_country,
  gq_away.id_team AS away_team_id,
  gq_away.code AS away_code,
  gq_away.country AS away_country,
  f.city,
  f.stadium,
  f.round_predictions_enabled,
  f.predictions_open
FROM public.v_fixture f
JOIN public.matches m ON m.id_match = f.id_match
JOIN public.knockout_slots ks_home ON ks_home.id_slot = m.home_slot_id
JOIN public.v_group_qualifiers gq_home ON gq_home.slot_label = ks_home.label
JOIN public.knockout_slots ks_away ON ks_away.id_slot = m.away_slot_id
JOIN public.v_group_qualifiers gq_away ON gq_away.slot_label = ks_away.label
WHERE f.id_round = 2;

CREATE POLICY "Admins update rounds predictions_enabled"
  ON public.rounds FOR UPDATE TO authenticated
  USING (EXISTS (SELECT 1 FROM public.profiles pr WHERE pr.id = auth.uid() AND pr.is_admin = true))
  WITH CHECK (EXISTS (SELECT 1 FROM public.profiles pr WHERE pr.id = auth.uid() AND pr.is_admin = true));

DROP POLICY IF EXISTS "Predictions insert own pool" ON public.predictions;
CREATE POLICY "Predictions insert own pool" ON public.predictions FOR INSERT TO authenticated
  WITH CHECK (
    EXISTS (SELECT 1 FROM public.pools p WHERE p.id_pool = predictions.id_pool AND p.owner_id = auth.uid())
    AND EXISTS (
      SELECT 1 FROM public.v_fixture f
      WHERE f.id_match = predictions.id_match AND f.predictions_open = true
    )
  );

DROP POLICY IF EXISTS "Predictions update own pool" ON public.predictions;
CREATE POLICY "Predictions update own pool" ON public.predictions FOR UPDATE TO authenticated
  USING (EXISTS (SELECT 1 FROM public.pools p WHERE p.id_pool = predictions.id_pool AND p.owner_id = auth.uid()))
  WITH CHECK (
    EXISTS (SELECT 1 FROM public.pools p WHERE p.id_pool = predictions.id_pool AND p.owner_id = auth.uid())
    AND EXISTS (
      SELECT 1 FROM public.v_fixture f
      WHERE f.id_match = predictions.id_match AND f.predictions_open = true
    )
  );
