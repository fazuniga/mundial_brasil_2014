import { FIRST_GOAL_RANGES } from "@/lib/first-goal-ranges";
import type { ScoringRuleRow } from "@/lib/predictions-types";
import type { PredictionDraft } from "@/lib/predictions-utils";
import { parseExtraTimeDraft, parseFirstGoalMinuteDraft, parseScoreDraft } from "@/lib/predictions-utils";

export type MatchResultDetail = {
  id_match: number;
  goals_home: number | null;
  goals_away: number | null;
  goals_home_et: number | null;
  goals_away_et: number | null;
  pens_home: number | null;
  pens_away: number | null;
  first_goal_minute_range: string | null;
};

export type SideBetOutcome = {
  actualFirstGoalRange: string | null;
  predictedFirstGoalRange: string | null;
  firstGoalMinuteHit: boolean | null;
  extraTimeHit: boolean | null;
};

type Outcome = "home" | "away" | "draw";

function matchOutcome(home: number, away: number): Outcome {
  if (home > away) return "home";
  if (home < away) return "away";
  return "draw";
}

function rulesMap(rules: ScoringRuleRow[]): Record<string, number> {
  const map: Record<string, number> = {};
  for (const rule of rules) {
    map[rule.rule_key] = rule.points;
  }
  return map;
}

export function hasMatchResult(result: MatchResultDetail | undefined): boolean {
  return result?.goals_home != null && result?.goals_away != null;
}

export function formatScore(home: number, away: number): string {
  return `${home}–${away}`;
}

export function firstGoalRangeLabel(key: string | null): string {
  if (!key) return "—";
  return FIRST_GOAL_RANGES.find((r) => r.key === key)?.label ?? key;
}

export function actualExtraTimeOccurred(result: MatchResultDetail): boolean {
  return (
    (result.goals_home_et != null &&
      result.goals_home != null &&
      result.goals_home_et !== result.goals_home) ||
    (result.goals_away_et != null &&
      result.goals_away != null &&
      result.goals_away_et !== result.goals_away) ||
    (result.pens_home ?? 0) > 0 ||
    (result.pens_away ?? 0) > 0
  );
}

export function extraTimeLabel(value: boolean): string {
  return value ? "Sí" : "No";
}

export function computeMainScorePoints(
  draft: PredictionDraft,
  result: MatchResultDetail,
  scoringRules: ScoringRuleRow[],
): { points: number; ruleKey: string | null } {
  const parsed = parseScoreDraft(draft);
  if (
    !parsed ||
    result.goals_home == null ||
    result.goals_away == null
  ) {
    return { points: 0, ruleKey: null };
  }

  const weights = rulesMap(scoringRules);
  const { goalsHome: predH, goalsAway: predA } = parsed;
  const actH = result.goals_home;
  const actA = result.goals_away;

  if (predH === actH && predA === actA) {
    return { points: weights.exact_score ?? 0, ruleKey: "exact_score" };
  }

  const predDiff = predH - predA;
  const actDiff = actH - actA;
  if (predDiff === actDiff) {
    return { points: weights.goal_difference ?? 0, ruleKey: "goal_difference" };
  }

  if (matchOutcome(predH, predA) === matchOutcome(actH, actA)) {
    return { points: weights.winner ?? 0, ruleKey: "winner" };
  }

  return { points: 0, ruleKey: null };
}

export function computeSideBetPoints(
  draft: PredictionDraft,
  result: MatchResultDetail,
  sideBet: SideBetOutcome | undefined,
  isKnockout: boolean,
  scoringRules: ScoringRuleRow[],
): number {
  const weights = rulesMap(scoringRules);
  let total = 0;

  const firstGoal = parseFirstGoalMinuteDraft(draft);
  if (firstGoal && firstGoal !== "invalid" && result.first_goal_minute_range) {
    const hit =
      sideBet?.firstGoalMinuteHit ??
      firstGoal === result.first_goal_minute_range;
    if (hit) total += weights.first_goal_minute ?? 0;
  }

  const extraTime = parseExtraTimeDraft(draft, isKnockout);
  if (extraTime !== null && isKnockout && hasMatchResult(result)) {
    const actual = actualExtraTimeOccurred(result);
    const hit = sideBet?.extraTimeHit ?? extraTime === actual;
    if (hit) total += weights.extra_time ?? 0;
  }

  return total;
}

export function computeMatchPoints(
  draft: PredictionDraft,
  result: MatchResultDetail,
  sideBet: SideBetOutcome | undefined,
  isKnockout: boolean,
  scoringRules: ScoringRuleRow[],
): number {
  return (
    computeMainScorePoints(draft, result, scoringRules).points +
    computeSideBetPoints(draft, result, sideBet, isKnockout, scoringRules)
  );
}

export type CompareTone = "correct" | "incorrect" | "neutral" | "partial";

export function scoreCompareTone(
  draft: PredictionDraft,
  result: MatchResultDetail | undefined,
): CompareTone {
  if (!result || !hasMatchResult(result)) return "neutral";

  const parsed = parseScoreDraft(draft);
  if (!parsed) return "neutral";

  const { goalsHome, goalsAway } = parsed;
  if (
    goalsHome === result.goals_home &&
    goalsAway === result.goals_away
  ) {
    return "correct";
  }

  const predDiff = goalsHome - goalsAway;
  const actDiff = result.goals_home! - result.goals_away!;
  if (
    predDiff === actDiff ||
    matchOutcome(goalsHome, goalsAway) ===
      matchOutcome(result.goals_home!, result.goals_away!)
  ) {
    return "partial";
  }

  return "incorrect";
}
