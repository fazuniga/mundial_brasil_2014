"use client";

import { MaterialIcon } from "@/components/material-icon";
import { PlayerSearchSelect } from "@/components/predictions/player-search-select";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { scoringRuleLabel } from "@/lib/scoring-labels";
import type { PlayerRow } from "@/lib/predictions-types";

import type { TopScorerDraft } from "@/lib/predictions-utils";

type TopScorerBetProps = {
  players: PlayerRow[];
  draft: TopScorerDraft;
  onDraftChange: (field: keyof TopScorerDraft, value: string) => void;
  disabled: boolean;
  isSaved: boolean;
};

export function TopScorerBet({
  players,
  draft,
  onDraftChange,
  disabled,
  isSaved,
}: TopScorerBetProps) {
  return (
    <section className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
      <div className="border-b border-outline-variant/50 bg-surface-container-lowest px-4 py-3">
        <div className="flex items-center gap-2">
          <MaterialIcon name="emoji_events" className="text-xl text-accent" />
          <div>
            <h2 className="font-geist text-sm font-semibold text-on-surface">
              Goleador del torneo
            </h2>
            <p className="font-geist text-xs text-on-surface-variant">
              Pronóstico especial · {scoringRuleLabel("top_scorer_player")} (+10) ·{" "}
              {scoringRuleLabel("top_scorer_goals")} (+15)
            </p>
          </div>
        </div>
      </div>

      <div className="grid gap-4 p-4 sm:grid-cols-2">
        <PlayerSearchSelect
          id="top-scorer-player"
          label={scoringRuleLabel("top_scorer_player")}
          players={players}
          value={draft.playerId}
          onChange={(v) => onDraftChange("playerId", v)}
          disabled={disabled}
        />

        <div className="flex flex-col gap-2">
          <Label htmlFor="top-scorer-goals" className="font-geist text-xs text-on-surface-variant">
            {scoringRuleLabel("top_scorer_goals")}
          </Label>
          <Input
            id="top-scorer-goals"
            type="number"
            min={1}
            max={20}
            inputMode="numeric"
            placeholder="Ej. 6"
            value={draft.goals}
            onChange={(e) => onDraftChange("goals", e.target.value)}
            disabled={disabled}
            className="h-9 font-geist text-sm"
            aria-label={scoringRuleLabel("top_scorer_goals")}
          />
        </div>
      </div>

      <div className="border-t border-outline-variant/40 px-4 py-2">
        {disabled ? (
          <p className="flex items-center gap-1 font-geist text-xs text-on-surface-variant">
            <MaterialIcon name="lock" className="text-sm" />
            Cerrado (60 min antes del primer partido)
          </p>
        ) : isSaved ? (
          <p className="flex items-center gap-1 font-geist text-xs text-primary">
            <MaterialIcon name="check_circle" className="text-sm" />
            Pronóstico guardado
          </p>
        ) : (
          <p className="font-geist text-xs text-on-surface-variant">
            Indica jugador y cantidad de goles. Se guarda con &quot;Guardar todo&quot;.
          </p>
        )}
      </div>
    </section>
  );
}
