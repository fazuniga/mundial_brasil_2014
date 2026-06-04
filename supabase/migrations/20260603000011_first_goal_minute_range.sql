-- First-goal-minute side bet: category ranges instead of exact minute on predictions.
-- match_results.first_goal_minute stays smallint (actual minute); predictions stores category keys.

CREATE OR REPLACE FUNCTION public.minute_to_first_goal_range(minute int)
RETURNS text
LANGUAGE sql
IMMUTABLE
AS $$
  SELECT CASE
    WHEN minute IS NULL THEN NULL
    -- Encoded stoppage: 451 = 45+1 (1T), 901 = 90+1 (2T)
    WHEN minute BETWEEN 451 AND 459 THEN '45+_1T'
    WHEN minute BETWEEN 901 AND 909 THEN '90+_2T'
    WHEN minute <= 15 THEN '0-15'
    WHEN minute <= 30 THEN '16-30'
    WHEN minute <= 45 THEN '31-45'
    WHEN minute <= 60 THEN '46-60'
    WHEN minute <= 75 THEN '61-75'
    WHEN minute <= 90 THEN '76-90'
    WHEN minute > 90 THEN '90+_2T'
    ELSE NULL
  END;
$$;

COMMENT ON FUNCTION public.minute_to_first_goal_range(int) IS
  'Maps match_results.first_goal_minute to prediction category key. '
  'Use 451–459 for 1T stoppage (45+1…45+9), 901–909 for 2T stoppage (90+1…90+9).';

-- Migrate predictions.first_goal_minute smallint → text category keys
ALTER TABLE public.predictions
  ALTER COLUMN first_goal_minute TYPE text
  USING (
    CASE
      WHEN first_goal_minute IS NULL THEN NULL
      WHEN first_goal_minute BETWEEN 451 AND 459 THEN '45+_1T'
      WHEN first_goal_minute BETWEEN 901 AND 909 THEN '90+_2T'
      WHEN first_goal_minute <= 15 THEN '0-15'
      WHEN first_goal_minute <= 30 THEN '16-30'
      WHEN first_goal_minute <= 45 THEN '31-45'
      WHEN first_goal_minute <= 60 THEN '46-60'
      WHEN first_goal_minute <= 75 THEN '61-75'
      WHEN first_goal_minute <= 90 THEN '76-90'
      ELSE '90+_2T'
    END
  );

ALTER TABLE public.predictions
  ADD CONSTRAINT predictions_first_goal_minute_range_check
  CHECK (
    first_goal_minute IS NULL
    OR first_goal_minute IN (
      '0-15', '16-30', '31-45', '45+_1T',
      '46-60', '61-75', '76-90', '90+_2T'
    )
  );

-- v_results: expose actual first-goal range alongside raw minute
CREATE OR REPLACE VIEW public.v_results
WITH (security_invoker = true) AS
SELECT
  m.id_match,
  m.id_round,
  COALESCE(g.group_code::text, '') AS group_code,
  th.id_team AS home_team_id,
  th.country AS home_country,
  th.code AS home_code,
  ta.id_team AS away_team_id,
  ta.country AS away_country,
  ta.code AS away_code,
  mr.goals_home,
  mr.goals_away,
  mr.goals_home_pt,
  mr.goals_away_pt,
  mr.goals_home_et,
  mr.goals_away_et,
  mr.pens_home,
  mr.pens_away,
  mr.first_goal_minute,
  mr.first_goal_player_id,
  pl.name AS first_goal_player_name,
  CASE WHEN mr.goals_home IS NULL THEN NULL
    WHEN mr.goals_home > mr.goals_away THEN 3
    WHEN mr.goals_home = mr.goals_away THEN 1
    ELSE 0 END AS points_home,
  CASE WHEN mr.goals_away IS NULL THEN NULL
    WHEN mr.goals_home < mr.goals_away THEN 3
    WHEN mr.goals_home = mr.goals_away THEN 1
    ELSE 0 END AS points_away,
  CASE
    WHEN m.id_round = 1 AND mr.goals_home > mr.goals_away THEN th.country
    WHEN m.id_round = 1 AND mr.goals_home = mr.goals_away THEN 'Draw'
    WHEN m.id_round = 1 AND mr.goals_home < mr.goals_away THEN ta.country
    WHEN m.id_round > 1 AND mr.goals_home > mr.goals_away THEN th.country
    WHEN m.id_round > 1 AND mr.goals_home < mr.goals_away THEN ta.country
    WHEN m.id_round > 1 AND mr.goals_home = mr.goals_away THEN
      CASE
        WHEN COALESCE(mr.goals_home_et, 0) > COALESCE(mr.goals_away_et, 0) THEN th.country
        WHEN COALESCE(mr.goals_home_et, 0) < COALESCE(mr.goals_away_et, 0) THEN ta.country
        WHEN COALESCE(mr.goals_home_et, 0) = COALESCE(mr.goals_away_et, 0) THEN
          CASE
            WHEN COALESCE(mr.pens_home, 0) > COALESCE(mr.pens_away, 0) THEN th.country
            WHEN COALESCE(mr.pens_home, 0) < COALESCE(mr.pens_away, 0) THEN ta.country
          END
      END
  END AS winner_country,
  public.minute_to_first_goal_range(mr.first_goal_minute) AS first_goal_minute_range
FROM public.matches m
JOIN public.rounds r ON r.id_round = m.id_round
JOIN public.teams th ON th.id_team = m.home_team_id
JOIN public.teams ta ON ta.id_team = m.away_team_id
LEFT JOIN public.groups g ON g.id_group = m.id_group
LEFT JOIN public.match_results mr ON mr.id_match = m.id_match
LEFT JOIN public.players pl ON pl.id_player = mr.first_goal_player_id;

-- Per-match side-bet scoring (first_goal_minute compares category keys)
CREATE OR REPLACE VIEW public.v_prediction_side_bets
WITH (security_invoker = true) AS
SELECT
  p.id_pool,
  p.id_match,
  vr.first_goal_minute_range AS actual_first_goal_range,
  p.first_goal_minute AS predicted_first_goal_range,
  (
    p.first_goal_minute IS NOT NULL
    AND vr.first_goal_minute_range IS NOT NULL
    AND p.first_goal_minute = vr.first_goal_minute_range
  ) AS first_goal_minute_hit,
  (
    p.extra_time IS NOT NULL
    AND vr.goals_home IS NOT NULL
    AND p.extra_time = (
      COALESCE(vr.goals_home_et, 0) <> COALESCE(vr.goals_home, 0)
      OR COALESCE(vr.goals_away_et, 0) <> COALESCE(vr.goals_away, 0)
      OR COALESCE(vr.pens_home, 0) > 0
      OR COALESCE(vr.pens_away, 0) > 0
    )
  ) AS extra_time_hit
FROM public.predictions p
JOIN public.v_results vr ON vr.id_match = p.id_match;

GRANT SELECT ON public.v_prediction_side_bets TO anon, authenticated;
