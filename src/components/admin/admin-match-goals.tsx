"use client";

import { useState } from "react";
import { MaterialIcon } from "@/components/material-icon";
import { PlayerSearchSelect } from "@/components/predictions/player-search-select";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import type { MatchGoalRow } from "@/lib/admin-types";
import { parseGoalMinute, playersForMatch } from "@/lib/admin-utils";
import type { AdminFixtureRow } from "@/lib/admin-types";
import type { MatchResultDraft } from "@/lib/admin-types";
import type { PlayerRow } from "@/lib/predictions-types";

type AdminMatchGoalsProps = {
  fixture: AdminFixtureRow;
  draft: MatchResultDraft;
  goals: MatchGoalRow[];
  players: PlayerRow[];
  derivedFirstGoal: { minute: number; playerId: number; playerName: string } | null;
  saving: boolean;
  onAddGoal: (payload: {
    id_player: number;
    minute: number;
    is_own_goal: boolean;
  }) => Promise<string | null>;
  onDeleteGoal: (idGoal: number) => Promise<string | null>;
};

const fieldInputClass =
  "h-10 rounded-md border border-border/60 bg-white font-geist text-base text-on-surface focus:border-primary focus:outline-none focus:ring-2 focus:ring-primary/15 disabled:cursor-not-allowed disabled:opacity-50";

export function AdminMatchGoals({
  fixture,
  draft,
  goals,
  players,
  derivedFirstGoal,
  saving,
  onAddGoal,
  onDeleteGoal,
}: AdminMatchGoalsProps) {
  const [playerId, setPlayerId] = useState("");
  const [minute, setMinute] = useState("");
  const [isOwnGoal, setIsOwnGoal] = useState(false);
  const [adding, setAdding] = useState(false);
  const [deletingId, setDeletingId] = useState<number | null>(null);
  const [localError, setLocalError] = useState<string | null>(null);

  const matchPlayers = playersForMatch(
    players,
    fixture.home_team_id,
    fixture.away_team_id,
  );

  const goalsHome = draft.goalsHome.trim() === "" ? null : Number.parseInt(draft.goalsHome, 10);
  const goalsAway = draft.goalsAway.trim() === "" ? null : Number.parseInt(draft.goalsAway, 10);
  const expectedTotal =
    goalsHome != null && goalsAway != null && !Number.isNaN(goalsHome) && !Number.isNaN(goalsAway)
      ? goalsHome + goalsAway
      : null;
  const goalCountMismatch =
    expectedTotal != null && goals.length !== expectedTotal;

  async function handleAdd() {
    const parsedMinute = parseGoalMinute(minute);
    if (parsedMinute.error) {
      setLocalError(parsedMinute.error);
      return;
    }
    const idPlayer = Number.parseInt(playerId, 10);
    if (!playerId || Number.isNaN(idPlayer)) {
      setLocalError("Selecciona el autor del gol.");
      return;
    }

    setAdding(true);
    setLocalError(null);
    const err = await onAddGoal({
      id_player: idPlayer,
      minute: parsedMinute.minute!,
      is_own_goal: isOwnGoal,
    });
    setAdding(false);

    if (err) {
      setLocalError(err);
      return;
    }

    setPlayerId("");
    setMinute("");
    setIsOwnGoal(false);
  }

  async function handleDelete(idGoal: number) {
    setDeletingId(idGoal);
    setLocalError(null);
    const err = await onDeleteGoal(idGoal);
    setDeletingId(null);
    if (err) setLocalError(err);
  }

  const sortedGoals = [...goals].sort((a, b) => a.minute - b.minute || a.id_goal - b.id_goal);

  return (
    <div className="space-y-5 border-t border-border/40 pt-5">
      <div>
        <h3 className="font-geist text-base font-semibold text-on-surface">
          Goles del partido
        </h3>
        <p className="font-geist text-sm text-on-surface-variant">
          Registra cada gol. El primer gol para apuestas se toma del minuto más
          bajo (excluye autogol).
        </p>
      </div>

      {goalCountMismatch ? (
        <p className="rounded-lg border border-accent/30 bg-accent/5 px-4 py-3 font-geist text-sm text-on-surface">
          Advertencia: {goals.length} gol{goals.length === 1 ? "" : "es"} registrados
          {" · "}
          marcador indica {expectedTotal} en total.
        </p>
      ) : null}

      {sortedGoals.length > 0 ? (
        <ul className="divide-y divide-border/40 rounded-xl border border-border/50 bg-white">
          {sortedGoals.map((goal) => (
            <li
              key={goal.id_goal}
              className="flex items-center justify-between gap-3 px-4 py-3"
            >
              <div className="min-w-0 flex items-center gap-2">
                <p className="font-geist text-base text-on-surface">
                  {goal.player_name ?? `Jugador ${goal.id_player}`}
                  {goal.is_own_goal ? (
                    <span className="ml-1 text-sm text-accent">(autogol)</span>
                  ) : null}
                </p>
                <span className="text-sm text-on-surface-variant">·</span>
                <p className="font-geist text-sm text-on-surface-variant">
                  minuto {goal.minute}
                </p>
              </div>
              <Button
                type="button"
                variant="outline"
                size="sm"
                disabled={saving || deletingId != null}
                onClick={() => handleDelete(goal.id_goal)}
              >
                {deletingId === goal.id_goal ? "…" : "Eliminar"}
              </Button>
            </li>
          ))}
        </ul>
      ) : (
        <p className="font-geist text-sm text-on-surface-variant">Sin goles registrados.</p>
      )}

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <PlayerSearchSelect
          id={`goal-player-${fixture.id_match}`}
          label="Autor del gol"
          players={matchPlayers.length > 0 ? matchPlayers : players}
          value={playerId}
          onChange={setPlayerId}
          disabled={saving || adding}
        />
        <div className="flex flex-col gap-2">
          <Label
            htmlFor={`goal-minute-${fixture.id_match}`}
            className="font-geist text-sm text-on-surface-variant"
          >
            Minuto
          </Label>
          <Input
            id={`goal-minute-${fixture.id_match}`}
            type="number"
            min={1}
            max={120}
            value={minute}
            onChange={(e) => setMinute(e.target.value)}
            disabled={saving || adding}
            className={fieldInputClass}
            placeholder="Ej. 23, 67, 105"
          />
        </div>
        <div className="flex flex-col gap-2">
          <Label className="sr-only">Autogol</Label>
          <label className="flex h-10 cursor-pointer items-center gap-2 font-geist text-base text-on-surface">
            <input
              type="checkbox"
              checked={isOwnGoal}
              onChange={(e) => setIsOwnGoal(e.target.checked)}
              disabled={saving || adding}
              className="h-4 w-4 rounded border-outline-variant"
            />
            Autogol
          </label>
        </div>
        <div className="flex flex-col gap-2">
          <span className="sr-only">Acción</span>
          <div className="flex h-10 items-center">
          <Button
            type="button"
            size="sm"
            onClick={handleAdd}
            disabled={saving || adding}
            className="w-full sm:w-auto"
          >
            {adding ? "Agregando…" : "Agregar gol"}
          </Button>
          </div>
        </div>
      </div>

      {localError ? (
        <p className="font-geist text-sm text-destructive">{localError}</p>
      ) : null}

      <div className="rounded-xl border border-border/40 bg-slate-50 px-5 py-4">
        <p className="font-geist text-sm font-medium text-on-surface-variant">
          Primer gol del partido (automático)
        </p>
        {derivedFirstGoal ? (
          <p className="mt-2 font-geist text-base text-on-surface flex items-center">
            <MaterialIcon name="sports_soccer" className="mr-2 inline text-lg text-primary" />
            {derivedFirstGoal.playerName} · minuto {derivedFirstGoal.minute}
          </p>
        ) : (
          <p className="mt-2 font-geist text-base text-on-surface-variant">
            Sin primer gol (sin goles o solo autogoles).
          </p>
        )}
      </div>
    </div>
  );
}
