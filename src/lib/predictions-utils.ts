import {
  isFirstGoalRangeKey,
  type FirstGoalRangeKey,
} from "@/lib/first-goal-ranges";
import { createClient } from "@/lib/supabase/client";
import { MATCH_TIMEZONE, parseMatchKickoff } from "@/lib/match-timezone";
import type { FixtureRow, PredictionRow } from "@/lib/predictions-types";

export type ExtraTimeDraft = "" | "yes" | "no";

export type PredictionDraft = {
  goalsHome: string;
  goalsAway: string;
  extraTime: ExtraTimeDraft;
  firstGoalMinute: string;
};

export type TopScorerDraft = {
  playerId: string;
  goals: string;
};

export type WinnerDraft = {
  teamId: string;
};

export type FixtureGroup = {
  key: string;
  title: string;
  fixtures: FixtureRow[];
};

/** Group stage is id_round = 1 (Fase de Grupos); knockouts start at id_round = 2. */
export function isKnockoutFixture(fixture: Pick<FixtureRow, "id_round">): boolean {
  return fixture.id_round > 1;
}

export type FixturePredictionLock = "open" | "round_closed" | "kickoff_closed";

export function getFixturePredictionLock(
  fixture: Pick<
    FixtureRow,
    "round_predictions_enabled" | "predictions_open"
  >,
): FixturePredictionLock {
  if (!fixture.round_predictions_enabled) return "round_closed";
  if (!fixture.predictions_open) return "kickoff_closed";
  return "open";
}

export function isFixtureSectionRoundClosed(fixtures: FixtureRow[]): boolean {
  return fixtures.length > 0 && !fixtures[0].round_predictions_enabled;
}

/** Highest id_round with at least one fixture open for predictions. */
export function getMaxEnabledPredictionRound(
  fixtures: Pick<FixtureRow, "id_round" | "round_predictions_enabled">[],
): number | null {
  let max: number | null = null;
  for (const fixture of fixtures) {
    if (!fixture.round_predictions_enabled) continue;
    max = max === null ? fixture.id_round : Math.max(max, fixture.id_round);
  }
  return max;
}

/**
 * Collapse inactive rounds and any phase after the latest enabled id_round
 * (future phases stay collapsed even if mistakenly re-enabled).
 */
export function isPredictionSectionDefaultOpen(
  sectionFixtures: Pick<FixtureRow, "id_round" | "round_predictions_enabled">[],
  maxEnabledRound: number | null,
): boolean {
  if (sectionFixtures.length === 0 || maxEnabledRound === null) return false;

  const sectionIdRound = sectionFixtures[0].id_round;
  const hasEnabledFixture = sectionFixtures.some(
    (fixture) => fixture.round_predictions_enabled,
  );

  return hasEnabledFixture && sectionIdRound <= maxEnabledRound;
}

export async function ensureUserPool(userId: string): Promise<number> {
  const supabase = createClient();

  const { data: existingPools, error: poolError } = await supabase
    .from("pools")
    .select("id_pool")
    .eq("owner_id", userId)
    .order("id_pool")
    .limit(1);

  if (poolError) throw poolError;

  if (existingPools && existingPools.length > 0) {
    return existingPools[0].id_pool;
  }

  const { data: created, error: createError } = await supabase
    .from("pools")
    .insert({ description: "Mi polla personal", owner_id: userId })
    .select("id_pool")
    .single();

  if (createError) throw createError;
  return created.id_pool;
}

/** Match fixture against search query (team, code, grupo, round). */
export function fixtureMatchesSearch(fixture: FixtureRow, query: string): boolean {
  const q = query.trim().toLowerCase();
  if (!q) return true;

  const tokens = q.split(/\s+/).filter(Boolean);
  const haystack = [
    fixture.home_country,
    fixture.away_country,
    fixture.home_code,
    fixture.away_code,
    fixture.name_round,
    fixture.group_code ? `grupo ${fixture.group_code}` : "",
    fixture.group_code,
  ]
    .join(" ")
    .toLowerCase();

  return tokens.every((token) => haystack.includes(token));
}

export function filterSectionsBySearch(
  sections: FixtureGroup[],
  query: string,
): FixtureGroup[] {
  const q = query.trim();
  if (!q) return sections;

  return sections
    .map((section) => ({
      ...section,
      fixtures: section.fixtures.filter((f) => fixtureMatchesSearch(f, q)),
    }))
    .filter((section) => section.fixtures.length > 0);
}

export function groupFixturesBySection(fixtures: FixtureRow[]): FixtureGroup[] {
  const groupMap = new Map<string, FixtureRow[]>();
  const knockoutMap = new Map<string, FixtureRow[]>();

  for (const fixture of fixtures) {
    if (fixture.group_code) {
      const existing = groupMap.get(fixture.group_code) ?? [];
      existing.push(fixture);
      groupMap.set(fixture.group_code, existing);
    } else {
      const existing = knockoutMap.get(fixture.name_round) ?? [];
      existing.push(fixture);
      knockoutMap.set(fixture.name_round, existing);
    }
  }

  const groups: FixtureGroup[] = [...groupMap.entries()]
    .sort(([a], [b]) => a.localeCompare(b))
    .map(([code, groupFixtures]) => ({
      key: `group-${code}`,
      title: `Grupo ${code}`,
      fixtures: sortGroupFixtures(groupFixtures),
    }));

  const knockouts: FixtureGroup[] = [...knockoutMap.entries()].map(
    ([roundName, roundFixtures]) => ({
      key: `round-${roundName}`,
      title: roundName,
      fixtures: sortGroupFixtures(roundFixtures),
    }),
  );

  return [...groups, ...knockouts];
}

function sortGroupFixtures(fixtures: FixtureRow[]): FixtureRow[] {
  return [...fixtures].sort((a, b) => {
    const dateCompare = a.match_date.localeCompare(b.match_date);
    if (dateCompare !== 0) return dateCompare;
    return a.match_time.localeCompare(b.match_time);
  });
}

export function predictionDraftFromRow(
  prediction: PredictionRow | undefined,
): PredictionDraft {
  let extraTime: ExtraTimeDraft = "";
  if (prediction?.extra_time === true) extraTime = "yes";
  else if (prediction?.extra_time === false) extraTime = "no";

  return {
    goalsHome: prediction?.goals_home?.toString() ?? "",
    goalsAway: prediction?.goals_away?.toString() ?? "",
    extraTime,
    firstGoalMinute: prediction?.first_goal_minute ?? "",
  };
}

export function topScorerDraftFromRow(
  row: { top_scorer_player_id: number | null; top_scorer_goals: number | null } | undefined,
): TopScorerDraft {
  return {
    playerId: row?.top_scorer_player_id?.toString() ?? "",
    goals: row?.top_scorer_goals?.toString() ?? "",
  };
}

export function parseTopScorerGoalsDraft(
  draft: TopScorerDraft,
): number | null | "invalid" {
  if (draft.goals === "") return null;

  const goals = Number(draft.goals);
  if (Number.isNaN(goals) || !Number.isInteger(goals) || goals < 1 || goals > 20) {
    return "invalid";
  }

  return goals;
}

export function topScorerDraftHasValue(draft: TopScorerDraft): boolean {
  return draft.playerId !== "" || draft.goals !== "";
}

export function topScorerDraftsAreEqual(a: TopScorerDraft, b: TopScorerDraft): boolean {
  return a.playerId === b.playerId && a.goals === b.goals;
}

export function isTopScorerSaved(
  row: { top_scorer_player_id: number | null; top_scorer_goals: number | null } | undefined,
): boolean {
  return row?.top_scorer_player_id != null && row?.top_scorer_goals != null;
}

export function winnerDraftFromRow(
  row: { winner_team_id: number | null } | undefined,
): WinnerDraft {
  return {
    teamId: row?.winner_team_id?.toString() ?? "",
  };
}

export function winnerDraftHasValue(draft: WinnerDraft): boolean {
  return draft.teamId !== "";
}

export function winnerDraftsAreEqual(a: WinnerDraft, b: WinnerDraft): boolean {
  return a.teamId === b.teamId;
}

export function isWinnerSaved(
  row: { winner_team_id: number | null } | undefined,
): boolean {
  return row?.winner_team_id != null;
}

export function parseScoreDraft(
  draft: PredictionDraft,
): { goalsHome: number; goalsAway: number } | null {
  const home = draft.goalsHome === "" ? null : Number(draft.goalsHome);
  const away = draft.goalsAway === "" ? null : Number(draft.goalsAway);

  if (home === null || away === null || Number.isNaN(home) || Number.isNaN(away)) {
    return null;
  }

  if (home < 0 || away < 0 || home > 99 || away > 99) {
    return null;
  }

  return { goalsHome: home, goalsAway: away };
}

export function parseFirstGoalMinuteDraft(
  draft: PredictionDraft,
): FirstGoalRangeKey | null | "invalid" {
  if (draft.firstGoalMinute === "") return null;

  if (!isFirstGoalRangeKey(draft.firstGoalMinute)) {
    return "invalid";
  }

  return draft.firstGoalMinute;
}

export function parseExtraTimeDraft(
  draft: PredictionDraft,
  isKnockout = true,
): boolean | null {
  if (!isKnockout) return null;
  if (draft.extraTime === "yes") return true;
  if (draft.extraTime === "no") return false;
  return null;
}

export function draftHasAnyValue(draft: PredictionDraft): boolean {
  return (
    draft.goalsHome !== "" ||
    draft.goalsAway !== "" ||
    draft.extraTime !== "" ||
    draft.firstGoalMinute !== ""
  );
}

export function draftsAreEqual(a: PredictionDraft, b: PredictionDraft): boolean {
  return (
    a.goalsHome === b.goalsHome &&
    a.goalsAway === b.goalsAway &&
    a.extraTime === b.extraTime &&
    a.firstGoalMinute === b.firstGoalMinute
  );
}

export function isPredictionSaved(prediction: PredictionRow | undefined): boolean {
  if (!prediction) return false;

  return (
    prediction.goals_home != null ||
    prediction.goals_away != null ||
    prediction.extra_time != null ||
    prediction.first_goal_minute != null
  );
}

export function formatFixtureDateTime(
  matchDate: string,
  matchTime: string,
): { dateShort: string; timeShort: string } {
  const kickoff = parseMatchKickoff(matchDate, matchTime);

  const dateShort = new Intl.DateTimeFormat("es-ES", {
    weekday: "short",
    day: "numeric",
    month: "short",
    timeZone: MATCH_TIMEZONE,
  }).format(kickoff);

  const timeShort = new Intl.DateTimeFormat("es-ES", {
    hour: "2-digit",
    minute: "2-digit",
    hour12: false,
    timeZone: MATCH_TIMEZONE,
  }).format(kickoff);

  return { dateShort, timeShort };
}

/** @deprecated Use PredictionDraft */
export type ScoreDraft = PredictionDraft;
