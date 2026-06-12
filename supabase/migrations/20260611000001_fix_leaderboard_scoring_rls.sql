-- Leaderboard views must not depend on security_invoker=true child views that read
-- predictions / tournament_predictions under RLS. Inline scoring logic here so
-- v_pool_rankings returns identical totals for every authenticated user.

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
      AND p.extra_time = (
        COALESCE(vr.goals_home_et, 0) <> COALESCE(vr.goals_home, 0)
        OR COALESCE(vr.goals_away_et, 0) <> COALESCE(vr.goals_away, 0)
        OR COALESCE(vr.pens_home, 0) > 0
        OR COALESCE(vr.pens_away, 0) > 0
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
        AND p.extra_time = (
          COALESCE(vr.goals_home_et, 0) <> COALESCE(vr.goals_home, 0)
          OR COALESCE(vr.goals_away_et, 0) <> COALESCE(vr.goals_away, 0)
          OR COALESCE(vr.pens_home, 0) > 0
          OR COALESCE(vr.pens_away, 0) > 0
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
  'Per-match scoring for leaderboard. Inlines side-bet hits (no v_prediction_side_bets) so security_invoker=false bypasses predictions RLS consistently.';

DROP VIEW IF EXISTS public.v_pool_rankings;

CREATE VIEW public.v_pool_rankings
WITH (security_invoker = false) AS
WITH weights AS (
  SELECT
    COALESCE(MAX(points) FILTER (WHERE rule_key = 'tournament_winner'), 0) AS pts_winner,
    COALESCE(MAX(points) FILTER (WHERE rule_key = 'top_scorer_player'), 0) AS pts_ts_player,
    COALESCE(MAX(points) FILTER (WHERE rule_key = 'top_scorer_goals'), 0) AS pts_ts_goals
  FROM public.scoring_rules
),
prediction_counts AS (
  SELECT
    id_pool,
    COUNT(*) FILTER (
      WHERE goals_home IS NOT NULL
         OR goals_away IS NOT NULL
         OR extra_time IS NOT NULL
         OR first_goal_minute IS NOT NULL
    )::int AS bets_placed
  FROM public.predictions
  GROUP BY id_pool
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
    tp.id_pool,
    (
      CASE
        WHEN tp.winner_team_id IS NOT NULL
         AND vtw.winner_team_id IS NOT NULL
         AND tp.winner_team_id = vtw.winner_team_id
        THEN w.pts_winner
        ELSE 0
      END
      + CASE
        WHEN tp.top_scorer_player_id IS NOT NULL
         AND CARDINALITY(vts.top_scorer_player_ids) > 0
         AND tp.top_scorer_player_id = ANY (vts.top_scorer_player_ids)
        THEN w.pts_ts_player
        ELSE 0
      END
      + CASE
        WHEN tp.top_scorer_goals IS NOT NULL
         AND vts.top_scorer_goals > 0
         AND tp.top_scorer_goals = vts.top_scorer_goals
        THEN w.pts_ts_goals
        ELSE 0
      END
    )::int AS tournament_points
  FROM public.tournament_predictions tp
  CROSS JOIN public.v_tournament_top_scorer_summary vts
  CROSS JOIN public.v_tournament_winner_summary vtw
  CROSS JOIN weights w
),
owner_points AS (
  SELECT
    pl.owner_id,
    COALESCE(SUM(ma.match_points), 0)::int AS match_points,
    COALESCE(SUM(ma.exact_hits), 0)::bigint AS exact_hits,
    COALESCE(SUM(ma.goal_diff_hits), 0)::bigint AS goal_diff_hits,
    COALESCE(SUM(ma.winner_hits), 0)::bigint AS winner_hits,
    COALESCE(SUM(ma.side_bet_points), 0)::int AS side_bet_points,
    COALESCE(SUM(ta.tournament_points), 0)::int AS tournament_points
  FROM public.pools pl
  LEFT JOIN match_agg ma ON ma.id_pool = pl.id_pool
  LEFT JOIN tournament_agg ta ON ta.id_pool = pl.id_pool
  GROUP BY pl.owner_id
),
owner_bets AS (
  SELECT
    pl.owner_id,
    COALESCE(SUM(pc.bets_placed), 0)::int AS bets_placed
  FROM public.pools pl
  LEFT JOIN prediction_counts pc ON pc.id_pool = pl.id_pool
  GROUP BY pl.owner_id
),
primary_pool AS (
  SELECT DISTINCT ON (owner_id)
    owner_id,
    id_pool,
    is_paid_group_phase,
    is_paid_knockout
  FROM public.pools
  ORDER BY owner_id, id_pool ASC
),
totals AS (
  SELECT
    pp.id_pool,
    pr.id AS owner_id,
    TRIM(BOTH FROM pr.first_name || ' ' || pr.last_name) AS display_name,
    pr.username,
    COALESCE(pp.is_paid_group_phase, false) AS is_paid_group_phase,
    COALESCE(pp.is_paid_knockout, false) AS is_paid_knockout,
    COALESCE(ob.bets_placed, 0) AS bets_placed,
    COALESCE(op.match_points, 0) AS match_points,
    COALESCE(op.exact_hits, 0) AS exact_hits,
    COALESCE(op.goal_diff_hits, 0) AS goal_diff_hits,
    COALESCE(op.winner_hits, 0) AS winner_hits,
    COALESCE(op.side_bet_points, 0) AS side_bet_points,
    COALESCE(op.tournament_points, 0) AS tournament_points,
    (COALESCE(op.match_points, 0) + COALESCE(op.tournament_points, 0))::int AS total_points,
    pr.created_at
  FROM primary_pool pp
  INNER JOIN public.profiles pr ON pr.id = pp.owner_id
  LEFT JOIN owner_points op ON op.owner_id = pr.id
  LEFT JOIN owner_bets ob ON ob.owner_id = pr.id
)
SELECT
  id_pool,
  owner_id,
  display_name,
  username,
  is_paid_group_phase,
  is_paid_knockout,
  bets_placed,
  match_points,
  exact_hits,
  goal_diff_hits,
  winner_hits,
  side_bet_points,
  tournament_points,
  total_points,
  ROW_NUMBER() OVER (
    ORDER BY total_points DESC, display_name ASC, created_at ASC, owner_id ASC
  )::int AS rank_position
FROM totals;

COMMENT ON VIEW public.v_pool_rankings IS
  'Polla leaderboard: one row per owner with at least one pool. Inlines tournament scoring (no v_tournament_prediction_scores) for consistent totals under RLS.';

GRANT SELECT ON public.v_prediction_match_points TO authenticated;
GRANT SELECT ON public.v_pool_rankings TO authenticated;
