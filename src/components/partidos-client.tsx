"use client";

import { useEffect, useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import { MaterialIcon } from "@/components/material-icon";
import { FilterField } from "@/components/filter-field";
import { GroupStandingsSections } from "@/components/group-standings-sections";
import { MatchResultsFeed } from "@/components/match-results-feed";
import {
  PartidosViewSelect,
  type PartidosView,
} from "@/components/partidos-view-select";
import { PredictionsSearchBar } from "@/components/predictions/predictions-search-bar";
import { RoundFilterSelect } from "@/components/round-filter-select";
import { TodayMatchesToggle } from "@/components/today-matches-toggle";
import type { GroupStandingRow } from "@/lib/group-standings";
import type { MatchResultScore } from "@/lib/home-fixtures";
import { filterFixturesToday } from "@/lib/match-timezone";
import type { MatchGoalPublicRow } from "@/lib/match-goals-display";
import type { FixtureRow, PredictionRow } from "@/lib/predictions-types";
import {
  GROUP_STAGE_ROUND_ID,
  filterFixturesByRound,
  fixtureMatchesSearch,
  uniqueRoundsFromFixtures,
} from "@/lib/predictions-utils";
import { cn } from "@/lib/utils";

type PartidosClientProps = {
  grouped: Record<string, GroupStandingRow[]>;
  fixtures: FixtureRow[];
  resultsByMatch: Record<number, MatchResultScore>;
  goalsByMatch: Record<number, MatchGoalPublicRow[]>;
  predictionsByMatch?: Record<number, PredictionRow>;
  initialView: PartidosView;
};

export function PartidosClient({
  grouped,
  fixtures,
  resultsByMatch,
  goalsByMatch,
  predictionsByMatch,
  initialView,
}: PartidosClientProps) {
  const router = useRouter();
  const [view, setView] = useState<PartidosView>(initialView);
  const [selectedRound, setSelectedRound] = useState<number | null>(null);
  const [todayOnly, setTodayOnly] = useState(true);
  const [searchQuery, setSearchQuery] = useState("");

  const roundOptions = useMemo(() => uniqueRoundsFromFixtures(fixtures), [fixtures]);
  const groupRoundName =
    roundOptions.find((round) => round.id_round === GROUP_STAGE_ROUND_ID)?.name_round ??
    "Fase de Grupos";
  const standingsAvailable =
    selectedRound === null || selectedRound === GROUP_STAGE_ROUND_ID;

  useEffect(() => {
    if (!standingsAvailable && view === "posiciones") {
      setView("partidos");
    }
  }, [standingsAvailable, view]);

  function syncViewUrl(next: PartidosView) {
    if (next === "posiciones") {
      router.replace("/partidos?v=grupo");
      return;
    }
    router.replace("/partidos");
  }

  function handleViewChange(next: PartidosView) {
    if (next === "posiciones" && !standingsAvailable) return;
    setView(next);
    if (next === "posiciones") {
      setSelectedRound(GROUP_STAGE_ROUND_ID);
      setSearchQuery("");
      setTodayOnly(false);
    }
    syncViewUrl(next);
  }

  function handleRoundChange(roundId: number | null) {
    setSelectedRound(roundId);
    if (roundId !== null && roundId > GROUP_STAGE_ROUND_ID && view === "posiciones") {
      setView("partidos");
      syncViewUrl("partidos");
    }
  }

  const visibleFixtures = useMemo(() => {
    const filtered = filterFixturesByRound(
      filterFixturesToday(fixtures, todayOnly),
      selectedRound,
    );
    const query = searchQuery.trim();
    if (!query) return filtered;
    return filtered.filter((fixture) => fixtureMatchesSearch(fixture, query));
  }, [fixtures, todayOnly, selectedRound, searchQuery]);

  const panelTitle =
    view === "posiciones"
      ? "Posiciones de la Fase de Grupos"
      : "Partidos del torneo";

  const panelSubtitle =
    view === "posiciones"
      ? "Clasificación por grupo según resultados oficiales"
      : todayOnly
        ? "Partidos de hoy · hora de Chile"
        : selectedRound
          ? `${roundOptions.find((round) => round.id_round === selectedRound)?.name_round ?? "Fase seleccionada"} · ordenados por fecha`
          : "Todos los partidos · ordenados por fecha";

  return (
    <div className="light-surface-panel flex flex-col gap-4">
      <section className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
        <div className="border-b border-outline-variant/50 bg-surface-container-lowest p-4">
          <div className="flex flex-wrap items-center gap-3">
            <MaterialIcon name="sports_soccer" className="text-2xl text-accent" />
            <div className="flex min-w-0 flex-1 flex-col justify-center gap-0">
              <h2 className="font-geist text-lg font-semibold text-on-surface">
                {panelTitle}
              </h2>
              <p className="font-geist text-sm text-on-surface-variant">{panelSubtitle}</p>
            </div>
          </div>

          <div
            className={cn(
              "mt-4 grid gap-3",
              view === "partidos" &&
                "sm:grid-cols-2 lg:grid-cols-[minmax(0,1fr)_minmax(0,1fr)_auto_minmax(16rem,20rem)] lg:items-start",
              view === "posiciones" && "sm:grid-cols-2",
            )}
          >
            <FilterField label="Vista" className="min-w-0 w-full">
              <PartidosViewSelect
                value={view}
                onChange={handleViewChange}
                standingsAvailable={standingsAvailable}
              />
            </FilterField>

            {view === "partidos" ? (
              <FilterField label="Fase del torneo" className="min-w-0 w-full">
                <RoundFilterSelect
                  rounds={roundOptions}
                  value={selectedRound}
                  onChange={handleRoundChange}
                  id="partidos-round-filter"
                />
              </FilterField>
            ) : (
              <FilterField label="Fase del torneo" className="min-w-0 w-full">
                <p className="flex h-11 w-full items-center rounded-lg border border-outline-variant/60 bg-surface-container-high/40 px-3 font-geist text-sm text-on-surface-variant">
                  {groupRoundName}
                </p>
              </FilterField>
            )}

            {view === "partidos" ? (
              <>
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
                    resultCount={searchQuery.trim() ? visibleFixtures.length : undefined}
                  />
                </FilterField>
              </>
            ) : null}
          </div>
        </div>

        {view === "posiciones" ? (
          <div className="p-4">
            <GroupStandingsSections grouped={grouped} />
          </div>
        ) : (
          <MatchResultsFeed
            fixtures={visibleFixtures}
            resultsByMatch={resultsByMatch}
            goalsByMatch={goalsByMatch}
            predictionsByMatch={predictionsByMatch}
            todayOnly={todayOnly}
            selectedRound={selectedRound}
            searchQuery={searchQuery}
          />
        )}
      </section>
    </div>
  );
}
