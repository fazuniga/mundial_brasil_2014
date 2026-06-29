-- Fix extra_time side-bet detection when goals_home_et / goals_away_et are NULL
-- (no extra time). COALESCE(..., 0) incorrectly treated NULL ET totals as 0 and
-- compared them to regulation scores, so "No prórroga" bets never scored +1.

CREATE OR REPLACE FUNCTION public.match_went_to_extra_time(
  goals_home smallint,
  goals_away smallint,
  goals_home_et smallint,
  goals_away_et smallint,
  pens_home smallint,
  pens_away smallint
)
RETURNS boolean
LANGUAGE sql
IMMUTABLE
AS $$
  SELECT
    (
      goals_home_et IS NOT NULL
      AND goals_away_et IS NOT NULL
      AND (
        goals_home_et <> goals_home
        OR goals_away_et <> goals_away
      )
    )
    OR COALESCE(pens_home, 0) > 0
    OR COALESCE(pens_away, 0) > 0;
$$;

COMMENT ON FUNCTION public.match_went_to_extra_time IS
  'True when a knockout match went to extra time and/or penalties. ET totals are NULL when the match ended in regulation.';

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
    AND p.extra_time = public.match_went_to_extra_time(
      vr.goals_home,
      vr.goals_away,
      vr.goals_home_et,
      vr.goals_away_et,
      vr.pens_home,
      vr.pens_away
    )
  ) AS extra_time_hit
FROM public.predictions p
JOIN public.v_results vr ON vr.id_match = p.id_match;

GRANT SELECT ON public.v_prediction_side_bets TO anon, authenticated;

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
scored AS (
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
    (
      p.first_goal_minute IS NOT NULL
      AND vr.first_goal_minute_range IS NOT NULL
      AND p.first_goal_minute = vr.first_goal_minute_range
    ) AS first_goal_minute_hit,
    (
      m.id_round > 1
      AND p.extra_time IS NOT NULL
      AND vr.goals_home IS NOT NULL
      AND p.extra_time = public.match_went_to_extra_time(
        vr.goals_home,
        vr.goals_away,
        vr.goals_home_et,
        vr.goals_away_et,
        vr.pens_home,
        vr.pens_away
      )
    ) AS extra_time_hit,
    CASE
      WHEN vr.goals_home IS NULL OR vr.goals_away IS NULL THEN 0
      WHEN p.goals_home IS NULL OR p.goals_away IS NULL THEN 0
      WHEN p.goals_home = vr.goals_home AND p.goals_away = vr.goals_away THEN w.pts_exact
      WHEN (p.goals_home - p.goals_away) = (vr.goals_home - vr.goals_away) THEN w.pts_diff
      WHEN (
        CASE
          WHEN p.goals_home > p.goals_away THEN 'home'
          WHEN p.goals_home < p.goals_away THEN 'away'
          ELSE 'draw'
        END
      ) = (
        CASE
          WHEN vr.goals_home > vr.goals_away THEN 'home'
          WHEN vr.goals_home < vr.goals_away THEN 'away'
          ELSE 'draw'
        END
      ) THEN w.pts_winner
      ELSE 0
    END::smallint AS main_points,
    CASE
      WHEN (
        p.first_goal_minute IS NOT NULL
        AND vr.first_goal_minute_range IS NOT NULL
        AND p.first_goal_minute = vr.first_goal_minute_range
      ) THEN w.pts_first_goal
      ELSE 0
    END::smallint AS first_goal_points,
    CASE
      WHEN m.id_round > 1
        AND p.extra_time IS NOT NULL
        AND vr.goals_home IS NOT NULL
        AND p.extra_time = public.match_went_to_extra_time(
          vr.goals_home,
          vr.goals_away,
          vr.goals_home_et,
          vr.goals_away_et,
          vr.pens_home,
          vr.pens_away
        )
      THEN w.pts_extra_time
      ELSE 0
    END::smallint AS extra_time_points
  FROM public.predictions p
  JOIN public.matches m ON m.id_match = p.id_match
  JOIN public.v_results vr ON vr.id_match = p.id_match
  CROSS JOIN weights w
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
  'Per-match scoring for leaderboard. Uses match_went_to_extra_time for prórroga side bets.';

GRANT SELECT ON public.v_prediction_match_points TO authenticated;
