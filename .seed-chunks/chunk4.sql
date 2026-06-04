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
