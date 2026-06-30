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
  "h-9 w-full rounded-md border border-outline-variant bg-surface-container-lowest font-geist text-sm text-on-surface focus-visible:border-primary focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary/20 disabled:cursor-not-allowed disabled:opacity-50";

const sideBetLabelClass = "font-geist text-xs text-on-surface-variant";
const sideBetHelperClass = "font-geist text-[10px] leading-snug text-on-surface-variant";

function SideBetLabelBlock({
  htmlFor,
  label,
  helper,
}: {
  htmlFor: string;
  label: string;
  helper?: string | null;
}) {
  return (
    <div className="flex min-h-10 flex-col justify-end gap-0.5">
      <Label htmlFor={htmlFor} className={sideBetLabelClass}>
        {label}
      </Label>
      <p className={cn(sideBetHelperClass, !helper && "invisible")} aria-hidden={!helper}>
        {helper ?? "\u00a0"}
      </p>
    </div>
  );
}

export function MatchSideBets({
  idMatch,
  draft,
  isKnockout,
  disabled,
  onDraftChange,
}: MatchSideBetsProps) {
  const extraTimeLabel = scoringRuleLabel("extra_time");
  const extraTimeHelper = scoringRuleHelper("extra_time");
  const firstGoalLabel = scoringRuleLabel("first_goal_minute");

  return (
    <div
      className={cn(
        "grid gap-4",
        isKnockout ? "sm:grid-cols-2" : "sm:grid-cols-1",
      )}
    >
      {isKnockout && (
        <div className="flex flex-col gap-2">
          <SideBetLabelBlock
            htmlFor={`extra-time-${idMatch}`}
            label={extraTimeLabel}
            helper={extraTimeHelper}
          />
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
        <SideBetLabelBlock
          htmlFor={`first-goal-minute-${idMatch}`}
          label={firstGoalLabel}
        />
        <select
          id={`first-goal-minute-${idMatch}`}
          value={draft.firstGoalMinute}
          onChange={(e) => onDraftChange("firstGoalMinute", e.target.value)}
          disabled={disabled}
          className={cn(sideBetInputClass, "px-2")}
          aria-label={firstGoalLabel}
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
