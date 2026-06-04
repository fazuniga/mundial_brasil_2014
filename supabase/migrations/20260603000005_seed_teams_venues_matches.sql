-- Seed: 48 teams, 16 venues, 104 matches
BEGIN;
DELETE FROM public.match_results;
DELETE FROM public.predictions;
DELETE FROM public.matches;
DELETE FROM public.teams;
DELETE FROM public.venues;
INSERT INTO public.knockout_slots (id_slot, label) VALUES
  (25,'3rd ABCDEF'),(26,'3rd CDFGH'),(27,'3rd CEFHI'),(28,'3rd EHIJK'),
  (29,'3rd BEFIJ'),(30,'3rd AEHIJ'),(31,'3rd EFGIJ'),(32,'3rd DEIJL')
ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (33, 'Ganador 73') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (34, 'Ganador 74') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (35, 'Ganador 75') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (36, 'Ganador 76') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (37, 'Ganador 77') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (38, 'Ganador 78') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (39, 'Ganador 79') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (40, 'Ganador 80') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (41, 'Ganador 81') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (42, 'Ganador 82') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (43, 'Ganador 83') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (44, 'Ganador 84') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (45, 'Ganador 85') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (46, 'Ganador 86') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (47, 'Ganador 87') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (48, 'Ganador 88') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (49, 'Ganador 89') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (50, 'Ganador 90') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (51, 'Ganador 91') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (52, 'Ganador 92') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (53, 'Ganador 93') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (54, 'Ganador 94') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (55, 'Ganador 95') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (56, 'Ganador 96') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (57, 'Ganador 97') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (58, 'Ganador 98') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (59, 'Ganador 99') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (60, 'Ganador 100') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (61, 'Ganador 101') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (62, 'Ganador 102') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (63, 'Ganador 103') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (64, 'Ganador 104') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (65, 'Perdedor 73') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (66, 'Perdedor 74') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (67, 'Perdedor 75') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (68, 'Perdedor 76') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (69, 'Perdedor 77') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (70, 'Perdedor 78') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (71, 'Perdedor 79') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (72, 'Perdedor 80') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (73, 'Perdedor 81') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (74, 'Perdedor 82') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (75, 'Perdedor 83') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (76, 'Perdedor 84') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (77, 'Perdedor 85') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (78, 'Perdedor 86') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (79, 'Perdedor 87') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (80, 'Perdedor 88') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (81, 'Perdedor 89') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (82, 'Perdedor 90') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (83, 'Perdedor 91') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (84, 'Perdedor 92') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (85, 'Perdedor 93') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (86, 'Perdedor 94') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (87, 'Perdedor 95') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (88, 'Perdedor 96') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (89, 'Perdedor 97') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (90, 'Perdedor 98') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (91, 'Perdedor 99') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (92, 'Perdedor 100') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (93, 'Perdedor 101') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.knockout_slots (id_slot, label) VALUES (94, 'Perdedor 102') ON CONFLICT (id_slot) DO NOTHING;
INSERT INTO public.venues (city, stadium) VALUES
  ('Mexico City','Estadio Azteca'),
  ('Guadalajara','Estadio Akron'),
  ('Monterrey','Estadio BBVA'),
  ('Toronto','BMO Field'),
  ('Vancouver','BC Place'),
  ('Los Angeles','SoFi Stadium'),
  ('San Francisco Bay Area','Levi''s Stadium'),
  ('Seattle','Lumen Field'),
  ('Boston','Gillette Stadium'),
  ('New York/New Jersey','MetLife Stadium'),
  ('Philadelphia','Lincoln Financial Field'),
  ('Houston','NRG Stadium'),
  ('Dallas','AT&T Stadium'),
  ('Kansas City','Arrowhead Stadium'),
  ('Miami','Hard Rock Stadium'),
  ('Atlanta','Mercedes-Benz Stadium')
;
INSERT INTO public.teams (country, id_group, code) SELECT 'Mexico', id_group, 'MEX' FROM public.groups WHERE group_code='A';
INSERT INTO public.teams (country, id_group, code) SELECT 'South Africa', id_group, 'RSA' FROM public.groups WHERE group_code='A';
INSERT INTO public.teams (country, id_group, code) SELECT 'South Korea', id_group, 'KOR' FROM public.groups WHERE group_code='A';
INSERT INTO public.teams (country, id_group, code) SELECT 'Czech Republic', id_group, 'CZE' FROM public.groups WHERE group_code='A';
INSERT INTO public.teams (country, id_group, code) SELECT 'Canada', id_group, 'CAN' FROM public.groups WHERE group_code='B';
INSERT INTO public.teams (country, id_group, code) SELECT 'Bosnia and Herzegovina', id_group, 'BIH' FROM public.groups WHERE group_code='B';
INSERT INTO public.teams (country, id_group, code) SELECT 'Qatar', id_group, 'QAT' FROM public.groups WHERE group_code='B';
INSERT INTO public.teams (country, id_group, code) SELECT 'Switzerland', id_group, 'SUI' FROM public.groups WHERE group_code='B';
INSERT INTO public.teams (country, id_group, code) SELECT 'Brazil', id_group, 'BRA' FROM public.groups WHERE group_code='C';
INSERT INTO public.teams (country, id_group, code) SELECT 'Morocco', id_group, 'MAR' FROM public.groups WHERE group_code='C';
INSERT INTO public.teams (country, id_group, code) SELECT 'Haiti', id_group, 'HAI' FROM public.groups WHERE group_code='C';
INSERT INTO public.teams (country, id_group, code) SELECT 'Scotland', id_group, 'SCO' FROM public.groups WHERE group_code='C';
INSERT INTO public.teams (country, id_group, code) SELECT 'United States', id_group, 'USA' FROM public.groups WHERE group_code='D';
INSERT INTO public.teams (country, id_group, code) SELECT 'Paraguay', id_group, 'PAR' FROM public.groups WHERE group_code='D';
INSERT INTO public.teams (country, id_group, code) SELECT 'Australia', id_group, 'AUS' FROM public.groups WHERE group_code='D';
INSERT INTO public.teams (country, id_group, code) SELECT 'Turkey', id_group, 'TUR' FROM public.groups WHERE group_code='D';
INSERT INTO public.teams (country, id_group, code) SELECT 'Germany', id_group, 'GER' FROM public.groups WHERE group_code='E';
INSERT INTO public.teams (country, id_group, code) SELECT 'Curaçao', id_group, 'CUW' FROM public.groups WHERE group_code='E';
INSERT INTO public.teams (country, id_group, code) SELECT 'Ivory Coast', id_group, 'CIV' FROM public.groups WHERE group_code='E';
INSERT INTO public.teams (country, id_group, code) SELECT 'Ecuador', id_group, 'ECU' FROM public.groups WHERE group_code='E';
INSERT INTO public.teams (country, id_group, code) SELECT 'Netherlands', id_group, 'NED' FROM public.groups WHERE group_code='F';
INSERT INTO public.teams (country, id_group, code) SELECT 'Japan', id_group, 'JPN' FROM public.groups WHERE group_code='F';
INSERT INTO public.teams (country, id_group, code) SELECT 'Sweden', id_group, 'SWE' FROM public.groups WHERE group_code='F';
INSERT INTO public.teams (country, id_group, code) SELECT 'Tunisia', id_group, 'TUN' FROM public.groups WHERE group_code='F';
INSERT INTO public.teams (country, id_group, code) SELECT 'Belgium', id_group, 'BEL' FROM public.groups WHERE group_code='G';
INSERT INTO public.teams (country, id_group, code) SELECT 'Egypt', id_group, 'EGY' FROM public.groups WHERE group_code='G';
INSERT INTO public.teams (country, id_group, code) SELECT 'Iran', id_group, 'IRN' FROM public.groups WHERE group_code='G';
INSERT INTO public.teams (country, id_group, code) SELECT 'New Zealand', id_group, 'NZL' FROM public.groups WHERE group_code='G';
INSERT INTO public.teams (country, id_group, code) SELECT 'Spain', id_group, 'ESP' FROM public.groups WHERE group_code='H';
INSERT INTO public.teams (country, id_group, code) SELECT 'Cape Verde', id_group, 'CPV' FROM public.groups WHERE group_code='H';
INSERT INTO public.teams (country, id_group, code) SELECT 'Saudi Arabia', id_group, 'KSA' FROM public.groups WHERE group_code='H';
INSERT INTO public.teams (country, id_group, code) SELECT 'Uruguay', id_group, 'URY' FROM public.groups WHERE group_code='H';
INSERT INTO public.teams (country, id_group, code) SELECT 'France', id_group, 'FRA' FROM public.groups WHERE group_code='I';
INSERT INTO public.teams (country, id_group, code) SELECT 'Senegal', id_group, 'SEN' FROM public.groups WHERE group_code='I';
INSERT INTO public.teams (country, id_group, code) SELECT 'Iraq', id_group, 'IRQ' FROM public.groups WHERE group_code='I';
INSERT INTO public.teams (country, id_group, code) SELECT 'Norway', id_group, 'NOR' FROM public.groups WHERE group_code='I';
INSERT INTO public.teams (country, id_group, code) SELECT 'Argentina', id_group, 'ARG' FROM public.groups WHERE group_code='J';
INSERT INTO public.teams (country, id_group, code) SELECT 'Algeria', id_group, 'ALG' FROM public.groups WHERE group_code='J';
INSERT INTO public.teams (country, id_group, code) SELECT 'Austria', id_group, 'AUT' FROM public.groups WHERE group_code='J';
INSERT INTO public.teams (country, id_group, code) SELECT 'Jordan', id_group, 'JOR' FROM public.groups WHERE group_code='J';
INSERT INTO public.teams (country, id_group, code) SELECT 'Portugal', id_group, 'POR' FROM public.groups WHERE group_code='K';
INSERT INTO public.teams (country, id_group, code) SELECT 'DR Congo', id_group, 'COD' FROM public.groups WHERE group_code='K';
INSERT INTO public.teams (country, id_group, code) SELECT 'Uzbekistan', id_group, 'UZB' FROM public.groups WHERE group_code='K';
INSERT INTO public.teams (country, id_group, code) SELECT 'Colombia', id_group, 'COL' FROM public.groups WHERE group_code='K';
INSERT INTO public.teams (country, id_group, code) SELECT 'England', id_group, 'ENG' FROM public.groups WHERE group_code='L';
INSERT INTO public.teams (country, id_group, code) SELECT 'Croatia', id_group, 'CRO' FROM public.groups WHERE group_code='L';
INSERT INTO public.teams (country, id_group, code) SELECT 'Ghana', id_group, 'GHA' FROM public.groups WHERE group_code='L';
INSERT INTO public.teams (country, id_group, code) SELECT 'Panama', id_group, 'PAN' FROM public.groups WHERE group_code='L';
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo A', NULL, 'SFT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo B', NULL, 'TFT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero E', NULL, 'JI1') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd ABCDEF', NULL, 'S2H') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero F', NULL, 'KI1') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo C', NULL, 'UFT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero C', NULL, 'HH1') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo F', NULL, 'XFT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero I', NULL, 'NI1') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd CDFGH', NULL, '13P') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo E', NULL, 'WFT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo I', NULL, '0GT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero A', NULL, 'FH1') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd CEFHI', NULL, 'G1W') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero L', NULL, 'QI1') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd EHIJK', NULL, 'MS1') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero D', NULL, 'II1') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd BEFIJ', NULL, 'Z8M') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero G', NULL, 'LI1') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd AEHIJ', NULL, '08D') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo K', NULL, '2GT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo L', NULL, '3GT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero H', NULL, 'MI1') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo J', NULL, '1GT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero B', NULL, 'GH1') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd EFGIJ', NULL, 'A2M') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero J', NULL, 'OI1') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo H', NULL, 'ZGT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero K', NULL, 'PI1') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd DEIJL', NULL, 'P56') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo D', NULL, 'VFT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo G', NULL, 'YGT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 74', NULL, 'THA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 77', NULL, 'WHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 73', NULL, 'SHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 75', NULL, 'UHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 76', NULL, 'VHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 78', NULL, 'XHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 79', NULL, 'YHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 80', NULL, 'KHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 83', NULL, 'NHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 84', NULL, 'OHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 81', NULL, 'LHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 82', NULL, 'MHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 86', NULL, 'QHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 88', NULL, 'RXC') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 85', NULL, 'PHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 87', NULL, 'RHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 89', NULL, 'SXC') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 90', NULL, 'FHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 93', NULL, 'IIA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 94', NULL, 'JIA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 91', NULL, 'FXC') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 92', NULL, 'HHA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 95', NULL, 'KIA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 96', NULL, 'LIA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 97', NULL, 'MIA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 98', NULL, 'NIA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 99', NULL, 'OIA') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 100', NULL, 'DTT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 101', NULL, 'PGD') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 102', NULL, 'QGD') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 101', NULL, 'ETT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 102', NULL, 'FTT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 73', NULL, 'HY9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 74', NULL, 'IY9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 75', NULL, 'JY9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 76', NULL, 'KY9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 77', NULL, 'LY9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 78', NULL, 'MY9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 79', NULL, 'NY9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 80', NULL, '9Y9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 81', NULL, 'AY9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 82', NULL, 'BY9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 83', NULL, 'CY9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 84', NULL, 'DY9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 85', NULL, 'EY9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 86', NULL, 'FY9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 87', NULL, 'GY9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 88', NULL, 'GEB') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 89', NULL, 'HEB') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 90', NULL, '4Z9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 91', NULL, '5Z9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 92', NULL, '6Z9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 93', NULL, '7Z9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 94', NULL, '8Z9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 95', NULL, '9Z9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 96', NULL, 'AZ9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 97', NULL, 'BZ9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 98', NULL, 'CZ9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 99', NULL, 'DZ9') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 100', NULL, 'OGD') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 103', NULL, 'GTT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 104', NULL, 'HTT') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 1,1,g.id_group,'2026-06-11'::date,'13:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='A' AND v.city='Mexico City' AND v.stadium='Estadio Azteca'
  AND th.country='Mexico' AND ta.country='South Africa';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 2,1,g.id_group,'2026-06-11'::date,'20:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='A' AND v.city='Guadalajara' AND v.stadium='Estadio Akron'
  AND th.country='South Korea' AND ta.country='Czech Republic';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 3,1,g.id_group,'2026-06-12'::date,'15:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='B' AND v.city='Toronto' AND v.stadium='BMO Field'
  AND th.country='Canada' AND ta.country='Bosnia and Herzegovina';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 4,1,g.id_group,'2026-06-12'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='D' AND v.city='Los Angeles' AND v.stadium='SoFi Stadium'
  AND th.country='United States' AND ta.country='Paraguay';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 5,1,g.id_group,'2026-06-13'::date,'21:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='C' AND v.city='Boston' AND v.stadium='Gillette Stadium'
  AND th.country='Haiti' AND ta.country='Scotland';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 6,1,g.id_group,'2026-06-13'::date,'21:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='D' AND v.city='Vancouver' AND v.stadium='BC Place'
  AND th.country='Australia' AND ta.country='Turkey';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 7,1,g.id_group,'2026-06-13'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='C' AND v.city='New York/New Jersey' AND v.stadium='MetLife Stadium'
  AND th.country='Brazil' AND ta.country='Morocco';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 8,1,g.id_group,'2026-06-13'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='B' AND v.city='San Francisco Bay Area' AND v.stadium='Levi''s Stadium'
  AND th.country='Qatar' AND ta.country='Switzerland';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 9,1,g.id_group,'2026-06-14'::date,'19:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='E' AND v.city='Philadelphia' AND v.stadium='Lincoln Financial Field'
  AND th.country='Ivory Coast' AND ta.country='Ecuador';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 10,1,g.id_group,'2026-06-14'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='E' AND v.city='Houston' AND v.stadium='NRG Stadium'
  AND th.country='Germany' AND ta.country='Curaçao';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 11,1,g.id_group,'2026-06-14'::date,'15:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='F' AND v.city='Dallas' AND v.stadium='AT&T Stadium'
  AND th.country='Netherlands' AND ta.country='Japan';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 12,1,g.id_group,'2026-06-14'::date,'20:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='F' AND v.city='Monterrey' AND v.stadium='Estadio BBVA'
  AND th.country='Sweden' AND ta.country='Tunisia';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 13,1,g.id_group,'2026-06-15'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='H' AND v.city='Miami' AND v.stadium='Hard Rock Stadium'
  AND th.country='Saudi Arabia' AND ta.country='Uruguay';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 14,1,g.id_group,'2026-06-15'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='H' AND v.city='Atlanta' AND v.stadium='Mercedes-Benz Stadium'
  AND th.country='Spain' AND ta.country='Cape Verde';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 15,1,g.id_group,'2026-06-15'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='G' AND v.city='Los Angeles' AND v.stadium='SoFi Stadium'
  AND th.country='Iran' AND ta.country='New Zealand';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 16,1,g.id_group,'2026-06-15'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='G' AND v.city='Seattle' AND v.stadium='Lumen Field'
  AND th.country='Belgium' AND ta.country='Egypt';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 17,1,g.id_group,'2026-06-16'::date,'15:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='I' AND v.city='New York/New Jersey' AND v.stadium='MetLife Stadium'
  AND th.country='France' AND ta.country='Senegal';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 18,1,g.id_group,'2026-06-16'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='I' AND v.city='Boston' AND v.stadium='Gillette Stadium'
  AND th.country='Iraq' AND ta.country='Norway';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 19,1,g.id_group,'2026-06-16'::date,'20:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='J' AND v.city='Kansas City' AND v.stadium='Arrowhead Stadium'
  AND th.country='Argentina' AND ta.country='Algeria';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 20,1,g.id_group,'2026-06-16'::date,'21:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='J' AND v.city='San Francisco Bay Area' AND v.stadium='Levi''s Stadium'
  AND th.country='Austria' AND ta.country='Jordan';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 21,1,g.id_group,'2026-06-17'::date,'19:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='L' AND v.city='Toronto' AND v.stadium='BMO Field'
  AND th.country='Ghana' AND ta.country='Panama';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 22,1,g.id_group,'2026-06-17'::date,'15:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='L' AND v.city='Dallas' AND v.stadium='AT&T Stadium'
  AND th.country='England' AND ta.country='Croatia';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 23,1,g.id_group,'2026-06-17'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='K' AND v.city='Houston' AND v.stadium='NRG Stadium'
  AND th.country='Portugal' AND ta.country='DR Congo';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 24,1,g.id_group,'2026-06-17'::date,'20:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='K' AND v.city='Mexico City' AND v.stadium='Estadio Azteca'
  AND th.country='Uzbekistan' AND ta.country='Colombia';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 25,1,g.id_group,'2026-06-18'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='A' AND v.city='Atlanta' AND v.stadium='Mercedes-Benz Stadium'
  AND th.country='Czech Republic' AND ta.country='South Africa';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 26,1,g.id_group,'2026-06-18'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='B' AND v.city='Los Angeles' AND v.stadium='SoFi Stadium'
  AND th.country='Switzerland' AND ta.country='Bosnia and Herzegovina';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 27,1,g.id_group,'2026-06-18'::date,'15:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='B' AND v.city='Vancouver' AND v.stadium='BC Place'
  AND th.country='Canada' AND ta.country='Qatar';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 28,1,g.id_group,'2026-06-18'::date,'19:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='A' AND v.city='Guadalajara' AND v.stadium='Estadio Akron'
  AND th.country='Mexico' AND ta.country='South Korea';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 29,1,g.id_group,'2026-06-19'::date,'21:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='C' AND v.city='Philadelphia' AND v.stadium='Lincoln Financial Field'
  AND th.country='Brazil' AND ta.country='Haiti';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 30,1,g.id_group,'2026-06-19'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='C' AND v.city='Boston' AND v.stadium='Gillette Stadium'
  AND th.country='Scotland' AND ta.country='Morocco';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 31,1,g.id_group,'2026-06-19'::date,'20:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='D' AND v.city='San Francisco Bay Area' AND v.stadium='Levi''s Stadium'
  AND th.country='Turkey' AND ta.country='Paraguay';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 32,1,g.id_group,'2026-06-19'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='D' AND v.city='Seattle' AND v.stadium='Lumen Field'
  AND th.country='United States' AND ta.country='Australia';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 33,1,g.id_group,'2026-06-20'::date,'16:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='E' AND v.city='Toronto' AND v.stadium='BMO Field'
  AND th.country='Germany' AND ta.country='Ivory Coast';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 34,1,g.id_group,'2026-06-20'::date,'19:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='E' AND v.city='Kansas City' AND v.stadium='Arrowhead Stadium'
  AND th.country='Ecuador' AND ta.country='Curaçao';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 35,1,g.id_group,'2026-06-20'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='F' AND v.city='Houston' AND v.stadium='NRG Stadium'
  AND th.country='Netherlands' AND ta.country='Sweden';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 36,1,g.id_group,'2026-06-20'::date,'22:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='F' AND v.city='Monterrey' AND v.stadium='Estadio BBVA'
  AND th.country='Tunisia' AND ta.country='Japan';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 37,1,g.id_group,'2026-06-21'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='H' AND v.city='Miami' AND v.stadium='Hard Rock Stadium'
  AND th.country='Uruguay' AND ta.country='Cape Verde';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 38,1,g.id_group,'2026-06-21'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='H' AND v.city='Atlanta' AND v.stadium='Mercedes-Benz Stadium'
  AND th.country='Spain' AND ta.country='Saudi Arabia';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 39,1,g.id_group,'2026-06-21'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='G' AND v.city='Los Angeles' AND v.stadium='SoFi Stadium'
  AND th.country='Belgium' AND ta.country='Iran';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 40,1,g.id_group,'2026-06-21'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='G' AND v.city='Vancouver' AND v.stadium='BC Place'
  AND th.country='New Zealand' AND ta.country='Egypt';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 41,1,g.id_group,'2026-06-22'::date,'20:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='I' AND v.city='New York/New Jersey' AND v.stadium='MetLife Stadium'
  AND th.country='Norway' AND ta.country='Senegal';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 42,1,g.id_group,'2026-06-22'::date,'17:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='I' AND v.city='Philadelphia' AND v.stadium='Lincoln Financial Field'
  AND th.country='France' AND ta.country='Iraq';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 43,1,g.id_group,'2026-06-22'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='J' AND v.city='Dallas' AND v.stadium='AT&T Stadium'
  AND th.country='Argentina' AND ta.country='Austria';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 44,1,g.id_group,'2026-06-22'::date,'20:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='J' AND v.city='San Francisco Bay Area' AND v.stadium='Levi''s Stadium'
  AND th.country='Jordan' AND ta.country='Algeria';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 45,1,g.id_group,'2026-06-23'::date,'16:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='L' AND v.city='Boston' AND v.stadium='Gillette Stadium'
  AND th.country='England' AND ta.country='Ghana';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 46,1,g.id_group,'2026-06-23'::date,'19:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='L' AND v.city='Toronto' AND v.stadium='BMO Field'
  AND th.country='Panama' AND ta.country='Croatia';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 47,1,g.id_group,'2026-06-23'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='K' AND v.city='Houston' AND v.stadium='NRG Stadium'
  AND th.country='Portugal' AND ta.country='Uzbekistan';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 48,1,g.id_group,'2026-06-23'::date,'20:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='K' AND v.city='Guadalajara' AND v.stadium='Estadio Akron'
  AND th.country='Colombia' AND ta.country='DR Congo';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 49,1,g.id_group,'2026-06-24'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='C' AND v.city='Miami' AND v.stadium='Hard Rock Stadium'
  AND th.country='Scotland' AND ta.country='Brazil';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 50,1,g.id_group,'2026-06-24'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='C' AND v.city='Atlanta' AND v.stadium='Mercedes-Benz Stadium'
  AND th.country='Morocco' AND ta.country='Haiti';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 51,1,g.id_group,'2026-06-24'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='B' AND v.city='Vancouver' AND v.stadium='BC Place'
  AND th.country='Switzerland' AND ta.country='Canada';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 52,1,g.id_group,'2026-06-24'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='B' AND v.city='Seattle' AND v.stadium='Lumen Field'
  AND th.country='Bosnia and Herzegovina' AND ta.country='Qatar';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 53,1,g.id_group,'2026-06-24'::date,'19:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='A' AND v.city='Mexico City' AND v.stadium='Estadio Azteca'
  AND th.country='Czech Republic' AND ta.country='Mexico';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 54,1,g.id_group,'2026-06-24'::date,'19:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='A' AND v.city='Monterrey' AND v.stadium='Estadio BBVA'
  AND th.country='South Africa' AND ta.country='South Korea';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 55,1,g.id_group,'2026-06-25'::date,'16:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='E' AND v.city='Philadelphia' AND v.stadium='Lincoln Financial Field'
  AND th.country='Curaçao' AND ta.country='Ivory Coast';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 56,1,g.id_group,'2026-06-25'::date,'16:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='E' AND v.city='New York/New Jersey' AND v.stadium='MetLife Stadium'
  AND th.country='Ecuador' AND ta.country='Germany';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 57,1,g.id_group,'2026-06-25'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='F' AND v.city='Dallas' AND v.stadium='AT&T Stadium'
  AND th.country='Japan' AND ta.country='Sweden';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 58,1,g.id_group,'2026-06-25'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='F' AND v.city='Kansas City' AND v.stadium='Arrowhead Stadium'
  AND th.country='Tunisia' AND ta.country='Netherlands';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 59,1,g.id_group,'2026-06-25'::date,'19:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='D' AND v.city='Los Angeles' AND v.stadium='SoFi Stadium'
  AND th.country='Turkey' AND ta.country='United States';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 60,1,g.id_group,'2026-06-25'::date,'19:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='D' AND v.city='San Francisco Bay Area' AND v.stadium='Levi''s Stadium'
  AND th.country='Paraguay' AND ta.country='Australia';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 61,1,g.id_group,'2026-06-26'::date,'15:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='I' AND v.city='Boston' AND v.stadium='Gillette Stadium'
  AND th.country='Norway' AND ta.country='France';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 62,1,g.id_group,'2026-06-26'::date,'15:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='I' AND v.city='Toronto' AND v.stadium='BMO Field'
  AND th.country='Senegal' AND ta.country='Iraq';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 63,1,g.id_group,'2026-06-26'::date,'20:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='G' AND v.city='Seattle' AND v.stadium='Lumen Field'
  AND th.country='Egypt' AND ta.country='Iran';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 64,1,g.id_group,'2026-06-26'::date,'20:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='G' AND v.city='Vancouver' AND v.stadium='BC Place'
  AND th.country='New Zealand' AND ta.country='Belgium';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 65,1,g.id_group,'2026-06-26'::date,'19:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='H' AND v.city='Houston' AND v.stadium='NRG Stadium'
  AND th.country='Cape Verde' AND ta.country='Saudi Arabia';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 66,1,g.id_group,'2026-06-26'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='H' AND v.city='Guadalajara' AND v.stadium='Estadio Akron'
  AND th.country='Uruguay' AND ta.country='Spain';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 67,1,g.id_group,'2026-06-27'::date,'17:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='L' AND v.city='New York/New Jersey' AND v.stadium='MetLife Stadium'
  AND th.country='Panama' AND ta.country='England';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 68,1,g.id_group,'2026-06-27'::date,'17:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='L' AND v.city='Philadelphia' AND v.stadium='Lincoln Financial Field'
  AND th.country='Croatia' AND ta.country='Ghana';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 69,1,g.id_group,'2026-06-27'::date,'21:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='J' AND v.city='Kansas City' AND v.stadium='Arrowhead Stadium'
  AND th.country='Algeria' AND ta.country='Austria';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 70,1,g.id_group,'2026-06-27'::date,'21:00'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='J' AND v.city='Dallas' AND v.stadium='AT&T Stadium'
  AND th.country='Jordan' AND ta.country='Argentina';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 71,1,g.id_group,'2026-06-27'::date,'19:30'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='K' AND v.city='Miami' AND v.stadium='Hard Rock Stadium'
  AND th.country='Colombia' AND ta.country='Portugal';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 72,1,g.id_group,'2026-06-27'::date,'19:30'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='K' AND v.city='Atlanta' AND v.stadium='Mercedes-Benz Stadium'
  AND th.country='DR Congo' AND ta.country='Uzbekistan';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 73,2,NULL,'2026-06-28'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Los Angeles' AND v.stadium='SoFi Stadium'
  AND th.country='Segundo A' AND ta.country='Segundo B'
  AND hs.label='Segundo A' AND aslot.label='Segundo B';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 74,2,NULL,'2026-06-29'::date,'16:30'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Boston' AND v.stadium='Gillette Stadium'
  AND th.country='Primero E' AND ta.country='3rd ABCDEF'
  AND hs.label='Primero E' AND aslot.label='3rd ABCDEF';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 75,2,NULL,'2026-06-29'::date,'19:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Monterrey' AND v.stadium='Estadio BBVA'
  AND th.country='Primero F' AND ta.country='Segundo C'
  AND hs.label='Primero F' AND aslot.label='Segundo C';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 76,2,NULL,'2026-06-29'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Houston' AND v.stadium='NRG Stadium'
  AND th.country='Primero C' AND ta.country='Segundo F'
  AND hs.label='Primero C' AND aslot.label='Segundo F';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 77,2,NULL,'2026-06-30'::date,'17:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='New York/New Jersey' AND v.stadium='MetLife Stadium'
  AND th.country='Primero I' AND ta.country='3rd CDFGH'
  AND hs.label='Primero I' AND aslot.label='3rd CDFGH';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 78,2,NULL,'2026-06-30'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Dallas' AND v.stadium='AT&T Stadium'
  AND th.country='Segundo E' AND ta.country='Segundo I'
  AND hs.label='Segundo E' AND aslot.label='Segundo I';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 79,2,NULL,'2026-06-30'::date,'19:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Mexico City' AND v.stadium='Estadio Azteca'
  AND th.country='Primero A' AND ta.country='3rd CEFHI'
  AND hs.label='Primero A' AND aslot.label='3rd CEFHI';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 80,2,NULL,'2026-07-01'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Atlanta' AND v.stadium='Mercedes-Benz Stadium'
  AND th.country='Primero L' AND ta.country='3rd EHIJK'
  AND hs.label='Primero L' AND aslot.label='3rd EHIJK';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 81,2,NULL,'2026-07-01'::date,'17:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='San Francisco Bay Area' AND v.stadium='Levi''s Stadium'
  AND th.country='Primero D' AND ta.country='3rd BEFIJ'
  AND hs.label='Primero D' AND aslot.label='3rd BEFIJ';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 82,2,NULL,'2026-07-01'::date,'13:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Seattle' AND v.stadium='Lumen Field'
  AND th.country='Primero G' AND ta.country='3rd AEHIJ'
  AND hs.label='Primero G' AND aslot.label='3rd AEHIJ';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 83,2,NULL,'2026-07-02'::date,'19:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Toronto' AND v.stadium='BMO Field'
  AND th.country='Segundo K' AND ta.country='Segundo L'
  AND hs.label='Segundo K' AND aslot.label='Segundo L';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 84,2,NULL,'2026-07-02'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Los Angeles' AND v.stadium='SoFi Stadium'
  AND th.country='Primero H' AND ta.country='Segundo J'
  AND hs.label='Primero H' AND aslot.label='Segundo J';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 85,2,NULL,'2026-07-02'::date,'20:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Vancouver' AND v.stadium='BC Place'
  AND th.country='Primero B' AND ta.country='3rd EFGIJ'
  AND hs.label='Primero B' AND aslot.label='3rd EFGIJ';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 86,2,NULL,'2026-07-03'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Miami' AND v.stadium='Hard Rock Stadium'
  AND th.country='Primero J' AND ta.country='Segundo H'
  AND hs.label='Primero J' AND aslot.label='Segundo H';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 87,2,NULL,'2026-07-03'::date,'20:30'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Kansas City' AND v.stadium='Arrowhead Stadium'
  AND th.country='Primero K' AND ta.country='3rd DEIJL'
  AND hs.label='Primero K' AND aslot.label='3rd DEIJL';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 88,2,NULL,'2026-07-03'::date,'13:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Dallas' AND v.stadium='AT&T Stadium'
  AND th.country='Segundo D' AND ta.country='Segundo G'
  AND hs.label='Segundo D' AND aslot.label='Segundo G';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 89,3,NULL,'2026-07-04'::date,'17:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Philadelphia' AND v.stadium='Lincoln Financial Field'
  AND th.country='Ganador 74' AND ta.country='Ganador 77'
  AND hs.label='Ganador 74' AND aslot.label='Ganador 77';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 90,3,NULL,'2026-07-04'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Houston' AND v.stadium='NRG Stadium'
  AND th.country='Ganador 73' AND ta.country='Ganador 75'
  AND hs.label='Ganador 73' AND aslot.label='Ganador 75';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 91,3,NULL,'2026-07-05'::date,'16:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='New York/New Jersey' AND v.stadium='MetLife Stadium'
  AND th.country='Ganador 76' AND ta.country='Ganador 78'
  AND hs.label='Ganador 76' AND aslot.label='Ganador 78';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 92,3,NULL,'2026-07-05'::date,'18:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Mexico City' AND v.stadium='Estadio Azteca'
  AND th.country='Ganador 79' AND ta.country='Ganador 80'
  AND hs.label='Ganador 79' AND aslot.label='Ganador 80';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 93,3,NULL,'2026-07-06'::date,'14:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Dallas' AND v.stadium='AT&T Stadium'
  AND th.country='Ganador 83' AND ta.country='Ganador 84'
  AND hs.label='Ganador 83' AND aslot.label='Ganador 84';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 94,3,NULL,'2026-07-06'::date,'17:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Seattle' AND v.stadium='Lumen Field'
  AND th.country='Ganador 81' AND ta.country='Ganador 82'
  AND hs.label='Ganador 81' AND aslot.label='Ganador 82';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 95,3,NULL,'2026-07-07'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Atlanta' AND v.stadium='Mercedes-Benz Stadium'
  AND th.country='Ganador 86' AND ta.country='Ganador 88'
  AND hs.label='Ganador 86' AND aslot.label='Ganador 88';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 96,3,NULL,'2026-07-07'::date,'13:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Vancouver' AND v.stadium='BC Place'
  AND th.country='Ganador 85' AND ta.country='Ganador 87'
  AND hs.label='Ganador 85' AND aslot.label='Ganador 87';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 97,4,NULL,'2026-07-09'::date,'16:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Boston' AND v.stadium='Gillette Stadium'
  AND th.country='Ganador 89' AND ta.country='Ganador 90'
  AND hs.label='Ganador 89' AND aslot.label='Ganador 90';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 98,4,NULL,'2026-07-10'::date,'12:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Los Angeles' AND v.stadium='SoFi Stadium'
  AND th.country='Ganador 93' AND ta.country='Ganador 94'
  AND hs.label='Ganador 93' AND aslot.label='Ganador 94';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 99,4,NULL,'2026-07-11'::date,'17:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Miami' AND v.stadium='Hard Rock Stadium'
  AND th.country='Ganador 91' AND ta.country='Ganador 92'
  AND hs.label='Ganador 91' AND aslot.label='Ganador 92';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 100,4,NULL,'2026-07-11'::date,'20:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Kansas City' AND v.stadium='Arrowhead Stadium'
  AND th.country='Ganador 95' AND ta.country='Ganador 96'
  AND hs.label='Ganador 95' AND aslot.label='Ganador 96';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 101,5,NULL,'2026-07-14'::date,'14:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Dallas' AND v.stadium='AT&T Stadium'
  AND th.country='Ganador 97' AND ta.country='Ganador 98'
  AND hs.label='Ganador 97' AND aslot.label='Ganador 98';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 102,5,NULL,'2026-07-15'::date,'15:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Atlanta' AND v.stadium='Mercedes-Benz Stadium'
  AND th.country='Ganador 99' AND ta.country='Ganador 100'
  AND hs.label='Ganador 99' AND aslot.label='Ganador 100';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 103,6,NULL,'2026-07-18'::date,'17:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='Miami' AND v.stadium='Hard Rock Stadium'
  AND th.country='Perdedor 101' AND ta.country='Perdedor 102'
  AND hs.label='Perdedor 101' AND aslot.label='Perdedor 102';
INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT 104,7,NULL,'2026-07-19'::date,'15:00'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='New York/New Jersey' AND v.stadium='MetLife Stadium'
  AND th.country='Ganador 101' AND ta.country='Ganador 102'
  AND hs.label='Ganador 101' AND aslot.label='Ganador 102';
COMMIT;