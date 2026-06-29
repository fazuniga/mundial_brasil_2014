"use client";

import { useState } from "react";
import { PlayerSearchSelect } from "@/components/predictions/player-search-select";
import { TeamFlag } from "@/components/team-flag";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import type { MatchGoalRow } from "@/lib/admin-types";
import {
  compareGoalMinutes,
  type DerivedFirstGoal,
  formatGoalMinuteDisplay,
  parseGoalMinute,
  playersForMatch,
  STOPPAGE_1T_MIN,
  STOPPAGE_2T_MIN,
} from "@/lib/admin-utils";
import type { AdminFixtureRow } from "@/lib/admin-types";
import type { PlayerRow } from "@/lib/predictions-types";
import { cn } from "@/lib/utils";

export type { DerivedFirstGoal };

type AdminDerivedFirstGoalProps = {
  derivedFirstGoal: DerivedFirstGoal | null;
};

export function AdminDerivedFirstGoal({
  derivedFirstGoal,
}: AdminDerivedFirstGoalProps) {
  return (
    <div className="flex h-full min-w-0 flex-col rounded-xl border border-border/40 bg-white px-4 py-3">
      <p className="font-geist text-sm font-medium text-on-surface-variant">
        Primer gol del partido (automático)
      </p>
      {derivedFirstGoal ? (
        <p className="mt-2 flex flex-1 items-center gap-2 font-geist text-base text-on-surface">
          {derivedFirstGoal.teamCode ? (
            <TeamFlag
              code={derivedFirstGoal.teamCode}
              country={derivedFirstGoal.teamCountry}
            />
          ) : null}
          <span>
            {derivedFirstGoal.playerName} · minuto{" "}
            {formatGoalMinuteDisplay(derivedFirstGoal.minute)}
          </span>
        </p>
      ) : (
        <p className="mt-2 flex flex-1 items-center font-geist text-base text-on-surface-variant">
          Sin primer gol (sin goles o solo autogoles).
        </p>
      )}
    </div>
  );
}

type AdminMatchGoalsProps = {
  fixture: AdminFixtureRow;
  goals: MatchGoalRow[];
  players: PlayerRow[];
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
  goals,
  players,
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
  const playerById = new Map(players.map((player) => [player.id_player, player]));

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

  const sortedGoals = [...goals].sort(
    (a, b) => compareGoalMinutes(a.minute, b.minute) || a.id_goal - b.id_goal,
  );

  return (
    <div className="space-y-5 border-t border-border/40 pt-5">
      <div>
        <h3 className="font-geist text-base font-semibold text-on-surface">
          Goles del partido
        </h3>
        <p className="font-geist text-sm text-on-surface-variant">
          Registra cada gol con su minuto exacto. El primer gol para apuestas
          se toma del minuto más bajo (excluye autogol).
        </p>
        <p className="font-geist mt-1 text-xs text-on-surface-variant">
          Minutos válidos: 1–90 (reglamento) · 91–130 (prórroga) ·{" "}
          {STOPPAGE_1T_MIN}–{STOPPAGE_1T_MIN + 8} (tiempo añadido 1.er tiempo,
          ej. {STOPPAGE_1T_MIN + 2} = 45+3) ·{" "}
          {STOPPAGE_2T_MIN}–{STOPPAGE_2T_MIN + 8} (tiempo añadido 2.º tiempo
          reglamentario, ej. {STOPPAGE_2T_MIN + 2} = 90+3)
        </p>
      </div>

      {sortedGoals.length > 0 ? (
        <ul className="divide-y divide-border/40 rounded-xl border border-border/50 bg-white">
          {sortedGoals.map((goal) => {
            const player = playerById.get(goal.id_player);
            return (
            <li
              key={goal.id_goal}
              className="flex items-center justify-between gap-3 px-4 py-1.5"
            >
              <div className="flex min-w-0 items-center gap-1">
                {player?.team_code ? (
                  <TeamFlag
                    code={player.team_code}
                    country={player.team_country}
                  />
                ) : null}
                <p className="font-geist text-xs sm:text-sm text-on-surface">
                  {goal.player_name ?? `Jugador ${goal.id_player}`}
                  {goal.is_own_goal ? (
                    <span className="ml-1 text-xs sm:text-sm text-accent">(autogol)</span>
                  ) : null}
                </p>
                <span className="text-xs sm:text-sm text-on-surface-variant">·</span>
                <p className="font-geist text-xs sm:text-sm text-on-surface-variant">
                  Minuto {formatGoalMinuteDisplay(goal.minute)}
                </p>
              </div>
              <Button
                type="button"
                variant="default"
                size="sm"
                className="bg-red-100! hover:bg-red-200! rounded-sm!"
                disabled={saving || deletingId != null}
                onClick={() => handleDelete(goal.id_goal)}
              >
                {deletingId === goal.id_goal ? "…" : "Eliminar"}
              </Button>
            </li>
            );
          })}
        </ul>
      ) : (
        <p className="font-geist text-sm text-on-surface-variant">Sin goles registrados.</p>
      )}

      <div className="flex flex-col gap-4 sm:flex-row sm:items-end">
        <div className="min-w-0 flex-1">
          <PlayerSearchSelect
            id={`goal-player-${fixture.id_match}`}
            label="Autor del gol"
            players={matchPlayers.length > 0 ? matchPlayers : players}
            value={playerId}
            onChange={setPlayerId}
            disabled={saving || adding}
          />
        </div>
        <div className="flex shrink-0 flex-col gap-2 sm:w-24">
          <Label
            htmlFor={`goal-minute-${fixture.id_match}`}
            className="font-geist text-xs text-on-surface-variant"
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
            className={cn(fieldInputClass, "px-2 text-center tabular-nums")}
            placeholder="23"
          />
        </div>
        <div className="flex shrink-0 flex-col gap-2 text-center">
          <Label className="font-geist text-xs text-on-surface-variant">Autogol</Label>
          <Button
            type="button"
            variant="outline"
            disabled={saving || adding}
            aria-pressed={isOwnGoal}
            onClick={() => setIsOwnGoal((value) => !value)}
            className={cn(
              "h-10 border-border/60 font-geist",
              isOwnGoal && "border-accent bg-accent/10 text-accent hover:bg-accent/15",
            )}
          >
            {isOwnGoal ? "Sí" : "No"}
          </Button>
        </div>
        <Button
          type="button"
          onClick={handleAdd}
          disabled={saving || adding}
          className="h-10 shrink-0 border border-border/40 bg-primary text-primary-foreground hover:bg-primary-hover text-sm sm:w-auto"
        >
          {adding ? "Agregando…" : "Agregar gol"}
        </Button>
      </div>

      {localError ? (
        <p className="font-geist text-sm text-destructive">{localError}</p>
      ) : null}
    </div>
  );
}
