"use client";

import { Fragment, useState } from "react";
import {
  CollapsibleInlineHeader,
  CollapsibleSection,
} from "@/components/collapsible-section";
import { MaterialIcon } from "@/components/material-icon";
import { MatchPredictionCard } from "@/components/predictions/match-prediction-card";
import {
  MatchStatusBadges,
  TeamCell,
  desktopScoreInputClass,
  sideBetCount,
} from "@/components/predictions/match-prediction-fields";
import { MatchPredictionCompare } from "@/components/predictions/match-prediction-compare";
import { MatchSideBets } from "@/components/predictions/match-side-bets";
import { hasMatchResult, type MatchResultDetail, type SideBetOutcome } from "@/lib/prediction-scoring";
import type { FixtureRow, ScoringRuleRow } from "@/lib/predictions-types";
import { MATCH_TIMEZONE_ABBR } from "@/lib/match-timezone";
import {
  formatFixtureDateTime,
  formatMatchCountLabel,
  getFixturePredictionLock,
  getPredictionSectionTitleMeta,
  isFixtureSectionRoundClosed,
  isKnockoutFixture,
  type PredictionDraft,
} from "@/lib/predictions-utils";
import { cn } from "@/lib/utils";

type GroupPredictionsTableProps = {
  title: string;
  fixtures: FixtureRow[];
  defaultOpen?: boolean;
  drafts: Record<number, PredictionDraft>;
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

export function GroupPredictionsTable({
  title,
  fixtures,
  defaultOpen = true,
  drafts,
  savedMatches,
  resultsByMatch,
  sideBetsByMatch,
  scoringRules,
  onDraftChange,
  isAuthenticated,
}: GroupPredictionsTableProps) {
  const [expandedMatches, setExpandedMatches] = useState<Set<number>>(new Set());

  if (fixtures.length === 0) return null;

  function toggleExpanded(idMatch: number) {
    setExpandedMatches((prev) => {
      const next = new Set(prev);
      if (next.has(idMatch)) {
        next.delete(idMatch);
      } else {
        next.add(idMatch);
      }
      return next;
    });
  }

  const roundClosed = isFixtureSectionRoundClosed(fixtures);
  const { name, total, saved } = getPredictionSectionTitleMeta(
    title,
    fixtures,
    savedMatches,
  );
  const totalLabel = formatMatchCountLabel(total);
  const sectionLabel = `${name} · ${totalLabel} · ${saved} / ${totalLabel} con apuesta`;

  return (
    <CollapsibleSection
      title={sectionLabel}
      titleContent={
        <CollapsibleInlineHeader
          title={name}
          detail={`${saved} / ${totalLabel} con apuesta`}
        />
      }
      defaultOpen={defaultOpen}
      className={roundClosed ? "opacity-75" : undefined}
    >
      {roundClosed ? (
        <p className="border-b border-outline-variant/40 bg-surface-container-low px-3 py-2.5 font-geist text-sm text-on-surface-variant">
          Esta fase aún no está abierta para pronósticos
        </p>
      ) : null}
      <div className="flex flex-col gap-3 p-3 md:hidden">
        {fixtures.map((fixture) => {
          const draft = drafts[fixture.id_match] ?? {
            goalsHome: "",
            goalsAway: "",
            extraTime: "",
            firstGoalMinute: "",
          };

          return (
            <MatchPredictionCard
              key={fixture.id_match}
              fixture={fixture}
              draft={draft}
              savedMatches={savedMatches}
              resultsByMatch={resultsByMatch}
              sideBetsByMatch={sideBetsByMatch}
              scoringRules={scoringRules}
              onDraftChange={onDraftChange}
              isAuthenticated={isAuthenticated}
            />
          );
        })}
      </div>

      <div className="hidden overflow-x-auto md:block">
        <table className="w-full min-w-[680px] text-left text-sm">
          <thead>
            <tr className="border-b border-outline-variant/50 bg-surface-container-low/60">
              <th className="w-10 px-2 py-2.5" aria-label="Apuestas adicionales" />
              <th className="px-3 py-2.5 font-geist text-xs font-semibold uppercase tracking-wide text-on-surface-variant">
                Fecha/Hora
              </th>
              <th className="px-3 py-2.5 font-geist text-xs font-semibold uppercase tracking-wide text-on-surface-variant">
                Local
              </th>
              <th className="px-3 py-2.5 text-center font-geist text-xs font-semibold uppercase tracking-wide text-on-surface-variant">
                Marcador
              </th>
              <th className="text-right px-3 py-2.5 font-geist text-xs font-semibold uppercase tracking-wide text-on-surface-variant">
                Visitante
              </th>
              <th className="text-center px-3 py-2.5 font-geist text-xs font-semibold uppercase tracking-wide text-on-surface-variant">
                Estado
              </th>
            </tr>
          </thead>
          <tbody>
            {fixtures.map((fixture) => {
              const draft = drafts[fixture.id_match] ?? {
                goalsHome: "",
                goalsAway: "",
                extraTime: "",
                firstGoalMinute: "",
              };
              const lock = getFixturePredictionLock(fixture);
              const isLocked = lock !== "open";
              const canEdit = isAuthenticated && lock === "open";
              const { dateShort, timeShort } = formatFixtureDateTime(
                fixture.match_date,
                fixture.match_time,
              );
              const isSaved = savedMatches.has(fixture.id_match);
              const isExpanded = expandedMatches.has(fixture.id_match);
              const isKnockout = isKnockoutFixture(fixture);
              const sideBetsFilled = sideBetCount(draft, isKnockout);
              const matchResult = resultsByMatch[fixture.id_match];
              const showCompare =
                matchResult != null && hasMatchResult(matchResult);

              return (
                <Fragment key={fixture.id_match}>
                  <tr
                    className={cn(
                      "border-b border-outline-variant/40",
                      showCompare && "border-b-0",
                    )}
                  >
                    <td className="px-2 py-3 align-middle">
                      <button
                        type="button"
                        onClick={() => toggleExpanded(fixture.id_match)}
                        className="flex h-8 w-8 items-center justify-center rounded-md text-on-surface-variant transition-colors hover:bg-surface-container-high hover:text-primary"
                        aria-expanded={isExpanded}
                        aria-label={
                          isExpanded
                            ? "Ocultar apuestas adicionales"
                            : "Mostrar apuestas adicionales"
                        }
                      >
                        <MaterialIcon
                          name={isExpanded ? "remove_circle" : "add_circle"}
                          className="text-xl"
                        />
                        {sideBetsFilled > 0 && !isExpanded && (
                          <span className="sr-only">Con apuestas adicionales</span>
                        )}
                      </button>
                    </td>

                    <td className="px-3 py-3 align-middle">
                      <p className="font-geist text-xs capitalize text-on-surface">
                        {dateShort}
                      </p>
                      <p className="font-mono text-xs text-on-surface-variant">
                        {timeShort} {MATCH_TIMEZONE_ABBR}
                      </p>
                      <p className="font-geist mt-0.5 truncate text-[10px] text-on-surface-variant">
                        {fixture.city}
                      </p>
                    </td>

                    <td className="px-3 py-3 align-middle">
                      <TeamCell
                        country={fixture.home_country}
                        code={fixture.home_code}
                        align="left"
                      />
                    </td>

                    <td className="px-3 py-3 align-middle">
                      <div className="flex items-center justify-center gap-1.5">
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
                          className={desktopScoreInputClass}
                        />
                        <span className="font-headline text-base font-bold text-on-surface-variant">
                          -
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
                          className={desktopScoreInputClass}
                        />
                      </div>
                    </td>

                    <td className="px-3 py-3 align-middle">
                      <TeamCell
                        country={fixture.away_country}
                        code={fixture.away_code}
                        align="right"
                      />
                    </td>

                    <td className="px-3 py-3 align-middle">
                      <MatchStatusBadges
                        lock={lock}
                        isSaved={isSaved}
                        canEdit={canEdit}
                        sideBetsFilled={sideBetsFilled}
                        isExpanded={isExpanded}
                      />
                    </td>
                  </tr>

                  {showCompare && !isExpanded && (
                    <tr className="border-b border-outline-variant/40">
                      <td colSpan={6} className="px-4 pb-3 pt-0">
                        <MatchPredictionCompare
                          fixture={fixture}
                          draft={draft}
                          result={matchResult}
                          sideBet={sideBetsByMatch[fixture.id_match]}
                          scoringRules={scoringRules}
                          compact
                        />
                      </td>
                    </tr>
                  )}

                  {isExpanded && (
                    <tr className="border-b border-outline-variant/40 bg-surface-container-low/40 last:border-0">
                      <td colSpan={6} className="px-4 py-4">
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
                          <div className="mt-4">
                            <MatchPredictionCompare
                              fixture={fixture}
                              draft={draft}
                              result={matchResult}
                              sideBet={sideBetsByMatch[fixture.id_match]}
                              scoringRules={scoringRules}
                            />
                          </div>
                        )}
                      </td>
                    </tr>
                  )}
                </Fragment>
              );
            })}
          </tbody>
        </table>
      </div>
    </CollapsibleSection>
  );
}
