export type PoolRankingRow = {
  id_pool: number | null;
  owner_id: string;
  display_name: string;
  username: string | null;
  match_points: number;
  exact_hits: number;
  goal_diff_hits: number;
  winner_hits: number;
  side_bet_points: number;
  tournament_points: number;
  total_points: number;
  rank_position: number;
};
