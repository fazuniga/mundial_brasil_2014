"use client";

import { PlayerSearchSelect } from "@/components/predictions/player-search-select";
import { PointsBadge } from "@/components/predictions/points-badge";
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
  playerPoints: number;
  goalsPoints: number;
};

export function TopScorerBet({
  players,
  draft,
  onDraftChange,
  disabled,
  isSaved,
  playerPoints,
  goalsPoints,
}: TopScorerBetProps) {
  return (
    <div className="grid gap-4 sm:grid-cols-2">
      <PlayerSearchSelect
        id="top-scorer-player"
        label={
          <span className="flex items-center gap-2">
            {scoringRuleLabel("top_scorer_player")}
            <PointsBadge points={playerPoints} />
          </span>
        }
        players={players}
        value={draft.playerId}
        onChange={(v) => onDraftChange("playerId", v)}
        disabled={disabled}
      />

      <div className="flex flex-col gap-2">
        <Label
          htmlFor="top-scorer-goals"
          className="flex items-center gap-2 font-geist text-xs text-on-surface-variant"
        >
          {scoringRuleLabel("top_scorer_goals")}
          <PointsBadge points={goalsPoints} />
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

      {isSaved && !disabled ? (
        <p className="font-geist text-xs text-primary sm:col-span-2">
          Goleador guardado
        </p>
      ) : null}
    </div>
  );
}
