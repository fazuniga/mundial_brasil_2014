"use client";

import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { Alert } from "@/components/ui/alert";
import { AdminMatchSection } from "@/components/admin/admin-match-section";
import { AdminTournamentScorer } from "@/components/admin/admin-tournament-scorer";
import type {
  AdminClientProps,
  AdminFixtureRow,
  MatchGoalRow,
  MatchResultDraft,
  MatchResultRow,
} from "@/lib/admin-types";
import {
  groupFixturesBySection,
  isMatchResultSaved,
  matchDraftsAreEqual,
  matchResultDraftFromRow,
  parseMatchResultPayload,
} from "@/lib/admin-utils";

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
}: AdminClientProps) {
  const router = useRouter();
  const matchIds = useMemo(() => fixtures.map((f) => f.id_match), [fixtures]);
  const sections = useMemo(() => groupFixturesBySection(fixtures), [fixtures]);

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

  async function handleSaveMatch(idMatch: number) {
    const draft = drafts[idMatch];
    const baseline = baselines[idMatch];
    if (!draft || matchDraftsAreEqual(draft, baseline)) return;

    const { payload, error: parseError } = parseMatchResultPayload(idMatch, draft);
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

    setBaselines((prev) => ({ ...prev, [idMatch]: { ...draft } }));
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

    setGoalsByMatch((prev) => ({
      ...prev,
      [idMatch]: [...(prev[idMatch] ?? []), row],
    }));
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

    setGoalsByMatch((prev) => ({
      ...prev,
      [idMatch]: (prev[idMatch] ?? []).filter((g) => g.id_goal !== idGoal),
    }));
    setSuccess(`Gol eliminado (partido ${idMatch}).`);
    router.refresh();
    return null;
  }

  return (
    <div className="light-surface-panel flex flex-col gap-section-gap">
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

      <AdminTournamentScorer summary={topScorerSummary} />

      {sections.map((section) => (
        <AdminMatchSection
          key={section.key}
          title={section.title}
          fixtures={section.fixtures as AdminFixtureRow[]}
          drafts={drafts}
          baselines={baselines}
          savedMatches={savedMatches}
          goalsByMatch={goalsByMatch}
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
