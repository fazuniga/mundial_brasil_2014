"use client";

import { MaterialIcon } from "@/components/material-icon";
import { knockoutScorePredictionHint } from "@/lib/scoring-labels";
import { teamFlagUrl, teamInitials } from "@/lib/team-display";
import type {
  FixturePredictionLock,
  PredictionDraft,
} from "@/lib/predictions-utils";
import { cn } from "@/lib/utils";

export const desktopScoreInputClass =
  "h-9 w-11 rounded-md border border-outline-variant bg-surface-container-lowest text-center font-headline text-lg font-bold text-on-surface tabular-nums transition-[border-color,box-shadow] focus-visible:border-primary focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary/20 disabled:cursor-not-allowed disabled:opacity-50 sm:h-10 sm:w-12 sm:text-xl";

export const mobileScoreInputClass =
  "h-11 min-h-[44px] w-14 min-w-[44px] rounded-lg border border-outline-variant bg-surface-container-lowest text-center font-headline text-2xl font-bold text-on-surface tabular-nums transition-[border-color,box-shadow] focus-visible:border-primary focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary/20 disabled:cursor-not-allowed disabled:opacity-50";

export function KnockoutScoreHint({ className }: { className?: string }) {
  return (
    <p
      className={cn(
        "flex items-start justify-center gap-1.5 font-geist text-[11px] leading-snug text-on-surface-variant",
        className,
      )}
    >
      <MaterialIcon
        name="info"
        className="mt-px shrink-0 text-sm text-primary"
        aria-hidden
      />
      <span>{knockoutScorePredictionHint()}</span>
    </p>
  );
}

export function sideBetCount(draft: PredictionDraft, isKnockout: boolean): number {
  let count = 0;
  if (isKnockout && draft.extraTime !== "") count++;
  if (draft.firstGoalMinute !== "") count++;
  return count;
}

export function TeamCell({
  country,
  code,
  align,
  size = "default",
  truncateName = true,
}: {
  country: string;
  code: string;
  align: "left" | "right";
  size?: "default" | "large";
  truncateName?: boolean;
}) {
  const flagUrl = teamFlagUrl(code);
  const isLarge = size === "large";

  return (
    <div
      className={cn(
        "flex min-w-0 flex-1 items-center gap-2",
        align === "right" && "flex-row-reverse text-right",
        !isLarge && align === "left" && "max-w-none",
      )}
    >
      <div
        className={cn(
          "flex shrink-0 items-center justify-center overflow-hidden rounded-full border border-outline-variant/50 bg-surface-container-high",
          isLarge ? "h-10 w-10" : "h-7 w-7",
        )}
      >
        {flagUrl ? (
          // eslint-disable-next-line @next/next/no-img-element
          <img
            src={flagUrl}
            alt={country}
            width={80}
            height={80}
            className="h-full w-full object-cover"
            onError={(e) => {
              e.currentTarget.style.display = "none";
            }}
          />
        ) : (
          <span
            className={cn(
              "font-mono font-bold text-primary",
              isLarge ? "text-xs" : "text-[10px]",
            )}
          >
            {teamInitials(code)}
          </span>
        )}
      </div>
      <div className="min-w-0">
        <p
          className={cn(
            "font-geist font-medium text-on-surface",
            isLarge ? "text-sm" : "text-sm",
            truncateName ? "truncate" : "break-words leading-snug",
          )}
        >
          {country}
        </p>
        <p className="font-mono text-[10px] text-on-surface-variant">{code}</p>
      </div>
    </div>
  );
}

export function MatchStatusBadges({
  lock = "open",
  isSaved,
  canEdit,
  sideBetsFilled,
  isExpanded,
  layout = "stack",
}: {
  lock?: FixturePredictionLock;
  isSaved: boolean;
  canEdit: boolean;
  sideBetsFilled: number;
  isExpanded: boolean;
  layout?: "stack" | "row";
}) {
  const isLocked = lock !== "open";
  return (
    <div
      className={cn(
        "flex gap-1 justify-center",
        layout === "row"
          ? "flex-wrap items-center justify-center gap-x-3 gap-y-1"
          : "flex-col",
      )}
    >
      {isLocked ? (
        <span className="flex items-center justify-center gap-1 font-geist text-xs text-on-surface-variant">
          <MaterialIcon name="lock" className="text-sm" />
          {lock === "round_closed" ? "Fase cerrada" : "Cerrado"}
        </span>
      ) : (
        <span className="flex items-center justify-center gap-1 font-geist text-xs text-primary">
          <MaterialIcon name="edit_calendar" className="text-sm" />
          Abierto
        </span>
      )}
      {isSaved && canEdit && (
        <span className="flex items-center justify-center gap-1 font-geist text-xs text-primary">
          <MaterialIcon name="check_circle" className="text-sm" />
          Guardado
        </span>
      )}
      {sideBetsFilled > 0 && !isExpanded && (
        <span className="flex items-center justify-center gap-1 font-geist text-xs text-on-surface-variant">
          <MaterialIcon name="sports_soccer" className="text-sm" />
          +{sideBetsFilled} apuesta{sideBetsFilled === 1 ? "" : "s"}
        </span>
      )}
    </div>
  );
}
