export type FixtureRow = {
  id_match: number;
  id_round: number;
  name_round: string;
  group_code: string;
  dow: string;
  match_date: string;
  match_time: string;
  home_code: string;
  home_country: string;
  away_code: string;
  away_country: string;
  city: string;
  stadium: string;
  round_predictions_enabled: boolean;
  predictions_open: boolean;
};

export type RoundPhaseRow = {
  id_round: number;
  name_round: string;
  predictions_enabled: boolean;
};

export type ScoringRuleRow = {
  id: number;
  rule_key: string;
  points: number;
};

export type PredictionRow = {
  id_pool: number;
  id_match: number;
  goals_home: number | null;
  goals_away: number | null;
  extra_time: boolean | null;
  first_goal_minute: string | null;
};

export type PlayerRow = {
  id_player: number;
  name: string;
  position: string | null;
  club: string | null;
  club_country: string | null;
  id_team: number;
  team_code: string;
  team_country: string;
  group_code: string | null;
};

export type TeamRow = {
  id_team: number;
  country: string;
  code: string;
  group_code: string | null;
};

export type TournamentPredictionRow = {
  id_pool: number;
  winner_team_id: number | null;
  top_scorer_player_id: number | null;
  top_scorer_goals: number | null;
};

export type PoolRow = {
  id_pool: number;
  description: string;
  is_paid: boolean;
};
