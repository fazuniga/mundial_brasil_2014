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