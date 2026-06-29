import { compareGoalMinutes, formatGoalMinuteDisplay } from "@/lib/admin-utils";

export type MatchGoalPublicRow = {
  id_goal: number;
  id_match: number;
  minute: number;
  is_own_goal: boolean;
  player_name: string;
  team_code: string;
};

type MatchGoalQueryRow = {
  id_goal: number;
  id_match: number;
  minute: number;
  is_own_goal: boolean;
  players:
    | {
        name: string;
        teams: { code: string } | { code: string }[] | null;
      }
    | {
        name: string;
        teams: { code: string } | { code: string }[] | null;
      }[]
    | null;
};

export function normalizeMatchGoalRow(row: MatchGoalQueryRow): MatchGoalPublicRow | null {
  const player = Array.isArray(row.players) ? row.players[0] : row.players;
  const teams = player?.teams;
  const team = Array.isArray(teams) ? teams[0] : teams;
  const teamCode = team?.code;

  if (!player?.name || !teamCode) return null;

  return {
    id_goal: row.id_goal,
    id_match: row.id_match,
    minute: row.minute,
    is_own_goal: row.is_own_goal,
    player_name: player.name,
    team_code: teamCode,
  };
}

export function buildGoalsByMatch(
  rows: MatchGoalQueryRow[],
): Record<number, MatchGoalPublicRow[]> {
  const map: Record<number, MatchGoalPublicRow[]> = {};

  for (const row of rows) {
    const goal = normalizeMatchGoalRow(row);
    if (!goal) continue;

    if (!map[goal.id_match]) {
      map[goal.id_match] = [];
    }
    map[goal.id_match].push(goal);
  }

  for (const idMatch of Object.keys(map)) {
    map[Number(idMatch)].sort(
      (left, right) =>
        compareGoalMinutes(left.minute, right.minute) || left.id_goal - right.id_goal,
    );
  }

  return map;
}

export function goalCreditsSide(
  goal: MatchGoalPublicRow,
  homeCode: string,
  awayCode: string,
): "home" | "away" {
  const scorerIsHome = goal.team_code === homeCode;

  if (goal.is_own_goal) {
    return scorerIsHome ? "away" : "home";
  }

  return scorerIsHome ? "home" : "away";
}

export function formatGoalLabel(goal: MatchGoalPublicRow): string {
  const minute = `${formatGoalMinuteDisplay(goal.minute)}'`;
  if (goal.is_own_goal) {
    return `${minute} ${goal.player_name} (autogol)`;
  }
  return `${minute} ${goal.player_name}`;
}
