INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Manuel Neuer', 'GK', 'Bayern Munich', 'GER'),
  ('Marc-André ter Stegen', 'GK', 'Barcelona', 'ESP'),
  ('Antonio Rüdiger', 'DF', 'Real Madrid', 'ESP'),
  ('Jonathan Tah', 'DF', 'Bayer Leverkusen', 'GER'),
  ('David Raum', 'DF', 'RB Leipzig', 'GER'),
  ('Joshua Kimmich', 'MF', 'Bayern Munich', 'GER'),
  ('İlkay Gündoğan', 'MF', 'Manchester City', 'ENG'),
  ('Florian Wirtz', 'MF', 'Bayer Leverkusen', 'GER'),
  ('Jamal Musiala', 'MF', 'Bayern Munich', 'GER'),
  ('Kai Havertz', 'FW', 'Arsenal', 'ENG'),
  ('Niclas Füllkrug', 'FW', 'West Ham', 'ENG'),
  ('Leroy Sané', 'FW', 'Bayern Munich', 'GER'),
  ('Serge Gnabry', 'FW', 'Bayern Munich', 'GER'),
  ('Timo Werner', 'FW', 'Tottenham', 'ENG'),
  ('Niclas Fullkrug', 'FW', 'West Ham', 'ENG'),
  ('Felix Nmecha', 'MF', 'Borussia Dortmund', 'GER'),
  ('Maximilian Mittelstädt', 'DF', 'Stuttgart', 'GER'),
  ('Robin Gosens', 'DF', 'Fiorentina', 'ITA')
) AS p(name, position, club, club_country)
WHERE t.code = 'GER';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Eloy Room', 'GK', 'PSV', 'NED'),
  ('Jurich Brown', 'GK', 'Vitesse', 'NED'),
  ('Sherel Floranus', 'DF', 'Almere City', 'NED'),
  ('Juriën Gaari', 'DF', 'Al-Batin', 'KSA'),
  ('Brandley Kuwas', 'MF', 'Groningen', 'NED'),
  ('Leandro Bacuna', 'MF', 'Cardiff City', 'WAL'),
  ('Roly Bonevacia', 'MF', 'Al-Jazira', 'UAE'),
  ('Crysencio Summerville', 'FW', 'West Ham', 'ENG'),
  ('Elson Hooi', 'FW', 'Cambuur', 'NED'),
  ('Gervane Kastaneer', 'FW', 'Twente', 'NED'),
  ('Jarchinio Antonia', 'FW', 'Volendam', 'NED'),
  ('Rangelo Janga', 'FW', 'Astana', 'KAZ'),
  ('Juriën Gaari', 'DF', 'Al-Batin', 'KSA'),
  ('Shanon Carmelia', 'FW', 'Helmond Sport', 'NED'),
  ('Brandley Martis', 'DF', 'Sparta Rotterdam', 'NED'),
  ('Juriën Gaari', 'MF', 'Al-Batin', 'KSA'),
  ('Gino van Kessel', 'FW', 'TOP Oss', 'NED'),
  ('Juriën Gaari', 'FW', 'Al-Batin', 'KSA')
) AS p(name, position, club, club_country)
WHERE t.code = 'CUW';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Badra Ali Sangaré', 'GK', 'Pyramids', 'EGY'),
  ('Yahia Fofana', 'GK', 'Angers', 'FRA'),
  ('Serge Aurier', 'DF', 'Villarreal', 'ESP'),
  ('Ousmane Diomande', 'DF', 'Sporting CP', 'POR'),
  ('Wilfried Singo', 'DF', 'Monaco', 'FRA'),
  ('Franck Kessié', 'MF', 'Al-Ahli', 'KSA'),
  ('Jean-Philippe Krasso', 'FW', 'Sunderland', 'ENG'),
  ('Sébastien Haller', 'FW', 'Borussia Dortmund', 'GER'),
  ('Nicolas Pépé', 'FW', 'Villarreal', 'ESP'),
  ('Simon Adingra', 'FW', 'Brighton', 'ENG'),
  ('Jérémie Boga', 'FW', 'Nice', 'FRA'),
  ('Ibrahim Sangaré', 'MF', 'Nottingham Forest', 'ENG'),
  ('Habib Maiga', 'MF', 'Troyes', 'FRA'),
  ('Max-Alain Gradel', 'FW', 'Sivasspor', 'TUR'),
  ('Amad Diallo', 'FW', 'Manchester United', 'ENG'),
  ('Christian Kouakou', 'MF', 'Basel', 'SUI'),
  ('Odilon Kossounou', 'DF', 'Atalanta', 'ITA'),
  ('Ghislain Konan', 'DF', 'Al-Fayha', 'KSA')
) AS p(name, position, club, club_country)
WHERE t.code = 'CIV';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Alexander Domínguez', 'GK', 'LDU Quito', 'ECU'),
  ('Hernán Galíndez', 'GK', 'Aucas', 'ECU'),
  ('Piero Hincapié', 'DF', 'Bayer Leverkusen', 'GER'),
  ('Felix Torres', 'DF', 'Santos Laguna', 'MEX'),
  ('Angelo Preciado', 'DF', 'Genk', 'BEL'),
  ('Moisés Caicedo', 'MF', 'Chelsea', 'ENG'),
  ('Carlos Gruezo', 'MF', 'San Jose Earthquakes', 'USA'),
  ('Kendry Páez', 'MF', 'Independiente del Valle', 'ECU'),
  ('Enner Valencia', 'FW', 'Internacional', 'BRA'),
  ('Jeremy Sarmiento', 'FW', 'Brighton', 'ENG'),
  ('Pervis Estupiñán', 'DF', 'Brighton', 'ENG'),
  ('Willian Pacho', 'DF', 'Paris Saint-Germain', 'FRA'),
  ('Michael Estrada', 'FW', 'Cruz Azul', 'MEX'),
  ('Jordy Caicedo', 'FW', 'Independiente del Valle', 'ECU'),
  ('Kevin Rodriguez', 'FW', 'Union Saint-Gilloise', 'BEL'),
  ('Alan Franco', 'MF', 'Atlético Mineiro', 'BRA'),
  ('José Cifuentes', 'MF', 'Los Angeles FC', 'USA'),
  ('Gonzalo Plata', 'FW', 'Flamengo', 'BRA')
) AS p(name, position, club, club_country)
WHERE t.code = 'ECU';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Virgil van Dijk', 'DF', 'Liverpool', 'ENG'),
  ('Nathan Aké', 'DF', 'Manchester City', 'ENG'),
  ('Denzel Dumfries', 'DF', 'Inter Milan', 'ITA'),
  ('Jurriën Timber', 'DF', 'Arsenal', 'ENG'),
  ('Frenkie de Jong', 'MF', 'Barcelona', 'ESP'),
  ('Tijjani Reijnders', 'MF', 'Milan', 'ITA'),
  ('Ryan Gravenberch', 'MF', 'Liverpool', 'ENG'),
  ('Steven Bergwijn', 'FW', 'Al-Ittihad', 'KSA'),
  ('Memphis Depay', 'FW', 'Corinthians', 'BRA'),
  ('Cody Gakpo', 'FW', 'Liverpool', 'ENG'),
  ('Brian Brobbey', 'FW', 'Ajax', 'NED'),
  ('Wout Weghorst', 'FW', 'Ajax', 'NED'),
  ('Xavi Simons', 'MF', 'RB Leipzig', 'GER'),
  ('Donyell Malen', 'FW', 'Aston Villa', 'ENG'),
  ('Jeremie Frimpong', 'DF', 'Bayer Leverkusen', 'GER'),
  ('Mark Flekken', 'GK', 'Brentford', 'ENG'),
  ('Bart Verbruggen', 'GK', 'Brighton', 'ENG'),
  ('Ian Maatsen', 'DF', 'Aston Villa', 'ENG')
) AS p(name, position, club, club_country)
WHERE t.code = 'NED';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Gonda Shuichi', 'GK', 'Shimizu S-Pulse', 'JPN'),
  ('Suzuki Zion', 'GK', 'Parma', 'ITA'),
  ('Itakura Ko', 'DF', 'Manchester City', 'ENG'),
  ('Tomiyasu Takehiro', 'DF', 'Arsenal', 'ENG'),
  ('Taniguchi Ko', 'DF', 'Reims', 'FRA'),
  ('Endo Wataru', 'MF', 'Liverpool', 'ENG'),
  ('Kamada Daichi', 'MF', 'Lazio', 'ITA'),
  ('Minamino Takumi', 'MF', 'Monaco', 'FRA'),
  ('Kubo Takefusa', 'FW', 'Real Sociedad', 'ESP'),
  ('Mitoma Kaoru', 'FW', 'Brighton', 'ENG'),
  ('Asano Takuma', 'FW', 'Mainz', 'GER'),
  ('Doan Ritsu', 'FW', 'Freiburg', 'GER'),
  ('Soma Yuki', 'FW', 'Cerezo Osaka', 'JPN'),
  ('Ueda Ayase', 'FW', 'Feyenoord', 'NED'),
  ('Ito Junya', 'FW', 'Reims', 'FRA'),
  ('Suzuki Yuito', 'FW', 'Brugge', 'BEL'),
  ('Morita Hidemasa', 'MF', 'Sporting CP', 'POR'),
  ('Tanaka Ao', 'MF', 'Fortuna Düsseldorf', 'GER')
) AS p(name, position, club, club_country)
WHERE t.code = 'JPN';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Robin Olsen', 'GK', 'Malmö FF', 'SWE'),
  ('Kristoffer Kjölan', 'GK', 'Hammarby', 'SWE'),
  ('Victor Lindelöf', 'DF', 'Manchester United', 'ENG'),
  ('Isak Hien', 'DF', 'Atalanta', 'ITA'),
  ('Ludwig Augustinsson', 'DF', 'Malmö FF', 'SWE'),
  ('Emil Forsberg', 'MF', 'New York Red Bulls', 'USA'),
  ('Dejan Kulusevski', 'MF', 'Tottenham', 'ENG'),
  ('Mattias Svanberg', 'MF', 'Wolfsburg', 'GER'),
  ('Alexander Isak', 'FW', 'Newcastle United', 'ENG'),
  ('Viktor Gyökeres', 'FW', 'Sporting CP', 'POR'),
  ('Anthony Elanga', 'FW', 'Nottingham Forest', 'ENG'),
  ('Jesper Karlsson', 'FW', 'Bologna', 'ITA'),
  ('Aron El Kadiri', 'FW', 'Malmo FF', 'SWE'),
  ('Gustav Berggren', 'MF', 'Rosenborg', 'NOR'),
  ('Jesper Ceesay', 'DF', 'AIK', 'SWE'),
  ('Hugo Larsson', 'MF', 'Eintracht Frankfurt', 'GER'),
  ('Simon Olsson', 'MF', 'Heerenveen', 'NED'),
  ('Willem Gevers', 'DF', 'Hammarby', 'SWE')
) AS p(name, position, club, club_country)
WHERE t.code = 'SWE';


INSERT INTO public.players (id_team, name, position, club, club_country)
SELECT t.id_team, p.name, p.position, p.club, p.club_country
FROM public.teams t
CROSS JOIN (
  VALUES
  ('Aymen Dahmen', 'GK', 'Club Africain', 'TUN'),
  ('Mouez Hassen', 'GK', 'Club Africain', 'TUN'),
  ('Yassine Meriah', 'DF', 'Espérance', 'TUN'),
  ('Montassar Talbi', 'DF', 'Lorient', 'FRA'),
  ('Ali Maaloul', 'DF', 'Al-Ahly', 'EGY'),
  ('Ellyes Skhiri', 'MF', 'Eintracht Frankfurt', 'GER'),
  ('Aïssa Laïdouni', 'MF', 'Union Berlin', 'GER'),
  ('Hamza Rafia', 'MF', 'Lecce', 'ITA'),
  ('Wahbi Khazri', 'FW', 'Montpellier', 'FRA'),
  ('Issam Jebali', 'FW', 'IF Elfsborg', 'SWE'),
  ('Taha Yassine Khenissi', 'FW', 'Espérance', 'TUN'),
  ('Seifeddine Jaziri', 'FW', 'Zamalek', 'EGY'),
  ('Naim Sliti', 'FW', 'Al-Ettifaq', 'KSA'),
  ('Hamza Lahmar', 'MF', 'Espérance', 'TUN'),
  ('Anis Ben Slimane', 'MF', 'Sheffield United', 'ENG'),
  ('Youssef Msakni', 'FW', 'Al-Arabi', 'QAT'),
  ('Oussama Khazri', 'FW', 'Montpellier', 'FRA'),
  ('Bilel Ifa', 'DF', 'Kuwait SC', 'KUW')
) AS p(name, position, club, club_country)
WHERE t.code = 'TUN';