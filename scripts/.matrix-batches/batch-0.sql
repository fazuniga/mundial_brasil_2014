DELETE FROM public.third_place_matrix WHERE scenario_key = 'pending';
INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('EFGHIJKL', 'EFGHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"F","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('DFGHIJKL', 'DFGHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('DEGHIJKL', 'DEGHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('DEFHIJKL', 'DEFHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('DEFGIJKL', 'DEFGIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('DEFGHJKL', 'DEFGHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('DEFGHIKL', 'DEFGHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('DEFGHIJL', 'DEFGHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('DEFGHIJK', 'DEFGHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CFGHIJKL', 'CFGHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CEGHIJKL', 'CEGHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CEFHIJKL', 'CEFHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CEFGIJKL', 'CEFGIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CEFGHJKL', 'CEFGHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CEFGHIKL', 'CEFGHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CEFGHIJL', 'CEFGHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CEFGHIJK', 'CEFGHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDGHIJKL', 'CDGHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDFHIJKL', 'CDFHIJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDFGIJKL', 'CDFGIJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDFGHJKL', 'CDFGHJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDFGHIKL', 'CDFGHIKL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDFGHIJL', 'CDFGHIJL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDFGHIJK', 'CDFGHIJK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEHIJKL', 'CDEHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEGIJKL', 'CDEGIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEGHJKL', 'CDEGHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEGHIKL', 'CDEGHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEGHIJL', 'CDEGHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEGHIJK', 'CDEGHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFIJKL', 'CDEFIJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFHJKL', 'CDEFHJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFHIKL', 'CDEFHIKL', '{"3rd CEFHI":"C","3rd EFGIJ":"E","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFHIJL', 'CDEFHIJL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFHIJK', 'CDEFHIJK', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFGJKL', 'CDEFGJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFGIKL', 'CDEFGIKL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFGIJL', 'CDEFGIJL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFGIJK', 'CDEFGIJK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFGHKL', 'CDEFGHKL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFGHJL', 'CDEFGHJL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFGHJK', 'CDEFGHJK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFGHIL', 'CDEFGHIL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFGHIK', 'CDEFGHIK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('CDEFGHIJ', 'CDEFGHIJ', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BFGHIJKL', 'BFGHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"I","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BEGHIJKL', 'BEGHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"B","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BEFHIJKL', 'BEFHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"I","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BEFGIJKL', 'BEFGIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"I","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BEFGHJKL', 'BEFGHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;