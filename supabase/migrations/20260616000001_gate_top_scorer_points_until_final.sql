-- Top scorer tournament points must not accrue during the World Cup.
-- Award only after the Final is decided (same gate as tournament_winner).

CREATE OR REPLACE VIEW public.v_tournament_prediction_scores
WITH (security_invoker = true) AS
SELECT
  tp.id_pool,
  tp.winner_team_id AS predicted_winner_team_id,
  vtw.winner_team_id AS actual_winner_team_id,
  (
    tp.winner_team_id IS NOT NULL
    AND vtw.winner_team_id IS NOT NULL
    AND tp.winner_team_id = vtw.winner_team_id
  ) AS tournament_winner_hit,
  tp.top_scorer_player_id AS predicted_player_id,
  tp.top_scorer_goals AS predicted_goals,
  vts.top_scorer_goals AS actual_goals,
  vts.top_scorer_player_ids AS actual_player_ids,
  vts.top_scorer_names AS actual_player_names,
  vts.tied_leaders_count,
  (
    vtw.winner_team_id IS NOT NULL
    AND tp.top_scorer_player_id IS NOT NULL
    AND CARDINALITY(vts.top_scorer_player_ids) > 0
    AND tp.top_scorer_player_id = ANY (vts.top_scorer_player_ids)
  ) AS top_scorer_player_hit,
  (
    vtw.winner_team_id IS NOT NULL
    AND tp.top_scorer_goals IS NOT NULL
    AND vts.top_scorer_goals > 0
    AND tp.top_scorer_goals = vts.top_scorer_goals
  ) AS top_scorer_goals_hit
FROM public.tournament_predictions tp
CROSS JOIN public.v_tournament_top_scorer_summary vts
CROSS JOIN public.v_tournament_winner_summary vtw;

COMMENT ON VIEW public.v_tournament_prediction_scores IS
  'Compares tournament_predictions to v_tournament_winner_summary (winner) and v_tournament_top_scorer_summary (top scorer). Top scorer hits only after Final is decided.';

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
        WHEN vtw.winner_team_id IS NOT NULL
         AND tp.top_scorer_player_id IS NOT NULL
         AND CARDINALITY(vts.top_scorer_player_ids) > 0
         AND tp.top_scorer_player_id = ANY (vts.top_scorer_player_ids)
        THEN w.pts_ts_player
        ELSE 0
      END
      + CASE
        WHEN vtw.winner_team_id IS NOT NULL
         AND tp.top_scorer_goals IS NOT NULL
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
  'Polla leaderboard: one row per owner with at least one pool. Tournament top scorer points only after Final is decided.';

GRANT SELECT ON public.v_pool_rankings TO authenticated;
