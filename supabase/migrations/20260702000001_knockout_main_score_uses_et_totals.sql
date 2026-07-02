-- Knockout main-score bets compare against cumulative ET totals when saved.
-- Group-stage bets keep using regulation scores (goals_home / goals_away).

CREATE OR REPLACE VIEW public.v_prediction_match_points
WITH (security_invoker = false) AS
WITH weights AS (
  SELECT
    COALESCE(MAX(points) FILTER (WHERE rule_key = 'exact_score'), 0) AS pts_exact,
    COALESCE(MAX(points) FILTER (WHERE rule_key = 'goal_difference'), 0) AS pts_diff,
    COALESCE(MAX(points) FILTER (WHERE rule_key = 'winner'), 0) AS pts_winner,
    COALESCE(MAX(points) FILTER (WHERE rule_key = 'first_goal_minute'), 0) AS pts_first_goal,
    COALESCE(MAX(points) FILTER (WHERE rule_key = 'extra_time'), 0) AS pts_extra_time
  FROM public.scoring_rules
),
base AS (
  SELECT
    p.id_pool,
    p.id_match,
    m.id_round,
    vr.goals_home,
    vr.goals_away,
    p.goals_home AS pred_home,
    p.goals_away AS pred_away,
    w.pts_exact,
    w.pts_diff,
    w.pts_winner,
    w.pts_first_goal,
    w.pts_extra_time,
    CASE
      WHEN m.id_round > 1
        AND vr.goals_home_et IS NOT NULL
        AND vr.goals_away_et IS NOT NULL
      THEN vr.goals_home_et
      ELSE vr.goals_home
    END AS act_home,
    CASE
      WHEN m.id_round > 1
        AND vr.goals_home_et IS NOT NULL
        AND vr.goals_away_et IS NOT NULL
      THEN vr.goals_away_et
      ELSE vr.goals_away
    END AS act_away,
    vr.first_goal_minute_range,
    p.first_goal_minute,
    p.extra_time,
    vr.goals_home_et,
    vr.goals_away_et,
    vr.pens_home,
    vr.pens_away
  FROM public.predictions p
  JOIN public.matches m ON m.id_match = p.id_match
  JOIN public.v_results vr ON vr.id_match = p.id_match
  CROSS JOIN weights w
),
scored AS (
  SELECT
    id_pool,
    id_match,
    id_round,
    pts_exact,
    pts_diff,
    pts_winner,
    CASE
      WHEN goals_home IS NULL OR goals_away IS NULL THEN 0
      WHEN pred_home IS NULL OR pred_away IS NULL THEN 0
      WHEN pred_home = act_home AND pred_away = act_away THEN pts_exact
      WHEN (pred_home - pred_away) = (act_home - act_away) THEN pts_diff
      WHEN (
        CASE
          WHEN pred_home > pred_away THEN 'home'
          WHEN pred_home < pred_away THEN 'away'
          ELSE 'draw'
        END
      ) = (
        CASE
          WHEN act_home > act_away THEN 'home'
          WHEN act_home < act_away THEN 'away'
          ELSE 'draw'
        END
      ) THEN pts_winner
      ELSE 0
    END::smallint AS main_points,
    CASE
      WHEN first_goal_minute IS NOT NULL
        AND first_goal_minute_range IS NOT NULL
        AND first_goal_minute = first_goal_minute_range
      THEN pts_first_goal
      ELSE 0
    END::smallint AS first_goal_points,
    CASE
      WHEN id_round > 1
        AND extra_time IS NOT NULL
        AND goals_home IS NOT NULL
        AND extra_time = public.match_went_to_extra_time(
          goals_home,
          goals_away,
          goals_home_et,
          goals_away_et,
          pens_home,
          pens_away
        )
      THEN pts_extra_time
      ELSE 0
    END::smallint AS extra_time_points
  FROM base
)
SELECT
  id_pool,
  id_match,
  id_round,
  main_points,
  first_goal_points,
  extra_time_points,
  (main_points + first_goal_points + extra_time_points)::smallint AS match_points,
  (main_points = pts_exact AND main_points > 0) AS is_exact_hit,
  (main_points = pts_diff AND main_points > 0) AS is_goal_diff_hit,
  (main_points = pts_winner AND main_points > 0) AS is_winner_hit
FROM scored;

COMMENT ON VIEW public.v_prediction_match_points IS
  'Per-match scoring for leaderboard. Knockout main bets use ET cumulative totals when saved.';

GRANT SELECT ON public.v_prediction_match_points TO authenticated;
