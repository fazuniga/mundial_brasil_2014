-- Refresh Group B player rosters to 26-player FIFA World Cup 2026 squads.
-- Sources: Canada Soccer, FIFA squad pages, Qatar press, and 2026 World Cup squad table.
-- Replaces stale/duplicate Group B seed rows while preserving referenced player ids.
BEGIN;

CREATE TEMP TABLE group_b_roster (
  team_code char(3) NOT NULL,
  name text NOT NULL,
  position text NOT NULL,
  club text NOT NULL,
  club_country text NOT NULL
) ON COMMIT DROP;

INSERT INTO group_b_roster (team_code, name, position, club, club_country) VALUES
  ('CAN', 'Dayne St. Clair', 'GK', 'Inter Miami CF', 'USA'),
  ('CAN', 'Maxime Crépeau', 'GK', 'Orlando City SC', 'USA'),
  ('CAN', 'Owen Goodman', 'GK', 'Barnsley', 'ENG'),
  ('CAN', 'Alistair Johnston', 'DF', 'Celtic', 'SCO'),
  ('CAN', 'Alfie Jones', 'DF', 'Middlesbrough', 'ENG'),
  ('CAN', 'Luc de Fougerolles', 'DF', 'Dender', 'BEL'),
  ('CAN', 'Joel Waterman', 'DF', 'Chicago Fire FC', 'USA'),
  ('CAN', 'Derek Cornelius', 'DF', 'Rangers', 'SCO'),
  ('CAN', 'Moïse Bombito', 'DF', 'Nice', 'FRA'),
  ('CAN', 'Alphonso Davies', 'DF', 'Bayern Munich', 'GER'),
  ('CAN', 'Richie Laryea', 'DF', 'Toronto FC', 'CAN'),
  ('CAN', 'Niko Sigur', 'DF', 'Hajduk Split', 'CRO'),
  ('CAN', 'Mathieu Choinière', 'MF', 'Los Angeles FC', 'USA'),
  ('CAN', 'Stephen Eustáquio', 'MF', 'Los Angeles FC', 'USA'),
  ('CAN', 'Ismaël Koné', 'MF', 'Sassuolo', 'ITA'),
  ('CAN', 'Liam Millar', 'MF', 'Hull City', 'ENG'),
  ('CAN', 'Jacob Shaffelburg', 'MF', 'Los Angeles FC', 'USA'),
  ('CAN', 'Jonathan Osorio', 'MF', 'Toronto FC', 'CAN'),
  ('CAN', 'Nathan Saliba', 'MF', 'Anderlecht', 'BEL'),
  ('CAN', 'Jayden Nelson', 'MF', 'Austin FC', 'USA'),
  ('CAN', 'Cyle Larin', 'FW', 'Southampton', 'ENG'),
  ('CAN', 'Jonathan David', 'FW', 'Juventus', 'ITA'),
  ('CAN', 'Tani Oluwaseyi', 'FW', 'Villarreal', 'ESP'),
  ('CAN', 'Tajon Buchanan', 'FW', 'Villarreal', 'ESP'),
  ('CAN', 'Ali Ahmed', 'FW', 'Norwich City', 'ENG'),
  ('CAN', 'Promise David', 'FW', 'Union Saint-Gilloise', 'BEL'),
  ('BIH', 'Nikola Vasilj', 'GK', 'FC St. Pauli', 'GER'),
  ('BIH', 'Mladen Jurkas', 'GK', 'Borac Banja Luka', 'BIH'),
  ('BIH', 'Martin Zlomislić', 'GK', 'Rijeka', 'CRO'),
  ('BIH', 'Nihad Mujakić', 'DF', 'Gaziantep', 'TUR'),
  ('BIH', 'Dennis Hadžikadunić', 'DF', 'Sampdoria', 'ITA'),
  ('BIH', 'Tarik Muharemović', 'DF', 'Sassuolo', 'ITA'),
  ('BIH', 'Sead Kolašinac', 'DF', 'Atalanta', 'ITA'),
  ('BIH', 'Amar Dedić', 'DF', 'Benfica', 'POR'),
  ('BIH', 'Nikola Katić', 'DF', 'Schalke 04', 'GER'),
  ('BIH', 'Stjepan Radeljić', 'DF', 'Rijeka', 'CRO'),
  ('BIH', 'Arjan Malić', 'DF', 'Sturm Graz', 'AUT'),
  ('BIH', 'Benjamin Tahirović', 'MF', 'Brøndby', 'DEN'),
  ('BIH', 'Armin Gigović', 'MF', 'Young Boys', 'SUI'),
  ('BIH', 'Ivan Bašić', 'MF', 'Astana', 'KAZ'),
  ('BIH', 'Ivan Šunjić', 'MF', 'Pafos', 'CYP'),
  ('BIH', 'Amar Memić', 'MF', 'Viktoria Plzeň', 'CZE'),
  ('BIH', 'Amir Hadžiahmetović', 'MF', 'Hull City', 'ENG'),
  ('BIH', 'Dženis Burnić', 'MF', 'Karlsruher SC', 'GER'),
  ('BIH', 'Ermin Mahmić', 'MF', 'Slovan Liberec', 'CZE'),
  ('BIH', 'Samed Baždar', 'FW', 'Jagiellonia Białystok', 'POL'),
  ('BIH', 'Ermedin Demirović', 'FW', 'VfB Stuttgart', 'GER'),
  ('BIH', 'Edin Džeko', 'FW', 'Schalke 04', 'GER'),
  ('BIH', 'Kerim Alajbegović', 'FW', 'Red Bull Salzburg', 'AUT'),
  ('BIH', 'Esmir Bajraktarević', 'FW', 'PSV Eindhoven', 'NED'),
  ('BIH', 'Haris Tabaković', 'FW', 'Borussia Mönchengladbach', 'GER'),
  ('BIH', 'Jovo Lukić', 'FW', 'Universitatea Cluj', 'ROU'),
  ('QAT', 'Mahmud Abunada', 'GK', 'Al-Rayyan', 'QAT'),
  ('QAT', 'Salah Zakaria', 'GK', 'Al-Duhail', 'QAT'),
  ('QAT', 'Meshaal Barsham', 'GK', 'Al-Sadd', 'QAT'),
  ('QAT', 'Pedro Miguel', 'DF', 'Al-Sadd', 'QAT'),
  ('QAT', 'Lucas Mendes', 'DF', 'Al-Wakrah', 'QAT'),
  ('QAT', 'Issa Laye', 'DF', 'Al-Arabi', 'QAT'),
  ('QAT', 'Jassem Gaber', 'DF', 'Al-Rayyan', 'QAT'),
  ('QAT', 'Ayoub Al-Oui', 'DF', 'Al-Gharafa', 'QAT'),
  ('QAT', 'Homam Ahmed', 'DF', 'Cultural Leonesa', 'ESP'),
  ('QAT', 'Boualem Khoukhi', 'DF', 'Al-Sadd', 'QAT'),
  ('QAT', 'Sultan Al-Brake', 'DF', 'Al-Duhail', 'QAT'),
  ('QAT', 'Al-Hashmi Al-Hussain', 'DF', 'Al-Arabi', 'QAT'),
  ('QAT', 'Abdulaziz Hatem', 'MF', 'Al-Rayyan', 'QAT'),
  ('QAT', 'Karim Boudiaf', 'MF', 'Al-Duhail', 'QAT'),
  ('QAT', 'Ahmed Al-Ganehi', 'MF', 'Al-Gharafa', 'QAT'),
  ('QAT', 'Ahmed Fathy', 'MF', 'Al-Arabi', 'QAT'),
  ('QAT', 'Assim Madibo', 'MF', 'Al-Wakrah', 'QAT'),
  ('QAT', 'Ahmed Alaaeldin', 'FW', 'Al-Rayyan', 'QAT'),
  ('QAT', 'Edmilson Junior', 'FW', 'Al-Duhail', 'QAT'),
  ('QAT', 'Mohammed Muntari', 'FW', 'Al-Gharafa', 'QAT'),
  ('QAT', 'Hassan Al-Haydos', 'FW', 'Al-Sadd', 'QAT'),
  ('QAT', 'Akram Afif', 'FW', 'Al-Sadd', 'QAT'),
  ('QAT', 'Yusuf Abdurisag', 'FW', 'Al-Wakrah', 'QAT'),
  ('QAT', 'Almoez Ali', 'FW', 'Al-Duhail', 'QAT'),
  ('QAT', 'Tahsin Jamshid', 'FW', 'Al-Duhail', 'QAT'),
  ('QAT', 'Mohamed Manai', 'FW', 'Al-Shamal', 'QAT'),
  ('SUI', 'Gregor Kobel', 'GK', 'Borussia Dortmund', 'GER'),
  ('SUI', 'Yvon Mvogo', 'GK', 'Lorient', 'FRA'),
  ('SUI', 'Marvin Keller', 'GK', 'Young Boys', 'SUI'),
  ('SUI', 'Miro Muheim', 'DF', 'Hamburger SV', 'GER'),
  ('SUI', 'Silvan Widmer', 'DF', 'Mainz 05', 'GER'),
  ('SUI', 'Nico Elvedi', 'DF', 'Borussia Mönchengladbach', 'GER'),
  ('SUI', 'Manuel Akanji', 'DF', 'Inter Milan', 'ITA'),
  ('SUI', 'Ricardo Rodriguez', 'DF', 'Real Betis', 'ESP'),
  ('SUI', 'Eray Cömert', 'DF', 'Valencia', 'ESP'),
  ('SUI', 'Aurèle Amenda', 'DF', 'Eintracht Frankfurt', 'GER'),
  ('SUI', 'Luca Jaquez', 'DF', 'VfB Stuttgart', 'GER'),
  ('SUI', 'Denis Zakaria', 'MF', 'Monaco', 'FRA'),
  ('SUI', 'Remo Freuler', 'MF', 'Bologna', 'ITA'),
  ('SUI', 'Johan Manzambi', 'MF', 'SC Freiburg', 'GER'),
  ('SUI', 'Granit Xhaka', 'MF', 'Sunderland', 'ENG'),
  ('SUI', 'Ardon Jashari', 'MF', 'Milan', 'ITA'),
  ('SUI', 'Djibril Sow', 'MF', 'Sevilla', 'ESP'),
  ('SUI', 'Michel Aebischer', 'MF', 'Bologna', 'ITA'),
  ('SUI', 'Fabian Rieder', 'MF', 'FC Augsburg', 'GER'),
  ('SUI', 'Breel Embolo', 'FW', 'Rennes', 'FRA'),
  ('SUI', 'Dan Ndoye', 'FW', 'Nottingham Forest', 'ENG'),
  ('SUI', 'Christian Fassnacht', 'FW', 'Young Boys', 'SUI'),
  ('SUI', 'Rubén Vargas', 'FW', 'Sevilla', 'ESP'),
  ('SUI', 'Noah Okafor', 'FW', 'Leeds United', 'ENG'),
  ('SUI', 'Zeki Amdouni', 'FW', 'Burnley', 'ENG'),
  ('SUI', 'Cedric Itten', 'FW', 'Fortuna Düsseldorf', 'GER');

UPDATE public.players p
SET
  position = r.position,
  club = r.club,
  club_country = r.club_country
FROM public.teams t
JOIN group_b_roster r ON r.team_code = t.code
WHERE p.id_team = t.id_team
  AND p.name = r.name;

INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, r.name, r.position, r.club, r.club_country
FROM group_b_roster r
JOIN public.teams t ON t.code = r.team_code
WHERE NOT EXISTS (
  SELECT 1
  FROM public.players p
  WHERE p.id_team = t.id_team
    AND p.name = r.name
);

WITH duplicate_or_removed AS (
  SELECT p.id_player
  FROM public.players p
  JOIN public.teams t ON t.id_team = p.id_team
  WHERE t.code IN ('CAN', 'BIH', 'QAT', 'SUI')
    AND (
      NOT EXISTS (
        SELECT 1
        FROM group_b_roster r
        WHERE r.team_code = t.code
          AND r.name = p.name
      )
      OR p.id_player <> (
        SELECT min(p2.id_player)
        FROM public.players p2
        WHERE p2.id_team = p.id_team
          AND p2.name = p.name
      )
    )
),
unreferenced AS (
  SELECT d.id_player
  FROM duplicate_or_removed d
  WHERE NOT EXISTS (
      SELECT 1 FROM public.tournament_predictions tp
      WHERE tp.top_scorer_player_id = d.id_player
    )
    AND NOT EXISTS (
      SELECT 1 FROM public.tournament_results tr
      WHERE tr.top_scorer_player_id = d.id_player
    )
    AND NOT EXISTS (
      SELECT 1 FROM public.match_results mr
      WHERE mr.first_goal_player_id = d.id_player
    )
    AND NOT EXISTS (
      SELECT 1 FROM public.match_goals mg
      WHERE mg.id_player = d.id_player
    )
)
DELETE FROM public.players p
USING unreferenced u
WHERE p.id_player = u.id_player;

COMMIT;
