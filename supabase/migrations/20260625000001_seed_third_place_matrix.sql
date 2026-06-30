-- FIFA World Cup 2026 Annex C: 495 third-place combination mappings
-- Source: FWC2026 Regulations Annex C (see scripts/annex-c-data.mjs)
-- Regenerate: node scripts/generate-third-place-matrix.mjs

BEGIN;

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

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BEFGHIKL', 'BEFGHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"I","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BEFGHIJL', 'BEFGHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BEFGHIJK', 'BEFGHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDGHIJKL', 'BDGHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"I","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDFHIJKL', 'BDFHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDFGIJKL', 'BDFGIJKL', '{"3rd CEFHI":"I","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDFGHJKL', 'BDFGHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDFGHIKL', 'BDFGHIKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDFGHIJL', 'BDFGHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDFGHIJK', 'BDFGHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEHIJKL', 'BDEHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"I","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEGIJKL', 'BDEGIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"I","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEGHJKL', 'BDEGHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEGHIKL', 'BDEGHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"I","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEGHIJL', 'BDEGHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEGHIJK', 'BDEGHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFIJKL', 'BDEFIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFHJKL', 'BDEFHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFHIKL', 'BDEFHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"I","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFHIJL', 'BDEFHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFHIJK', 'BDEFHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFGJKL', 'BDEFGJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFGIKL', 'BDEFGIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFGIJL', 'BDEFGIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFGIJK', 'BDEFGIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFGHKL', 'BDEFGHKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFGHJL', 'BDEFGHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFGHJK', 'BDEFGHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFGHIL', 'BDEFGHIL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFGHIK', 'BDEFGHIK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BDEFGHIJ', 'BDEFGHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCGHIJKL', 'BCGHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"I","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCFHIJKL', 'BCFHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCFGIJKL', 'BCFGIJKL', '{"3rd CEFHI":"I","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCFGHJKL', 'BCFGHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCFGHIKL', 'BCFGHIKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCFGHIJL', 'BCFGHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCFGHIJK', 'BCFGHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEHIJKL', 'BCEHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"I","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEGIJKL', 'BCEGIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"I","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEGHJKL', 'BCEGHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEGHIKL', 'BCEGHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"I","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEGHIJL', 'BCEGHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEGHIJK', 'BCEGHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFIJKL', 'BCEFIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFHJKL', 'BCEFHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFHIKL', 'BCEFHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"I","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFHIJL', 'BCEFHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFHIJK', 'BCEFHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFGJKL', 'BCEFGJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFGIKL', 'BCEFGIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFGIJL', 'BCEFGIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFGIJK', 'BCEFGIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFGHKL', 'BCEFGHKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFGHJL', 'BCEFGHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFGHJK', 'BCEFGHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFGHIL', 'BCEFGHIL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFGHIK', 'BCEFGHIK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCEFGHIJ', 'BCEFGHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDHIJKL', 'BCDHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"I","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDGIJKL', 'BCDGIJKL', '{"3rd CEFHI":"I","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDGHJKL', 'BCDGHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDGHIKL', 'BCDGHIKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"I","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDGHIJL', 'BCDGHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDGHIJK', 'BCDGHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFIJKL', 'BCDFIJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFHJKL', 'BCDFHJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFHIKL', 'BCDFHIKL', '{"3rd CEFHI":"C","3rd EFGIJ":"I","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFHIJL', 'BCDFHIJL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFHIJK', 'BCDFHIJK', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFGJKL', 'BCDFGJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFGIKL', 'BCDFGIKL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFGIJL', 'BCDFGIJL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFGIJK', 'BCDFGIJK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFGHKL', 'BCDFGHKL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFGHJL', 'BCDFGHJL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFGHJK', 'BCDFGHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFGHIL', 'BCDFGHIL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFGHIK', 'BCDFGHIK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDFGHIJ', 'BCDFGHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEIJKL', 'BCDEIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"I","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEHJKL', 'BCDEHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEHIKL', 'BCDEHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"I","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEHIJL', 'BCDEHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEHIJK', 'BCDEHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEGJKL', 'BCDEGJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEGIKL', 'BCDEGIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"I","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEGIJL', 'BCDEGIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEGIJK', 'BCDEGIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEGHKL', 'BCDEGHKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEGHJL', 'BCDEGHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEGHJK', 'BCDEGHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"D","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEGHIL', 'BCDEGHIL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEGHIK', 'BCDEGHIK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"H","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEGHIJ', 'BCDEGHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"D","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFJKL', 'BCDEFJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"E","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFIKL', 'BCDEFIKL', '{"3rd CEFHI":"C","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFIJL', 'BCDEFIJL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"E","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFIJK', 'BCDEFIJK', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"E","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFHKL', 'BCDEFHKL', '{"3rd CEFHI":"C","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFHJL', 'BCDEFHJL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFHJK', 'BCDEFHJK', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFHIL', 'BCDEFHIL', '{"3rd CEFHI":"C","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFHIK', 'BCDEFHIK', '{"3rd CEFHI":"C","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFHIJ', 'BCDEFHIJ', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFGKL', 'BCDEFGKL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"E","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFGJL', 'BCDEFGJL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFGJK', 'BCDEFGJK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFGIL', 'BCDEFGIL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"E","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFGIK', 'BCDEFGIK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"E","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFGIJ', 'BCDEFGIJ', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFGHL', 'BCDEFGHL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFGHK', 'BCDEFGHK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFGHJ', 'BCDEFGHJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"J","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('BCDEFGHI', 'BCDEFGHI', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"H","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('AFGHIJKL', 'AFGHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('AEGHIJKL', 'AEGHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"A","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('AEFHIJKL', 'AEFHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('AEFGIJKL', 'AEFGIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('AEFGHJKL', 'AEFGHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('AEFGHIKL', 'AEFGHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('AEFGHIJL', 'AEFGHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('AEFGHIJK', 'AEFGHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADGHIJKL', 'ADGHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADFHIJKL', 'ADFHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADFGIJKL', 'ADFGIJKL', '{"3rd CEFHI":"I","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADFGHJKL', 'ADFGHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADFGHIKL', 'ADFGHIKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADFGHIJL', 'ADFGHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADFGHIJK', 'ADFGHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEHIJKL', 'ADEHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEGIJKL', 'ADEGIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEGHJKL', 'ADEGHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEGHIKL', 'ADEGHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEGHIJL', 'ADEGHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEGHIJK', 'ADEGHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFIJKL', 'ADEFIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFHJKL', 'ADEFHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFHIKL', 'ADEFHIKL', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFHIJL', 'ADEFHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFHIJK', 'ADEFHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFGJKL', 'ADEFGJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFGIKL', 'ADEFGIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFGIJL', 'ADEFGIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFGIJK', 'ADEFGIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFGHKL', 'ADEFGHKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFGHJL', 'ADEFGHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFGHJK', 'ADEFGHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFGHIL', 'ADEFGHIL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFGHIK', 'ADEFGHIK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ADEFGHIJ', 'ADEFGHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACGHIJKL', 'ACGHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACFHIJKL', 'ACFHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACFGIJKL', 'ACFGIJKL', '{"3rd CEFHI":"I","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACFGHJKL', 'ACFGHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACFGHIKL', 'ACFGHIKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACFGHIJL', 'ACFGHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACFGHIJK', 'ACFGHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEHIJKL', 'ACEHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEGIJKL', 'ACEGIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEGHJKL', 'ACEGHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEGHIKL', 'ACEGHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEGHIJL', 'ACEGHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEGHIJK', 'ACEGHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFIJKL', 'ACEFIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFHJKL', 'ACEFHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFHIKL', 'ACEFHIKL', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFHIJL', 'ACEFHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFHIJK', 'ACEFHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFGJKL', 'ACEFGJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFGIKL', 'ACEFGIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFGIJL', 'ACEFGIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFGIJK', 'ACEFGIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFGHKL', 'ACEFGHKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFGHJL', 'ACEFGHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFGHJK', 'ACEFGHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFGHIL', 'ACEFGHIL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFGHIK', 'ACEFGHIK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACEFGHIJ', 'ACEFGHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDHIJKL', 'ACDHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDGIJKL', 'ACDGIJKL', '{"3rd CEFHI":"I","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDGHJKL', 'ACDGHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDGHIKL', 'ACDGHIKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDGHIJL', 'ACDGHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDGHIJK', 'ACDGHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFIJKL', 'ACDFIJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFHJKL', 'ACDFHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"F","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFHIKL', 'ACDFHIKL', '{"3rd CEFHI":"H","3rd EFGIJ":"F","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFHIJL', 'ACDFHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"F","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFHIJK', 'ACDFHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"F","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFGJKL', 'ACDFGJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFGIKL', 'ACDFGIKL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFGIJL', 'ACDFGIJL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFGIJK', 'ACDFGIJK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFGHKL', 'ACDFGHKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"F","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFGHJL', 'ACDFGHJL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"H"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFGHJK', 'ACDFGHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFGHIL', 'ACDFGHIL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"F","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFGHIK', 'ACDFGHIK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"F","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDFGHIJ', 'ACDFGHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEIJKL', 'ACDEIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEHJKL', 'ACDEHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEHIKL', 'ACDEHIKL', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEHIJL', 'ACDEHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEHIJK', 'ACDEHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEGJKL', 'ACDEGJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEGIKL', 'ACDEGIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"I","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEGIJL', 'ACDEGIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEGIJK', 'ACDEGIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEGHKL', 'ACDEGHKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEGHJL', 'ACDEGHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEGHJK', 'ACDEGHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEGHIL', 'ACDEGHIL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEGHIK', 'ACDEGHIK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEGHIJ', 'ACDEGHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFJKL', 'ACDEFJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFIKL', 'ACDEFIKL', '{"3rd CEFHI":"C","3rd EFGIJ":"E","3rd BEFIJ":"I","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFIJL', 'ACDEFIJL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFIJK', 'ACDEFIJK', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFHKL', 'ACDEFHKL', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"F","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFHJL', 'ACDEFHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"F","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFHJK', 'ACDEFHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFHIL', 'ACDEFHIL', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"F","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFHIK', 'ACDEFHIK', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"F","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFHIJ', 'ACDEFHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFGKL', 'ACDEFGKL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFGJL', 'ACDEFGJL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFGJK', 'ACDEFGJK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFGIL', 'ACDEFGIL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFGIK', 'ACDEFGIK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFGIJ', 'ACDEFGIJ', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFGHL', 'ACDEFGHL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"F","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFGHK', 'ACDEFGHK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFGHJ', 'ACDEFGHJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"J","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ACDEFGHI', 'ACDEFGHI', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"E","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABGHIJKL', 'ABGHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"I","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABFHIJKL', 'ABFHIJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABFGIJKL', 'ABFGIJKL', '{"3rd CEFHI":"I","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABFGHJKL', 'ABFGHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABFGHIKL', 'ABFGHIKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABFGHIJL', 'ABFGHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABFGHIJK', 'ABFGHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEHIJKL', 'ABEHIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"I","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEGIJKL', 'ABEGIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"I","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEGHJKL', 'ABEGHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEGHIKL', 'ABEGHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"I","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEGHIJL', 'ABEGHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEGHIJK', 'ABEGHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"H","3rd CDFGH":"G","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFIJKL', 'ABEFIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFHJKL', 'ABEFHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFHIKL', 'ABEFHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"I","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFHIJL', 'ABEFHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFHIJK', 'ABEFHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFGJKL', 'ABEFGJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFGIKL', 'ABEFGIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"I","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFGIJL', 'ABEFGIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFGIJK', 'ABEFGIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFGHKL', 'ABEFGHKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFGHJL', 'ABEFGHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFGHJK', 'ABEFGHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFGHIL', 'ABEFGHIL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFGHIK', 'ABEFGHIK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABEFGHIJ', 'ABEFGHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDHIJKL', 'ABDHIJKL', '{"3rd CEFHI":"I","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDGIJKL', 'ABDGIJKL', '{"3rd CEFHI":"I","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDGHJKL', 'ABDGHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDGHIKL', 'ABDGHIKL', '{"3rd CEFHI":"I","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDGHIJL', 'ABDGHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDGHIJK', 'ABDGHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFIJKL', 'ABDFIJKL', '{"3rd CEFHI":"I","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFHJKL', 'ABDFHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFHIKL', 'ABDFHIKL', '{"3rd CEFHI":"H","3rd EFGIJ":"I","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFHIJL', 'ABDFHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFHIJK', 'ABDFHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFGJKL', 'ABDFGJKL', '{"3rd CEFHI":"F","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFGIKL', 'ABDFGIKL', '{"3rd CEFHI":"I","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFGIJL', 'ABDFGIJL', '{"3rd CEFHI":"F","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFGIJK', 'ABDFGIJK', '{"3rd CEFHI":"F","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFGHKL', 'ABDFGHKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFGHJL', 'ABDFGHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFGHJK', 'ABDFGHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"J","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFGHIL', 'ABDFGHIL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFGHIK', 'ABDFGHIK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDFGHIJ', 'ABDFGHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEIJKL', 'ABDEIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"I","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEHJKL', 'ABDEHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEHIKL', 'ABDEHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"I","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEHIJL', 'ABDEHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEHIJK', 'ABDEHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEGJKL', 'ABDEGJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEGIKL', 'ABDEGIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"I","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEGIJL', 'ABDEGIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEGIJK', 'ABDEGIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEGHKL', 'ABDEGHKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEGHJL', 'ABDEGHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEGHJK', 'ABDEGHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEGHIL', 'ABDEGHIL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEGHIK', 'ABDEGHIK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEGHIJ', 'ABDEGHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFJKL', 'ABDEFJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFIKL', 'ABDEFIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"I","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFIJL', 'ABDEFIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFIJK', 'ABDEFIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFHKL', 'ABDEFHKL', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFHJL', 'ABDEFHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFHJK', 'ABDEFHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFHIL', 'ABDEFHIL', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFHIK', 'ABDEFHIK', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFHIJ', 'ABDEFHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFGKL', 'ABDEFGKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFGJL', 'ABDEFGJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFGJK', 'ABDEFGJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"J","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFGIL', 'ABDEFGIL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFGIK', 'ABDEFGIK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFGIJ', 'ABDEFGIJ', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFGHL', 'ABDEFGHL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFGHK', 'ABDEFGHK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFGHJ', 'ABDEFGHJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABDEFGHI', 'ABDEFGHI', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCHIJKL', 'ABCHIJKL', '{"3rd CEFHI":"I","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCGIJKL', 'ABCGIJKL', '{"3rd CEFHI":"I","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCGHJKL', 'ABCGHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCGHIKL', 'ABCGHIKL', '{"3rd CEFHI":"I","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCGHIJL', 'ABCGHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCGHIJK', 'ABCGHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFIJKL', 'ABCFIJKL', '{"3rd CEFHI":"I","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFHJKL', 'ABCFHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFHIKL', 'ABCFHIKL', '{"3rd CEFHI":"H","3rd EFGIJ":"I","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFHIJL', 'ABCFHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFHIJK', 'ABCFHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFGJKL', 'ABCFGJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFGIKL', 'ABCFGIKL', '{"3rd CEFHI":"I","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFGIJL', 'ABCFGIJL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFGIJK', 'ABCFGIJK', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"F","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFGHKL', 'ABCFGHKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFGHJL', 'ABCFGHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFGHJK', 'ABCFGHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"J","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFGHIL', 'ABCFGHIL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFGHIK', 'ABCFGHIK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCFGHIJ', 'ABCFGHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEIJKL', 'ABCEIJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"I","3rd CDFGH":"C","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEHJKL', 'ABCEHJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEHIKL', 'ABCEHIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"I","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEHIJL', 'ABCEHIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEHIJK', 'ABCEHIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEGJKL', 'ABCEGJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEGIKL', 'ABCEGIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"A","3rd AEHIJ":"I","3rd CDFGH":"C","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEGIJL', 'ABCEGIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEGIJK', 'ABCEGIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEGHKL', 'ABCEGHKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEGHJL', 'ABCEGHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEGHJK', 'ABCEGHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEGHIL', 'ABCEGHIL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEGHIK', 'ABCEGHIK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"H","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEGHIJ', 'ABCEGHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFJKL', 'ABCEFJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFIKL', 'ABCEFIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"I","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFIJL', 'ABCEFIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFIJK', 'ABCEFIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFHKL', 'ABCEFHKL', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFHJL', 'ABCEFHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFHJK', 'ABCEFHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFHIL', 'ABCEFHIL', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFHIK', 'ABCEFHIK', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFHIJ', 'ABCEFHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFGKL', 'ABCEFGKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFGJL', 'ABCEFGJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFGJK', 'ABCEFGJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"J","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFGIL', 'ABCEFGIL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFGIK', 'ABCEFGIK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFGIJ', 'ABCEFGIJ', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFGHL', 'ABCEFGHL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFGHK', 'ABCEFGHK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFGHJ', 'ABCEFGHJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCEFGHI', 'ABCEFGHI', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDIJKL', 'ABCDIJKL', '{"3rd CEFHI":"I","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDHJKL', 'ABCDHJKL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDHIKL', 'ABCDHIKL', '{"3rd CEFHI":"H","3rd EFGIJ":"I","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDHIJL', 'ABCDHIJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDHIJK', 'ABCDHIJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDGJKL', 'ABCDGJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDGIKL', 'ABCDGIKL', '{"3rd CEFHI":"I","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDGIJL', 'ABCDGIJL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDGIJK', 'ABCDGIJK', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"G","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDGHKL', 'ABCDGHKL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDGHJL', 'ABCDGHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDGHJK', 'ABCDGHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"J","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDGHIL', 'ABCDGHIL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDGHIK', 'ABCDGHIK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDGHIJ', 'ABCDGHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFJKL', 'ABCDFJKL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFIKL', 'ABCDFIKL', '{"3rd CEFHI":"C","3rd EFGIJ":"I","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFIJL', 'ABCDFIJL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFIJK', 'ABCDFIJK', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFHKL', 'ABCDFHKL', '{"3rd CEFHI":"H","3rd EFGIJ":"F","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFHJL', 'ABCDFHJL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"H"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFHJK', 'ABCDFHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFHIL', 'ABCDFHIL', '{"3rd CEFHI":"H","3rd EFGIJ":"F","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFHIK', 'ABCDFHIK', '{"3rd CEFHI":"H","3rd EFGIJ":"F","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFHIJ', 'ABCDFHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFGKL', 'ABCDFGKL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFGJL', 'ABCDFGJL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFGJK', 'ABCDFGJK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"J","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFGIL', 'ABCDFGIL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFGIK', 'ABCDFGIK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFGIJ', 'ABCDFGIJ', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFGHL', 'ABCDFGHL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"H"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFGHK', 'ABCDFGHK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFGHJ', 'ABCDFGHJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDFGHI', 'ABCDFGHI', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEJKL', 'ABCDEJKL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEIKL', 'ABCDEIKL', '{"3rd CEFHI":"E","3rd EFGIJ":"I","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEIJL', 'ABCDEIJL', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEIJK', 'ABCDEIJK', '{"3rd CEFHI":"E","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEHKL', 'ABCDEHKL', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEHJL', 'ABCDEHJL', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEHJK', 'ABCDEHJK', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEHIL', 'ABCDEHIL', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEHIK', 'ABCDEHIK', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEHIJ', 'ABCDEHIJ', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEGKL', 'ABCDEGKL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEGJL', 'ABCDEGJL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEGJK', 'ABCDEGJK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"J","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEGIL', 'ABCDEGIL', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEGIK', 'ABCDEGIK', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEGIJ', 'ABCDEGIJ', '{"3rd CEFHI":"E","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"I","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEGHL', 'ABCDEGHL', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEGHK', 'ABCDEGHK', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEGHJ', 'ABCDEGHJ', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"E","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEGHI', 'ABCDEGHI', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFKL', 'ABCDEFKL', '{"3rd CEFHI":"C","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFJL', 'ABCDEFJL', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFJK', 'ABCDEFJK', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFIL', 'ABCDEFIL', '{"3rd CEFHI":"C","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFIK', 'ABCDEFIK', '{"3rd CEFHI":"C","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"I","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFIJ', 'ABCDEFIJ', '{"3rd CEFHI":"C","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFHL', 'ABCDEFHL', '{"3rd CEFHI":"H","3rd EFGIJ":"F","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"D","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFHK', 'ABCDEFHK', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFHJ', 'ABCDEFHJ', '{"3rd CEFHI":"H","3rd EFGIJ":"J","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFHI', 'ABCDEFHI', '{"3rd CEFHI":"H","3rd EFGIJ":"E","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFGL', 'ABCDEFGL', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"L","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFGK', 'ABCDEFGK', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"K"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFGJ', 'ABCDEFGJ', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"J"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFGI', 'ABCDEFGI', '{"3rd CEFHI":"C","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"D","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"E","3rd EHIJK":"I"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)
VALUES ('ABCDEFGH', 'ABCDEFGH', '{"3rd CEFHI":"H","3rd EFGIJ":"G","3rd BEFIJ":"B","3rd ABCDEF":"C","3rd AEHIJ":"A","3rd CDFGH":"F","3rd DEIJL":"D","3rd EHIJK":"E"}'::jsonb)
ON CONFLICT (scenario_key) DO UPDATE SET
  qualifying_groups = EXCLUDED.qualifying_groups,
  slot_mappings = EXCLUDED.slot_mappings;

COMMIT;