-- Live knockout fixture resolution for admin display.
-- Resolves Primero/Segundo via v_group_qualifiers, Ganador/Perdedor via upstream
-- match results, and 3rd composite slots via third_place_matrix when populated.

CREATE OR REPLACE FUNCTION public.match_result_winner_team_id(
  p_id_round smallint,
  p_home_team_id smallint,
  p_away_team_id smallint,
  p_goals_home smallint,
  p_goals_away smallint,
  p_goals_home_et smallint,
  p_goals_away_et smallint,
  p_pens_home smallint,
  p_pens_away smallint
)
RETURNS smallint
LANGUAGE sql
IMMUTABLE
AS $$
  SELECT CASE
    WHEN p_goals_home IS NULL THEN NULL
    WHEN p_id_round = 1 AND p_goals_home > p_goals_away THEN p_home_team_id
    WHEN p_id_round = 1 AND p_goals_home < p_goals_away THEN p_away_team_id
    WHEN p_id_round = 1 THEN NULL
    WHEN p_goals_home > p_goals_away THEN p_home_team_id
    WHEN p_goals_home < p_goals_away THEN p_away_team_id
    WHEN COALESCE(p_goals_home_et, 0) > COALESCE(p_goals_away_et, 0) THEN p_home_team_id
    WHEN COALESCE(p_goals_home_et, 0) < COALESCE(p_goals_away_et, 0) THEN p_away_team_id
    WHEN COALESCE(p_pens_home, 0) > COALESCE(p_pens_away, 0) THEN p_home_team_id
    WHEN COALESCE(p_pens_home, 0) < COALESCE(p_pens_away, 0) THEN p_away_team_id
    ELSE NULL
  END;
$$;

CREATE OR REPLACE FUNCTION public.resolve_third_place_slot_team(p_label text)
RETURNS smallint
LANGUAGE plpgsql
STABLE
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_qualifying_groups text;
  v_group_code text;
  v_mapping jsonb;
  v_team_id smallint;
BEGIN
  IF p_label IS NULL OR p_label !~ '^3rd ' THEN
    RETURN NULL;
  END IF;

  SELECT string_agg(group_code, '' ORDER BY group_code)
  INTO v_qualifying_groups
  FROM public.v_best_third_places;

  IF v_qualifying_groups IS NULL OR length(v_qualifying_groups) < 8 THEN
    RETURN NULL;
  END IF;

  SELECT tpm.slot_mappings
  INTO v_mapping
  FROM public.third_place_matrix tpm
  WHERE tpm.qualifying_groups = v_qualifying_groups
    AND tpm.scenario_key <> 'pending'
  LIMIT 1;

  IF v_mapping IS NULL OR v_mapping = '{}'::jsonb THEN
    RETURN NULL;
  END IF;

  v_group_code := v_mapping ->> p_label;
  IF v_group_code IS NULL OR v_group_code = '' THEN
    RETURN NULL;
  END IF;

  SELECT btp.id_team
  INTO v_team_id
  FROM public.v_best_third_places btp
  WHERE btp.group_code = v_group_code;

  RETURN v_team_id;
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

CREATE OR REPLACE VIEW public.v_fixture_resolved
WITH (security_invoker = true) AS
SELECT
  f.id_match,
  f.id_round,
  f.name_round,
  f.group_code,
  f.dow,
  f.match_date,
  f.match_time,
  COALESCE(th_resolved.code, f.home_code) AS home_code,
  COALESCE(th_resolved.country, f.home_country) AS home_country,
  COALESCE(ta_resolved.code, f.away_code) AS away_code,
  COALESCE(ta_resolved.country, f.away_country) AS away_country,
  f.city,
  f.stadium,
  f.predictions_open,
  f.round_predictions_enabled,
  public.resolve_match_side_team(m.id_match, 'home', 0) AS home_team_id,
  public.resolve_match_side_team(m.id_match, 'away', 0) AS away_team_id,
  ks_home.label AS home_slot_label,
  ks_away.label AS away_slot_label
FROM public.v_fixture f
JOIN public.matches m ON m.id_match = f.id_match
LEFT JOIN public.knockout_slots ks_home ON ks_home.id_slot = m.home_slot_id
LEFT JOIN public.knockout_slots ks_away ON ks_away.id_slot = m.away_slot_id
LEFT JOIN public.teams th_resolved
  ON th_resolved.id_team = public.resolve_match_side_team(m.id_match, 'home', 0)
LEFT JOIN public.teams ta_resolved
  ON ta_resolved.id_team = public.resolve_match_side_team(m.id_match, 'away', 0);

GRANT SELECT ON public.v_fixture_resolved TO anon, authenticated;

COMMENT ON VIEW public.v_fixture_resolved IS
  'Fixture rows with knockout slots resolved live from standings and upstream results. '
  'Third-place composite slots (3rd ABCDEF, etc.) stay as labels until third_place_matrix is seeded.';
