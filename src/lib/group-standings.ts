export type GroupStandingRow = {
  group_code: string;
  id_team?: number;
  team_name: string;
  team_code: string;
  played: number;
  wins: number;
  draws: number;
  losses: number;
  goals_for: number;
  goals_against: number;
  goal_diff: number;
  points: number;
};

export const GROUP_CODES = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
] as const;

/** Same tiebreak order as v_qualified_top_two in engine views. */
export function sortGroupStandings(rows: GroupStandingRow[]): GroupStandingRow[] {
  return [...rows].sort((a, b) => {
    if (b.points !== a.points) return b.points - a.points;
    if (b.goal_diff !== a.goal_diff) return b.goal_diff - a.goal_diff;
    if (b.goals_for !== a.goals_for) return b.goals_for - a.goals_for;
    return (a.id_team ?? 0) - (b.id_team ?? 0);
  });
}

export function groupStandingsByCode(
  rows: GroupStandingRow[],
): Map<string, GroupStandingRow[]> {
  const map = new Map<string, GroupStandingRow[]>();
  for (const code of GROUP_CODES) {
    map.set(code, []);
  }
  for (const row of rows) {
    const list = map.get(row.group_code);
    if (list) {
      list.push(row);
    }
  }
  for (const code of GROUP_CODES) {
    const list = map.get(code);
    if (list) {
      map.set(code, sortGroupStandings(list));
    }
  }
  return map;
}

export function groupHasPlayedMatches(rows: GroupStandingRow[]): boolean {
  return rows.some((row) => row.played > 0);
}
