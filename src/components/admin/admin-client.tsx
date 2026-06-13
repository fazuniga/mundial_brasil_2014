"use client";

import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { PredictionsSearchBar } from "@/components/predictions/predictions-search-bar";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { AdminMatchSection } from "@/components/admin/admin-match-section";
import { AdminSpecialBetsToggle } from "@/components/admin/admin-special-bets-toggle";
import { AdminTournamentFinals } from "@/components/admin/admin-tournament-finals";
import type {
  AdminClientProps,
  AdminFixtureRow,
  MatchGoalRow,
  MatchResultDraft,
  MatchResultRow,
} from "@/lib/admin-types";
import {
  deriveFirstGoalFromGoals,
  deriveScoreFromGoals,
  groupAdminFixturesByGame,
  groupFixturesBySection,
  canSaveAdminMatch,
  isMatchResultSaved,
  matchResultDraftFromRow,
  parseMatchResultPayload,
  regulationScoreToDraft,
} from "@/lib/admin-utils";
import { filterSectionsBySearch } from "@/lib/predictions-utils";

type AdminFixtureViewMode = "group" | "game";

function buildInitialDrafts(
  resultsByMatch: Record<number, MatchResultRow>,
  matchIds: number[],
): Record<number, MatchResultDraft> {
  const drafts: Record<number, MatchResultDraft> = {};
  for (const idMatch of matchIds) {
    drafts[idMatch] = matchResultDraftFromRow(resultsByMatch[idMatch]);
  }
  return drafts;
}

function buildSavedMatches(
  resultsByMatch: Record<number, MatchResultRow>,
  matchIds: number[],
): Set<number> {
  const saved = new Set<number>();
  for (const idMatch of matchIds) {
    if (isMatchResultSaved(resultsByMatch[idMatch])) {
      saved.add(idMatch);
    }
  }
  return saved;
}

export function AdminClient({
  fixtures,
  resultsByMatch,
  goalsByMatch: initialGoalsByMatch,
  players,
  topScorerSummary,
  winnerSummary,
  specialBetsSettings,
}: AdminClientProps) {
  const router = useRouter();
  const matchIds = useMemo(() => fixtures.map((f) => f.id_match), [fixtures]);
  const [viewMode, setViewMode] = useState<AdminFixtureViewMode>("group");
  const sections = useMemo(() => {
    if (viewMode === "game") {
      return groupAdminFixturesByGame(fixtures);
    }
    return groupFixturesBySection(fixtures);
  }, [fixtures, viewMode]);
  const [searchQuery, setSearchQuery] = useState("");
  const filteredSections = useMemo(
    () => filterSectionsBySearch(sections, searchQuery),
    [sections, searchQuery],
  );
  const filteredMatchCount = useMemo(
    () => filteredSections.reduce((sum, section) => sum + section.fixtures.length, 0),
    [filteredSections],
  );

  const [drafts, setDrafts] = useState(() =>
    buildInitialDrafts(resultsByMatch, matchIds),
  );
  const [baselines, setBaselines] = useState(() =>
    buildInitialDrafts(resultsByMatch, matchIds),
  );
  const [savedMatches, setSavedMatches] = useState(() =>
    buildSavedMatches(resultsByMatch, matchIds),
  );
  const [goalsByMatch, setGoalsByMatch] = useState(initialGoalsByMatch);
  const [baselineGoalsByMatch, setBaselineGoalsByMatch] = useState(initialGoalsByMatch);

  const [savingMatchId, setSavingMatchId] = useState<number | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  const savedCount = savedMatches.size;
  const totalCount = fixtures.length;

  function handleDraftChange(
    idMatch: number,
    field: keyof MatchResultDraft,
    value: string,
  ) {
    setDrafts((prev) => ({
      ...prev,
      [idMatch]: { ...prev[idMatch], [field]: value },
    }));
    setSuccess(null);
    setError(null);
  }

  function syncRegulationDraft(idMatch: number, goals: MatchGoalRow[]) {
    const fixture = fixtures.find((row) => row.id_match === idMatch);
    if (!fixture) return;

    const regulation = deriveScoreFromGoals(
      goals,
      fixture.home_team_id,
      fixture.away_team_id,
      players,
    );

    setDrafts((prev) => ({
      ...prev,
      [idMatch]: {
        ...prev[idMatch],
        ...regulationScoreToDraft(regulation),
      },
    }));
  }

  async function handleSaveMatch(idMatch: number) {
    const draft = drafts[idMatch];
    const baseline = baselines[idMatch];
    if (!draft || !baseline) return;

    const matchGoals = goalsByMatch[idMatch] ?? [];
    const baselineGoals = baselineGoalsByMatch[idMatch] ?? [];
    const fixture = fixtures.find((row) => row.id_match === idMatch);
    if (!fixture) return;

    const regulation = deriveScoreFromGoals(
      matchGoals,
      fixture.home_team_id,
      fixture.away_team_id,
      players,
    );
    const isSaved = savedMatches.has(idMatch);
    if (
      !canSaveAdminMatch(
        draft,
        baseline,
        matchGoals,
        baselineGoals,
        isSaved,
        regulation,
      )
    ) {
      return;
    }
    const firstGoal = deriveFirstGoalFromGoals(matchGoals, players);
    const syncedDraft = {
      ...draft,
      ...regulationScoreToDraft(regulation),
    };

    const { payload, error: parseError } = parseMatchResultPayload(
      idMatch,
      syncedDraft,
      regulation,
      firstGoal
        ? { minute: firstGoal.minute, playerId: firstGoal.playerId }
        : null,
    );
    if (parseError) {
      setError(parseError);
      return;
    }

    setSavingMatchId(idMatch);
    setError(null);
    setSuccess(null);

    const supabase = createClient();
    const { error: saveError } = await supabase
      .from("match_results")
      .upsert(payload, { onConflict: "id_match" });

    setSavingMatchId(null);

    if (saveError) {
      setError(saveError.message);
      return;
    }

    setDrafts((prev) => ({ ...prev, [idMatch]: syncedDraft }));
    setBaselines((prev) => ({ ...prev, [idMatch]: syncedDraft }));
    setBaselineGoalsByMatch((prev) => ({ ...prev, [idMatch]: matchGoals }));
    setSavedMatches((prev) => new Set(prev).add(idMatch));
    setSuccess(`Resultado guardado (partido ${idMatch}).`);
    router.refresh();
  }

  async function handleAddGoal(
    idMatch: number,
    payload: { id_player: number; minute: number; is_own_goal: boolean },
  ): Promise<string | null> {
    const supabase = createClient();
    const { data, error: insertError } = await supabase
      .from("match_goals")
      .insert({
        id_match: idMatch,
        id_player: payload.id_player,
        minute: payload.minute,
        is_own_goal: payload.is_own_goal,
      })
      .select("id_goal, id_match, id_player, minute, is_own_goal")
      .single();

    if (insertError) return insertError.message;

    const playerName =
      players.find((p) => p.id_player === payload.id_player)?.name ?? null;
    const row: MatchGoalRow = {
      ...data,
      player_name: playerName,
    };

    const nextGoals = [...(goalsByMatch[idMatch] ?? []), row];
    setGoalsByMatch((prev) => ({
      ...prev,
      [idMatch]: nextGoals,
    }));
    syncRegulationDraft(idMatch, nextGoals);
    setSuccess(`Gol agregado (partido ${idMatch}).`);
    router.refresh();
    return null;
  }

  async function handleDeleteGoal(idMatch: number, idGoal: number): Promise<string | null> {
    const supabase = createClient();
    const { error: deleteError } = await supabase
      .from("match_goals")
      .delete()
      .eq("id_goal", idGoal);

    if (deleteError) return deleteError.message;

    const nextGoals = (goalsByMatch[idMatch] ?? []).filter((g) => g.id_goal !== idGoal);
    setGoalsByMatch((prev) => ({
      ...prev,
      [idMatch]: nextGoals,
    }));
    syncRegulationDraft(idMatch, nextGoals);
    setSuccess(`Gol eliminado (partido ${idMatch}).`);
    router.refresh();
    return null;
  }

  return (
    <div className="light-surface-panel flex flex-col gap-4">
      <div className="rounded-xl border border-border/50 bg-white px-5 py-4 shadow-sm">
        <p className="font-geist text-base text-on-surface">
          <span className="font-semibold tabular-nums text-primary">{savedCount}</span>
          {" "}
          de {totalCount} partidos con resultado cargado
        </p>
      </div>

      {error ? (
        <Alert variant="destructive">
          <p className="font-geist text-base">{error}</p>
        </Alert>
      ) : null}
      {success ? (
        <Alert>
          <p className="font-geist text-base">{success}</p>
        </Alert>
      ) : null}

      <AdminSpecialBetsToggle settings={specialBetsSettings} />

      <AdminTournamentFinals
        winnerSummary={winnerSummary}
        topScorerSummary={topScorerSummary}
      />

      <div className="flex flex-col gap-3 sm:flex-row sm:items-end sm:justify-between">
        <div className="flex flex-col gap-1.5">
          <p className="font-geist text-sm font-medium text-on-surface">Organizar</p>
          <div
            className="inline-flex w-fit rounded-lg border border-border/60 bg-slate-50 p-1"
            role="group"
            aria-label="Organizar partidos"
          >
            <Button
              type="button"
              size="sm"
              variant={viewMode === "group" ? "default" : "ghost"}
              className={viewMode === "group" ? "text-white" : "text-on-surface"}
              aria-pressed={viewMode === "group"}
              onClick={() => setViewMode("group")}
            >
              Por grupo
            </Button>
            <Button
              type="button"
              size="sm"
              variant={viewMode === "game" ? "default" : "ghost"}
              className={viewMode === "game" ? "text-white" : "text-on-surface"}
              aria-pressed={viewMode === "game"}
              onClick={() => setViewMode("game")}
            >
              Por partido
            </Button>
          </div>
        </div>

        <PredictionsSearchBar
          value={searchQuery}
          onChange={setSearchQuery}
          resultCount={searchQuery.trim() ? filteredMatchCount : undefined}
          className="min-w-0 flex-1 sm:max-w-md"
        />
      </div>

      {searchQuery.trim() && filteredSections.length === 0 ? (
        <p className="font-geist text-base text-on-surface-variant">
          Ningún partido coincide con &quot;{searchQuery.trim()}&quot;. Prueba con el
          nombre del equipo, grupo o fase.
        </p>
      ) : null}

      {filteredSections.map((section) => (
        <AdminMatchSection
          key={section.key}
          title={section.title}
          fixtures={section.fixtures as AdminFixtureRow[]}
          drafts={drafts}
          baselines={baselines}
          savedMatches={savedMatches}
          goalsByMatch={goalsByMatch}
          baselineGoalsByMatch={baselineGoalsByMatch}
          players={players}
          savingMatchId={savingMatchId}
          onDraftChange={handleDraftChange}
          onSaveMatch={handleSaveMatch}
          onAddGoal={handleAddGoal}
          onDeleteGoal={handleDeleteGoal}
        />
      ))}
    </div>
  );
}
