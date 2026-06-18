-- Per-match exact score prediction counts for rounds with predictions enabled.
-- security_invoker=false: pool-wide counts for authenticated users.

CREATE OR REPLACE VIEW public.v_match_prediction_score_stats
WITH (security_invoker = false) AS
SELECT
  p.id_match,
  p.goals_home,
  p.goals_away,
  COUNT(*)::int AS bet_count
FROM public.predictions p
INNER JOIN public.v_fixture f ON f.id_match = p.id_match
WHERE f.round_predictions_enabled = true
  AND p.goals_home IS NOT NULL
  AND p.goals_away IS NOT NULL
GROUP BY p.id_match, p.goals_home, p.goals_away;

GRANT SELECT ON public.v_match_prediction_score_stats TO authenticated;

COMMENT ON VIEW public.v_match_prediction_score_stats IS
  'Per-match exact score prediction counts for fixtures in rounds with predictions enabled. '
  'security_invoker=false: pool-wide counts for all authenticated users.';
