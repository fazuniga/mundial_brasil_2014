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