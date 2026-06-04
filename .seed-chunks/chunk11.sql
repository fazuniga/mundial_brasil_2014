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