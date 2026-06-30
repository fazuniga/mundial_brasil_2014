"use client";

import { usePathname, useRouter } from "next/navigation";
import { useEffect, useMemo, useState } from "react";
import { MaterialIcon } from "@/components/material-icon";
import { FilterField } from "@/components/filter-field";
import { MatchResultsFeed } from "@/components/match-results-feed";
import { PredictionsSearchBar } from "@/components/predictions/predictions-search-bar";
import { RoundFilterSelect } from "@/components/round-filter-select";
import { TodayMatchesToggle } from "@/components/today-matches-toggle";
import type { MatchResultScore } from "@/lib/home-fixtures";
import { filterFixturesToday } from "@/lib/match-timezone";
import type { MatchGoalPublicRow } from "@/lib/match-goals-display";
import {
  filterFixturesByRound,
  fixtureMatchesSearch,
} from "@/lib/predictions-utils";
import type { FixtureRow, PredictionRow, RoundPhaseRow } from "@/lib/predictions-types";

type ResultadosClientProps = {
  fixtures: FixtureRow[];
  resultsByMatch: Record<number, MatchResultScore>;
  goalsByMatch: Record<number, MatchGoalPublicRow[]>;
  predictionsByMatch?: Record<number, PredictionRow>;
  rounds: Pick<RoundPhaseRow, "id_round" | "name_round">[];
  initialRoundId?: number | null;
  syncRoundToUrl?: boolean;
};

function buildResultsUrl(path: string, roundId: number | null): string {
  if (roundId == null) return path;
  return `${path}?ronda=${roundId}`;
}

export function ResultadosClient({
  fixtures,
  resultsByMatch,
  goalsByMatch,
  predictionsByMatch,
  rounds,
  initialRoundId = null,
  syncRoundToUrl = false,
}: ResultadosClientProps) {
  const router = useRouter();
  const pathname = usePathname();
  const [todayOnly, setTodayOnly] = useState(true);
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedRound, setSelectedRound] = useState<number | null>(initialRoundId);

  useEffect(() => {
    setSelectedRound(initialRoundId);
  }, [initialRoundId]);

  const roundName = useMemo(
    () => rounds.find((round) => round.id_round === selectedRound)?.name_round ?? null,
    [rounds, selectedRound],
  );

  const visibleFixtures = useMemo(() => {
    const filtered = filterFixturesByRound(
      filterFixturesToday(fixtures, todayOnly),
      selectedRound,
    );
    const query = searchQuery.trim();
    if (!query) return filtered;
    return filtered.filter((fixture) => fixtureMatchesSearch(fixture, query));
  }, [fixtures, todayOnly, selectedRound, searchQuery]);

  function handleRoundChange(roundId: number | null) {
    setSelectedRound(roundId);
    if (syncRoundToUrl && pathname) {
      router.replace(buildResultsUrl(pathname, roundId));
    }
  }

  const panelSubtitle = roundName
    ? `${roundName}${todayOnly ? " · partidos de hoy" : ""}`
    : todayOnly
      ? "Partidos de hoy · hora de Chile"
      : "Resultados oficiales cargados · Ordenados por fecha";

  return (
    <section className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
      <div className="border-b border-outline-variant/50 bg-surface-container-lowest p-4">
        <div className="flex flex-wrap items-center gap-3">
          <MaterialIcon name="sports_soccer" className="text-2xl text-accent" />
          <div className="flex min-w-0 flex-1 flex-col justify-center gap-0">
            <h2 className="font-geist text-lg font-semibold text-on-surface">
              Partidos del torneo
            </h2>
            <p className="font-geist text-sm text-on-surface-variant">{panelSubtitle}</p>
          </div>
        </div>

        <div className="mt-4 grid gap-3 sm:grid-cols-2 lg:grid-cols-[minmax(0,1fr)_auto_minmax(16rem,20rem)] lg:items-start">
          {rounds.length > 0 ? (
            <FilterField label="Fase del torneo" className="min-w-0 w-full">
              <RoundFilterSelect
                rounds={rounds}
                value={selectedRound}
                onChange={handleRoundChange}
                id="resultados-round-filter"
              />
            </FilterField>
          ) : null}

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
              resultCount={
                searchQuery.trim() || selectedRound != null
                  ? visibleFixtures.length
                  : undefined
              }
            />
          </FilterField>
        </div>
      </div>

      <MatchResultsFeed
        fixtures={visibleFixtures}
        resultsByMatch={resultsByMatch}
        goalsByMatch={goalsByMatch}
        predictionsByMatch={predictionsByMatch}
        todayOnly={todayOnly}
        selectedRound={selectedRound}
        searchQuery={searchQuery}
      />
    </section>
  );
}
