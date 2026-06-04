-- Tournament-level top scorer bet; remove per-match first-goal-scorer from predictions.

-- Actual tournament result (admin sets after WC ends)
CREATE TABLE public.tournament_results (
  id smallint PRIMARY KEY DEFAULT 1 CHECK (id = 1),
  top_scorer_player_id smallint REFERENCES public.players (id_player),
  top_scorer_goals smallint,
  updated_at timestamptz NOT NULL DEFAULT now()
);

INSERT INTO public.tournament_results (id) VALUES (1) ON CONFLICT (id) DO NOTHING;

-- One row per pool: user's top scorer prediction
CREATE TABLE public.tournament_predictions (
  id_pool smallint PRIMARY KEY REFERENCES public.pools (id_pool) ON DELETE CASCADE,
  top_scorer_player_id smallint REFERENCES public.players (id_player),
  top_scorer_goals smallint,
  updated_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE public.tournament_results ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.tournament_predictions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read tournament_results"
  ON public.tournament_results FOR SELECT TO anon, authenticated USING (true);

CREATE POLICY "Admins manage tournament_results"
  ON public.tournament_results FOR ALL TO authenticated
  USING (EXISTS (SELECT 1 FROM public.profiles pr WHERE pr.id = auth.uid() AND pr.is_admin = true))
  WITH CHECK (EXISTS (SELECT 1 FROM public.profiles pr WHERE pr.id = auth.uid() AND pr.is_admin = true));

CREATE POLICY "Tournament predictions select own pool"
  ON public.tournament_predictions FOR SELECT TO authenticated
  USING (EXISTS (SELECT 1 FROM public.pools p WHERE p.id_pool = tournament_predictions.id_pool AND p.owner_id = auth.uid()));

CREATE POLICY "Tournament predictions insert own pool"
  ON public.tournament_predictions FOR INSERT TO authenticated
  WITH CHECK (EXISTS (SELECT 1 FROM public.pools p WHERE p.id_pool = tournament_predictions.id_pool AND p.owner_id = auth.uid()));

CREATE POLICY "Tournament predictions update own pool"
  ON public.tournament_predictions FOR UPDATE TO authenticated
  USING (EXISTS (SELECT 1 FROM public.pools p WHERE p.id_pool = tournament_predictions.id_pool AND p.owner_id = auth.uid()))
  WITH CHECK (EXISTS (SELECT 1 FROM public.pools p WHERE p.id_pool = tournament_predictions.id_pool AND p.owner_id = auth.uid()));

-- Lock tournament bet 60 min before first group-stage kickoff (same window as first match predictions_open)
CREATE OR REPLACE VIEW public.v_tournament_bet_open
WITH (security_invoker = true) AS
SELECT COALESCE(
  (
    SELECT f.predictions_open
    FROM public.v_fixture f
    WHERE f.id_match = (SELECT MIN(m.id_match) FROM public.matches m WHERE m.id_round = 1)
  ),
  true
) AS tournament_bet_open;

GRANT SELECT ON public.v_tournament_bet_open TO anon, authenticated;

-- Drop first-goal-scorer columns from match-level predictions
ALTER TABLE public.predictions
  DROP COLUMN IF EXISTS first_goal_player_id,
  DROP COLUMN IF EXISTS first_goal_scorer_name;

-- Scoring rules: replace first_goal_scorer with tournament top scorer
DELETE FROM public.scoring_rules WHERE rule_key = 'first_goal_scorer';

INSERT INTO public.scoring_rules (rule_key, points) VALUES
  ('top_scorer_player', 10),
  ('top_scorer_goals', 15)
ON CONFLICT (rule_key) DO UPDATE SET points = EXCLUDED.points;

-- Enriched player list for UI (group-phase teams only)
CREATE OR REPLACE VIEW public.v_players
WITH (security_invoker = true) AS
SELECT
  p.id_player,
  p.name,
  p.position,
  p.club,
  p.club_country,
  t.id_team,
  t.code AS team_code,
  t.country AS team_country,
  g.group_code
FROM public.players p
JOIN public.teams t ON t.id_team = p.id_team
LEFT JOIN public.groups g ON g.id_group = t.id_group
WHERE t.id_group IS NOT NULL
ORDER BY t.country, p.name;

GRANT SELECT ON public.v_players TO anon, authenticated;
