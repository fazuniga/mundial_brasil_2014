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