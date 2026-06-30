"use client";

import Link from "next/link";
import { useRouter, useSearchParams } from "next/navigation";
import { useCallback, useEffect, useMemo, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { MaterialIcon } from "@/components/material-icon";
import { FilterField } from "@/components/filter-field";
import { RoundFilterSelect } from "@/components/round-filter-select";
import { filterFixturesToday } from "@/lib/match-timezone";
import {
  type FixtureListFilters,
  parseFixtureFiltersFromSearchParams,
  replaceFilterUrl,
} from "@/lib/filter-url-params";
import { GroupPredictionsTable } from "@/components/predictions/group-predictions-table";
import { PredictionsSearchBar } from "@/components/predictions/predictions-search-bar";
import { ScoringRulesCard } from "@/components/predictions/scoring-rules-card";
import { SpecialBetsSection } from "@/components/predictions/special-bets-section";
import { TodayMatchesToggle } from "@/components/today-matches-toggle";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import type {
  FixtureRow,
  PlayerRow,
  PredictionRow,
  ScoringRuleRow,
  TeamRow,
  TournamentPredictionRow,
} from "@/lib/predictions-types";
import type { MatchResultDetail, SideBetOutcome } from "@/lib/prediction-scoring";
import {
  draftHasAnyValue,
  draftsAreEqual,
  ensureUserPool,
  filterFixturesByRound,
  filterSectionsBySearch,
  getMaxEnabledPredictionRound,
  groupFixturesByGame,
  groupFixturesBySection,
  isPredictionSectionDefaultOpen,
  isKnockoutFixture,
  isPredictionSaved,
  isTopScorerSaved,
  isWinnerSaved,
  uniqueRoundsFromFixtures,
  parseExtraTimeDraft,
  parseFirstGoalMinuteDraft,
  parseScoreDraft,
  parseTopScorerGoalsDraft,
  predictionDraftFromRow,
  topScorerDraftFromRow,
  topScorerDraftHasValue,
  topScorerDraftsAreEqual,
  winnerDraftFromRow,
  winnerDraftHasValue,
  winnerDraftsAreEqual,
  type PredictionDraft,
  type TopScorerDraft,
  type WinnerDraft,
} from "@/lib/predictions-utils";

type FixtureViewMode = "group" | "game";

const FILTER_DEFAULTS = { todayOnly: false };

function parseViewMode(vm: string | null): FixtureViewMode {
  return vm === "juego" ? "game" : "group";
}

type PredictionsClientProps = {
  fixtures: FixtureRow[];
  scoringRules: ScoringRuleRow[];
  predictionsByMatch: Record<number, PredictionRow>;
  resultsByMatch: Record<number, MatchResultDetail>;
  sideBetsByMatch: Record<number, SideBetOutcome>;
  players: PlayerRow[];
  teams: TeamRow[];
  tournamentPrediction: TournamentPredictionRow | null;
  tournamentBetOpen: boolean;
  poolId: number | null;
  isAuthenticated: boolean;
};

function buildInitialDrafts(
  fixtures: FixtureRow[],
  predictionsByMatch: Record<number, PredictionRow>,
): Record<number, PredictionDraft> {
  const drafts: Record<number, PredictionDraft> = {};

  for (const fixture of fixtures) {
    const draft = predictionDraftFromRow(
      predictionsByMatch[fixture.id_match],
    );
    if (!isKnockoutFixture(fixture)) {
      draft.extraTime = "";
    }
    drafts[fixture.id_match] = draft;
  }

  return drafts;
}

function buildSavedMatches(
  fixtures: FixtureRow[],
  predictionsByMatch: Record<number, PredictionRow>,
): Set<number> {
  const saved = new Set<number>();

  for (const fixture of fixtures) {
    if (isPredictionSaved(predictionsByMatch[fixture.id_match])) {
      saved.add(fixture.id_match);
    }
  }

  return saved;
}

export function PredictionsClient({
  fixtures,
  scoringRules,
  predictionsByMatch,
  resultsByMatch,
  sideBetsByMatch,
  players,
  teams,
  tournamentPrediction,
  tournamentBetOpen,
  poolId,
  isAuthenticated,
}: PredictionsClientProps) {
  const router = useRouter();
  const searchParams = useSearchParams();
  const initialFilters = useMemo(
    () =>
      parseFixtureFiltersFromSearchParams(
        {
          r: searchParams.get("r") ?? undefined,
          hoy: searchParams.get("hoy") ?? undefined,
          q: searchParams.get("q") ?? undefined,
        },
        FILTER_DEFAULTS,
      ),
    [searchParams],
  );
  const [todayOnly, setTodayOnly] = useState(initialFilters.todayOnly);
  const [viewMode, setViewMode] = useState<FixtureViewMode>(() =>
    parseViewMode(searchParams.get("vm")),
  );
  const [selectedRound, setSelectedRound] = useState<number | null>(
    initialFilters.selectedRound,
  );
  const roundOptions = useMemo(() => uniqueRoundsFromFixtures(fixtures), [fixtures]);
  const roundFilteredFixtures = useMemo(
    () => filterFixturesByRound(filterFixturesToday(fixtures, todayOnly), selectedRound),
    [fixtures, todayOnly, selectedRound],
  );
  const visibleFixtures = roundFilteredFixtures;
  const sections = useMemo(() => {
    if (viewMode === "game") {
      return groupFixturesByGame(visibleFixtures);
    }
    return groupFixturesBySection(visibleFixtures);
  }, [visibleFixtures, viewMode]);
  const maxEnabledRound = useMemo(
    () => getMaxEnabledPredictionRound(visibleFixtures),
    [visibleFixtures],
  );
  const [searchQuery, setSearchQuery] = useState(initialFilters.searchQuery);
  const filteredSections = useMemo(
    () => filterSectionsBySearch(sections, searchQuery),
    [sections, searchQuery],
  );
  const filteredMatchCount = useMemo(
    () => filteredSections.reduce((sum, s) => sum + s.fixtures.length, 0),
    [filteredSections],
  );

  const [drafts, setDrafts] = useState(() =>
    buildInitialDrafts(fixtures, predictionsByMatch),
  );
  const [baseline, setBaseline] = useState(() =>
    buildInitialDrafts(fixtures, predictionsByMatch),
  );
  const [winnerDraft, setWinnerDraft] = useState<WinnerDraft>(() =>
    winnerDraftFromRow(tournamentPrediction ?? undefined),
  );
  const [winnerBaseline, setWinnerBaseline] = useState<WinnerDraft>(() =>
    winnerDraftFromRow(tournamentPrediction ?? undefined),
  );
  const [topScorerDraft, setTopScorerDraft] = useState<TopScorerDraft>(() =>
    topScorerDraftFromRow(tournamentPrediction ?? undefined),
  );
  const [topScorerBaseline, setTopScorerBaseline] = useState<TopScorerDraft>(() =>
    topScorerDraftFromRow(tournamentPrediction ?? undefined),
  );
  const [savedMatches, setSavedMatches] = useState(() =>
    buildSavedMatches(fixtures, predictionsByMatch),
  );
  const [winnerSaved, setWinnerSaved] = useState(() =>
    isWinnerSaved(tournamentPrediction ?? undefined),
  );
  const [topScorerSaved, setTopScorerSaved] = useState(() =>
    isTopScorerSaved(tournamentPrediction ?? undefined),
  );

  const tournamentSnapshot = tournamentPrediction
    ? `${poolId}:${tournamentPrediction.winner_team_id}:${tournamentPrediction.top_scorer_player_id}:${tournamentPrediction.top_scorer_goals}`
    : `${poolId ?? "guest"}:empty`;

  useEffect(() => {
    const winner = winnerDraftFromRow(tournamentPrediction ?? undefined);
    const topScorer = topScorerDraftFromRow(tournamentPrediction ?? undefined);
    setWinnerDraft(winner);
    setWinnerBaseline(winner);
    setTopScorerDraft(topScorer);
    setTopScorerBaseline(topScorer);
    setWinnerSaved(isWinnerSaved(tournamentPrediction ?? undefined));
    setTopScorerSaved(isTopScorerSaved(tournamentPrediction ?? undefined));
  }, [tournamentSnapshot]);

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  const openFixtures = fixtures.filter((f) => f.predictions_open);
  const matchPendingCount = openFixtures.filter((fixture) => {
    const draft = drafts[fixture.id_match];
    const saved = baseline[fixture.id_match];
    if (!draft || !saved) return false;
    return !draftsAreEqual(draft, saved) && draftHasAnyValue(draft);
  }).length;

  const winnerPending =
    tournamentBetOpen &&
    winnerDraftHasValue(winnerDraft) &&
    !winnerDraftsAreEqual(winnerDraft, winnerBaseline);

  const topScorerPending =
    tournamentBetOpen &&
    topScorerDraftHasValue(topScorerDraft) &&
    !topScorerDraftsAreEqual(topScorerDraft, topScorerBaseline);

  const tournamentPending = winnerPending || topScorerPending;

  const pendingCount =
    matchPendingCount + (winnerPending ? 1 : 0) + (topScorerPending ? 1 : 0);

  const syncFiltersUrl = useCallback(
    (
      filters: FixtureListFilters,
      nextViewMode: FixtureViewMode = viewMode,
    ) => {
      router.replace(
        replaceFilterUrl("/apuestas", filters, FILTER_DEFAULTS, {
          vm: nextViewMode === "game" ? "juego" : undefined,
        }),
      );
    },
    [router, viewMode],
  );

  useEffect(() => {
    if (pendingCount === 0) return;

    function handleBeforeUnload(event: BeforeUnloadEvent) {
      event.preventDefault();
    }

    window.addEventListener("beforeunload", handleBeforeUnload);
    return () => window.removeEventListener("beforeunload", handleBeforeUnload);
  }, [pendingCount]);

  function handleViewModeChange(next: FixtureViewMode) {
    setViewMode(next);
    syncFiltersUrl(
      { selectedRound, todayOnly, searchQuery },
      next,
    );
  }

  function handleRoundChange(roundId: number | null) {
    setSelectedRound(roundId);
    syncFiltersUrl({
      selectedRound: roundId,
      todayOnly,
      searchQuery,
    });
  }

  function handleTodayOnlyChange(checked: boolean) {
    setTodayOnly(checked);
    syncFiltersUrl({
      selectedRound,
      todayOnly: checked,
      searchQuery,
    });
  }

  function handleSearchChange(query: string) {
    setSearchQuery(query);
    syncFiltersUrl({
      selectedRound,
      todayOnly,
      searchQuery: query,
    });
  }

  function handleDraftChange(
    idMatch: number,
    field: keyof PredictionDraft,
    value: string,
  ) {
    setDrafts((prev) => ({
      ...prev,
      [idMatch]: {
        goalsHome: prev[idMatch]?.goalsHome ?? "",
        goalsAway: prev[idMatch]?.goalsAway ?? "",
        extraTime: prev[idMatch]?.extraTime ?? "",
        firstGoalMinute: prev[idMatch]?.firstGoalMinute ?? "",
        [field]: value,
      },
    }));
    setSuccess(null);
  }

  function handleWinnerChange(field: keyof WinnerDraft, value: string) {
    setWinnerDraft((prev) => ({ ...prev, [field]: value }));
    setSuccess(null);
  }

  function handleTopScorerChange(field: keyof TopScorerDraft, value: string) {
    setTopScorerDraft((prev) => ({ ...prev, [field]: value }));
    setSuccess(null);
  }

  async function handleSaveAll() {
    if (!isAuthenticated) {
      router.push("/login");
      return;
    }

    setLoading(true);
    setError(null);
    setSuccess(null);

    const toSave: Array<{
      id_match: number;
      goals_home: number | null;
      goals_away: number | null;
      extra_time: boolean | null;
      first_goal_minute: string | null;
    }> = [];
    const invalidMatches: string[] = [];

    for (const fixture of openFixtures) {
      const draft = drafts[fixture.id_match];
      if (!draft || !draftHasAnyValue(draft)) continue;

      const saved = baseline[fixture.id_match];
      if (saved && draftsAreEqual(draft, saved)) continue;

      const hasPartialScore =
        (draft.goalsHome !== "" && draft.goalsAway === "") ||
        (draft.goalsHome === "" && draft.goalsAway !== "");

      if (hasPartialScore) {
        invalidMatches.push(
          `${fixture.home_country} vs ${fixture.away_country} (marcador incompleto)`,
        );
        continue;
      }

      let goalsHome: number | null = null;
      let goalsAway: number | null = null;

      if (draft.goalsHome !== "" || draft.goalsAway !== "") {
        const parsed = parseScoreDraft(draft);
        if (!parsed) {
          invalidMatches.push(
            `${fixture.home_country} vs ${fixture.away_country} (marcador inválido)`,
          );
          continue;
        }
        goalsHome = parsed.goalsHome;
        goalsAway = parsed.goalsAway;
      }

      const firstGoalMinute = parseFirstGoalMinuteDraft(draft);
      if (firstGoalMinute === "invalid") {
        invalidMatches.push(
          `${fixture.home_country} vs ${fixture.away_country} (intervalo inválido)`,
        );
        continue;
      }

      toSave.push({
        id_match: fixture.id_match,
        goals_home: goalsHome,
        goals_away: goalsAway,
        extra_time: parseExtraTimeDraft(draft, isKnockoutFixture(fixture)),
        first_goal_minute: firstGoalMinute,
      });
    }

    let tournamentToSave: {
      winner_team_id: number | null;
      top_scorer_player_id: number | null;
      top_scorer_goals: number | null;
    } | null = null;

    if (tournamentPending) {
      let winnerTeamId: number | null = winnerDraft.teamId
        ? Number(winnerDraft.teamId)
        : null;
      let topScorerPlayerId: number | null = topScorerDraft.playerId
        ? Number(topScorerDraft.playerId)
        : null;
      let topScorerGoals: number | null = null;

      if (winnerPending) {
        if (winnerDraft.teamId === "") {
          invalidMatches.push("Campeón del Mundial (indica un país)");
        }
      }

      if (topScorerPending) {
        if (topScorerDraft.playerId === "" || topScorerDraft.goals === "") {
          invalidMatches.push("Goleador del torneo (indica jugador y goles)");
        } else {
          const goals = parseTopScorerGoalsDraft(topScorerDraft);
          if (goals === "invalid") {
            invalidMatches.push("Goleador del torneo (goles inválidos, 1–20)");
          } else if (goals != null) {
            topScorerGoals = goals;
          }
        }
      } else if (isTopScorerSaved(tournamentPrediction ?? undefined)) {
        topScorerPlayerId = tournamentPrediction?.top_scorer_player_id ?? null;
        topScorerGoals = tournamentPrediction?.top_scorer_goals ?? null;
      }

      if (!winnerPending && isWinnerSaved(tournamentPrediction ?? undefined)) {
        winnerTeamId = tournamentPrediction?.winner_team_id ?? null;
      }

      if (invalidMatches.length === 0) {
        tournamentToSave = {
          winner_team_id: winnerTeamId,
          top_scorer_player_id: topScorerPlayerId,
          top_scorer_goals: topScorerGoals,
        };
      }
    }

    if (invalidMatches.length > 0) {
      setError(
        `Datos inválidos en: ${invalidMatches.slice(0, 3).join(", ")}${invalidMatches.length > 3 ? "…" : ""}.`,
      );
      setLoading(false);
      return;
    }

    if (toSave.length === 0 && !tournamentToSave) {
      setError("No hay pronósticos nuevos para guardar.");
      setLoading(false);
      return;
    }

    try {
      const supabase = createClient();
      const {
        data: { user },
      } = await supabase.auth.getUser();

      if (!user) {
        router.push("/login");
        return;
      }

      const resolvedPoolId = poolId ?? (await ensureUserPool(supabase, user.id));

      if (toSave.length > 0) {
        const rows = toSave.map((row) => ({
          id_pool: resolvedPoolId,
          id_match: row.id_match,
          goals_home: row.goals_home,
          goals_away: row.goals_away,
          extra_time: row.extra_time,
          first_goal_minute: row.first_goal_minute,
        }));

        const { error: upsertError } = await supabase
          .from("predictions")
          .upsert(rows, { onConflict: "id_pool,id_match" });

        if (upsertError) throw upsertError;

        setSavedMatches((prev) => {
          const next = new Set(prev);
          for (const row of toSave) {
            next.add(row.id_match);
          }
          return next;
        });

        setBaseline((prev) => {
          const next = { ...prev };
          for (const row of toSave) {
            next[row.id_match] = drafts[row.id_match];
          }
          return next;
        });
      }

      if (tournamentToSave) {
        const { error: tournamentError } = await supabase
          .from("tournament_predictions")
          .upsert(
            {
              id_pool: resolvedPoolId,
              ...tournamentToSave,
              updated_at: new Date().toISOString(),
            },
            { onConflict: "id_pool" },
          );

        if (tournamentError) throw tournamentError;

        if (winnerPending) {
          setWinnerBaseline(winnerDraft);
          setWinnerSaved(true);
        }
        if (topScorerPending) {
          setTopScorerBaseline(topScorerDraft);
          setTopScorerSaved(true);
        }
      }

      const savedParts: string[] = [];
      if (toSave.length > 0) {
        savedParts.push(
          `${toSave.length} partido${toSave.length === 1 ? "" : "s"}`,
        );
      }
      if (tournamentToSave) {
        const tournamentParts: string[] = [];
        if (winnerPending) tournamentParts.push("campeón del mundial");
        if (topScorerPending) tournamentParts.push("goleador del torneo");
        if (tournamentParts.length > 0) {
          savedParts.push(tournamentParts.join(" y "));
        }
      }

      setSuccess(`Guardado: ${savedParts.join(" y ")}.`);
      router.refresh();
    } catch (err) {
      setError(
        err instanceof Error ? err.message : "No se pudieron guardar los pronósticos.",
      );
    } finally {
      setLoading(false);
    }
  }

  if (fixtures.length === 0) {
    return (
      <p className="font-geist text-sm text-on-surface-variant">
        No hay partidos en el calendario del torneo.
      </p>
    );
  }

  return (
    <div className="light-surface-panel flex flex-col gap-stack-gap lg:flex-row lg:items-start">
      <div className="flex min-w-0 flex-1 flex-col gap-stack-gap">
        {!isAuthenticated && (
          <Alert className="border-primary/30 bg-primary/5 text-on-surface">
            <span className="flex flex-wrap items-center gap-2">
              <MaterialIcon name="login" className="text-base text-primary" />
              Inicia sesión para guardar tus pronósticos.
              <Link href="/login" className="font-medium text-primary hover:underline">
                Iniciar sesión
              </Link>
            </span>
          </Alert>
        )}

        <div className="lg:hidden">
          <ScoringRulesCard rules={scoringRules} collapsible />
        </div>

        {!searchQuery.trim() && (
          <SpecialBetsSection
            teams={teams}
            players={players}
            scoringRules={scoringRules}
            winnerDraft={winnerDraft}
            topScorerDraft={topScorerDraft}
            onWinnerChange={handleWinnerChange}
            onTopScorerChange={handleTopScorerChange}
            disabled={!isAuthenticated || !tournamentBetOpen}
            winnerSaved={winnerSaved}
            topScorerSaved={topScorerSaved}
          />
        )}

        <div className="flex flex-col gap-3 lg:flex-row lg:items-start lg:justify-between">
          <div className="flex flex-col gap-3 sm:flex-row sm:flex-wrap sm:items-start sm:gap-4">
            <FilterField label="Organizar" labelClassName="text-white">
              <div className="flex flex-col gap-1.5">
                <div
                  className="inline-flex h-11 w-fit items-center rounded-lg border border-border/60 bg-slate-50 p-1"
                  role="group"
                  aria-label="Organizar partidos"
                >
                  <Button
                    type="button"
                    size="sm"
                    variant={viewMode === "group" ? "default" : "ghost"}
                    className={viewMode === "group" ? "text-white" : "text-on-surface"}
                    aria-pressed={viewMode === "group"}
                    onClick={() => handleViewModeChange("group")}
                  >
                    Por grupo
                  </Button>
                  <Button
                    type="button"
                    size="sm"
                    variant={viewMode === "game" ? "default" : "ghost"}
                    className={viewMode === "game" ? "text-white" : "text-on-surface"}
                    aria-pressed={viewMode === "game"}
                    onClick={() => handleViewModeChange("game")}
                  >
                    Por partido
                  </Button>
                </div>
              </div>
            </FilterField>

            <FilterField label="Fase del torneo" htmlFor="apuestas-round-filter" labelClassName="text-white">
              <div className="flex flex-col gap-1.5">
                <RoundFilterSelect
                  id="apuestas-round-filter"
                  rounds={roundOptions}
                  value={selectedRound}
                  onChange={handleRoundChange}
                />
              </div>
            </FilterField>

            <FilterField label="Filtrar" htmlFor="apuestas-today-matches-toggle" labelClassName="text-white">
              <div className="flex flex-col gap-1.5">
                <TodayMatchesToggle
                  id="apuestas-today-matches-toggle"
                  checked={todayOnly}
                  onChange={handleTodayOnlyChange}
                />
              </div>
            </FilterField>
          </div>

          <FilterField label="Buscar" className="min-w-0 w-full lg:max-w-md" labelClassName="text-white">
            <PredictionsSearchBar
              value={searchQuery}
              onChange={handleSearchChange}
              resultCount={searchQuery.trim() ? filteredMatchCount : undefined}
            />
          </FilterField>
        </div>

        {todayOnly && !searchQuery.trim() && !selectedRound && filteredSections.length === 0 ? (
          <p className="font-geist text-sm text-on-surface-variant">
            No hay partidos programados para hoy.
          </p>
        ) : searchQuery.trim() && filteredSections.length === 0 ? (
          <p className="font-geist text-sm text-on-surface-variant">
            Ningún partido coincide con &quot;{searchQuery.trim()}&quot;. Prueba con el
            nombre del equipo, código (ARG), grupo (Grupo A) o fase eliminatoria.
          </p>
        ) : !searchQuery.trim() && selectedRound && filteredSections.length === 0 ? (
          <p className="font-geist text-sm text-on-surface-variant">
            No hay partidos en esta fase con los filtros actuales.
          </p>
        ) : (
          filteredSections.map((section) => (
            <GroupPredictionsTable
              key={section.key}
              title={section.title}
              fixtures={section.fixtures}
              defaultOpen={isPredictionSectionDefaultOpen(
                section.fixtures,
                maxEnabledRound,
              )}
              drafts={drafts}
              savedMatches={savedMatches}
              resultsByMatch={resultsByMatch}
              sideBetsByMatch={sideBetsByMatch}
              scoringRules={scoringRules}
              onDraftChange={handleDraftChange}
              isAuthenticated={isAuthenticated}
            />
          ))
        )}

        {error && (
          <Alert variant="destructive">{error}</Alert>
        )}

        {success && (
          <Alert live="polite" className="border-primary/30 bg-primary/5 text-on-surface">
            {success}
          </Alert>
        )}

        {isAuthenticated && (
          <div className="mx-2 sticky bottom-20 z-10 rounded-lg border border-outline-variant/60 bg-surface-container-lowest p-4 shadow-md md:bottom-4 md:bg-card/95 md:backdrop-blur-sm">
            <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
              <p className="font-geist text-sm text-on-surface-variant">
                {pendingCount > 0
                  ? `${pendingCount} cambio${pendingCount === 1 ? "" : "s"} pendiente${pendingCount === 1 ? "" : "s"}`
                  : "Sin cambios pendientes"}
              </p>
              <Button
                type="button"
                onClick={handleSaveAll}
                disabled={loading || pendingCount === 0}
                className="w-full sm:w-auto text-white"
              >
                <MaterialIcon name="save" className="text-[16px]" />
                {loading ? "Guardando…" : "Guardar todo"}
              </Button>
            </div>
          </div>
        )}
      </div>

      <aside className="hidden w-full shrink-0 lg:block lg:w-72 xl:w-80">
        <div className="sticky top-24">
          <ScoringRulesCard rules={scoringRules} compact />
        </div>
      </aside>
    </div>
  );
}
