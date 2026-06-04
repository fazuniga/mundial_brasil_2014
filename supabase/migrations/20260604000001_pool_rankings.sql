-- Polla user leaderboard (aggregated points). security_invoker = false so all
-- authenticated users can read rankings without exposing raw predictions.

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
    sb.first_goal_minute_hit,
    sb.extra_time_hit,
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
      WHEN sb.first_goal_minute_hit IS TRUE THEN w.pts_first_goal
      ELSE 0
    END::smallint AS first_goal_points,
    CASE
      WHEN m.id_round > 1 AND sb.extra_time_hit IS TRUE THEN w.pts_extra_time
      ELSE 0
    END::smallint AS extra_time_points
  FROM public.predictions p
  JOIN public.matches m ON m.id_match = p.id_match
  JOIN public.v_results vr ON vr.id_match = p.id_match
  LEFT JOIN public.v_prediction_side_bets sb
    ON sb.id_pool = p.id_pool AND sb.id_match = p.id_match
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

CREATE OR REPLACE VIEW public.v_pool_rankings
WITH (security_invoker = false) AS
WITH weights AS (
  SELECT
    COALESCE(MAX(points) FILTER (WHERE rule_key = 'top_scorer_player'), 0) AS pts_ts_player,
    COALESCE(MAX(points) FILTER (WHERE rule_key = 'top_scorer_goals'), 0) AS pts_ts_goals
  FROM public.scoring_rules
),
match_agg AS (
  SELECT
    id_pool,
    COALESCE(SUM(match_points), 0)::int AS match_points,
    COUNT(*) FILTER (WHERE is_exact_hit) AS exact_hits,
    COUNT(*) FILTER (WHERE is_goal_diff_hit) AS goal_diff_hits,
    COUNT(*) FILTER (WHERE is_winner_hit) AS winner_hits,
    COALESCE(SUM(first_goal_points + extra_time_points), 0)::int AS side_bet_points
  FROM public.v_prediction_match_points
  GROUP BY id_pool
),
tournament_agg AS (
  SELECT
    tps.id_pool,
    (
      CASE WHEN tps.top_scorer_player_hit THEN w.pts_ts_player ELSE 0 END
      + CASE WHEN tps.top_scorer_goals_hit THEN w.pts_ts_goals ELSE 0 END
    )::int AS tournament_points
  FROM public.v_tournament_prediction_scores tps
  CROSS JOIN weights w
),
totals AS (
  SELECT
    pl.id_pool,
    pl.owner_id,
    TRIM(BOTH FROM pr.first_name || ' ' || pr.last_name) AS display_name,
    pr.username,
    COALESCE(ma.match_points, 0) AS match_points,
    COALESCE(ma.exact_hits, 0) AS exact_hits,
    COALESCE(ma.goal_diff_hits, 0) AS goal_diff_hits,
    COALESCE(ma.winner_hits, 0) AS winner_hits,
    COALESCE(ma.side_bet_points, 0) AS side_bet_points,
    COALESCE(ta.tournament_points, 0) AS tournament_points,
    (COALESCE(ma.match_points, 0) + COALESCE(ta.tournament_points, 0))::int AS total_points
  FROM public.pools pl
  JOIN public.profiles pr ON pr.id = pl.owner_id
  LEFT JOIN match_agg ma ON ma.id_pool = pl.id_pool
  LEFT JOIN tournament_agg ta ON ta.id_pool = pl.id_pool
)
SELECT
  id_pool,
  owner_id,
  display_name,
  username,
  match_points,
  exact_hits,
  goal_diff_hits,
  winner_hits,
  side_bet_points,
  tournament_points,
  total_points,
  ROW_NUMBER() OVER (
    ORDER BY total_points DESC, display_name ASC, id_pool ASC
  )::int AS rank_position
FROM totals;

GRANT SELECT ON public.v_prediction_match_points TO authenticated;
GRANT SELECT ON public.v_pool_rankings TO authenticated;

COMMENT ON VIEW public.v_pool_rankings IS
  'Polla leaderboard: total points and hit counts per pool owner. Uses scoring_rules weights.';
