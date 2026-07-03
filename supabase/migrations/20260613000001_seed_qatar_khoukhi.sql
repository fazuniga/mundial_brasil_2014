-- Add missing Qatar (QAT) defender Boualem Khoukhi for FIFA World Cup 2026 squad.
-- Source: Wikipedia FIFA World Cup 2026 squads (Qatar final squad).
BEGIN;

INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Boualem Khoukhi', 'DF', 'Al-Sadd', 'QAT')
) AS p(name, position, club, club_country)
WHERE t.code = 'QAT'
  AND NOT EXISTS (
    SELECT 1
    FROM public.players ex
    WHERE ex.id_team = t.id_team
      AND ex.name = p.name
  );

COMMIT;
