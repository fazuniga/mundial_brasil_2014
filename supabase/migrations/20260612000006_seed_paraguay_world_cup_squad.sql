-- Add missing Paraguay (PAR) players for FIFA World Cup 2026 final squad.
-- Sources: FIFA squad page, Wikipedia (June 2026).
-- Does not remove legacy roster entries from the initial player seed.
BEGIN;

INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Damián Bobadilla', 'MF', 'São Paulo', 'BRA')
) AS p(name, position, club, club_country)
WHERE t.code = 'PAR'
  AND NOT EXISTS (
    SELECT 1
    FROM public.players ex
    WHERE ex.id_team = t.id_team
      AND ex.name = p.name
  );

COMMIT;
