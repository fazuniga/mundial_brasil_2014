-- Extend encoded stoppage-minute ranges to 25 minutes per half (45+1…45+25, 90+1…90+25).

CREATE OR REPLACE FUNCTION public.minute_to_first_goal_range(minute int)
RETURNS text
LANGUAGE sql
IMMUTABLE
AS $$
  SELECT CASE
    WHEN minute IS NULL THEN NULL
    -- Encoded stoppage: 451 = 45+1 (1T), 901 = 90+1 (2T)
    WHEN minute BETWEEN 451 AND 475 THEN '45+_1T'
    WHEN minute BETWEEN 901 AND 925 THEN '90+_2T'
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
  'Use 451–475 for 1T stoppage (45+1…45+25), 901–925 for 2T stoppage (90+1…90+25).';

ALTER TABLE public.match_goals
  DROP CONSTRAINT IF EXISTS match_goals_minute_check;

ALTER TABLE public.match_goals
  ADD CONSTRAINT match_goals_minute_check CHECK (minute >= 0 AND minute <= 925);
