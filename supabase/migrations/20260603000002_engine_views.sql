-- Tournament engine views (2026 format). security_invoker so RLS applies.

CREATE OR REPLACE FUNCTION public.minute_to_first_goal_range(minute int)
RETURNS text
LANGUAGE sql
IMMUTABLE
AS $$
  SELECT CASE
    WHEN minute IS NULL THEN NULL
    WHEN minute BETWEEN 451 AND 459 THEN '45+_1T'
    WHEN minute BETWEEN 901 AND 909 THEN '90+_2T'
    WHEN minute <= 15 THEN '0-15'
    WHEN minute <= 30 THEN '16-30'
    WHEN minute <= 45 THEN '31-45'
    WHEN minute <= 60 THEN '46-60'
    WHEN minute <= 75 THEN '61-75'
    WHEN minute <= 90 THEN '76-90'
    WHEN minute > 90 THEN '90+_2T'
    ELSE NULL
  END;
$$;

-- Core match results with winner logic (from vw_results)
CREATE OR REPLACE VIEW public.v_results
WITH (security_invoker = true) AS
SELECT
  m.id_match,
  m.id_round,
  COALESCE(g.group_code::text, '') AS group_code,
  th.id_team AS home_team_id,
  th.country AS home_country,
  th.code AS home_code,
  ta.id_team AS away_team_id,
  ta.country AS away_country,
  ta.code AS away_code,
  mr.goals_home,
  mr.goals_away,
  mr.goals_home_pt,
  mr.goals_away_pt,
  mr.goals_home_et,
  mr.goals_away_et,
  mr.pens_home,
  mr.pens_away,
  mr.first_goal_minute,
  mr.first_goal_player_id,
  pl.name AS first_goal_player_name,
  CASE WHEN mr.goals_home IS NULL THEN NULL
    WHEN mr.goals_home > mr.goals_away THEN 3
    WHEN mr.goals_home = mr.goals_away THEN 1
    ELSE 0 END AS points_home,
  CASE WHEN mr.goals_away IS NULL THEN NULL
    WHEN mr.goals_home < mr.goals_away THEN 3
    WHEN mr.goals_home = mr.goals_away THEN 1
    ELSE 0 END AS points_away,
  CASE
    WHEN m.id_round = 1 AND mr.goals_home > mr.goals_away THEN th.country
    WHEN m.id_round = 1 AND mr.goals_home = mr.goals_away THEN 'Draw'
    WHEN m.id_round = 1 AND mr.goals_home < mr.goals_away THEN ta.country
    WHEN m.id_round > 1 AND mr.goals_home > mr.goals_away THEN th.country
    WHEN m.id_round > 1 AND mr.goals_home < mr.goals_away THEN ta.country
    WHEN m.id_round > 1 AND mr.goals_home = mr.goals_away THEN
      CASE
        WHEN COALESCE(mr.goals_home_et, 0) > COALESCE(mr.goals_away_et, 0) THEN th.country
        WHEN COALESCE(mr.goals_home_et, 0) < COALESCE(mr.goals_away_et, 0) THEN ta.country
        WHEN COALESCE(mr.goals_home_et, 0) = COALESCE(mr.goals_away_et, 0) THEN
          CASE
            WHEN COALESCE(mr.pens_home, 0) > COALESCE(mr.pens_away, 0) THEN th.country
            WHEN COALESCE(mr.pens_home, 0) < COALESCE(mr.pens_away, 0) THEN ta.country
          END
      END
  END AS winner_country,
  public.minute_to_first_goal_range(mr.first_goal_minute) AS first_goal_minute_range
FROM public.matches m
JOIN public.rounds r ON r.id_round = m.id_round
JOIN public.teams th ON th.id_team = m.home_team_id
JOIN public.teams ta ON ta.id_team = m.away_team_id
LEFT JOIN public.groups g ON g.id_group = m.id_group
LEFT JOIN public.match_results mr ON mr.id_match = m.id_match
LEFT JOIN public.players pl ON pl.id_player = mr.first_goal_player_id;

-- Per-team group stage stats (from vw_results_by_group_tmp chain)
CREATE OR REPLACE VIEW public.v_group_standings_detail
WITH (security_invoker = true) AS
SELECT
  g.group_code,
  t.id_team,
  t.country AS team_name,
  t.code AS team_code,
  COUNT(*) FILTER (WHERE vr.goals_home IS NOT NULL) AS played,
  COUNT(*) FILTER (WHERE
    (vr.home_team_id = t.id_team AND vr.goals_home > vr.goals_away)
    OR (vr.away_team_id = t.id_team AND vr.goals_away > vr.goals_home)) AS wins,
  COUNT(*) FILTER (WHERE vr.goals_home = vr.goals_away AND vr.goals_home IS NOT NULL) AS draws,
  COUNT(*) FILTER (WHERE
    (vr.home_team_id = t.id_team AND vr.goals_home < vr.goals_away)
    OR (vr.away_team_id = t.id_team AND vr.goals_away < vr.goals_home)) AS losses,
  SUM(CASE
    WHEN vr.home_team_id = t.id_team THEN COALESCE(vr.goals_home, 0)
    ELSE COALESCE(vr.goals_away, 0) END) AS goals_for,
  SUM(CASE
    WHEN vr.home_team_id = t.id_team THEN COALESCE(vr.goals_away, 0)
    ELSE COALESCE(vr.goals_home, 0) END) AS goals_against
FROM public.teams t
JOIN public.groups g ON g.id_group = t.id_group
JOIN public.v_results vr ON vr.id_round = 1
  AND (vr.home_team_id = t.id_team OR vr.away_team_id = t.id_team)
GROUP BY g.group_code, t.id_team, t.country, t.code;

CREATE OR REPLACE VIEW public.v_group_standings
WITH (security_invoker = true) AS
SELECT
  group_code,
  id_team,
  team_name,
  team_code,
  played,
  wins,
  draws,
  losses,
  goals_for,
  goals_against,
  goals_for - goals_against AS goal_diff,
  wins * 3 + draws AS points
FROM public.v_group_standings_detail;

-- 1st and 2nd per group (replaces vw_octavos_de_final_uno UNION ALL)
CREATE OR REPLACE VIEW public.v_qualified_top_two
WITH (security_invoker = true) AS
WITH ranked AS (
  SELECT
    gs.*,
    ROW_NUMBER() OVER (
      PARTITION BY gs.group_code
      ORDER BY gs.points DESC, gs.goal_diff DESC, gs.goals_for DESC, gs.id_team
    ) AS pos
  FROM public.v_group_standings gs
)
SELECT
  group_code,
  team_name AS country,
  id_team,
  team_code AS code,
  CASE WHEN pos = 1 THEN 'Primero ' || group_code ELSE 'Segundo ' || group_code END AS slot_label
FROM ranked
WHERE pos <= 2;

-- 8 best third places (new for 2026)
CREATE OR REPLACE VIEW public.v_best_third_places
WITH (security_invoker = true) AS
WITH ranked AS (
  SELECT
    gs.*,
    ROW_NUMBER() OVER (
      PARTITION BY gs.group_code
      ORDER BY gs.points DESC, gs.goal_diff DESC, gs.goals_for DESC, gs.id_team
    ) AS pos
  FROM public.v_group_standings gs
),
thirds AS (
  SELECT * FROM ranked WHERE pos = 3
),
best AS (
  SELECT
    *,
    ROW_NUMBER() OVER (
      ORDER BY points DESC, goal_diff DESC, goals_for DESC, id_team
    ) AS rank_among_thirds
  FROM thirds
)
SELECT
  group_code,
  team_name AS country,
  id_team,
  team_code AS code,
  'Mejor Tercero ' || group_code AS slot_label
FROM best
WHERE rank_among_thirds <= 8;

-- All group-phase qualifiers for knockout slot resolution
CREATE OR REPLACE VIEW public.v_group_qualifiers
WITH (security_invoker = true) AS
SELECT group_code, country, id_team, code, slot_label FROM public.v_qualified_top_two
UNION ALL
SELECT group_code, country, id_team, code, slot_label FROM public.v_best_third_places;

-- Fixture with lock window (enabled): 60 min before kickoff (from vw_fixture)
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
    WHEN EXTRACT(EPOCH FROM (
      (m.match_date + m.match_time) AT TIME ZONE 'America/New_York' - now()
    )) / 60 < 60 THEN false
    ELSE true
  END AS predictions_open
FROM public.matches m
JOIN public.rounds r ON r.id_round = m.id_round
JOIN public.venues v ON v.id_venue = m.id_venue
JOIN public.teams th ON th.id_team = m.home_team_id
JOIN public.teams ta ON ta.id_team = m.away_team_id
LEFT JOIN public.groups g ON g.id_group = m.id_group;

-- Round of 32 with placeholders resolved to real teams (id_round = 2 in 2026)
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
  f.predictions_open
FROM public.v_fixture f
JOIN public.matches m ON m.id_match = f.id_match
JOIN public.knockout_slots ks_home ON ks_home.id_slot = m.home_slot_id
JOIN public.v_group_qualifiers gq_home ON gq_home.slot_label = ks_home.label
JOIN public.knockout_slots ks_away ON ks_away.id_slot = m.away_slot_id
JOIN public.v_group_qualifiers gq_away ON gq_away.slot_label = ks_away.label
WHERE f.id_round = 2;

CREATE OR REPLACE VIEW public.v_prediction_side_bets
WITH (security_invoker = true) AS
SELECT
  p.id_pool,
  p.id_match,
  vr.first_goal_minute_range AS actual_first_goal_range,
  p.first_goal_minute AS predicted_first_goal_range,
  (
    p.first_goal_minute IS NOT NULL
    AND vr.first_goal_minute_range IS NOT NULL
    AND p.first_goal_minute = vr.first_goal_minute_range
  ) AS first_goal_minute_hit,
  (
    p.extra_time IS NOT NULL
    AND vr.goals_home IS NOT NULL
    AND p.extra_time = (
      COALESCE(vr.goals_home_et, 0) <> COALESCE(vr.goals_home, 0)
      OR COALESCE(vr.goals_away_et, 0) <> COALESCE(vr.goals_away, 0)
      OR COALESCE(vr.pens_home, 0) > 0
      OR COALESCE(vr.pens_away, 0) > 0
    )
  ) AS extra_time_hit
FROM public.predictions p
JOIN public.v_results vr ON vr.id_match = p.id_match;

GRANT SELECT ON public.v_results TO anon, authenticated;
GRANT SELECT ON public.v_group_standings TO anon, authenticated;
GRANT SELECT ON public.v_qualified_top_two TO anon, authenticated;
GRANT SELECT ON public.v_best_third_places TO anon, authenticated;
GRANT SELECT ON public.v_group_qualifiers TO anon, authenticated;
GRANT SELECT ON public.v_fixture TO anon, authenticated;
GRANT SELECT ON public.v_round_of_32_teams TO anon, authenticated;
GRANT SELECT ON public.v_prediction_side_bets TO anon, authenticated;
