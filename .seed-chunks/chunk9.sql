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
