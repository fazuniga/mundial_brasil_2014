import type { SupabaseClient } from "@supabase/supabase-js";
import type { SpecialBetsPredictionStatsData } from "@/lib/special-bets-stats";

export async function fetchSpecialBetsPredictionStats(
  supabase: SupabaseClient,
): Promise<SpecialBetsPredictionStatsData | null> {
  const [
    { data: summaryRaw },
    { data: winnerRaw },
    { data: topScorerRaw },
    { data: goalsRaw },
  ] = await Promise.all([
    supabase.from("v_tournament_prediction_stats_summary").select("*").single(),
    supabase
      .from("v_tournament_winner_bet_stats")
      .select("team_id, team_country, team_code, bet_count")
      .order("bet_count", { ascending: false }),
    supabase
      .from("v_tournament_top_scorer_bet_stats")
      .select("player_id, player_name, team_country, team_code, bet_count")
      .order("bet_count", { ascending: false }),
    supabase
      .from("v_tournament_goals_bet_stats")
      .select("goals, bet_count")
      .order("bet_count", { ascending: false }),
  ]);

  if (!summaryRaw) return null;

  return {
    summary: {
      winner_bet_count: summaryRaw.winner_bet_count ?? 0,
      top_scorer_bet_count: summaryRaw.top_scorer_bet_count ?? 0,
      goals_bet_count: summaryRaw.goals_bet_count ?? 0,
    },
    winnerStats: winnerRaw ?? [],
    topScorerStats: topScorerRaw ?? [],
    goalsStats: goalsRaw ?? [],
  };
}
