INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Diogo Costa', 'GK', 'Porto', 'POR'),
  ('José Sá', 'GK', 'Wolverhampton', 'ENG'),
  ('Rúben Dias', 'DF', 'Manchester City', 'ENG'),
  ('Nuno Mendes', 'DF', 'Paris Saint-Germain', 'FRA'),
  ('João Cancelo', 'DF', 'Al-Hilal', 'KSA'),
  ('Bruno Fernandes', 'MF', 'Manchester United', 'ENG'),
  ('Bernardo Silva', 'MF', 'Manchester City', 'ENG'),
  ('Vitinha', 'MF', 'Paris Saint-Germain', 'FRA'),
  ('Cristiano Ronaldo', 'FW', 'Al-Nassr', 'KSA'),
  ('Rafael Leão', 'FW', 'Milan', 'ITA'),
  ('Diogo Jota', 'FW', 'Liverpool', 'ENG'),
  ('Gonçalo Ramos', 'FW', 'Paris Saint-Germain', 'FRA'),
  ('João Félix', 'FW', 'Chelsea', 'ENG'),
  ('Pedro Neto', 'FW', 'Chelsea', 'ENG'),
  ('Francisco Conceição', 'FW', 'Porto', 'POR'),
  ('Otávio', 'MF', 'Al-Nassr', 'KSA'),
  ('Rúben Neves', 'MF', 'Al-Hilal', 'KSA'),
  ('Pepe', 'DF', 'Porto', 'POR')
) AS p(name, position, club, club_country)
WHERE t.code = 'POR';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Joël Kiassumbua', 'GK', 'Lugano', 'SUI'),
  ('Parfait Mandanda', 'GK', 'RS Berkane', 'MAR'),
  ('Chancel Mbemba', 'DF', 'Marseille', 'FRA'),
  ('Christian Luyindama', 'DF', 'Standard Liège', 'BEL'),
  ('Arthur Masuaku', 'DF', 'Sunderland', 'ENG'),
  ('Gaël Kakuta', 'MF', 'Amiens', 'FRA'),
  ('Edo Kayembe', 'MF', 'Watford', 'ENG'),
  ('Théo Bongonda', 'FW', 'Standard Liège', 'BEL'),
  ('Yoane Wissa', 'FW', 'Brentford', 'ENG'),
  ('Cédric Bakambu', 'FW', 'Real Betis', 'ESP'),
  ('Fiston Mayele', 'FW', 'Pyramids', 'EGY'),
  ('Miché Mika', 'FW', 'RS Berkane', 'MAR'),
  ('Beni Baningime', 'MF', 'Heart of Midlothian', 'SCO'),
  ('Samuel Moutoussamy', 'MF', 'Changchun Yatai', 'CHN'),
  ('Paul-José M''Poku', 'FW', 'Ankaragücü', 'TUR'),
  ('Gael Kakuta', 'MF', 'Amiens', 'FRA'),
  ('Chancel Mbemba', 'MF', 'Marseille', 'FRA'),
  ('Yoane Wissa', 'MF', 'Brentford', 'ENG')
) AS p(name, position, club, club_country)
WHERE t.code = 'COD';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Utkir Yusupov', 'GK', 'Pakhtakor', 'UZB'),
  ('Rustam Yatimov', 'GK', 'Pakhtakor', 'UZB'),
  ('Egor Krimets', 'DF', 'Pakhtakor', 'UZB'),
  ('Abdukakhkhor Abdumavlonov', 'DF', 'Nasaf', 'UZB'),
  ('Jaloliddin Masharipov', 'MF', 'Al-Nassr', 'KSA'),
  ('Odil Ahmedov', 'MF', 'Pakhtakor', 'UZB'),
  ('Jasurbek Yakhshibekov', 'MF', 'Nasaf', 'UZB'),
  ('Eldor Shomurodov', 'FW', 'Roma', 'ITA'),
  ('Igor Sergeev', 'FW', 'Pakhtakor', 'UZB'),
  ('Abbosbek Fayzullaev', 'FW', 'CSKA Moscow', 'RUS'),
  ('Otabek Shukurov', 'MF', 'Sharjah', 'UAE'),
  ('Sanjar Tursunov', 'FW', 'Nasaf', 'UZB'),
  ('Azizbek Turgunboev', 'FW', 'Pakhtakor', 'UZB'),
  ('Jasurbek Yakhshibekov', 'FW', 'Nasaf', 'UZB'),
  ('Khozhimat Erkinov', 'MF', 'Pakhtakor', 'UZB'),
  ('Sherzod Nasriddinov', 'DF', 'Nasaf', 'UZB'),
  ('Odil Abdurakhmanov', 'DF', 'Pakhtakor', 'UZB'),
  ('Rustam Yatimov', 'MF', 'Pakhtakor', 'UZB')
) AS p(name, position, club, club_country)
WHERE t.code = 'UZB';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Camilo Vargas', 'GK', 'Atlas', 'MEX'),
  ('David Ospina', 'GK', 'Al-Nassr', 'KSA'),
  ('Davinson Sánchez', 'DF', 'Galatasaray', 'TUR'),
  ('Yerry Mina', 'DF', 'Cagliari', 'ITA'),
  ('Johan Mojica', 'DF', 'Mallorca', 'ESP'),
  ('James Rodríguez', 'MF', 'León', 'MEX'),
  ('Luis Díaz', 'FW', 'Liverpool', 'ENG'),
  ('Luis Sinisterra', 'FW', 'Bournemouth', 'ENG'),
  ('Rafael Borré', 'FW', 'Internacional', 'BRA'),
  ('Jhon Durán', 'FW', 'Aston Villa', 'ENG'),
  ('Sebastián Villa', 'FW', 'Boca Juniors', 'ARG'),
  ('Jefferson Lerma', 'MF', 'Crystal Palace', 'ENG'),
  ('Wilmar Barrios', 'MF', 'Zenit', 'RUS'),
  ('Jhon Arias', 'MF', 'Fluminense', 'BRA'),
  ('Jhon Lucumí', 'DF', 'Bologna', 'ITA'),
  ('Santiago Arias', 'DF', 'América', 'MEX'),
  ('Mateus Uribe', 'MF', 'Monterrey', 'MEX'),
  ('Jhon Cordoba', 'FW', 'Krasnodar', 'RUS')
) AS p(name, position, club, club_country)
WHERE t.code = 'COL';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Jordan Pickford', 'GK', 'Everton', 'ENG'),
  ('Nick Pope', 'GK', 'Newcastle United', 'ENG'),
  ('John Stones', 'DF', 'Manchester City', 'ENG'),
  ('Harry Maguire', 'DF', 'Manchester United', 'ENG'),
  ('Kyle Walker', 'DF', 'Manchester City', 'ENG'),
  ('Declan Rice', 'MF', 'Arsenal', 'ENG'),
  ('Jude Bellingham', 'MF', 'Real Madrid', 'ESP'),
  ('Phil Foden', 'MF', 'Manchester City', 'ENG'),
  ('Harry Kane', 'FW', 'Bayern Munich', 'GER'),
  ('Bukayo Saka', 'FW', 'Arsenal', 'ENG'),
  ('Ollie Watkins', 'FW', 'Aston Villa', 'ENG'),
  ('Anthony Gordon', 'FW', 'Newcastle United', 'ENG'),
  ('Cole Palmer', 'FW', 'Chelsea', 'ENG'),
  ('Ivan Toney', 'FW', 'Al-Ahli', 'KSA'),
  ('Jack Grealish', 'FW', 'Manchester City', 'ENG'),
  ('Trent Alexander-Arnold', 'DF', 'Liverpool', 'ENG'),
  ('Kobbie Mainoo', 'MF', 'Manchester United', 'ENG'),
  ('Ezri Konsa', 'DF', 'Aston Villa', 'ENG')
) AS p(name, position, club, club_country)
WHERE t.code = 'ENG';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Dominik Livaković', 'GK', 'Fenerbahçe', 'TUR'),
  ('Lovro Kalinić', 'GK', 'Hajduk Split', 'CRO'),
  ('Joško Gvardiol', 'DF', 'Manchester City', 'ENG'),
  ('Dejan Lovren', 'DF', 'Fenerbahçe', 'TUR'),
  ('Borna Sosa', 'DF', 'Torino', 'ITA'),
  ('Luka Modrić', 'MF', 'Real Madrid', 'ESP'),
  ('Mateo Kovačić', 'MF', 'Manchester City', 'ENG'),
  ('Marcelo Brozović', 'MF', 'Al-Nassr', 'KSA'),
  ('Bruno Petković', 'FW', 'Dinamo Zagreb', 'CRO'),
  ('Marko Livaja', 'FW', 'Hajduk Split', 'CRO'),
  ('Ivan Perišić', 'FW', 'Hajduk Split', 'CRO'),
  ('Ante Rebić', 'FW', 'Beşiktaş', 'TUR'),
  ('Mario Pašalić', 'MF', 'Atalanta', 'ITA'),
  ('Luka Sučić', 'MF', 'Real Sociedad', 'ESP'),
  ('Josip Juranović', 'DF', 'Union Berlin', 'GER'),
  ('Martin Baturina', 'MF', 'Dinamo Zagreb', 'CRO'),
  ('Nikola Vlašić', 'MF', 'Torino', 'ITA'),
  ('Pepe', 'DF', 'Porto', 'POR')
) AS p(name, position, club, club_country)
WHERE t.code = 'CRO';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Lawrence Ati-Zigi', 'GK', 'St. Gallen', 'SUI'),
  ('Richard Ofori', 'GK', 'Kaizer Chiefs', 'RSA'),
  ('Daniel Amartey', 'DF', 'Leicester City', 'ENG'),
  ('Alexander Djiku', 'DF', 'Fenerbahçe', 'TUR'),
  ('Gideon Mensah', 'DF', 'Auxerre', 'FRA'),
  ('Thomas Partey', 'MF', 'Arsenal', 'ENG'),
  ('Mohammed Kudus', 'MF', 'West Ham', 'ENG'),
  ('Salis Abdul Samed', 'MF', 'Lens', 'FRA'),
  ('André Ayew', 'FW', 'Le Havre', 'FRA'),
  ('Jordan Ayew', 'FW', 'Leicester City', 'ENG'),
  ('Inaki Williams', 'FW', 'Athletic Club', 'ESP'),
  ('Antoine Semenyo', 'FW', 'Bournemouth', 'ENG'),
  ('Ernest Nuamah', 'FW', 'Lyon', 'FRA'),
  ('Kamaldeen Sulemana', 'FW', 'Southampton', 'ENG'),
  ('Joseph Paintsil', 'FW', 'LA Galaxy', 'USA'),
  ('Daniel-Kofi Kyereh', 'MF', 'Freiburg', 'GER'),
  ('Alidu Seidu', 'DF', 'Rennes', 'FRA'),
  ('Baba Idrissu', 'MF', 'Viborg', 'DEN')
) AS p(name, position, club, club_country)
WHERE t.code = 'GHA';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Jaime Penedo', 'GK', 'Dinamo București', 'ROU'),
  ('Luis Mejía', 'GK', 'Nacional', 'URY'),
  ('Michael Murillo', 'DF', 'Marseille', 'FRA'),
  ('Fidel Escobar', 'DF', 'Al-Adalah', 'KSA'),
  ('Harold Cummings', 'DF', 'Saprissa', 'PAN'),
  ('Aníbal Godoy', 'MF', 'Nashville SC', 'USA'),
  ('Adalberto Carrasquilla', 'MF', 'Houston Dynamo', 'USA'),
  ('José Fajardo', 'FW', 'Saprissa', 'PAN'),
  ('Ismael Díaz', 'FW', 'Mazatlán', 'MEX'),
  ('Alberto Quintero', 'FW', 'Universitario', 'PER'),
  ('Gabriel Torres', 'FW', 'The Strongest', 'BOL'),
  ('Rolando Blackburn', 'FW', 'The Strongest', 'BOL'),
  ('César Blackman', 'MF', 'Dunaj Streda', 'SVK'),
  ('Jorge Gómez', 'DF', 'Comunicaciones', 'GUA'),
  ('José Luis Rodríguez', 'MF', 'Deportivo Saprissa', 'PAN'),
  ('Omar Browne', 'FW', 'Independiente', 'PAN'),
  ('Ricardo Ávila', 'MF', 'Gent', 'BEL'),
  ('Ismael Díaz', 'MF', 'Mazatlán', 'MEX')
) AS p(name, position, club, club_country)
WHERE t.code = 'PAN';

INSERT INTO public.tournament_results (id) VALUES (1) ON CONFLICT (id) DO NOTHING;
COMMIT;

-- Total: 864 players across 48 teams

