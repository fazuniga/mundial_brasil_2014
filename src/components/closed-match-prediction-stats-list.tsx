"use client";

import { useMemo, useState } from "react";
import { MaterialIcon } from "@/components/material-icon";
import { FilterField } from "@/components/filter-field";
import { FixtureRowCard } from "@/components/fixture-row-card";
import { PredictionsSearchBar } from "@/components/predictions/predictions-search-bar";
import { RoundFilterSelect } from "@/components/round-filter-select";
import { TodayMatchesToggle } from "@/components/today-matches-toggle";
import {
  formatPredictionStatPercent,
  type MatchPredictionStatsRow,
} from "@/lib/closed-match-prediction-stats";
import { displayScoreFromResult, type MatchResultScore } from "@/lib/home-fixtures";
import type { MatchGoalPublicRow } from "@/lib/match-goals-display";
import { filterFixturesToday } from "@/lib/match-timezone";
import {
  filterFixturesByRound,
  fixtureMatchesSearch,
  getFixturePredictionLock,
  uniqueRoundsFromFixtures,
} from "@/lib/predictions-utils";
import { formatPredictionLockWindowShort } from "@/lib/prediction-lock";
import { cn } from "@/lib/utils";

type MatchPredictionStatsListProps = {
  rows: MatchPredictionStatsRow[];
  resultsByMatch: Record<number, MatchResultScore>;
  goalsByMatch: Record<number, MatchGoalPublicRow[]>;
};

function predictionLockLabel(row: MatchPredictionStatsRow): string {
  const lock = getFixturePredictionLock(row);
  if (lock === "open") return "Pronósticos abiertos";
  return `Cerrados ${formatPredictionLockWindowShort()} antes del inicio`;
}

function PredictionStatsFooter({ row }: { row: MatchPredictionStatsRow }) {
  const lock = getFixturePredictionLock(row);
  const total = row.bet_count;

  const stats = [
    { label: "Local", value: formatPredictionStatPercent(row.home_win_count, total) },
    { label: "Empate", value: formatPredictionStatPercent(row.draw_count, total) },
    { label: "Visitante", value: formatPredictionStatPercent(row.away_win_count, total) },
    {
      label: "Con goles",
      value: formatPredictionStatPercent(row.with_goals_count, total),
    },
    {
      label: "Sin goles",
      value: formatPredictionStatPercent(row.no_goals_count, total),
    },
  ];

  return (
    <div className="flex flex-col gap-2">
      <p
        className={cn(
          "font-geist text-[11px] font-medium",
          lock === "open"
            ? "text-primary"
            : "uppercase tracking-wide text-on-surface-variant",
        )}
      >
        {predictionLockLabel(row)}
      </p>
      <p className="font-geist text-[11px] font-medium uppercase tracking-wide text-on-surface-variant">
        Pronósticos agregados
        {total > 0 ? (
          <span className="font-normal normal-case tracking-normal text-on-surface-variant">
            {" "}
            · {total} {total === 1 ? "apuesta" : "apuestas"}
          </span>
        ) : null}
      </p>
      <dl className="grid grid-cols-3 gap-x-4 gap-y-2 sm:grid-cols-5">
        {stats.map((stat) => (
          <div key={stat.label} className="min-w-0">
            <dt className="font-geist text-[11px] text-on-surface-variant">{stat.label}</dt>
            <dd className="font-headline text-base font-semibold tabular-nums text-primary">
              {stat.value}
            </dd>
          </div>
        ))}
      </dl>
      {total === 0 ? (
        <p className="font-geist text-xs text-on-surface-variant">
          {lock === "open"
            ? "Aún no hay pronósticos registrados para este partido."
            : "Sin pronósticos registrados para este partido."}
        </p>
      ) : lock === "open" ? (
        <p className="font-geist text-xs text-on-surface-variant">
          Totales parciales · los pronósticos siguen abiertos.
        </p>
      ) : null}
    </div>
  );
}

export function MatchPredictionStatsList({
  rows,
  resultsByMatch,
  goalsByMatch,
}: MatchPredictionStatsListProps) {
  const [todayOnly, setTodayOnly] = useState(true);
  const [selectedRound, setSelectedRound] = useState<number | null>(null);
  const [searchQuery, setSearchQuery] = useState("");

  const roundOptions = useMemo(() => uniqueRoundsFromFixtures(rows), [rows]);
  const visibleRows = useMemo(() => {
    const filtered = filterFixturesByRound(
      filterFixturesToday(rows, todayOnly),
      selectedRound,
    );
    const query = searchQuery.trim();
    if (!query) return filtered;
    return filtered.filter((row) => fixtureMatchesSearch(row, query));
  }, [rows, todayOnly, selectedRound, searchQuery]);

  const panelSubtitle = todayOnly
    ? "Partidos de hoy · hora de Chile"
    : selectedRound
      ? `${roundOptions.find((round) => round.id_round === selectedRound)?.name_round ?? "Fase seleccionada"} · pronósticos agregados`
      : "Partidos con pronósticos agregados";

  return (
    <section className="light-surface-panel overflow-hidden rounded-xl border border-outline-variant/60 bg-white shadow-sm">
      <div className="border-b border-outline-variant/50 bg-surface-container-lowest p-4">
        <div className="flex flex-wrap items-center gap-3">
          <MaterialIcon name="bar_chart" className="text-2xl text-accent" />
          <div className="flex min-w-0 flex-1 flex-col justify-center gap-0">
            <h2 className="font-geist text-lg font-semibold text-on-surface">
              ¿Qué apostó la gente?
            </h2>
            <p className="font-geist text-sm text-on-surface-variant">{panelSubtitle}</p>
          </div>
        </div>

        <div className="mt-4 grid gap-3 sm:grid-cols-2 lg:grid-cols-[minmax(0,1fr)_auto_minmax(16rem,20rem)] lg:items-start">
          <FilterField label="Fase del torneo" className="min-w-0 w-full">
            <RoundFilterSelect
              rounds={roundOptions}
              value={selectedRound}
              onChange={setSelectedRound}
              id="estadisticas-round-filter"
            />
          </FilterField>

          <FilterField label="Filtrar" className="min-w-0 w-full lg:w-auto">
            <TodayMatchesToggle checked={todayOnly} onChange={setTodayOnly} />
          </FilterField>

          <FilterField
            label="Buscar"
            className="min-w-0 w-full sm:col-span-2 lg:col-span-1"
          >
            <PredictionsSearchBar
              value={searchQuery}
              onChange={setSearchQuery}
              resultCount={searchQuery.trim() ? visibleRows.length : undefined}
            />
          </FilterField>
        </div>
      </div>

      {visibleRows.length > 0 ? (
        <ul className="flex flex-col gap-stack-gap p-3 sm:p-4">
          {visibleRows.map((row) => {
            const result = resultsByMatch[row.id_match];
            const score = displayScoreFromResult(result);
            const goals = goalsByMatch[row.id_match] ?? [];

            return (
              <FixtureRowCard
                key={row.id_match}
                fixture={row}
                score={score}
                goals={goals.length > 0 ? goals : undefined}
                showPredictLink={false}
                showVenue
                layout="card"
                footer={<PredictionStatsFooter row={row} />}
              />
            );
          })}
        </ul>
      ) : (
        <p className="font-geist px-5 py-8 text-sm text-on-surface-variant">
          {searchQuery.trim()
            ? `Ningún partido coincide con "${searchQuery.trim()}".`
            : todayOnly
              ? "No hay partidos programados para hoy."
              : selectedRound
                ? "No hay partidos en esta fase."
                : "No hay partidos en rondas con pronósticos activos."}
        </p>
      )}
    </section>
  );
}

/** @deprecated Use MatchPredictionStatsList */
export const ClosedMatchPredictionStatsList = MatchPredictionStatsList;
