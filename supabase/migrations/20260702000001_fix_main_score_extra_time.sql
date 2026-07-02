-- Main-score predictions include prórroga (see knockoutScorePredictionHint).
-- Compare against cumulative ET totals when saved, not regulation-only 90' scores.

CREATE OR REPLACE FUNCTION public.match_score_home_for_predictions(
  goals_home smallint,
  goals_home_et smallint,
  goals_away_et smallint
)
RETURNS smallint
LANGUAGE sql
IMMUTABLE
AS $$
  SELECT CASE
    WHEN goals_home_et IS NOT NULL AND goals_away_et IS NOT NULL THEN goals_home_et
    ELSE goals_home
  END;
$$;

CREATE OR REPLACE FUNCTION public.match_score_away_for_predictions(
  goals_away smallint,
  goals_home_et smallint,
  goals_away_et smallint
)
RETURNS smallint
LANGUAGE sql
IMMUTABLE
AS $$
  SELECT CASE
    WHEN goals_home_et IS NOT NULL AND goals_away_et IS NOT NULL THEN goals_away_et
    ELSE goals_away
  END;
$$;

COMMENT ON FUNCTION public.match_score_home_for_predictions IS
  'Final home goals for main-score prediction scoring (includes prórroga when ET totals are saved).';

COMMENT ON FUNCTION public.match_score_away_for_predictions IS
  'Final away goals for main-score prediction scoring (includes prórroga when ET totals are saved).';

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
    public.match_score_home_for_predictions(
      vr.goals_home,
      vr.goals_home_et,
      vr.goals_away_et
    ) AS actual_home,
    public.match_score_away_for_predictions(
      vr.goals_away,
      vr.goals_home_et,
      vr.goals_away_et
    ) AS actual_away,
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
      WHEN p.goals_home = public.match_score_home_for_predictions(
        vr.goals_home,
        vr.goals_home_et,
        vr.goals_away_et
      )
      AND p.goals_away = public.match_score_away_for_predictions(
        vr.goals_away,
        vr.goals_home_et,
        vr.goals_away_et
      ) THEN w.pts_exact
      WHEN (p.goals_home - p.goals_away) = (
        public.match_score_home_for_predictions(
          vr.goals_home,
          vr.goals_home_et,
          vr.goals_away_et
        )
        - public.match_score_away_for_predictions(
          vr.goals_away,
          vr.goals_home_et,
          vr.goals_away_et
        )
      ) THEN w.pts_diff
      WHEN (
        CASE
          WHEN p.goals_home > p.goals_away THEN 'home'
          WHEN p.goals_home < p.goals_away THEN 'away'
          ELSE 'draw'
        END
      ) = (
        CASE
          WHEN public.match_score_home_for_predictions(
            vr.goals_home,
            vr.goals_home_et,
            vr.goals_away_et
          ) > public.match_score_away_for_predictions(
            vr.goals_away,
            vr.goals_home_et,
            vr.goals_away_et
          ) THEN 'home'
          WHEN public.match_score_home_for_predictions(
            vr.goals_home,
            vr.goals_home_et,
            vr.goals_away_et
          ) < public.match_score_away_for_predictions(
            vr.goals_away,
            vr.goals_home_et,
            vr.goals_away_et
          ) THEN 'away'
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
  'Per-match scoring for leaderboard. Main score uses cumulative prórroga totals when saved.';

GRANT SELECT ON public.v_prediction_match_points TO authenticated;
