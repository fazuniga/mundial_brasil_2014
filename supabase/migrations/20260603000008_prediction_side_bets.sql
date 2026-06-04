-- Side-bet columns for predictions (extra time yes/no, free-text scorer).
-- first_goal_minute already exists on predictions.

ALTER TABLE public.predictions
  ADD COLUMN IF NOT EXISTS extra_time boolean,
  ADD COLUMN IF NOT EXISTS first_goal_scorer_name text;
