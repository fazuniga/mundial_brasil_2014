import type {
  AdminFixtureRow,
  MatchGoalRow,
  MatchResultDraft,
  MatchResultRow,
  MatchTeamRow,
} from "@/lib/admin-types";
import type { FixtureRow, PlayerRow } from "@/lib/predictions-types";
import {
  groupFixturesByGame,
  groupFixturesBySection,
  type FixtureGroup,
} from "@/lib/predictions-utils";

const GROUP_STAGE_ROUND_ID = 1;
const GROUP_STAGE_SECTION_TITLE = "Fase de Grupos";

/**
 * Admin fixture list: Fase de Grupos always (marcadores); each knockout round only
 * when that round is enabled in Fases del torneo. Later knockouts stay hidden
 * until their phase is opened — opening Dieciseisavos does not reveal Octavos+.
 */
export function filterAdminVisibleFixtures<
  T extends Pick<FixtureRow, "id_round" | "round_predictions_enabled">,
>(fixtures: T[]): T[] {
  return fixtures.filter(
    (fixture) =>
      fixture.id_round === GROUP_STAGE_ROUND_ID || fixture.round_predictions_enabled,
  );
}

function sortFixturesByKickoff(fixtures: FixtureRow[]): FixtureRow[] {
  return [...fixtures].sort((a, b) => {
    const dateCompare = a.match_date.localeCompare(b.match_date);
    if (dateCompare !== 0) return dateCompare;
    return a.match_time.localeCompare(b.match_time);
  });
}

/** Admin: one Fase de Grupos section; knockouts grouped by round name, ordered by id_round. */
export function groupAdminFixturesBySection(fixtures: FixtureRow[]): FixtureGroup[] {
  const groupStage: FixtureRow[] = [];
  const knockoutByRound = new Map<
    number,
    { nameRound: string; fixtures: FixtureRow[] }
  >();

  for (const fixture of fixtures) {
    if (fixture.id_round === GROUP_STAGE_ROUND_ID) {
      groupStage.push(fixture);
      continue;
    }

    const existing = knockoutByRound.get(fixture.id_round);
    if (existing) {
      existing.fixtures.push(fixture);
    } else {
      knockoutByRound.set(fixture.id_round, {
        nameRound: fixture.name_round,
        fixtures: [fixture],
      });
    }
  }

  const sections: FixtureGroup[] = [];

  if (groupStage.length > 0) {
    sections.push({
      key: "group-stage",
      title: GROUP_STAGE_SECTION_TITLE,
      fixtures: sortFixturesByKickoff(groupStage),
    });
  }

  const knockouts = [...knockoutByRound.entries()]
    .sort(([a], [b]) => a - b)
    .map(([idRound, { nameRound, fixtures: roundFixtures }]) => ({
      key: `round-${idRound}`,
      title: nameRound,
      fixtures: sortFixturesByKickoff(roundFixtures),
    }));

  return [...sections, ...knockouts];
}

/** Admin: single section with all fixtures ordered by kickoff (match_date, match_time). */
export function groupAdminFixturesByGame(fixtures: FixtureRow[]): FixtureGroup[] {
  return groupFixturesByGame(fixtures);
}

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

export type DerivedRegulationScore = {
  goalsHome: number;
  goalsAway: number;
};

export function deriveScoreFromGoals(
  goals: MatchGoalRow[],
  homeTeamId: number,
  awayTeamId: number,
  players: PlayerRow[],
): DerivedRegulationScore {
  const teamByPlayer = new Map(players.map((player) => [player.id_player, player.id_team]));
  let goalsHome = 0;
  let goalsAway = 0;

  for (const goal of goals) {
    const scorerTeam = teamByPlayer.get(goal.id_player);
    if (scorerTeam == null) continue;

    if (goal.is_own_goal) {
      if (scorerTeam === homeTeamId) goalsAway += 1;
      else if (scorerTeam === awayTeamId) goalsHome += 1;
    } else if (scorerTeam === homeTeamId) {
      goalsHome += 1;
    } else if (scorerTeam === awayTeamId) {
      goalsAway += 1;
    }
  }

  return { goalsHome, goalsAway };
}

/** Goals list when present; otherwise saved draft from match_results. */
export function resolveRegulationScore(
  goals: MatchGoalRow[],
  homeTeamId: number,
  awayTeamId: number,
  players: PlayerRow[],
  draft: MatchResultDraft,
): DerivedRegulationScore {
  if (goals.length > 0) {
    return deriveScoreFromGoals(goals, homeTeamId, awayTeamId, players);
  }

  const goalsHome = Number.parseInt(draft.goalsHome, 10);
  const goalsAway = Number.parseInt(draft.goalsAway, 10);

  if (
    draft.goalsHome !== "" &&
    draft.goalsAway !== "" &&
    !Number.isNaN(goalsHome) &&
    !Number.isNaN(goalsAway)
  ) {
    return { goalsHome, goalsAway };
  }

  return { goalsHome: 0, goalsAway: 0 };
}

export function regulationScoreToDraft(score: DerivedRegulationScore): Pick<
  MatchResultDraft,
  "goalsHome" | "goalsAway"
> {
  return {
    goalsHome: score.goalsHome.toString(),
    goalsAway: score.goalsAway.toString(),
  };
}

export function matchGoalsAreEqual(a: MatchGoalRow[], b: MatchGoalRow[]): boolean {
  if (a.length !== b.length) return false;

  const sortGoals = (goals: MatchGoalRow[]) =>
    [...goals].sort((left, right) => left.id_goal - right.id_goal);

  const sortedA = sortGoals(a);
  const sortedB = sortGoals(b);

  return sortedA.every(
    (goal, index) =>
      goal.id_goal === sortedB[index].id_goal &&
      goal.id_player === sortedB[index].id_player &&
      goal.minute === sortedB[index].minute &&
      goal.is_own_goal === sortedB[index].is_own_goal,
  );
}

export function isAdminMatchDirty(
  draft: MatchResultDraft,
  baseline: MatchResultDraft,
  goals: MatchGoalRow[],
  baselineGoals: MatchGoalRow[],
): boolean {
  return (
    !matchDraftsAreEqual(draft, baseline) || !matchGoalsAreEqual(goals, baselineGoals)
  );
}

/** Unsaved 0-0 with no goals listed is valid but not "dirty" until explicitly allowed to save. */
export function canSaveAdminMatch(
  draft: MatchResultDraft,
  baseline: MatchResultDraft,
  goals: MatchGoalRow[],
  baselineGoals: MatchGoalRow[],
  isSaved: boolean,
  regulationScore: DerivedRegulationScore,
): boolean {
  if (isAdminMatchDirty(draft, baseline, goals, baselineGoals)) {
    return true;
  }

  return (
    !isSaved &&
    goals.length === 0 &&
    regulationScore.goalsHome === 0 &&
    regulationScore.goalsAway === 0
  );
}

export type DerivedFirstGoal = {
  minute: number;
  playerId: number;
  playerName: string;
  teamCode: string;
  teamCountry: string;
};

export function deriveFirstGoalFromGoals(
  goals: MatchGoalRow[],
  players: PlayerRow[],
): DerivedFirstGoal | null {
  const eligible = goals
    .filter((g) => !g.is_own_goal)
    .sort((a, b) => a.minute - b.minute || a.id_goal - b.id_goal);
  const first = eligible[0];
  if (!first) return null;

  const player = players.find((p) => p.id_player === first.id_player);
  const playerName =
    first.player_name ?? player?.name ?? `Jugador ${first.id_player}`;

  return {
    minute: first.minute,
    playerId: first.id_player,
    playerName,
    teamCode: player?.team_code ?? "",
    teamCountry: player?.team_country ?? "",
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
  regulationScore: DerivedRegulationScore,
  firstGoal: { minute: number; playerId: number } | null,
): {
  payload: Record<string, unknown>;
  error: string | null;
} {
  const goalsHomeEt = parseOptionalSmallint(draft.goalsHomeEt);
  const goalsAwayEt = parseOptionalSmallint(draft.goalsAwayEt);
  const pensHome = parseOptionalSmallint(draft.pensHome);
  const pensAway = parseOptionalSmallint(draft.pensAway);

  if (draft.goalsHomeEt.trim() !== "" && goalsHomeEt === null) {
    return { payload: {}, error: "Marcador local en prórroga inválido." };
  }
  if (draft.goalsAwayEt.trim() !== "" && goalsAwayEt === null) {
    return { payload: {}, error: "Marcador visitante en prórroga inválido." };
  }
  if (draft.pensHome.trim() !== "" && pensHome === null) {
    return { payload: {}, error: "Penales local inválidos." };
  }
  if (draft.pensAway.trim() !== "" && pensAway === null) {
    return { payload: {}, error: "Penales visitante inválidos." };
  }

  if (
    (pensHome != null || pensAway != null) &&
    (pensHome == null || pensAway == null)
  ) {
    return {
      payload: {},
      error: "Indica penales local y visitante.",
    };
  }

  if (
    goalsHomeEt != null &&
    goalsAwayEt != null &&
    goalsHomeEt < regulationScore.goalsHome
  ) {
    return {
      payload: {},
      error: "Goles en prórroga (total) no pueden ser menores que el marcador de 90 minutos (local).",
    };
  }

  if (
    goalsHomeEt != null &&
    goalsAwayEt != null &&
    goalsAwayEt < regulationScore.goalsAway
  ) {
    return {
      payload: {},
      error: "Goles en prórroga (total) no pueden ser menores que el marcador de 90 minutos (visitante).",
    };
  }

  return {
    payload: {
      id_match: idMatch,
      goals_home: regulationScore.goalsHome,
      goals_away: regulationScore.goalsAway,
      goals_home_et: goalsHomeEt,
      goals_away_et: goalsAwayEt,
      pens_home: pensHome,
      pens_away: pensAway,
      first_goal_minute: firstGoal?.minute ?? null,
      first_goal_player_id: firstGoal?.playerId ?? null,
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
