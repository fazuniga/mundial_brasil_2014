"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { useMemo, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { MaterialIcon } from "@/components/material-icon";
import { GroupPredictionsTable } from "@/components/predictions/group-predictions-table";
import { PredictionsSearchBar } from "@/components/predictions/predictions-search-bar";
import { ScoringRulesCard } from "@/components/predictions/scoring-rules-card";
import { TopScorerBet } from "@/components/predictions/top-scorer-bet";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import type {
  FixtureRow,
  PlayerRow,
  PredictionRow,
  ScoringRuleRow,
  TournamentPredictionRow,
} from "@/lib/predictions-types";
import type { MatchResultDetail, SideBetOutcome } from "@/lib/prediction-scoring";
import {
  draftHasAnyValue,
  draftsAreEqual,
  ensureUserPool,
  filterSectionsBySearch,
  groupFixturesBySection,
  isKnockoutFixture,
  isPredictionSaved,
  isTopScorerSaved,
  parseExtraTimeDraft,
  parseFirstGoalMinuteDraft,
  parseScoreDraft,
  parseTopScorerGoalsDraft,
  predictionDraftFromRow,
  topScorerDraftFromRow,
  topScorerDraftHasValue,
  topScorerDraftsAreEqual,
  type PredictionDraft,
  type TopScorerDraft,
} from "@/lib/predictions-utils";

type PredictionsClientProps = {
  fixtures: FixtureRow[];
  scoringRules: ScoringRuleRow[];
  predictionsByMatch: Record<number, PredictionRow>;
  resultsByMatch: Record<number, MatchResultDetail>;
  sideBetsByMatch: Record<number, SideBetOutcome>;
  players: PlayerRow[];
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
  tournamentPrediction,
  tournamentBetOpen,
  poolId,
  isAuthenticated,
}: PredictionsClientProps) {
  const router = useRouter();
  const sections = useMemo(() => groupFixturesBySection(fixtures), [fixtures]);
  const [searchQuery, setSearchQuery] = useState("");
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
  const [topScorerDraft, setTopScorerDraft] = useState<TopScorerDraft>(() =>
    topScorerDraftFromRow(tournamentPrediction ?? undefined),
  );
  const [topScorerBaseline, setTopScorerBaseline] = useState<TopScorerDraft>(() =>
    topScorerDraftFromRow(tournamentPrediction ?? undefined),
  );
  const [savedMatches, setSavedMatches] = useState(() =>
    buildSavedMatches(fixtures, predictionsByMatch),
  );
  const [topScorerSaved, setTopScorerSaved] = useState(() =>
    isTopScorerSaved(tournamentPrediction ?? undefined),
  );
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

  const topScorerPending =
    tournamentBetOpen &&
    topScorerDraftHasValue(topScorerDraft) &&
    !topScorerDraftsAreEqual(topScorerDraft, topScorerBaseline);

  const pendingCount = matchPendingCount + (topScorerPending ? 1 : 0);

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

    let topScorerToSave: {
      top_scorer_player_id: number;
      top_scorer_goals: number;
    } | null = null;

    if (topScorerPending) {
      if (topScorerDraft.playerId === "" || topScorerDraft.goals === "") {
        invalidMatches.push("Goleador del torneo (indica jugador y goles)");
      } else {
        const goals = parseTopScorerGoalsDraft(topScorerDraft);
        if (goals === "invalid") {
          invalidMatches.push("Goleador del torneo (goles inválidos, 1–20)");
        } else if (goals != null) {
          topScorerToSave = {
            top_scorer_player_id: Number(topScorerDraft.playerId),
            top_scorer_goals: goals,
          };
        }
      }
    }

    if (invalidMatches.length > 0) {
      setError(
        `Datos inválidos en: ${invalidMatches.slice(0, 3).join(", ")}${invalidMatches.length > 3 ? "…" : ""}.`,
      );
      setLoading(false);
      return;
    }

    if (toSave.length === 0 && !topScorerToSave) {
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

      const resolvedPoolId = poolId ?? (await ensureUserPool(user.id));

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

      if (topScorerToSave) {
        const { error: topScorerError } = await supabase
          .from("tournament_predictions")
          .upsert(
            {
              id_pool: resolvedPoolId,
              ...topScorerToSave,
              updated_at: new Date().toISOString(),
            },
            { onConflict: "id_pool" },
          );

        if (topScorerError) throw topScorerError;

        setTopScorerBaseline(topScorerDraft);
        setTopScorerSaved(true);
      }

      const savedParts: string[] = [];
      if (toSave.length > 0) {
        savedParts.push(
          `${toSave.length} partido${toSave.length === 1 ? "" : "s"}`,
        );
      }
      if (topScorerToSave) {
        savedParts.push("goleador del torneo");
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

        <PredictionsSearchBar
          value={searchQuery}
          onChange={setSearchQuery}
          resultCount={searchQuery.trim() ? filteredMatchCount : undefined}
        />

        {!searchQuery.trim() && (
          <TopScorerBet
            players={players}
            draft={topScorerDraft}
            onDraftChange={handleTopScorerChange}
            disabled={!isAuthenticated || !tournamentBetOpen}
            isSaved={topScorerSaved}
          />
        )}

        {searchQuery.trim() && filteredSections.length === 0 ? (
          <p className="font-geist text-sm text-on-surface-variant">
            Ningún partido coincide con &quot;{searchQuery.trim()}&quot;. Prueba con el
            nombre del equipo, código (ARG), grupo (Grupo A) o fase eliminatoria.
          </p>
        ) : (
          filteredSections.map((section) => (
            <GroupPredictionsTable
              key={section.key}
              title={section.title}
              fixtures={section.fixtures}
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
          <Alert className="border-primary/30 bg-primary/5 text-on-surface">
            {success}
          </Alert>
        )}

        {isAuthenticated && (
          <div className="sticky bottom-20 z-10 rounded-xl border border-outline-variant/60 bg-surface-container-lowest p-4 shadow-md md:bottom-4 md:bg-card/95 md:backdrop-blur-sm">
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

        <div className="lg:hidden">
          <ScoringRulesCard rules={scoringRules} collapsible />
        </div>
      </div>

      <aside className="hidden w-full shrink-0 lg:block lg:w-72 xl:w-80">
        <div className="sticky top-24">
          <ScoringRulesCard rules={scoringRules} compact />
        </div>
      </aside>
    </div>
  );
}
