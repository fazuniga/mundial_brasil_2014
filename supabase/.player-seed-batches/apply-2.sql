INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Alisson', 'GK', 'Liverpool', 'ENG'),
  ('Ederson', 'GK', 'Manchester City', 'ENG'),
  ('Marquinhos', 'DF', 'Paris Saint-Germain', 'FRA'),
  ('Gabriel Magalhães', 'DF', 'Arsenal', 'ENG'),
  ('Danilo', 'DF', 'Juventus', 'ITA'),
  ('Wendell', 'DF', 'Porto', 'POR'),
  ('Casemiro', 'MF', 'Manchester United', 'ENG'),
  ('Bruno Guimarães', 'MF', 'Newcastle United', 'ENG'),
  ('Paquetá', 'MF', 'West Ham', 'ENG'),
  ('Rodrygo', 'FW', 'Real Madrid', 'ESP'),
  ('Vinícius Júnior', 'FW', 'Real Madrid', 'ESP'),
  ('Richarlison', 'FW', 'Tottenham', 'ENG'),
  ('Endrick', 'FW', 'Real Madrid', 'ESP'),
  ('Raphinha', 'FW', 'Barcelona', 'ESP'),
  ('Gabriel Martinelli', 'FW', 'Arsenal', 'ENG'),
  ('André', 'MF', 'Wolverhampton', 'ENG'),
  ('Estêvão', 'FW', 'Palmeiras', 'BRA'),
  ('Lucas Paquetá', 'MF', 'West Ham', 'ENG')
) AS p(name, position, club, club_country)
WHERE t.code = 'BRA';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Yassine Bono', 'GK', 'Al-Hilal', 'KSA'),
  ('Munir El Kajoui', 'GK', 'Wydad AC', 'MAR'),
  ('Achraf Hakimi', 'DF', 'Paris Saint-Germain', 'FRA'),
  ('Romain Saïss', 'DF', 'Al-Shabab', 'KSA'),
  ('Nayef Aguerd', 'DF', 'Real Sociedad', 'ESP'),
  ('Noussair Mazraoui', 'DF', 'Manchester United', 'ENG'),
  ('Sofyan Amrabat', 'MF', 'Manchester United', 'ENG'),
  ('Azzedine Ounahi', 'MF', 'Marseille', 'FRA'),
  ('Selim Amallah', 'MF', 'Valencia', 'ESP'),
  ('Hakim Ziyech', 'MF', 'Galatasaray', 'TUR'),
  ('Youssef En-Nesyri', 'FW', 'Sevilla', 'ESP'),
  ('Brahim Díaz', 'FW', 'Real Madrid', 'ESP'),
  ('Sofiane Boufal', 'FW', 'Angers', 'FRA'),
  ('Abde Ezzalzouli', 'FW', 'Real Betis', 'ESP'),
  ('Amine Harit', 'MF', 'Marseille', 'FRA'),
  ('Ayoub El Kaabi', 'FW', 'Olympiacos', 'GRE'),
  ('Ismaël Saibari', 'MF', 'PSV', 'NED'),
  ('Oussama Targhalline', 'MF', 'Feyenoord', 'NED')
) AS p(name, position, club, club_country)
WHERE t.code = 'MAR';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Johny Placide', 'GK', 'Antwerp', 'BEL'),
  ('Josue Duverger', 'GK', 'Violette AC', 'HAI'),
  ('Derrick Etienne', 'DF', 'Los Angeles FC', 'USA'),
  ('Carlens Arcus', 'DF', 'Auxerre', 'FRA'),
  ('Mechack Joseph', 'DF', 'Lens', 'FRA'),
  ('Zachary Herivaux', 'MF', 'Colorado Rapids', 'USA'),
  ('Derrick Etienne Jr.', 'MF', 'Montreal', 'CAN'),
  ('Bryan Alceus', 'MF', 'Gaziantep', 'TUR'),
  ('Frantzdy Pierrot', 'FW', 'Salernitana', 'ITA'),
  ('Duckens Nazon', 'FW', 'Saint-Étienne', 'FRA'),
  ('Mondy Prunier', 'FW', 'Grenoble', 'FRA'),
  ('Carnejy Antoine', 'FW', 'Portland Timbers', 'USA'),
  ('Widner Saintcyr', 'MF', 'Violette AC', 'HAI'),
  ('Bryan Labady', 'FW', 'Miami FC', 'USA'),
  ('Danley Jean Jacques', 'MF', 'Le Havre', 'FRA'),
  ('Ricardo Adé', 'DF', 'Miami FC', 'USA'),
  ('Johannese Michel', 'MF', 'Violette AC', 'HAI'),
  ('Wesley Lautoa', 'DF', 'Caen', 'FRA')
) AS p(name, position, club, club_country)
WHERE t.code = 'HAI';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Angus Gunn', 'GK', 'Nottingham Forest', 'ENG'),
  ('Craig Gordon', 'GK', 'Hearts', 'SCO'),
  ('Kieran Tierney', 'DF', 'Real Sociedad', 'ESP'),
  ('Grant Hanley', 'DF', 'Bristol City', 'ENG'),
  ('Jack Hendry', 'DF', 'Al-Ettifaq', 'KSA'),
  ('Andrew Robertson', 'DF', 'Liverpool', 'ENG'),
  ('Scott McTominay', 'MF', 'Napoli', 'ITA'),
  ('John McGinn', 'MF', 'Aston Villa', 'ENG'),
  ('Ryan Christie', 'MF', 'Bournemouth', 'ENG'),
  ('Billy Gilmour', 'MF', 'Napoli', 'ITA'),
  ('Che Adams', 'FW', 'Torino', 'ITA'),
  ('Lyndon Dykes', 'FW', 'QPR', 'ENG'),
  ('Lawrence Shankland', 'FW', 'Club Brugge', 'BEL'),
  ('Lewis Morgan', 'FW', 'New York Red Bulls', 'USA'),
  ('Kenny McLean', 'MF', 'Norwich City', 'ENG'),
  ('Callum McGregor', 'MF', 'Celtic', 'SCO'),
  ('Anthony Ralston', 'DF', 'Celtic', 'SCO'),
  ('Lewis Ferguson', 'MF', 'Bologna', 'ITA')
) AS p(name, position, club, club_country)
WHERE t.code = 'SCO';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Matt Turner', 'GK', 'Nottingham Forest', 'ENG'),
  ('Ethan Horvath', 'GK', 'Cardiff City', 'WAL'),
  ('Chris Richards', 'DF', 'Crystal Palace', 'ENG'),
  ('Antonee Robinson', 'DF', 'Fulham', 'ENG'),
  ('Walker Zimmerman', 'DF', 'Dallas', 'USA'),
  ('Sergiño Dest', 'DF', 'PSV', 'NED'),
  ('Tyler Adams', 'MF', 'Bournemouth', 'ENG'),
  ('Weston McKennie', 'MF', 'Juventus', 'ITA'),
  ('Yunus Musah', 'MF', 'Milan', 'ITA'),
  ('Gio Reyna', 'MF', 'Borussia Dortmund', 'GER'),
  ('Christian Pulisic', 'FW', 'Milan', 'ITA'),
  ('Folarin Balogun', 'FW', 'Monaco', 'FRA'),
  ('Ricardo Pepi', 'FW', 'PSV', 'NED'),
  ('Haji Wright', 'FW', 'Coventry City', 'ENG'),
  ('Tim Weah', 'FW', 'Juventus', 'ITA'),
  ('Brenden Aaronson', 'MF', 'Union Berlin', 'GER'),
  ('Johnny Cardoso', 'MF', 'Real Betis', 'ESP'),
  ('Malik Tillman', 'MF', 'Bayer Leverkusen', 'GER')
) AS p(name, position, club, club_country)
WHERE t.code = 'USA';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Antony Silva', 'GK', 'Olimpia', 'PAR'),
  ('Gerardo Ortiz', 'GK', 'Libertad', 'PAR'),
  ('Gustavo Gómez', 'DF', 'Palmeiras', 'BRA'),
  ('Omar Alderete', 'DF', 'Getafe', 'ESP'),
  ('Blas Riveros', 'DF', 'Braga', 'POR'),
  ('Matías Rojas', 'MF', 'Inter Miami', 'USA'),
  ('Miguel Almirón', 'MF', 'Newcastle United', 'ENG'),
  ('Richard Sánchez', 'MF', 'América', 'MEX'),
  ('Diego Gómez', 'MF', 'Inter Miami', 'USA'),
  ('Julio Enciso', 'FW', 'Brighton', 'ENG'),
  ('Antonio Sanabria', 'FW', 'Torino', 'ITA'),
  ('Gabriel Avalos', 'FW', 'Argentinos Juniors', 'ARG'),
  ('Carlos González', 'FW', 'Olimpia', 'PAR'),
  ('Alejandro Romero Gamarra', 'FW', 'Al-Rayyan', 'QAT'),
  ('Ramón Sosa', 'FW', 'Nottingham Forest', 'ENG'),
  ('Juan Iturbe', 'FW', 'Guaraní', 'PAR'),
  ('Héctor Morel', 'DF', 'Libertad', 'PAR'),
  ('Júnior Alonso', 'DF', 'Krasnodar', 'RUS')
) AS p(name, position, club, club_country)
WHERE t.code = 'PAR';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Mathew Ryan', 'GK', 'Roma', 'ITA'),
  ('Mark Gillespie', 'GK', 'Newcastle Jets', 'AUS'),
  ('Harry Souttar', 'DF', 'Sheffield United', 'ENG'),
  ('Kye Rowles', 'DF', 'Hearts', 'SCO'),
  ('Aziz Behich', 'DF', 'Melbourne City', 'AUS'),
  ('Jackson Irvine', 'MF', 'St. Pauli', 'GER'),
  ('Riley McGree', 'MF', 'Middlesbrough', 'ENG'),
  ('Aiden O''Neill', 'MF', 'Millwall', 'ENG'),
  ('Craig Goodwin', 'MF', 'Adelaide United', 'AUS'),
  ('Mathew Leckie', 'FW', 'Melbourne City', 'AUS'),
  ('Mitchell Duke', 'FW', 'Machida Zelvia', 'JPN'),
  ('Martin Boyle', 'FW', 'Hibernian', 'SCO'),
  ('Brandon Borrello', 'FW', 'Western Sydney', 'AUS'),
  ('Garang Kuol', 'FW', 'Volendam', 'NED'),
  ('Nestory Irankunda', 'FW', 'Watford', 'ENG'),
  ('Keanu Baccus', 'MF', 'St. Mirren', 'SCO'),
  ('Connor Metcalfe', 'MF', 'Hamburger SV', 'GER'),
  ('Bailey Wright', 'DF', 'Coventry City', 'ENG')
) AS p(name, position, club, club_country)
WHERE t.code = 'AUS';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Uğurcan Çakır', 'GK', 'Trabzonspor', 'TUR'),
  ('Altay Bayındır', 'GK', 'Manchester United', 'ENG'),
  ('Merih Demiral', 'DF', 'Al-Ahli', 'KSA'),
  ('Çağlar Söyüncü', 'DF', 'Fenerbahçe', 'TUR'),
  ('Zeki Çelik', 'DF', 'Roma', 'ITA'),
  ('Hakan Çalhanoğlu', 'MF', 'Inter Milan', 'ITA'),
  ('Orkun Kökçü', 'MF', 'Benfica', 'POR'),
  ('İrfan Can Kahveci', 'MF', 'Fenerbahçe', 'TUR'),
  ('Arda Güler', 'MF', 'Real Madrid', 'ESP'),
  ('Kenan Yıldız', 'FW', 'Juventus', 'ITA'),
  ('Cenk Tosun', 'FW', 'Beşiktaş', 'TUR'),
  ('Barış Alper Yılmaz', 'FW', 'Galatasaray', 'TUR'),
  ('Enes Ünal', 'FW', 'Getafe', 'ESP'),
  ('Kerem Aktürkoğlu', 'FW', 'Benfica', 'POR'),
  ('Yunus Akgün', 'FW', 'Galatasaray', 'TUR'),
  ('Salih Özcan', 'MF', 'Borussia Dortmund', 'GER'),
  ('Ferdi Kadıoğlu', 'DF', 'Brighton', 'ENG'),
  ('Abdülkerim Bardakcı', 'DF', 'Galatasaray', 'TUR')
) AS p(name, position, club, club_country)
WHERE t.code = 'TUR';