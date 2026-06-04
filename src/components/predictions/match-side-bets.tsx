"use client";

import { Label } from "@/components/ui/label";
import { FIRST_GOAL_RANGES } from "@/lib/first-goal-ranges";
import { scoringRuleHelper, scoringRuleLabel } from "@/lib/scoring-labels";
import type { ExtraTimeDraft, PredictionDraft } from "@/lib/predictions-utils";
import { cn } from "@/lib/utils";

type MatchSideBetsProps = {
  idMatch: number;
  draft: PredictionDraft;
  isKnockout: boolean;
  disabled: boolean;
  onDraftChange: (
    field: keyof Pick<PredictionDraft, "extraTime" | "firstGoalMinute">,
    value: string,
  ) => void;
};

const sideBetInputClass =
  "h-9 rounded-md border border-outline-variant bg-surface-container-lowest font-geist text-sm text-on-surface focus:border-primary focus:outline-none focus:ring-2 focus:ring-primary/20 disabled:cursor-not-allowed disabled:opacity-50";

export function MatchSideBets({
  idMatch,
  draft,
  isKnockout,
  disabled,
  onDraftChange,
}: MatchSideBetsProps) {
  const extraTimeLabel = scoringRuleLabel("extra_time");
  const extraTimeHelper = scoringRuleHelper("extra_time");

  return (
    <div
      className={cn(
        "grid gap-4",
        isKnockout ? "sm:grid-cols-2" : "sm:grid-cols-1",
      )}
    >
      {isKnockout && (
        <div className="flex flex-col gap-2">
          <div>
            <Label
              htmlFor={`extra-time-${idMatch}`}
              className="font-geist text-xs text-on-surface-variant"
            >
              {extraTimeLabel}
            </Label>
            {extraTimeHelper && (
              <p className="font-geist text-[10px] text-on-surface-variant">
                {extraTimeHelper}
              </p>
            )}
          </div>
          <select
            id={`extra-time-${idMatch}`}
            value={draft.extraTime}
            onChange={(e) =>
              onDraftChange("extraTime", e.target.value as ExtraTimeDraft)
            }
            disabled={disabled}
            className={cn(sideBetInputClass, "px-2")}
            aria-label={extraTimeLabel}
          >
            <option value="">Sin pronóstico</option>
            <option value="yes">Sí</option>
            <option value="no">No</option>
          </select>
        </div>
      )}

      <div className="flex flex-col gap-2">
        <Label
          htmlFor={`first-goal-minute-${idMatch}`}
          className="font-geist text-xs text-on-surface-variant"
        >
          {scoringRuleLabel("first_goal_minute")}
        </Label>
        <select
          id={`first-goal-minute-${idMatch}`}
          value={draft.firstGoalMinute}
          onChange={(e) => onDraftChange("firstGoalMinute", e.target.value)}
          disabled={disabled}
          className={cn(sideBetInputClass, "px-2")}
          aria-label={scoringRuleLabel("first_goal_minute")}
        >
          <option value="">Sin pronóstico</option>
          {FIRST_GOAL_RANGES.map(({ key, label }) => (
            <option key={key} value={key}>
              {label}
            </option>
          ))}
        </select>
      </div>
    </div>
  );
}
