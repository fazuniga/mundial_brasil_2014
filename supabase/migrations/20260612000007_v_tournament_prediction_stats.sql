-- Pool-wide aggregates for Apuestas Especiales (campeón, goleador, goles).
-- security_invoker=false: same pattern as v_match_prediction_stats.

CREATE OR REPLACE VIEW public.v_tournament_winner_bet_stats
WITH (security_invoker = false) AS
SELECT
  tp.winner_team_id AS team_id,
  t.country AS team_country,
  t.code AS team_code,
  COUNT(*)::int AS bet_count
FROM public.tournament_predictions tp
JOIN public.teams t ON t.id_team = tp.winner_team_id
WHERE tp.winner_team_id IS NOT NULL
GROUP BY tp.winner_team_id, t.country, t.code;

GRANT SELECT ON public.v_tournament_winner_bet_stats TO anon, authenticated;

COMMENT ON VIEW public.v_tournament_winner_bet_stats IS
  'Per-team champion bet counts from tournament_predictions (pool-wide aggregate).';

CREATE OR REPLACE VIEW public.v_tournament_top_scorer_bet_stats
WITH (security_invoker = false) AS
SELECT
  tp.top_scorer_player_id AS player_id,
  p.name AS player_name,
  t.country AS team_country,
  t.code AS team_code,
  COUNT(*)::int AS bet_count
FROM public.tournament_predictions tp
JOIN public.players p ON p.id_player = tp.top_scorer_player_id
JOIN public.teams t ON t.id_team = p.id_team
WHERE tp.top_scorer_player_id IS NOT NULL
GROUP BY tp.top_scorer_player_id, p.name, t.country, t.code;

GRANT SELECT ON public.v_tournament_top_scorer_bet_stats TO anon, authenticated;

COMMENT ON VIEW public.v_tournament_top_scorer_bet_stats IS
  'Per-player top scorer bet counts from tournament_predictions (pool-wide aggregate).';

CREATE OR REPLACE VIEW public.v_tournament_goals_bet_stats
WITH (security_invoker = false) AS
SELECT
  tp.top_scorer_goals AS goals,
  COUNT(*)::int AS bet_count
FROM public.tournament_predictions tp
WHERE tp.top_scorer_goals IS NOT NULL
GROUP BY tp.top_scorer_goals;

GRANT SELECT ON public.v_tournament_goals_bet_stats TO anon, authenticated;

COMMENT ON VIEW public.v_tournament_goals_bet_stats IS
  'Per-goal-count top scorer goals bet counts from tournament_predictions (pool-wide aggregate).';

CREATE OR REPLACE VIEW public.v_tournament_prediction_stats_summary
WITH (security_invoker = false) AS
SELECT
  COUNT(*) FILTER (WHERE tp.winner_team_id IS NOT NULL)::int AS winner_bet_count,
  COUNT(*) FILTER (WHERE tp.top_scorer_player_id IS NOT NULL)::int AS top_scorer_bet_count,
  COUNT(*) FILTER (WHERE tp.top_scorer_goals IS NOT NULL)::int AS goals_bet_count
FROM public.tournament_predictions tp;

GRANT SELECT ON public.v_tournament_prediction_stats_summary TO anon, authenticated;

COMMENT ON VIEW public.v_tournament_prediction_stats_summary IS
  'Total Apuestas Especiales counts per field (pool-wide aggregate).';
