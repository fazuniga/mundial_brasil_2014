-- Split pool payment: Fase de Grupos vs fases eliminatorias (knockout remainder)

DROP VIEW IF EXISTS public.v_pool_rankings;

ALTER TABLE public.pools
  ADD COLUMN is_paid_group_phase boolean NOT NULL DEFAULT false,
  ADD COLUMN is_paid_knockout boolean NOT NULL DEFAULT false;

UPDATE public.pools
SET
  is_paid_group_phase = is_paid,
  is_paid_knockout = is_paid
WHERE is_paid = true;

ALTER TABLE public.pools DROP COLUMN is_paid;

CREATE VIEW public.v_pool_rankings
WITH (security_invoker = false) AS
WITH weights AS (
  SELECT
    COALESCE(MAX(points) FILTER (WHERE rule_key = 'tournament_winner'), 0) AS pts_winner,
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
      CASE WHEN tps.tournament_winner_hit THEN w.pts_winner ELSE 0 END
      + CASE WHEN tps.top_scorer_player_hit THEN w.pts_ts_player ELSE 0 END
      + CASE WHEN tps.top_scorer_goals_hit THEN w.pts_ts_goals ELSE 0 END
    )::int AS tournament_points
  FROM public.v_tournament_prediction_scores tps
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
)
SELECT
  id_pool,
  owner_id,
  display_name,
  username,
  is_paid_group_phase,
  is_paid_knockout,
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
  'Polla leaderboard: one row per owner with at least one pool. Sums all pools per owner; payment flags from primary pool.';

COMMENT ON COLUMN public.pools.is_paid_group_phase IS
  'Payment received for Fase de Grupos (id_round = 1).';

COMMENT ON COLUMN public.pools.is_paid_knockout IS
  'Payment received for fases eliminatorias (id_round >= 2).';
