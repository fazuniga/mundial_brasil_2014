-- Restrict extra_time side-bet scoring to knockout matches (id_round > 1)

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
    vr.id_round > 1
    AND p.extra_time IS NOT NULL
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

GRANT SELECT ON public.v_prediction_side_bets TO anon, authenticated;

-- Clear stale extra_time predictions on group-stage fixtures
UPDATE public.predictions p
SET extra_time = NULL
FROM public.matches m
WHERE m.id_match = p.id_match
  AND m.id_round = 1
  AND p.extra_time IS NOT NULL;
