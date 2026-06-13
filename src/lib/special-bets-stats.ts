import {
  formatPredictionStatPercent,
  predictionStatPercent,
} from "@/lib/closed-match-prediction-stats";

export type TournamentWinnerBetStatRow = {
  team_id: number;
  team_country: string;
  team_code: string;
  bet_count: number;
};

export type TournamentTopScorerBetStatRow = {
  player_id: number;
  player_name: string;
  team_country: string;
  team_code: string;
  bet_count: number;
};

export type TournamentGoalsBetStatRow = {
  goals: number;
  bet_count: number;
};

export type TournamentPredictionStatsSummary = {
  winner_bet_count: number;
  top_scorer_bet_count: number;
  goals_bet_count: number;
};

export type SpecialBetsPredictionStatsData = {
  summary: TournamentPredictionStatsSummary;
  winnerStats: TournamentWinnerBetStatRow[];
  topScorerStats: TournamentTopScorerBetStatRow[];
  goalsStats: TournamentGoalsBetStatRow[];
};

export function sortBetStatsByCount<T extends { bet_count: number }>(rows: T[]): T[] {
  return [...rows].sort((a, b) => b.bet_count - a.bet_count || 0);
}

export function topBetStatRows<T extends { bet_count: number }>(
  rows: T[],
  limit = 5,
): { top: T[]; otherCount: number } {
  const sorted = sortBetStatsByCount(rows);
  const top = sorted.slice(0, limit);
  const otherCount = sorted.slice(limit).reduce((sum, row) => sum + row.bet_count, 0);
  return { top, otherCount };
}

export function formatBetStatLine(
  label: string,
  count: number,
  total: number,
): { label: string; value: string; count: number; percent: number | null } {
  return {
    label,
    value: formatPredictionStatPercent(count, total),
    count,
    percent: predictionStatPercent(count, total),
  };
}
