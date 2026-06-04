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
