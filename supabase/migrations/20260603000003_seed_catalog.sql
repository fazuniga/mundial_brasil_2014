-- Catalog seed for WC 2026 structure (teams/fixture to be loaded when draw is final)

INSERT INTO public.rounds (id_round, name_round) VALUES
  (1, 'Fase de Grupos'),
  (2, 'Dieciseisavos de Final'),
  (3, 'Octavos de Final'),
  (4, 'Cuartos de Final'),
  (5, 'Semifinal'),
  (6, 'Tercer Lugar'),
  (7, 'Final')
ON CONFLICT (id_round) DO NOTHING;

INSERT INTO public.groups (group_code) VALUES
  ('A'), ('B'), ('C'), ('D'), ('E'), ('F'),
  ('G'), ('H'), ('I'), ('J'), ('K'), ('L')
ON CONFLICT (group_code) DO NOTHING;

INSERT INTO public.scoring_rules (rule_key, points) VALUES
  ('exact_score', 3),
  ('goal_difference', 2),
  ('winner', 1),
  ('extra_time', 1),
  ('first_goal_minute', 1),
  ('top_scorer_player', 10),
  ('top_scorer_goals', 15)
ON CONFLICT (rule_key) DO NOTHING;

-- Placeholder knockout slots (extend when official bracket is published)
INSERT INTO public.knockout_slots (id_slot, label) VALUES
  (1, 'Primero A'), (2, 'Segundo A'),
  (3, 'Primero B'), (4, 'Segundo B'),
  (5, 'Primero C'), (6, 'Segundo C'),
  (7, 'Primero D'), (8, 'Segundo D'),
  (9, 'Primero E'), (10, 'Segundo E'),
  (11, 'Primero F'), (12, 'Segundo F'),
  (13, 'Primero G'), (14, 'Segundo G'),
  (15, 'Primero H'), (16, 'Segundo H'),
  (17, 'Primero I'), (18, 'Segundo I'),
  (19, 'Primero J'), (20, 'Segundo J'),
  (21, 'Primero K'), (22, 'Segundo K'),
  (23, 'Primero L'), (24, 'Segundo L')
ON CONFLICT (id_slot) DO NOTHING;

-- Third-place matrix: populate from FIFA regulation PDF when combination is known
INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('pending', '', '{}'::jsonb)
ON CONFLICT (scenario_key) DO NOTHING;
