-- Resolve knockout qualifier slots per completed group (not only when all 72 group
-- matches are done). Persist known teams in knockout_slots.resolved_team_id and
-- update matches.home_team_id / away_team_id when sides are determined.

CREATE OR REPLACE FUNCTION public.group_complete(p_group_code char)
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY INVOKER
SET search_path = public
AS $$
  SELECT NOT EXISTS (
    SELECT 1
    FROM public.matches m
    JOIN public.groups g ON g.id_group = m.id_group
    LEFT JOIN public.match_results mr ON mr.id_match = m.id_match
    WHERE m.id_round = 1
      AND g.group_code = p_group_code
      AND (mr.goals_home IS NULL OR mr.goals_away IS NULL)
  );
$$;

CREATE OR REPLACE FUNCTION public.knockout_slot_group_code(p_label text)
RETURNS char
LANGUAGE sql
IMMUTABLE
AS $$
  SELECT CASE
    WHEN p_label ~ '^(Primero|Segundo) ([A-L])$' THEN substring(p_label from '[A-L]$')::char
    ELSE NULL
  END;
$$;

CREATE OR REPLACE FUNCTION public.sync_knockout_qualifier_slots()
RETURNS integer
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_updated integer := 0;
  v_row_count integer;
BEGIN
  UPDATE public.knockout_slots ks
  SET resolved_team_id = qt.id_team
  FROM public.v_qualified_top_two qt
  WHERE ks.label = qt.slot_label
    AND public.group_complete(qt.group_code::char)
    AND ks.resolved_team_id IS DISTINCT FROM qt.id_team;

  GET DIAGNOSTICS v_row_count = ROW_COUNT;
  v_updated := v_updated + v_row_count;

  UPDATE public.matches m
  SET home_team_id = ks_home.resolved_team_id
  FROM public.knockout_slots ks_home
  WHERE m.home_slot_id = ks_home.id_slot
    AND m.id_round > 1
    AND ks_home.resolved_team_id IS NOT NULL
    AND m.home_team_id IS DISTINCT FROM ks_home.resolved_team_id;

  GET DIAGNOSTICS v_row_count = ROW_COUNT;
  v_updated := v_updated + v_row_count;

  UPDATE public.matches m
  SET away_team_id = ks_away.resolved_team_id
  FROM public.knockout_slots ks_away
  WHERE m.away_slot_id = ks_away.id_slot
    AND m.id_round > 1
    AND ks_away.resolved_team_id IS NOT NULL
    AND m.away_team_id IS DISTINCT FROM ks_away.resolved_team_id;

  GET DIAGNOSTICS v_row_count = ROW_COUNT;
  v_updated := v_updated + v_row_count;

  RETURN v_updated;
END;
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
  v_group_code char;
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

  SELECT ks.resolved_team_id
  INTO v_team_id
  FROM public.knockout_slots ks
  WHERE ks.label = p_label
    AND ks.resolved_team_id IS NOT NULL;

  IF v_team_id IS NOT NULL THEN
    RETURN v_team_id;
  END IF;

  v_group_code := public.knockout_slot_group_code(p_label);
  IF v_group_code IS NOT NULL AND public.group_complete(v_group_code) THEN
    SELECT gq.id_team
    INTO v_team_id
    FROM public.v_group_qualifiers gq
    WHERE gq.slot_label = p_label;

    IF v_team_id IS NOT NULL THEN
      RETURN v_team_id;
    END IF;
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
  v_resolved_team_id smallint;
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

  IF v_slot_id IS NOT NULL THEN
    SELECT ks.label
    INTO v_label
    FROM public.knockout_slots ks
    WHERE ks.id_slot = v_slot_id;

    v_resolved_team_id := public.resolve_knockout_slot_team(v_label, p_depth + 1);
    IF v_resolved_team_id IS NOT NULL THEN
      RETURN v_resolved_team_id;
    END IF;

    IF NOT EXISTS (
      SELECT 1
      FROM public.rounds r
      WHERE r.id_round = v_round
        AND r.predictions_enabled
    ) THEN
      RETURN NULL;
    END IF;

    RETURN public.resolve_knockout_slot_team(v_label, p_depth + 1);
  END IF;

  RETURN v_fallback_team_id;
END;
$$;

COMMENT ON FUNCTION public.group_complete IS
  'True when every Fase de Grupos match in the given group has goals_home and goals_away.';

COMMENT ON FUNCTION public.sync_knockout_qualifier_slots IS
  'Persist Primero/Segundo teams for completed groups into knockout_slots.resolved_team_id '
  'and mirror resolved sides onto matches.home_team_id / away_team_id. Returns rows touched.';

COMMENT ON COLUMN public.knockout_slots.resolved_team_id IS
  'Set when a qualifier slot (Primero/Segundo) is final; used by resolve_knockout_slot_team.';

COMMENT ON VIEW public.v_fixture_resolved IS
  'Fixture rows with knockout slots resolved incrementally per completed group. '
  'Primero/Segundo resolve when their group is done; composite 3rd slots after all groups; '
  'Ganador/Perdedor when upstream match has a result and that round is enabled.';

SELECT public.sync_knockout_qualifier_slots();
