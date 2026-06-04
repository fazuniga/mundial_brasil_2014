-- Shift all match kickoffs +2 hours (e.g. 13:00 → 15:00, 23:00 → next day 01:00).
UPDATE public.matches AS m
SET
  match_date = s.new_date,
  match_time = s.new_time
FROM (
  SELECT
    id_match,
    ((match_date + match_time) + interval '2 hours')::date AS new_date,
    ((match_date + match_time) + interval '2 hours')::time AS new_time
  FROM public.matches
) AS s
WHERE m.id_match = s.id_match;
