-- Add missing Czechia (CZE) players for FIFA World Cup 2026 final squad.
-- Sources: FIFA squad page, Wikipedia, BBC Sport (June 2026).
-- Does not remove legacy roster entries from the initial player seed.
BEGIN;

INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Matěj Kovář', 'GK', 'PSV Eindhoven', 'NED'),
  ('Jindřich Staněk', 'GK', 'Slavia Prague', 'CZE'),
  ('Lukáš Horníček', 'GK', 'Braga', 'POR'),
  ('David Zima', 'DF', 'Slavia Prague', 'CZE'),
  ('Tomáš Holeš', 'DF', 'Slavia Prague', 'CZE'),
  ('Robin Hranáč', 'DF', 'TSG Hoffenheim', 'GER'),
  ('Štěpán Chaloupek', 'DF', 'Slavia Prague', 'CZE'),
  ('Ladislav Krejčí', 'DF', 'Wolverhampton', 'ENG'),
  ('David Jurásek', 'DF', 'Slavia Prague', 'CZE'),
  ('Vladimír Darida', 'MF', 'Hradec Králové', 'CZE'),
  ('Alexandr Sojka', 'MF', 'Viktoria Plzeň', 'CZE'),
  ('Hugo Sochurek', 'MF', 'Sparta Prague', 'CZE'),
  ('Pavel Šulc', 'FW', 'Lyon', 'FRA'),
  ('Denis Visinsky', 'FW', 'Viktoria Plzeň', 'CZE'),
  ('Mojmir Chytil', 'FW', 'Slavia Prague', 'CZE')
) AS p(name, position, club, club_country)
WHERE t.code = 'CZE'
  AND NOT EXISTS (
    SELECT 1
    FROM public.players ex
    WHERE ex.id_team = t.id_team
      AND ex.name = p.name
  );

COMMIT;
