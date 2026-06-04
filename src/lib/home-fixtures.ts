import type { FixtureRow } from "@/lib/predictions-types";

export type MatchResultScore = {
  id_match: number;
  goals_home: number | null;
  goals_away: number | null;
};

export const HOME_UPCOMING_LIMIT = 5;
export const HOME_COMPLETED_LIMIT = 15;

export function isMatchCompleted(
  idMatch: number,
  resultsByMatch: Record<number, MatchResultScore>,
): boolean {
  const row = resultsByMatch[idMatch];
  return row?.goals_home != null && row?.goals_away != null;
}

function compareKickoffAsc(a: FixtureRow, b: FixtureRow): number {
  const dateCompare = a.match_date.localeCompare(b.match_date);
  if (dateCompare !== 0) return dateCompare;
  return a.match_time.localeCompare(b.match_time);
}

function compareKickoffDesc(a: FixtureRow, b: FixtureRow): number {
  return -compareKickoffAsc(a, b);
}

export function splitHomeFixtures(
  fixtures: FixtureRow[],
  resultsByMatch: Record<number, MatchResultScore>,
): { upcoming: FixtureRow[]; completed: FixtureRow[] } {
  const upcoming: FixtureRow[] = [];
  const completed: FixtureRow[] = [];

  for (const fixture of fixtures) {
    if (isMatchCompleted(fixture.id_match, resultsByMatch)) {
      completed.push(fixture);
    } else {
      upcoming.push(fixture);
    }
  }

  upcoming.sort(compareKickoffAsc);
  completed.sort(compareKickoffDesc);

  return {
    upcoming: upcoming.slice(0, HOME_UPCOMING_LIMIT),
    completed: completed.slice(0, HOME_COMPLETED_LIMIT),
  };
}

export function buildResultsByMatch(
  rows: MatchResultScore[],
): Record<number, MatchResultScore> {
  const map: Record<number, MatchResultScore> = {};
  for (const row of rows) {
    map[row.id_match] = row;
  }
  return map;
}
