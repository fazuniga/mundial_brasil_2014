import type { FixtureRow } from "@/lib/predictions-types";

/** Row from v_closed_match_prediction_stats. */
export type ClosedMatchPredictionStatsRow = FixtureRow & {
  bet_count: number;
  home_win_count: number;
  away_win_count: number;
  draw_count: number;
  with_goals_count: number;
  no_goals_count: number;
};

export function predictionStatPercent(count: number, total: number): number | null {
  if (total <= 0) return null;
  return Math.round((count / total) * 100);
}

export function formatPredictionStatPercent(count: number, total: number): string {
  const pct = predictionStatPercent(count, total);
  return pct == null ? "—" : `${pct}%`;
}
