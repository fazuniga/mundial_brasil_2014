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
  AND hs.label='Ganador 101' AND aslot.label='Ganador 102';INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo A', NULL, 'P203066') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo B', NULL, 'P203067') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero E', NULL, 'P409281') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd ABCDEF', NULL, 'P966398') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero F', NULL, 'P409282') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo C', NULL, 'P203068') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero C', NULL, 'P409279') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo F', NULL, 'P203071') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero I', NULL, 'P409285') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd CDFGH', NULL, 'P144427') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo E', NULL, 'P203070') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo I', NULL, 'P203074') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero A', NULL, 'P409277') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd CEFHI', NULL, 'P174250') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero L', NULL, 'P409288') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd EHIJK', NULL, 'P113612') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero D', NULL, 'P409280') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd BEFIJ', NULL, 'P250761') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero G', NULL, 'P409283') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd AEHIJ', NULL, 'P329162') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo K', NULL, 'P203076') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo L', NULL, 'P203077') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero H', NULL, 'P409284') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo J', NULL, 'P203075') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero B', NULL, 'P409278') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd EFGIJ', NULL, 'P052076') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero J', NULL, 'P409286') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo H', NULL, 'P203073') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Primero K', NULL, 'P409287') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('3rd DEIJL', NULL, 'P100719') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo D', NULL, 'P203069') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Segundo G', NULL, 'P203072') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 74', NULL, 'P993539') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 77', NULL, 'P993542') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 73', NULL, 'P993538') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 75', NULL, 'P993540') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 76', NULL, 'P993541') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 78', NULL, 'P993543') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 79', NULL, 'P993544') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 80', NULL, 'P993566') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 83', NULL, 'P993569') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 84', NULL, 'P993570') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 81', NULL, 'P993567') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 82', NULL, 'P993568') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 86', NULL, 'P993572') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 88', NULL, 'P993574') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 85', NULL, 'P993571') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 87', NULL, 'P993573') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 89', NULL, 'P993575') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 90', NULL, 'P993597') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 93', NULL, 'P993600') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 94', NULL, 'P993601') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 91', NULL, 'P993598') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 92', NULL, 'P993599') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 95', NULL, 'P993602') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 96', NULL, 'P993603') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 97', NULL, 'P993604') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 98', NULL, 'P993605') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 99', NULL, 'P993606') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 100', NULL, 'P088203') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 101', NULL, 'P057819') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 102', NULL, 'P057820') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 101', NULL, 'P088204') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 102', NULL, 'P088205') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 73', NULL, 'P193491') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 74', NULL, 'P193492') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 75', NULL, 'P193493') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 76', NULL, 'P193494') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 77', NULL, 'P193495') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 78', NULL, 'P193496') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 79', NULL, 'P193497') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 80', NULL, 'P193519') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 81', NULL, 'P193520') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 82', NULL, 'P193521') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 83', NULL, 'P193522') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 84', NULL, 'P193523') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 85', NULL, 'P193524') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 86', NULL, 'P193525') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 87', NULL, 'P193526') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 88', NULL, 'P193527') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 89', NULL, 'P193528') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 90', NULL, 'P193550') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 91', NULL, 'P193551') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 92', NULL, 'P193552') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 93', NULL, 'P193553') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 94', NULL, 'P193554') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 95', NULL, 'P193555') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 96', NULL, 'P193556') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 97', NULL, 'P193557') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 98', NULL, 'P193558') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 99', NULL, 'P193559') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Perdedor 100', NULL, 'P057818') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 103', NULL, 'P088206') ON CONFLICT (country) DO NOTHING;
INSERT INTO public.teams (country, id_group, code) VALUES ('Ganador 104', NULL, 'P088207') ON CONFLICT (country) DO NOTHING;INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
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
