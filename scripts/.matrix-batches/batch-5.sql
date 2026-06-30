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