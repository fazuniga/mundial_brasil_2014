INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Mike Maignan', 'GK', 'Milan', 'ITA'),
  ('Alphonse Areola', 'GK', 'West Ham', 'ENG'),
  ('William Saliba', 'DF', 'Arsenal', 'ENG'),
  ('Dayot Upamecano', 'DF', 'Bayern Munich', 'GER'),
  ('Jules Koundé', 'DF', 'Barcelona', 'ESP'),
  ('Aurélien Tchouaméni', 'MF', 'Real Madrid', 'ESP'),
  ('Adrien Rabiot', 'MF', 'Milan', 'ITA'),
  ('Warren Zaïre-Emery', 'MF', 'Paris Saint-Germain', 'FRA'),
  ('Kylian Mbappé', 'FW', 'Real Madrid', 'ESP'),
  ('Ousmane Dembélé', 'FW', 'Paris Saint-Germain', 'FRA'),
  ('Olivier Giroud', 'FW', 'LA Galaxy', 'USA'),
  ('Antoine Griezmann', 'FW', 'Atlético Madrid', 'ESP'),
  ('Randal Kolo Muani', 'FW', 'Juventus', 'ITA'),
  ('Bradley Barcola', 'FW', 'Paris Saint-Germain', 'FRA'),
  ('Marcus Thuram', 'FW', 'Inter Milan', 'ITA'),
  ('Kingsley Coman', 'FW', 'Bayern Munich', 'GER'),
  ('Youssouf Fofana', 'MF', 'Milan', 'ITA'),
  ('Ibrahima Konaté', 'DF', 'Liverpool', 'ENG')
) AS p(name, position, club, club_country)
WHERE t.code = 'FRA';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Édouard Mendy', 'GK', 'Al-Ahli', 'KSA'),
  ('Boubacar Diallo', 'GK', 'Metz', 'FRA'),
  ('Kalidou Koulibaly', 'DF', 'Al-Hilal', 'KSA'),
  ('Abdou Diallo', 'DF', 'Al-Arabi', 'QAT'),
  ('Ismail Jakobs', 'DF', 'Monaco', 'FRA'),
  ('Idrissa Gueye', 'MF', 'Everton', 'ENG'),
  ('Pape Matar Sarr', 'MF', 'Tottenham', 'ENG'),
  ('Sadio Mané', 'FW', 'Al-Nassr', 'KSA'),
  ('Nicolas Jackson', 'FW', 'Chelsea', 'ENG'),
  ('Boulaye Dia', 'FW', 'Lazio', 'ITA'),
  ('El Bilal Touré', 'FW', 'VfB Stuttgart', 'GER'),
  ('Iliman Ndiaye', 'FW', 'Everton', 'ENG'),
  ('Formose Mendy', 'DF', 'Brest', 'FRA'),
  ('Cheikh Kouyaté', 'MF', 'Nottingham Forest', 'ENG'),
  ('Moussa Niakhaté', 'DF', 'Lyon', 'FRA'),
  ('Lamine Camara', 'MF', 'Monaco', 'FRA'),
  ('Habib Diallo', 'FW', 'Al-Shabab', 'KSA'),
  ('Pape Gueye', 'MF', 'Marseille', 'FRA')
) AS p(name, position, club, club_country)
WHERE t.code = 'SEN';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Jalal Hassan', 'GK', 'Al-Shorta', 'IRQ'),
  ('Ahmed Basim', 'GK', 'Al-Zawraa', 'IRQ'),
  ('Ali Adnan', 'DF', 'Al-Shorta', 'IRQ'),
  ('Saad Natiq', 'DF', 'Al-Shorta', 'IRQ'),
  ('Manar Ismail', 'DF', 'Al-Zawraa', 'IRQ'),
  ('Amjad Attwan', 'MF', 'Al-Shorta', 'IRQ'),
  ('Zaid Mahdi', 'MF', 'Al-Zawraa', 'IRQ'),
  ('Aymen Hussein', 'FW', 'Al-Shorta', 'IRQ'),
  ('Mohanad Ali', 'FW', 'Al-Gharafa', 'QAT'),
  ('Aso Rostam', 'FW', 'Al-Zawraa', 'IRQ'),
  ('Bashar Resan', 'MF', 'Al-Gharafa', 'QAT'),
  ('Ali Faez', 'DF', 'Al-Shorta', 'IRQ'),
  ('Hussein Ali', 'MF', 'Al-Zawraa', 'IRQ'),
  ('Ahmed Yasin', 'FW', 'Al-Shorta', 'IRQ'),
  ('Rebin Sulaka', 'DF', 'Al-Zawraa', 'IRQ'),
  ('Mustafa Saadoun', 'MF', 'Al-Shorta', 'IRQ'),
  ('Ali Jasim', 'FW', 'Al-Shorta', 'IRQ'),
  ('Hussein Saeed', 'FW', 'Al-Shorta', 'IRQ')
) AS p(name, position, club, club_country)
WHERE t.code = 'IRQ';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Bernd Leno', 'GK', 'Fulham', 'ENG'),
  ('Ørjan Nyland', 'GK', 'Sevilla', 'ESP'),
  ('Stefan Strandberg', 'DF', 'Rosenborg', 'NOR'),
  ('Kristoffer Ajer', 'DF', 'Brentford', 'ENG'),
  ('Felix Myhre', 'MF', 'Vålerenga', 'NOR'),
  ('Martin Ødegaard', 'MF', 'Arsenal', 'ENG'),
  ('Sander Berge', 'MF', 'Fulham', 'ENG'),
  ('Patrick Berg', 'MF', 'Bodø/Glimt', 'NOR'),
  ('Erling Haaland', 'FW', 'Manchester City', 'ENG'),
  ('Alexander Sørloth', 'FW', 'Atlético Madrid', 'ESP'),
  ('Joshua King', 'FW', 'Toulouse', 'FRA'),
  ('Antoine Semenyo', 'FW', 'Bournemouth', 'ENG'),
  ('Aron Dønnum', 'MF', 'Toulouse', 'FRA'),
  ('Fredrik Aursnes', 'MF', 'Benfica', 'POR'),
  ('Morten Thorsby', 'MF', 'Genoa', 'ITA'),
  ('Julian Ryerson', 'DF', 'Borussia Dortmund', 'GER'),
  ('Marcus Pedersen', 'DF', 'Torino', 'ITA'),
  ('Leo Østigård', 'DF', 'Genoa', 'ITA')
) AS p(name, position, club, club_country)
WHERE t.code = 'NOR';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Emiliano Martínez', 'GK', 'Aston Villa', 'ENG'),
  ('Franco Armani', 'GK', 'River Plate', 'ARG'),
  ('Cristian Romero', 'DF', 'Tottenham', 'ENG'),
  ('Nicolás Otamendi', 'DF', 'Benfica', 'POR'),
  ('Marcos Acuña', 'DF', 'River Plate', 'ARG'),
  ('Rodrigo De Paul', 'MF', 'Atlético Madrid', 'ESP'),
  ('Enzo Fernández', 'MF', 'Chelsea', 'ENG'),
  ('Alexis Mac Allister', 'MF', 'Liverpool', 'ENG'),
  ('Lionel Messi', 'FW', 'Inter Miami', 'USA'),
  ('Lautaro Martínez', 'FW', 'Inter Milan', 'ITA'),
  ('Julián Álvarez', 'FW', 'Atlético Madrid', 'ESP'),
  ('Ángel Di María', 'FW', 'Benfica', 'POR'),
  ('Giovani Lo Celso', 'MF', 'Real Betis', 'ESP'),
  ('Nicolás González', 'FW', 'Juventus', 'ITA'),
  ('Paulo Dybala', 'FW', 'Roma', 'ITA'),
  ('Leandro Paredes', 'MF', 'Roma', 'ITA'),
  ('Exequiel Palacios', 'MF', 'Bayer Leverkusen', 'GER'),
  ('Germán Pezzella', 'DF', 'River Plate', 'ARG')
) AS p(name, position, club, club_country)
WHERE t.code = 'ARG';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Raïs M''Bolhi', 'GK', 'CR Belouizdad', 'ALG'),
  ('Anthony Mandrea', 'GK', 'Caen', 'FRA'),
  ('Ramy Bensebaini', 'DF', 'Borussia Dortmund', 'GER'),
  ('Aissa Mandi', 'DF', 'Villarreal', 'ESP'),
  ('Youcef Atal', 'DF', 'Nice', 'FRA'),
  ('Ismaël Bennacer', 'MF', 'Milan', 'ITA'),
  ('Ramiz Zerrouki', 'MF', 'Twente', 'NED'),
  ('Houssem Aouar', 'MF', 'Al-Ittihad', 'KSA'),
  ('Riyad Mahrez', 'FW', 'Al-Ahli', 'KSA'),
  ('Youcef Belaïli', 'FW', 'Qadsia', 'KUW'),
  ('Baghdad Bounedjah', 'FW', 'Al-Rayyan', 'QAT'),
  ('Islam Slimani', 'FW', 'Anderlecht', 'BEL'),
  ('Mohamed Amoura', 'FW', 'Wolfsburg', 'GER'),
  ('Rachid Ghezzal', 'FW', 'Al-Jazira', 'UAE'),
  ('Adam Ounas', 'FW', 'Empoli', 'ITA'),
  ('Amine Gouiri', 'FW', 'Rennes', 'FRA'),
  ('Sofiane Feghouli', 'MF', 'AEK Athens', 'GRE'),
  ('Zineddine Belaid', 'DF', 'USM Alger', 'ALG')
) AS p(name, position, club, club_country)
WHERE t.code = 'ALG';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Daniel Bachmann', 'GK', 'Stoke City', 'ENG'),
  ('Heinz Lindner', 'GK', 'WSG Tirol', 'AUT'),
  ('David Alaba', 'DF', 'Real Madrid', 'ESP'),
  ('Kevin Wimmer', 'DF', 'Glasgow Rangers', 'SCO'),
  ('Philipp Lienhart', 'DF', 'Freiburg', 'GER'),
  ('Marcel Sabitzer', 'MF', 'Borussia Dortmund', 'GER'),
  ('Konrad Laimer', 'MF', 'Bayern Munich', 'GER'),
  ('Florian Grillitsch', 'MF', 'Real Sociedad', 'ESP'),
  ('Christoph Baumgartner', 'MF', 'RB Leipzig', 'GER'),
  ('Marko Arnautović', 'FW', 'Inter Milan', 'ITA'),
  ('Michael Gregoritsch', 'FW', 'Freiburg', 'GER'),
  ('Romano Schmid', 'FW', 'Werder Bremen', 'GER'),
  ('Patrick Wimmer', 'FW', 'Wolfsburg', 'GER'),
  ('Marco Friedl', 'DF', 'Werder Bremen', 'GER'),
  ('Stefan Posch', 'DF', 'Bologna', 'ITA'),
  ('Alexander Prass', 'MF', 'Sturm Graz', 'AUT'),
  ('Andreas Ulmer', 'DF', 'Red Bull Salzburg', 'AUT'),
  ('Gernot Trauner', 'DF', 'LASK', 'AUT')
) AS p(name, position, club, club_country)
WHERE t.code = 'AUT';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Yazeed Abulaila', 'GK', 'Al-Quwa Al-Jawiya', 'IRQ'),
  ('Amir Shafi', 'GK', 'Al-Faisaly', 'JOR'),
  ('Yazan Al-Naimat', 'DF', 'Al-Ahli', 'JOR'),
  ('Husam Al-Taher', 'DF', 'Al-Wehdat', 'JOR'),
  ('Ihsan Haddad', 'DF', 'Al-Faisaly', 'JOR'),
  ('Musab Al-Lawadi', 'MF', 'Al-Wehdat', 'JOR'),
  ('Mahmoud Al-Mardi', 'MF', 'Al-Faisaly', 'JOR'),
  ('Ali Olwan', 'MF', 'Al-Faisaly', 'JOR'),
  ('Mousa Al-Taamari', 'FW', 'Montpellier', 'FRA'),
  ('Yazan Al-Naimat', 'FW', 'Al-Ahli', 'JOR'),
  ('Ali Olwan', 'FW', 'Al-Faisaly', 'JOR'),
  ('Mahmoud Al-Mardi', 'FW', 'Al-Faisaly', 'JOR'),
  ('Ahmad Ersan', 'MF', 'Al-Wehdat', 'JOR'),
  ('Yazan Al-Naimat', 'MF', 'Al-Ahli', 'JOR'),
  ('Baha Abdel-Rahman', 'MF', 'Al-Faisaly', 'JOR'),
  ('Anas Bani Yaseen', 'DF', 'Al-Faisaly', 'JOR'),
  ('Yazan Al-Naimat', 'DF', 'Al-Ahli', 'JOR'),
  ('Musab Al-Lawadi', 'FW', 'Al-Wehdat', 'JOR')
) AS p(name, position, club, club_country)
WHERE t.code = 'JOR';