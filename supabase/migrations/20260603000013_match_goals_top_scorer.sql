-- Per-goal match log; derive first goal + tournament Golden Boot from match_goals.
-- Tie rule (FIFA-style shared Golden Boot): any player tied at max non-own-goal count
-- counts for top_scorer_player; top_scorer_goals compares to that max count.

CREATE TABLE public.match_goals (
  id_goal serial PRIMARY KEY,
  id_match smallint NOT NULL REFERENCES public.matches (id_match) ON DELETE CASCADE,
  id_player smallint NOT NULL REFERENCES public.players (id_player),
  minute smallint NOT NULL CHECK (minute >= 0 AND minute <= 909),
  is_own_goal boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_match_goals_match ON public.match_goals (id_match);
CREATE INDEX idx_match_goals_player ON public.match_goals (id_player);

ALTER TABLE public.match_goals ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read match_goals"
  ON public.match_goals FOR SELECT TO anon, authenticated USING (true);

CREATE POLICY "Admins manage match_goals"
  ON public.match_goals FOR ALL TO authenticated
  USING (EXISTS (SELECT 1 FROM public.profiles pr WHERE pr.id = auth.uid() AND pr.is_admin = true))
  WITH CHECK (EXISTS (SELECT 1 FROM public.profiles pr WHERE pr.id = auth.uid() AND pr.is_admin = true));

-- Keep match_results.first_goal_* in sync with earliest non-own-goal in match_goals
CREATE OR REPLACE FUNCTION public.sync_match_first_goal()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_id_match smallint;
BEGIN
  IF TG_OP = 'DELETE' THEN
    v_id_match := OLD.id_match;
  ELSE
    v_id_match := NEW.id_match;
  END IF;

  UPDATE public.match_results mr
  SET
    first_goal_minute = sub.minute,
    first_goal_player_id = sub.id_player
  FROM (
    SELECT mg.minute, mg.id_player
    FROM public.match_goals mg
    WHERE mg.id_match = v_id_match
      AND mg.is_own_goal = false
    ORDER BY mg.minute ASC, mg.id_goal ASC
    LIMIT 1
  ) sub
  WHERE mr.id_match = v_id_match;

  UPDATE public.match_results mr
  SET first_goal_minute = NULL, first_goal_player_id = NULL
  WHERE mr.id_match = v_id_match
    AND NOT EXISTS (
      SELECT 1
      FROM public.match_goals mg
      WHERE mg.id_match = v_id_match AND mg.is_own_goal = false
    );

  RETURN COALESCE(NEW, OLD);
END;
$$;

CREATE TRIGGER trg_sync_match_first_goal
  AFTER INSERT OR UPDATE OR DELETE ON public.match_goals
  FOR EACH ROW EXECUTE FUNCTION public.sync_match_first_goal();

-- Non-own-goal totals per player (Golden Boot basis)
CREATE OR REPLACE VIEW public.v_player_goal_totals
WITH (security_invoker = true) AS
SELECT
  mg.id_player,
  COUNT(*)::smallint AS goal_count
FROM public.match_goals mg
WHERE mg.is_own_goal = false
GROUP BY mg.id_player;

GRANT SELECT ON public.v_player_goal_totals TO anon, authenticated;

-- All players tied at the tournament maximum (shared Golden Boot)
CREATE OR REPLACE VIEW public.v_tournament_top_scorer
WITH (security_invoker = true) AS
WITH max_goals AS (
  SELECT MAX(goal_count) AS max_count
  FROM public.v_player_goal_totals
)
SELECT
  pgt.id_player,
  pgt.goal_count,
  pl.name AS player_name
FROM public.v_player_goal_totals pgt
JOIN public.players pl ON pl.id_player = pgt.id_player
CROSS JOIN max_goals mg
WHERE pgt.goal_count = mg.max_count
  AND mg.max_count IS NOT NULL
  AND mg.max_count > 0;

GRANT SELECT ON public.v_tournament_top_scorer TO anon, authenticated;

-- Single-row summary for UI and scoring (tied leaders share the max count)
CREATE OR REPLACE VIEW public.v_tournament_top_scorer_summary
WITH (security_invoker = true) AS
SELECT
  COALESCE(MAX(vts.goal_count), 0)::smallint AS top_scorer_goals,
  COUNT(vts.id_player)::smallint AS tied_leaders_count,
  COALESCE(
    ARRAY_AGG(vts.id_player ORDER BY vts.id_player) FILTER (WHERE vts.id_player IS NOT NULL),
    ARRAY[]::smallint[]
  ) AS top_scorer_player_ids,
  COALESCE(
    STRING_AGG(vts.player_name, ', ' ORDER BY vts.player_name) FILTER (WHERE vts.player_name IS NOT NULL),
    ''
  ) AS top_scorer_names
FROM public.v_tournament_top_scorer vts;

GRANT SELECT ON public.v_tournament_top_scorer_summary TO anon, authenticated;

-- Tournament bet scoring: player hit if predicted id is among tied leaders
CREATE OR REPLACE VIEW public.v_tournament_prediction_scores
WITH (security_invoker = true) AS
SELECT
  tp.id_pool,
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
CROSS JOIN public.v_tournament_top_scorer_summary vts;

GRANT SELECT ON public.v_tournament_prediction_scores TO anon, authenticated;

COMMENT ON VIEW public.v_tournament_top_scorer IS
  'Players tied at max non-own-goal count. Shared Golden Boot: all listed players count for top_scorer_player bets.';

COMMENT ON VIEW public.v_tournament_prediction_scores IS
  'Compares tournament_predictions to v_tournament_top_scorer_summary for scoring_rules top_scorer_player / top_scorer_goals.';
