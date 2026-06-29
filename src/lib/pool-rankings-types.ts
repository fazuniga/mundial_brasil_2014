export type PoolRankingRow = {
  id_pool: number | null;
  owner_id: string;
  display_name: string;
  username: string | null;
  is_paid_group_phase: boolean;
  is_paid_knockout: boolean;
  bets_placed: number;
  match_points: number;
  exact_hits: number;
  goal_diff_hits: number;
  winner_hits: number;
  extra_time_hits: number;
  first_goal_hits: number;
  side_bet_points: number;
  tournament_points: number;
  total_points: number;
  rank_position: number;
};
