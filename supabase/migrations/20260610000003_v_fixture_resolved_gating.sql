-- Gate knockout resolution: qualifiers only after group stage complete;
-- knockout rounds only when rounds.predictions_enabled; Ganador/Perdedor only
-- when upstream match has a result and that match's round is enabled.

CREATE OR REPLACE FUNCTION public.group_stage_complete()
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY INVOKER
SET search_path = public
AS $$
  SELECT NOT EXISTS (
    SELECT 1
    FROM public.matches m
    LEFT JOIN public.match_results mr ON mr.id_match = m.id_match
    WHERE m.id_round = 1
      AND (mr.goals_home IS NULL OR mr.goals_away IS NULL)
  );
$$;

CREATE OR REPLACE FUNCTION public.resolve_knockout_slot_team(
  p_label text,
  p_depth int DEFAULT 0
)
RETURNS smallint
LANGUAGE plpgsql
STABLE
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_team_id smallint;
  v_match_id smallint;
  v_home_team_id smallint;
  v_away_team_id smallint;
  v_id_round smallint;
  v_mr public.match_results%ROWTYPE;
  v_winner_team_id smallint;
BEGIN
  IF p_label IS NULL OR p_depth > 20 THEN
    RETURN NULL;
  END IF;

  IF public.group_stage_complete() THEN
    SELECT gq.id_team
    INTO v_team_id
    FROM public.v_group_qualifiers gq
    WHERE gq.slot_label = p_label;

    IF v_team_id IS NOT NULL THEN
      RETURN v_team_id;
    END IF;

    v_team_id := public.resolve_third_place_slot_team(p_label);
    IF v_team_id IS NOT NULL THEN
      RETURN v_team_id;
    END IF;
  END IF;

  IF p_label ~ '^Ganador [0-9]+$' THEN
    v_match_id := substring(p_label from '[0-9]+$')::smallint;
    v_home_team_id := public.resolve_match_side_team(v_match_id, 'home', p_depth + 1);
    v_away_team_id := public.resolve_match_side_team(v_match_id, 'away', p_depth + 1);

    IF v_home_team_id IS NULL OR v_away_team_id IS NULL THEN
      RETURN NULL;
    END IF;

    SELECT m.id_round
    INTO v_id_round
    FROM public.matches m
    WHERE m.id_match = v_match_id;

    IF NOT EXISTS (
      SELECT 1
      FROM public.rounds r
      WHERE r.id_round = v_id_round
        AND r.predictions_enabled
    ) THEN
      RETURN NULL;
    END IF;

    SELECT *
    INTO v_mr
    FROM public.match_results mr
    WHERE mr.id_match = v_match_id;

    v_winner_team_id := public.match_result_winner_team_id(
      v_id_round,
      v_home_team_id,
      v_away_team_id,
      v_mr.goals_home,
      v_mr.goals_away,
      v_mr.goals_home_et,
      v_mr.goals_away_et,
      v_mr.pens_home,
      v_mr.pens_away
    );

    RETURN v_winner_team_id;
  END IF;

  IF p_label ~ '^Perdedor [0-9]+$' THEN
    v_match_id := substring(p_label from '[0-9]+$')::smallint;
    v_home_team_id := public.resolve_match_side_team(v_match_id, 'home', p_depth + 1);
    v_away_team_id := public.resolve_match_side_team(v_match_id, 'away', p_depth + 1);

    IF v_home_team_id IS NULL OR v_away_team_id IS NULL THEN
      RETURN NULL;
    END IF;

    SELECT m.id_round
    INTO v_id_round
    FROM public.matches m
    WHERE m.id_match = v_match_id;

    IF NOT EXISTS (
      SELECT 1
      FROM public.rounds r
      WHERE r.id_round = v_id_round
        AND r.predictions_enabled
    ) THEN
      RETURN NULL;
    END IF;

    SELECT *
    INTO v_mr
    FROM public.match_results mr
    WHERE mr.id_match = v_match_id;

    v_winner_team_id := public.match_result_winner_team_id(
      v_id_round,
      v_home_team_id,
      v_away_team_id,
      v_mr.goals_home,
      v_mr.goals_away,
      v_mr.goals_home_et,
      v_mr.goals_away_et,
      v_mr.pens_home,
      v_mr.pens_away
    );

    IF v_winner_team_id IS NULL THEN
      RETURN NULL;
    END IF;

    IF v_winner_team_id = v_home_team_id THEN
      RETURN v_away_team_id;
    END IF;

    RETURN v_home_team_id;
  END IF;

  RETURN NULL;
END;
$$;

CREATE OR REPLACE FUNCTION public.resolve_match_side_team(
  p_match_id smallint,
  p_side text,
  p_depth int DEFAULT 0
)
RETURNS smallint
LANGUAGE plpgsql
STABLE
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_round smallint;
  v_slot_id smallint;
  v_label text;
  v_fallback_team_id smallint;
BEGIN
  IF p_depth > 20 THEN
    RETURN NULL;
  END IF;

  SELECT
    m.id_round,
    CASE WHEN p_side = 'home' THEN m.home_slot_id ELSE m.away_slot_id END,
    CASE WHEN p_side = 'home' THEN m.home_team_id ELSE m.away_team_id END
  INTO v_round, v_slot_id, v_fallback_team_id
  FROM public.matches m
  WHERE m.id_match = p_match_id;

  IF v_round = 1 THEN
    RETURN v_fallback_team_id;
  END IF;

  IF NOT EXISTS (
    SELECT 1
    FROM public.rounds r
    WHERE r.id_round = v_round
      AND r.predictions_enabled
  ) THEN
    RETURN NULL;
  END IF;

  IF v_slot_id IS NOT NULL THEN
    SELECT ks.label
    INTO v_label
    FROM public.knockout_slots ks
    WHERE ks.id_slot = v_slot_id;

    RETURN public.resolve_knockout_slot_team(v_label, p_depth + 1);
  END IF;

  RETURN v_fallback_team_id;
END;
$$;

COMMENT ON FUNCTION public.group_stage_complete IS
  'True when every Fase de Grupos match has goals_home and goals_away in match_results.';

COMMENT ON VIEW public.v_fixture_resolved IS
  'Fixture rows with knockout slots resolved when the phase is active. '
  'Group qualifiers (Primero/Segundo/3rd) resolve only after all group matches '
  'have results; id_round >= 2 only when rounds.predictions_enabled; '
  'Ganador/Perdedor only when upstream match has a result and that round is enabled.';
