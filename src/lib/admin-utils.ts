import type {
  AdminFixtureRow,
  MatchGoalRow,
  MatchResultDraft,
  MatchResultRow,
  MatchTeamRow,
} from "@/lib/admin-types";
import type { FixtureRow, PlayerRow } from "@/lib/predictions-types";
import { groupFixturesBySection } from "@/lib/predictions-utils";

export function mergeFixturesWithTeams(
  fixtures: FixtureRow[],
  teams: MatchTeamRow[],
): AdminFixtureRow[] {
  const teamByMatch = new Map(teams.map((t) => [t.id_match, t]));

  return fixtures.map((fixture) => {
    const teamsRow = teamByMatch.get(fixture.id_match);
    return {
      ...fixture,
      home_team_id: teamsRow?.home_team_id ?? 0,
      away_team_id: teamsRow?.away_team_id ?? 0,
    };
  });
}

export { groupFixturesBySection };

export function matchResultDraftFromRow(
  row: MatchResultRow | undefined,
): MatchResultDraft {
  return {
    goalsHome: row?.goals_home?.toString() ?? "",
    goalsAway: row?.goals_away?.toString() ?? "",
    goalsHomeEt: row?.goals_home_et?.toString() ?? "",
    goalsAwayEt: row?.goals_away_et?.toString() ?? "",
    pensHome: row?.pens_home?.toString() ?? "",
    pensAway: row?.pens_away?.toString() ?? "",
    firstGoalMinute: row?.first_goal_minute?.toString() ?? "",
    firstGoalPlayerId: row?.first_goal_player_id?.toString() ?? "",
  };
}

export function isMatchResultSaved(row: MatchResultRow | undefined): boolean {
  return row?.goals_home != null && row?.goals_away != null;
}

export function matchDraftsAreEqual(a: MatchResultDraft, b: MatchResultDraft): boolean {
  return (
    a.goalsHome === b.goalsHome &&
    a.goalsAway === b.goalsAway &&
    a.goalsHomeEt === b.goalsHomeEt &&
    a.goalsAwayEt === b.goalsAwayEt &&
    a.pensHome === b.pensHome &&
    a.pensAway === b.pensAway
  );
}

export function deriveFirstGoalFromGoals(
  goals: MatchGoalRow[],
  players: PlayerRow[],
): { minute: number; playerId: number; playerName: string } | null {
  const eligible = goals
    .filter((g) => !g.is_own_goal)
    .sort((a, b) => a.minute - b.minute || a.id_goal - b.id_goal);
  const first = eligible[0];
  if (!first) return null;

  const playerName =
    first.player_name ??
    players.find((p) => p.id_player === first.id_player)?.name ??
    `Jugador ${first.id_player}`;

  return {
    minute: first.minute,
    playerId: first.id_player,
    playerName,
  };
}

export function parseGoalMinute(value: string): { minute: number | null; error: string | null } {
  const trimmed = value.trim();
  if (trimmed === "") {
    return { minute: null, error: "Indica el minuto del gol." };
  }

  const minute = Number.parseInt(trimmed, 10);
  if (Number.isNaN(minute)) {
    return { minute: null, error: "Minuto inválido." };
  }

  if (minute < 1 || minute > 120) {
    return {
      minute: null,
      error: "Indica un minuto entre 1 y 120.",
    };
  }

  return { minute, error: null };
}

function parseOptionalSmallint(value: string): number | null {
  const trimmed = value.trim();
  if (trimmed === "") return null;
  const n = Number.parseInt(trimmed, 10);
  if (Number.isNaN(n) || n < 0) return null;
  return n;
}

export function parseMatchResultPayload(
  idMatch: number,
  draft: MatchResultDraft,
): {
  payload: Record<string, unknown>;
  error: string | null;
} {
  const goalsHome = parseOptionalSmallint(draft.goalsHome);
  const goalsAway = parseOptionalSmallint(draft.goalsAway);

  if (draft.goalsHome.trim() !== "" && goalsHome === null) {
    return { payload: {}, error: "Marcador local inválido." };
  }
  if (draft.goalsAway.trim() !== "" && goalsAway === null) {
    return { payload: {}, error: "Marcador visitante inválido." };
  }
  if (goalsHome === null || goalsAway === null) {
    return {
      payload: {},
      error: "Indica goles local y visitante (90 min) para guardar el resultado.",
    };
  }

  return {
    payload: {
      id_match: idMatch,
      goals_home: goalsHome,
      goals_away: goalsAway,
      goals_home_et: parseOptionalSmallint(draft.goalsHomeEt),
      goals_away_et: parseOptionalSmallint(draft.goalsAwayEt),
      pens_home: parseOptionalSmallint(draft.pensHome),
      pens_away: parseOptionalSmallint(draft.pensAway),
    },
    error: null,
  };
}

export function playersForMatch(
  players: PlayerRow[],
  homeTeamId: number,
  awayTeamId: number,
): PlayerRow[] {
  if (!homeTeamId && !awayTeamId) return players;
  return players.filter(
    (p) => p.id_team === homeTeamId || p.id_team === awayTeamId,
  );
}
