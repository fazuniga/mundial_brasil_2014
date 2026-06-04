INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Thibaut Courtois', 'GK', 'Real Madrid', 'ESP'),
  ('Koen Casteels', 'GK', 'Wolfsburg', 'GER'),
  ('Timothy Castagne', 'DF', 'Fulham', 'ENG'),
  ('Arthur Theate', 'DF', 'Eintracht Frankfurt', 'GER'),
  ('Zeno Debast', 'DF', 'Sporting CP', 'POR'),
  ('Kevin De Bruyne', 'MF', 'Manchester City', 'ENG'),
  ('Youri Tielemans', 'MF', 'Aston Villa', 'ENG'),
  ('Amadou Onana', 'MF', 'Everton', 'ENG'),
  ('Romelu Lukaku', 'FW', 'Napoli', 'ITA'),
  ('Loïs Openda', 'FW', 'RB Leipzig', 'GER'),
  ('Dodi Lukebakio', 'FW', 'Sevilla', 'ESP'),
  ('Charles De Ketelaere', 'FW', 'Atalanta', 'ITA'),
  ('Jérémy Doku', 'FW', 'Manchester City', 'ENG'),
  ('Leandro Trossard', 'FW', 'Arsenal', 'ENG'),
  ('Johan Bakayoko', 'FW', 'PSV', 'NED'),
  ('Axel Witsel', 'MF', 'Atlético Madrid', 'ESP'),
  ('Thomas Meunier', 'DF', 'Trabzonspor', 'TUR'),
  ('Orel Mangala', 'MF', 'Lyon', 'FRA')
) AS p(name, position, club, club_country)
WHERE t.code = 'BEL';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Mohamed El Shenawy', 'GK', 'Al-Ahly', 'EGY'),
  ('Mohamed Abou Gabal', 'GK', 'Zamalek', 'EGY'),
  ('Ahmed Hegazi', 'DF', 'Al-Ittihad', 'KSA'),
  ('Mohamed Hany', 'DF', 'Al-Ahly', 'EGY'),
  ('Mohamed Abdelmonem', 'DF', 'Nice', 'FRA'),
  ('Mohamed Elneny', 'MF', 'Arsenal', 'ENG'),
  ('Emam Ashour', 'MF', 'Al-Ahly', 'EGY'),
  ('Mohamed Salah', 'FW', 'Liverpool', 'ENG'),
  ('Omar Marmoush', 'FW', 'Eintracht Frankfurt', 'GER'),
  ('Mostafa Mohamed', 'FW', 'Nantes', 'FRA'),
  ('Ahmed Hassan', 'FW', 'Panathinaikos', 'GRE'),
  ('Trézéguet', 'FW', 'Al-Ahly', 'EGY'),
  ('Marwan Hamdy', 'FW', 'Al-Ettifaq', 'KSA'),
  ('Zizo', 'FW', 'Al-Ahly', 'EGY'),
  ('Mohamed Magdy', 'MF', 'Pyramids', 'EGY'),
  ('Mahmoud Trezeguet', 'FW', 'Al-Ahly', 'EGY'),
  ('Ahmed Sayed Zizo', 'FW', 'Al-Ahly', 'EGY'),
  ('Mohamed Abdelrazek', 'DF', 'Zamalek', 'EGY')
) AS p(name, position, club, club_country)
WHERE t.code = 'EGY';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Alireza Beiranvand', 'GK', 'Persepolis', 'IRN'),
  ('Hossein Hosseini', 'GK', 'Esteghlal', 'IRN'),
  ('Ramin Rezaeian', 'DF', 'Al-Shabab', 'KSA'),
  ('Shojae Khalilzadeh', 'DF', 'Tractor', 'IRN'),
  ('Milad Mohammadi', 'DF', 'AEK Athens', 'GRE'),
  ('Saeid Ezatolahi', 'MF', 'Rostov', 'RUS'),
  ('Alireza Jahanbakhsh', 'FW', 'Feyenoord', 'NED'),
  ('Sardar Azmoun', 'FW', 'Shabab Al-Ahli', 'UAE'),
  ('Mehdi Taremi', 'FW', 'Inter Milan', 'ITA'),
  ('Saman Ghoddos', 'FW', 'Brentford', 'ENG'),
  ('Karim Ansarifard', 'FW', 'AEK Athens', 'GRE'),
  ('Vahid Amiri', 'MF', 'Persepolis', 'IRN'),
  ('Omid Noorafkan', 'MF', 'Sepahan', 'IRN'),
  ('Rouzbeh Cheshmi', 'DF', 'Esteghlal', 'IRN'),
  ('Hossein Kanani', 'DF', 'Persepolis', 'IRN'),
  ('Mohammad Mohebi', 'FW', 'Rostov', 'RUS'),
  ('Mehdi Ghayedi', 'FW', 'Ajman', 'UAE'),
  ('Abolfazl Jalali', 'DF', 'Esteghlal', 'IRN')
) AS p(name, position, club, club_country)
WHERE t.code = 'IRN';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Oliver Sail', 'GK', 'Wellington Phoenix', 'NZL'),
  ('Michael Boxall', 'DF', 'Minnesota United', 'USA'),
  ('Bill Tuiloma', 'DF', 'Portland Timbers', 'USA'),
  ('Nando Pijker', 'DF', 'Heerenveen', 'NED'),
  ('Marko Stamenić', 'MF', 'Nottingham Forest', 'ENG'),
  ('Clayton Lewis', 'MF', 'Western Sydney', 'AUS'),
  ('Marco Rojas', 'MF', 'Melbourne Victory', 'AUS'),
  ('Chris Wood', 'FW', 'Nottingham Forest', 'ENG'),
  ('Ben Waine', 'FW', 'Wellington Phoenix', 'NZL'),
  ('Elijah Just', 'FW', 'HJK', 'FIN'),
  ('Alex Greive', 'FW', 'Bristol Rovers', 'ENG'),
  ('Marco van Ginkel', 'MF', 'PSV', 'NED'),
  ('Finn Surman', 'DF', 'Wellington Phoenix', 'NZL'),
  ('Dane Ingham', 'DF', 'New York Red Bulls', 'USA'),
  ('Callum McCowatt', 'MF', 'Motherwell', 'SCO'),
  ('Ben Old', 'FW', 'Real Salt Lake', 'USA'),
  ('Justín Gulley', 'MF', 'Wellington Phoenix', 'NZL'),
  ('Kosta Barbarouses', 'FW', 'Sydney FC', 'AUS')
) AS p(name, position, club, club_country)
WHERE t.code = 'NZL';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Unai Simón', 'GK', 'Athletic Club', 'ESP'),
  ('David Raya', 'GK', 'Arsenal', 'ENG'),
  ('Aymeric Laporte', 'DF', 'Al-Nassr', 'KSA'),
  ('Robin Le Normand', 'DF', 'Atlético Madrid', 'ESP'),
  ('Jordi Alba', 'DF', 'Miami', 'USA'),
  ('Rodri', 'MF', 'Manchester City', 'ENG'),
  ('Pedri', 'MF', 'Barcelona', 'ESP'),
  ('Gavi', 'MF', 'Barcelona', 'ESP'),
  ('Fabián Ruiz', 'MF', 'Paris Saint-Germain', 'FRA'),
  ('Álvaro Morata', 'FW', 'Milan', 'ITA'),
  ('Dani Olmo', 'FW', 'Barcelona', 'ESP'),
  ('Nico Williams', 'FW', 'Athletic Club', 'ESP'),
  ('Lamine Yamal', 'FW', 'Barcelona', 'ESP'),
  ('Ferran Torres', 'FW', 'Barcelona', 'ESP'),
  ('Mikel Oyarzabal', 'FW', 'Real Sociedad', 'ESP'),
  ('Joselu', 'FW', 'Al-Gharafa', 'QAT'),
  ('Marco Asensio', 'FW', 'Paris Saint-Germain', 'FRA'),
  ('Alejandro Baena', 'MF', 'Villarreal', 'ESP')
) AS p(name, position, club, club_country)
WHERE t.code = 'ESP';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Vozinha', 'GK', 'AEL Limassol', 'CYP'),
  ('Marco', 'GK', 'Casa Pia', 'POR'),
  ('Stopira', 'DF', 'Feirense', 'POR'),
  ('Jójó', 'DF', 'Famalicão', 'POR'),
  ('Dylan Tavares', 'FW', 'Basel', 'SUI'),
  ('Ryan Mendes', 'FW', 'Al-Nasr', 'UAE'),
  ('Jovane Cabral', 'FW', 'Sparta Prague', 'CZE'),
  ('Garry Rodrigues', 'FW', 'Al-Ittihad', 'KSA'),
  ('Bébé', 'FW', 'Rayo Vallecano', 'ESP'),
  ('Patrick Andrade', 'MF', 'Qadsia', 'KUW'),
  ('Platini', 'FW', 'Santa Clara', 'POR'),
  ('Willy Semedo', 'FW', 'Göztepe', 'TUR'),
  ('Kevyn', 'MF', 'Famalicão', 'POR'),
  ('Diney', 'DF', 'Moreirense', 'POR'),
  ('Geovani', 'MF', 'Santa Clara', 'POR'),
  ('Jerson', 'FW', 'Moreirense', 'POR'),
  ('Kenny Rocha Santos', 'MF', 'Famalicão', 'POR'),
  ('Bruno Leite', 'DF', 'Moreirense', 'POR')
) AS p(name, position, club, club_country)
WHERE t.code = 'CPV';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Mohammed Al-Owais', 'GK', 'Al-Hilal', 'KSA'),
  ('Yassine Bono', 'GK', 'Al-Hilal', 'KSA'),
  ('Sultan Al-Ghannam', 'DF', 'Al-Nassr', 'KSA'),
  ('Ali Al-Bulaihi', 'DF', 'Al-Hilal', 'KSA'),
  ('Yasser Al-Shahrani', 'DF', 'Al-Hilal', 'KSA'),
  ('Salem Al-Dawsari', 'MF', 'Al-Hilal', 'KSA'),
  ('Salman Al-Faraj', 'MF', 'Al-Hilal', 'KSA'),
  ('Saud Abdulhamid', 'DF', 'Roma', 'ITA'),
  ('Firas Al-Buraikan', 'FW', 'Al-Shabab', 'KSA'),
  ('Saleh Al-Shehri', 'FW', 'Al-Hilal', 'KSA'),
  ('Abdullah Al-Hamdan', 'FW', 'Al-Hilal', 'KSA'),
  ('Fahad Al-Muwallad', 'FW', 'Al-Ittihad', 'KSA'),
  ('Musab Al-Juwair', 'MF', 'Al-Hilal', 'KSA'),
  ('Nasser Al-Dawsari', 'MF', 'Al-Nassr', 'KSA'),
  ('Abdulellah Al-Malki', 'MF', 'Al-Shabab', 'KSA'),
  ('Mohammed Al-Breik', 'DF', 'Al-Hilal', 'KSA'),
  ('Hassan Al-Tambakti', 'DF', 'Al-Shabab', 'KSA'),
  ('Sami Al-Najei', 'MF', 'Al-Nassr', 'KSA')
) AS p(name, position, club, club_country)
WHERE t.code = 'KSA';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Sergio Rochet', 'GK', 'Nacional', 'URY'),
  ('Fernando Muslera', 'GK', 'Peñarol', 'URY'),
  ('José María Giménez', 'DF', 'Atlético Madrid', 'ESP'),
  ('Ronald Araújo', 'DF', 'Barcelona', 'ESP'),
  ('Guillermo Varela', 'DF', 'Flamengo', 'BRA'),
  ('Federico Valverde', 'MF', 'Real Madrid', 'ESP'),
  ('Rodrigo Bentancur', 'MF', 'Tottenham', 'ENG'),
  ('Manuel Ugarte', 'MF', 'Manchester United', 'ENG'),
  ('Darwin Núñez', 'FW', 'Liverpool', 'ENG'),
  ('Luis Suárez', 'FW', 'Inter Miami', 'USA'),
  ('Facundo Pellistri', 'FW', 'Manchester United', 'ENG'),
  ('Giorgian Arrascaeta', 'MF', 'Flamengo', 'BRA'),
  ('Maxi Gómez', 'FW', 'Trabzonspor', 'TUR'),
  ('Facundo Torres', 'FW', 'Orlando City', 'USA'),
  ('Agustín Canobbio', 'FW', 'Athletico Paranaense', 'BRA'),
  ('Matías Viña', 'DF', 'Flamengo', 'BRA'),
  ('Nahitan Nández', 'MF', 'Cagliari', 'ITA'),
  ('Sebastián Coates', 'DF', 'Sporting CP', 'POR')
) AS p(name, position, club, club_country)
WHERE t.code = 'URY';