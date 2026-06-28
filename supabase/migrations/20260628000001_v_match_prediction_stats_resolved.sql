-- Use resolved team names in prediction stats (knockout slots → real countries).

CREATE OR REPLACE VIEW public.v_match_prediction_stats
WITH (security_invoker = false) AS
WITH complete_bets AS (
  SELECT
    p.id_match,
    p.goals_home,
    p.goals_away
  FROM public.predictions p
  WHERE p.goals_home IS NOT NULL
    AND p.goals_away IS NOT NULL
),
agg AS (
  SELECT
    id_match,
    COUNT(*)::int AS bet_count,
    COUNT(*) FILTER (WHERE goals_home > goals_away)::int AS home_win_count,
    COUNT(*) FILTER (WHERE goals_home < goals_away)::int AS away_win_count,
    COUNT(*) FILTER (WHERE goals_home = goals_away)::int AS draw_count,
    COUNT(*) FILTER (WHERE goals_home + goals_away > 0)::int AS with_goals_count,
    COUNT(*) FILTER (WHERE goals_home = 0 AND goals_away = 0)::int AS no_goals_count
  FROM complete_bets
  GROUP BY id_match
)
SELECT
  f.id_match,
  f.id_round,
  f.name_round,
  f.group_code,
  f.dow,
  f.match_date,
  f.match_time,
  f.home_code,
  f.home_country,
  f.away_code,
  f.away_country,
  f.city,
  f.stadium,
  f.round_predictions_enabled,
  f.predictions_open,
  COALESCE(a.bet_count, 0) AS bet_count,
  COALESCE(a.home_win_count, 0) AS home_win_count,
  COALESCE(a.away_win_count, 0) AS away_win_count,
  COALESCE(a.draw_count, 0) AS draw_count,
  COALESCE(a.with_goals_count, 0) AS with_goals_count,
  COALESCE(a.no_goals_count, 0) AS no_goals_count
FROM public.v_fixture_resolved f
LEFT JOIN agg a ON a.id_match = f.id_match
WHERE f.round_predictions_enabled = true;

COMMENT ON VIEW public.v_match_prediction_stats IS
  'Per-match prediction aggregates for all fixtures in rounds with predictions enabled '
  '(round_predictions_enabled), including open and closed. Team names from v_fixture_resolved.';
