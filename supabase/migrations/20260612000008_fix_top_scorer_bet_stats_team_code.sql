-- v_tournament_top_scorer_bet_stats was deployed without team_code; fetch selects it for TeamFlag.
DROP VIEW IF EXISTS public.v_tournament_top_scorer_bet_stats;

CREATE VIEW public.v_tournament_top_scorer_bet_stats
WITH (security_invoker = false) AS
SELECT
  tp.top_scorer_player_id AS player_id,
  p.name AS player_name,
  t.country AS team_country,
  t.code AS team_code,
  COUNT(*)::int AS bet_count
FROM public.tournament_predictions tp
JOIN public.players p ON p.id_player = tp.top_scorer_player_id
JOIN public.teams t ON t.id_team = p.id_team
WHERE tp.top_scorer_player_id IS NOT NULL
GROUP BY tp.top_scorer_player_id, p.name, t.country, t.code;

GRANT SELECT ON public.v_tournament_top_scorer_bet_stats TO anon, authenticated;
