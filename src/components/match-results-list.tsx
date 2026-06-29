"use client";

import { usePathname, useRouter } from "next/navigation";
import { useEffect, useMemo, useState } from "react";
import { MaterialIcon } from "@/components/material-icon";
import { PredictionsSearchBar } from "@/components/predictions/predictions-search-bar";
import { RoundStageFilter } from "@/components/round-stage-filter";
import { TodayMatchesToggle } from "@/components/today-matches-toggle";
import { filterFixturesToday } from "@/lib/match-timezone";
import { FixtureRowCard } from "@/components/fixture-row-card";
import { isMatchCompleted, type MatchResultScore } from "@/lib/home-fixtures";
import type { MatchGoalPublicRow } from "@/lib/match-goals-display";
import { formatScore, firstGoalRangeLabel } from "@/lib/prediction-scoring";
import { scoringRuleLabel } from "@/lib/scoring-labels";
import {
  filterFixturesByRound,
  fixtureMatchesSearch,
} from "@/lib/predictions-utils";
import type { FixtureRow, PredictionRow, RoundPhaseRow } from "@/lib/predictions-types";

type MatchResultsListProps = {
  fixtures: FixtureRow[];
  resultsByMatch: Record<number, MatchResultScore>;
  goalsByMatch: Record<number, MatchGoalPublicRow[]>;
  predictionsByMatch?: Record<number, PredictionRow>;
  rounds?: Pick<RoundPhaseRow, "id_round" | "name_round">[];
  initialRoundId?: number | null;
  syncRoundToUrl?: boolean;
  extraSearchParams?: Record<string, string>;
};

function buildResultsUrl(
  path: string,
  roundId: number | null,
  extraSearchParams?: Record<string, string>,
): string {
  const params = new URLSearchParams();
  for (const [key, value] of Object.entries(extraSearchParams ?? {})) {
    if (value) params.set(key, value);
  }
  if (roundId != null) params.set("ronda", roundId.toString());
  const query = params.toString();
  return query ? `${path}?${query}` : path;
}

function MyBetFooter({
  goalsHome,
  goalsAway,
  firstGoalMinute,
}: {
  goalsHome: number;
  goalsAway: number;
  firstGoalMinute?: string | null;
}) {
  const rangeLabel = firstGoalMinute ? firstGoalRangeLabel(firstGoalMinute) : null;

  return (
    <div className="flex flex-col gap-0.5 font-geist text-xs md:text-sm text-on-surface">
      <p>
        <span className="font-medium text-on-surface-variant">Mi apuesta:</span>{" "}
        <span className="font-headline font-semibold tabular-nums text-primary">
          {formatScore(goalsHome, goalsAway)}
        </span>
      </p>
      {rangeLabel ? (
        <p>
          <span className="font-medium text-on-surface-variant">
            {scoringRuleLabel("first_goal_minute")}:
          </span>{" "}
          <span className="font-medium text-primary">{rangeLabel}</span>
        </p>
      ) : null}
    </div>
  );
}

function hasCompletePrediction(prediction: PredictionRow | undefined): prediction is PredictionRow & {
  goals_home: number;
  goals_away: number;
} {
  return prediction?.goals_home != null && prediction?.goals_away != null;
}

export function MatchResultsList({
  fixtures,
  resultsByMatch,
  goalsByMatch,
  predictionsByMatch,
  rounds,
  initialRoundId = null,
  syncRoundToUrl = false,
  extraSearchParams,
}: MatchResultsListProps) {
  const router = useRouter();
  const pathname = usePathname();
  const [todayOnly, setTodayOnly] = useState(true);
  const [searchQuery, setSearchQuery] = useState("");
  const [roundId, setRoundId] = useState<number | null>(initialRoundId);

  useEffect(() => {
    setRoundId(initialRoundId);
  }, [initialRoundId]);

  const selectedRound = useMemo(
    () => rounds?.find((round) => round.id_round === roundId) ?? null,
    [rounds, roundId],
  );

  const visibleFixtures = useMemo(
    () => filterFixturesToday(fixtures, todayOnly),
    [fixtures, todayOnly],
  );

  const roundFilteredFixtures = useMemo(
    () => filterFixturesByRound(visibleFixtures, roundId),
    [visibleFixtures, roundId],
  );

  const filteredFixtures = useMemo(() => {
    const q = searchQuery.trim();
    if (!q) return roundFilteredFixtures;
    return roundFilteredFixtures.filter((fixture) => fixtureMatchesSearch(fixture, q));
  }, [roundFilteredFixtures, searchQuery]);

  function handleRoundChange(value: string) {
    const nextRoundId = value ? Number.parseInt(value, 10) : null;
    const parsedRoundId =
      nextRoundId != null && Number.isFinite(nextRoundId) ? nextRoundId : null;
    setRoundId(parsedRoundId);

    if (syncRoundToUrl && pathname) {
      router.replace(buildResultsUrl(pathname, parsedRoundId, extraSearchParams));
    }
  }

  const emptyMessage = (() => {
    if (searchQuery.trim()) {
      return `Ningún partido coincide con "${searchQuery.trim()}". Prueba con el nombre del equipo, código (ARG), grupo (Grupo A) o fase eliminatoria.`;
    }
    if (roundId != null && selectedRound) {
      return `No hay partidos en ${selectedRound.name_round}${todayOnly ? " para hoy" : ""}.`;
    }
    if (todayOnly) {
      return "No hay partidos programados para hoy.";
    }
    return "Aún no hay partidos con resultado cargado.";
  })();

  return (
    <section className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
      <div className="flex flex-col gap-4 border-b border-outline-variant/50 bg-surface-container-lowest p-4">
        <div className="flex flex-wrap items-start justify-between gap-3">
          <div className="flex min-w-0 items-center gap-3">
            <MaterialIcon name="sports_soccer" className="text-2xl text-accent" />
            <div className="flex flex-col gap-0">
              <h2 className="font-geist text-lg font-semibold text-on-surface">
                Partidos del torneo
              </h2>
              <p className="font-geist text-sm text-on-surface-variant">
                {selectedRound
                  ? `${selectedRound.name_round}${todayOnly ? " · partidos de hoy" : ""}`
                  : todayOnly
                    ? "Partidos de hoy · hora de Chile"
                    : "Resultados oficiales cargados · Ordenados por fecha"}
              </p>
            </div>
          </div>
          <TodayMatchesToggle checked={todayOnly} onChange={setTodayOnly} />
        </div>

        <div className="flex flex-col gap-3 sm:flex-row sm:items-end sm:gap-4">
          {rounds && rounds.length > 0 ? (
            <RoundStageFilter
              rounds={rounds}
              value={roundId?.toString() ?? ""}
              onChange={handleRoundChange}
              className="w-full sm:max-w-xs"
            />
          ) : null}
          <PredictionsSearchBar
            value={searchQuery}
            onChange={setSearchQuery}
            resultCount={
              searchQuery.trim() || roundId != null ? filteredFixtures.length : undefined
            }
            className="min-w-0 flex-1"
          />
        </div>
      </div>

      {filteredFixtures.length > 0 ? (
        <ul>
          {filteredFixtures.map((fixture) => {
            const result = resultsByMatch[fixture.id_match];
            const score =
              result?.goals_home != null && result?.goals_away != null
                ? { home: result.goals_home, away: result.goals_away }
                : undefined;

            const goals = goalsByMatch[fixture.id_match] ?? [];
            const prediction = predictionsByMatch?.[fixture.id_match];
            const showMyBet =
              predictionsByMatch != null &&
              !isMatchCompleted(fixture.id_match, resultsByMatch) &&
              hasCompletePrediction(prediction);

            return (
              <FixtureRowCard
                key={fixture.id_match}
                fixture={fixture}
                score={score}
                goals={goals.length > 0 ? goals : undefined}
                showPredictLink={false}
                showVenue
                footer={
                  showMyBet ? (
                    <MyBetFooter
                      goalsHome={prediction.goals_home}
                      goalsAway={prediction.goals_away}
                      firstGoalMinute={prediction.first_goal_minute}
                    />
                  ) : undefined
                }
              />
            );
          })}
        </ul>
      ) : (
        <p className="font-geist px-5 py-8 text-sm text-on-surface-variant">{emptyMessage}</p>
      )}
    </section>
  );
}
