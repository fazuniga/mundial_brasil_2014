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
