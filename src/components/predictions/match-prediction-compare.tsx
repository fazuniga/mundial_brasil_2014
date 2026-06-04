import { MaterialIcon } from "@/components/material-icon";
import {
  actualExtraTimeOccurred,
  computeMatchPoints,
  extraTimeLabel,
  firstGoalRangeLabel,
  formatScore,
  hasMatchResult,
  scoreCompareTone,
  type MatchResultDetail,
  type SideBetOutcome,
} from "@/lib/prediction-scoring";
import { scoringRuleLabel } from "@/lib/scoring-labels";
import type { ScoringRuleRow } from "@/lib/predictions-types";
import {
  isKnockoutFixture,
  type PredictionDraft,
} from "@/lib/predictions-utils";
import type { FixtureRow } from "@/lib/predictions-types";
import { parseExtraTimeDraft, parseFirstGoalMinuteDraft, parseScoreDraft } from "@/lib/predictions-utils";
import { cn } from "@/lib/utils";

type MatchPredictionCompareProps = {
  fixture: FixtureRow;
  draft: PredictionDraft;
  result: MatchResultDetail;
  sideBet?: SideBetOutcome;
  scoringRules: ScoringRuleRow[];
  compact?: boolean;
};

const toneStyles: Record<
  ReturnType<typeof scoreCompareTone>,
  string
> = {
  correct: "border-primary/40 bg-primary/10 text-on-surface",
  partial: "border-primary/25 bg-primary/5 text-on-surface",
  incorrect: "border-outline-variant/60 bg-surface-container-low/50 text-on-surface-variant",
  neutral: "border-outline-variant/40 bg-surface-container-low/30 text-on-surface-variant",
};

function CompareChip({
  label,
  hit,
  hasPrediction,
}: {
  label: string;
  hit: boolean | null;
  hasPrediction: boolean;
}) {
  if (!hasPrediction) return null;

  const tone =
    hit === true ? "text-primary" : hit === false ? "text-on-surface-variant" : "text-on-surface-variant";

  return (
    <span
      className={cn(
        "inline-flex items-center gap-1 rounded-md border px-2 py-0.5 font-geist text-[11px]",
        hit === true
          ? "border-primary/30 bg-primary/10"
          : hit === false
            ? "border-outline-variant/50 bg-surface-container-low"
            : "border-outline-variant/40",
        tone,
      )}
    >
      <MaterialIcon
        name={hit === true ? "check_circle" : hit === false ? "cancel" : "remove_circle_outline"}
        className="text-sm"
      />
      {label}
    </span>
  );
}

export function MatchPredictionCompare({
  fixture,
  draft,
  result,
  sideBet,
  scoringRules,
  compact = false,
}: MatchPredictionCompareProps) {
  if (!hasMatchResult(result)) return null;

  const parsed = parseScoreDraft(draft);
  const predScore =
    parsed != null
      ? formatScore(parsed.goalsHome, parsed.goalsAway)
      : null;
  const actualScore = formatScore(result.goals_home!, result.goals_away!);
  const isKnockout = isKnockoutFixture(fixture);
  const tone = scoreCompareTone(draft, result);
  const totalPoints = computeMatchPoints(
    draft,
    result,
    sideBet,
    isKnockout,
    scoringRules,
  );
  const hasAnyPrediction =
    predScore != null ||
    draft.extraTime !== "" ||
    draft.firstGoalMinute !== "";

  const firstGoalPred = parseFirstGoalMinuteDraft(draft);
  const extraTimePred = parseExtraTimeDraft(draft, isKnockout);
  const actualFirstGoal = result.first_goal_minute_range;
  const actualExtra = actualExtraTimeOccurred(result);

  const firstGoalHit =
    firstGoalPred && firstGoalPred !== "invalid" && actualFirstGoal
      ? (sideBet?.firstGoalMinuteHit ?? firstGoalPred === actualFirstGoal)
      : null;

  const extraTimeHit =
    extraTimePred !== null && isKnockout
      ? (sideBet?.extraTimeHit ?? extraTimePred === actualExtra)
      : null;

  return (
    <div
      className={cn(
        "rounded-lg border px-3 py-2.5",
        toneStyles[tone],
        compact && "text-xs",
      )}
    >
      <div className="flex flex-wrap items-center gap-x-3 gap-y-1 font-geist text-xs">
        {predScore != null ? (
          <span>
            <span className="text-on-surface-variant">Tu pronóstico:</span>{" "}
            <span className="font-semibold tabular-nums">{predScore}</span>
          </span>
        ) : (
          <span className="text-on-surface-variant">Sin marcador pronosticado</span>
        )}
        <span className="text-on-surface-variant" aria-hidden>
          ·
        </span>
        <span>
          <span className="text-on-surface-variant">Resultado:</span>{" "}
          <span className="font-semibold tabular-nums">{actualScore}</span>
        </span>
        {hasAnyPrediction && totalPoints > 0 && (
          <>
            <span className="text-on-surface-variant" aria-hidden>
              ·
            </span>
            <span className="inline-flex items-center gap-1 font-medium text-primary">
              <MaterialIcon name="stars" className="text-sm" />
              +{totalPoints} pts
            </span>
          </>
        )}
      </div>

      {!compact && (isKnockout || draft.firstGoalMinute !== "") && (
        <div className="mt-2 flex flex-wrap gap-2">
          {isKnockout && extraTimePred !== null && (
            <CompareChip
              label={`${scoringRuleLabel("extra_time")}: ${extraTimeLabel(extraTimePred)} → ${extraTimeLabel(actualExtra)}`}
              hit={extraTimeHit}
              hasPrediction
            />
          )}
          {firstGoalPred && firstGoalPred !== "invalid" && (
            <CompareChip
              label={`${scoringRuleLabel("first_goal_minute")}: ${firstGoalRangeLabel(firstGoalPred)} → ${firstGoalRangeLabel(actualFirstGoal)}`}
              hit={firstGoalHit}
              hasPrediction={!!actualFirstGoal}
            />
          )}
        </div>
      )}
    </div>
  );
}
