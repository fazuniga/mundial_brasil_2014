"use client";

import { useState } from "react";
import { MaterialIcon } from "@/components/material-icon";
import { MatchPredictionCompare } from "@/components/predictions/match-prediction-compare";
import {
  MatchStatusBadges,
  TeamCell,
  mobileScoreInputClass,
  sideBetCount,
} from "@/components/predictions/match-prediction-fields";
import { MatchSideBets } from "@/components/predictions/match-side-bets";
import { hasMatchResult, type MatchResultDetail, type SideBetOutcome } from "@/lib/prediction-scoring";
import { MATCH_TIMEZONE_ABBR } from "@/lib/match-timezone";
import type { FixtureRow, ScoringRuleRow } from "@/lib/predictions-types";
import {
  formatFixtureDateTime,
  getFixturePredictionLock,
  isKnockoutFixture,
  type PredictionDraft,
} from "@/lib/predictions-utils";
import { cn } from "@/lib/utils";

type MatchPredictionCardProps = {
  fixture: FixtureRow;
  draft: PredictionDraft;
  savedMatches: Set<number>;
  resultsByMatch: Record<number, MatchResultDetail>;
  sideBetsByMatch: Record<number, SideBetOutcome>;
  scoringRules: ScoringRuleRow[];
  onDraftChange: (
    idMatch: number,
    field: keyof PredictionDraft,
    value: string,
  ) => void;
  isAuthenticated: boolean;
};

export function MatchPredictionCard({
  fixture,
  draft,
  savedMatches,
  resultsByMatch,
  sideBetsByMatch,
  scoringRules,
  onDraftChange,
  isAuthenticated,
}: MatchPredictionCardProps) {
  const [isExpanded, setIsExpanded] = useState(false);

  const lock = getFixturePredictionLock(fixture);
  const isLocked = lock !== "open";
  const canEdit = isAuthenticated && lock === "open";
  const { dateShort, timeShort } = formatFixtureDateTime(
    fixture.match_date,
    fixture.match_time,
  );
  const isSaved = savedMatches.has(fixture.id_match);
  const isKnockout = isKnockoutFixture(fixture);
  const sideBetsFilled = sideBetCount(draft, isKnockout);
  const matchResult = resultsByMatch[fixture.id_match];
  const showCompare = matchResult != null && hasMatchResult(matchResult);

  return (
    <article
      className={cn(
        "rounded-xl border border-outline-variant/50 bg-surface-container-lowest p-4 shadow-sm",
        isLocked && "opacity-95",
      )}
    >
      <div className="flex flex-col gap-3">
        <div className="flex items-start justify-between gap-3">
          <TeamCell
            country={fixture.home_country}
            code={fixture.home_code}
            align="left"
            size="large"
            truncateName={false}
          />
          <TeamCell
            country={fixture.away_country}
            code={fixture.away_code}
            align="right"
            size="large"
            truncateName={false}
          />
        </div>
        <div className="flex items-center justify-center gap-2">
          <input
            type="number"
            min={0}
            max={99}
            inputMode="numeric"
            aria-label={`Goles ${fixture.home_country}`}
            value={draft.goalsHome}
            onChange={(e) =>
              onDraftChange(fixture.id_match, "goalsHome", e.target.value)
            }
            disabled={!canEdit}
            className={mobileScoreInputClass}
          />
          <span className="font-headline text-xl font-bold text-on-surface-variant">
            –
          </span>
          <input
            type="number"
            min={0}
            max={99}
            inputMode="numeric"
            aria-label={`Goles ${fixture.away_country}`}
            value={draft.goalsAway}
            onChange={(e) =>
              onDraftChange(fixture.id_match, "goalsAway", e.target.value)
            }
            disabled={!canEdit}
            className={mobileScoreInputClass}
          />
        </div>
      </div>

      <div className="mt-3 space-y-1 border-t border-outline-variant/40 pt-3 text-center">
        <p className="font-geist text-xs capitalize text-on-surface">
          {dateShort} · {timeShort} {MATCH_TIMEZONE_ABBR}
        </p>
        <p className="font-geist truncate text-[10px] text-on-surface-variant">
          {fixture.city}
          {fixture.stadium ? ` · ${fixture.stadium}` : ""}
        </p>
        <MatchStatusBadges
          lock={lock}
          isSaved={isSaved}
          canEdit={canEdit}
          sideBetsFilled={sideBetsFilled}
          isExpanded={isExpanded}
          layout="row"
        />
      </div>

      {showCompare && !isExpanded && (
        <div className="mt-3 border-t border-outline-variant/40 pt-3">
          <MatchPredictionCompare
            fixture={fixture}
            draft={draft}
            result={matchResult}
            sideBet={sideBetsByMatch[fixture.id_match]}
            scoringRules={scoringRules}
            compact
          />
        </div>
      )}

      <button
        type="button"
        onClick={() => setIsExpanded((prev) => !prev)}
        className="mt-3 flex h-11 min-h-[44px] w-full items-center justify-center gap-2 rounded-lg border border-outline-variant/60 bg-surface-container-low/60 font-geist text-sm font-medium text-on-surface transition-colors hover:bg-surface-container-high hover:text-primary"
        aria-expanded={isExpanded}
      >
        <MaterialIcon
          name={isExpanded ? "remove_circle" : "add_circle"}
          className="text-xl"
        />
        {isExpanded ? "Ocultar apuestas adicionales" : "Apuestas adicionales"}
        {sideBetsFilled > 0 && !isExpanded && (
          <span className="rounded-full bg-primary/15 px-2 py-0.5 text-xs font-semibold text-primary">
            {sideBetsFilled}
          </span>
        )}
      </button>

      {isExpanded && (
        <div className="mt-3 space-y-4 rounded-lg bg-surface-container-low/40 p-3">
          <MatchSideBets
            idMatch={fixture.id_match}
            draft={draft}
            isKnockout={isKnockout}
            disabled={!canEdit}
            onDraftChange={(field, value) =>
              onDraftChange(fixture.id_match, field, value)
            }
          />
          {showCompare && (
            <MatchPredictionCompare
              fixture={fixture}
              draft={draft}
              result={matchResult}
              sideBet={sideBetsByMatch[fixture.id_match]}
              scoringRules={scoringRules}
            />
          )}
        </div>
      )}
    </article>
  );
}
