import type { FixtureRow, PlayerRow } from "@/lib/predictions-types";

export type MatchResultRow = {
  id_match: number;
  goals_home: number | null;
  goals_away: number | null;
  goals_home_et: number | null;
  goals_away_et: number | null;
  goals_home_pt: number | null;
  goals_away_pt: number | null;
  pens_home: number | null;
  pens_away: number | null;
  first_goal_minute: number | null;
  first_goal_player_id: number | null;
};

export type MatchTeamRow = {
  id_match: number;
  home_team_id: number;
  away_team_id: number;
};

export type AdminFixtureRow = FixtureRow & {
  home_team_id: number;
  away_team_id: number;
};

export type MatchGoalRow = {
  id_goal: number;
  id_match: number;
  id_player: number;
  minute: number;
  is_own_goal: boolean;
  player_name?: string | null;
};

export type TournamentTopScorerSummary = {
  top_scorer_goals: number;
  tied_leaders_count: number;
  top_scorer_player_ids: number[];
  top_scorer_names: string;
};

export type MatchResultDraft = {
  goalsHome: string;
  goalsAway: string;
  goalsHomeEt: string;
  goalsAwayEt: string;
  pensHome: string;
  pensAway: string;
  firstGoalMinute: string;
  firstGoalPlayerId: string;
};

export type AdminClientProps = {
  fixtures: AdminFixtureRow[];
  resultsByMatch: Record<number, MatchResultRow>;
  goalsByMatch: Record<number, MatchGoalRow[]>;
  players: PlayerRow[];
  topScorerSummary: TournamentTopScorerSummary | null;
};
