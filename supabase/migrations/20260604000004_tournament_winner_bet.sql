-- Tournament winner bet (Campeón del Mundial) + scoring integration

ALTER TABLE public.tournament_predictions
  ADD COLUMN IF NOT EXISTS winner_team_id smallint REFERENCES public.teams (id_team);

ALTER TABLE public.tournament_results
  ADD COLUMN IF NOT EXISTS winner_team_id smallint REFERENCES public.teams (id_team);

INSERT INTO public.scoring_rules (rule_key, points) VALUES
  ('tournament_winner', 15)
ON CONFLICT (rule_key) DO UPDATE SET points = EXCLUDED.points;

DROP VIEW IF EXISTS public.v_pool_rankings;
DROP VIEW IF EXISTS public.v_tournament_prediction_scores;

CREATE VIEW public.v_tournament_prediction_scores
WITH (security_invoker = true) AS
SELECT
  tp.id_pool,
  tp.winner_team_id AS predicted_winner_team_id,
  tr.winner_team_id AS actual_winner_team_id,
  (
    tp.winner_team_id IS NOT NULL
    AND tr.winner_team_id IS NOT NULL
    AND tp.winner_team_id = tr.winner_team_id
  ) AS tournament_winner_hit,
  tp.top_scorer_player_id AS predicted_player_id,
  tp.top_scorer_goals AS predicted_goals,
  vts.top_scorer_goals AS actual_goals,
  vts.top_scorer_player_ids AS actual_player_ids,
  vts.top_scorer_names AS actual_player_names,
  vts.tied_leaders_count,
  (
    tp.top_scorer_player_id IS NOT NULL
    AND CARDINALITY(vts.top_scorer_player_ids) > 0
    AND tp.top_scorer_player_id = ANY (vts.top_scorer_player_ids)
  ) AS top_scorer_player_hit,
  (
    tp.top_scorer_goals IS NOT NULL
    AND vts.top_scorer_goals > 0
    AND tp.top_scorer_goals = vts.top_scorer_goals
  ) AS top_scorer_goals_hit
FROM public.tournament_predictions tp
CROSS JOIN public.v_tournament_top_scorer_summary vts
CROSS JOIN public.tournament_results tr;

GRANT SELECT ON public.v_tournament_prediction_scores TO anon, authenticated;

COMMENT ON VIEW public.v_tournament_prediction_scores IS
  'Compares tournament_predictions to tournament_results (winner) and v_tournament_top_scorer_summary (top scorer).';

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
  SELECT owner_id, MIN(id_pool) AS id_pool
  FROM public.pools
  GROUP BY owner_id
),
totals AS (
  SELECT
    pp.id_pool,
    pr.id AS owner_id,
    TRIM(BOTH FROM pr.first_name || ' ' || pr.last_name) AS display_name,
    pr.username,
    COALESCE(op.match_points, 0) AS match_points,
    COALESCE(op.exact_hits, 0) AS exact_hits,
    COALESCE(op.goal_diff_hits, 0) AS goal_diff_hits,
    COALESCE(op.winner_hits, 0) AS winner_hits,
    COALESCE(op.side_bet_points, 0) AS side_bet_points,
    COALESCE(op.tournament_points, 0) AS tournament_points,
    (COALESCE(op.match_points, 0) + COALESCE(op.tournament_points, 0))::int AS total_points,
    pr.created_at
  FROM public.profiles pr
  LEFT JOIN primary_pool pp ON pp.owner_id = pr.id
  LEFT JOIN owner_points op ON op.owner_id = pr.id
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
    ORDER BY total_points DESC, display_name ASC, created_at ASC, owner_id ASC
  )::int AS rank_position
FROM totals;

COMMENT ON VIEW public.v_pool_rankings IS
  'Polla leaderboard: one row per registered profile (0 points without a pool). Sums all pools per owner.';
