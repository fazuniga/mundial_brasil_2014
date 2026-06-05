"use client";

import { PointsBadge } from "@/components/predictions/points-badge";
import { TeamSearchSelect } from "@/components/predictions/team-search-select";
import { scoringRuleLabel } from "@/lib/scoring-labels";
import type { TeamRow } from "@/lib/predictions-types";
import type { WinnerDraft } from "@/lib/predictions-utils";

type WorldCupWinnerBetProps = {
  teams: TeamRow[];
  draft: WinnerDraft;
  onDraftChange: (field: keyof WinnerDraft, value: string) => void;
  disabled: boolean;
  isSaved: boolean;
  points: number;
};

export function WorldCupWinnerBet({
  teams,
  draft,
  onDraftChange,
  disabled,
  isSaved,
  points,
}: WorldCupWinnerBetProps) {
  return (
    <div className="space-y-3">
      <TeamSearchSelect
        id="tournament-winner-team"
        label={
          <>
            <span>{scoringRuleLabel("tournament_winner")}</span>
            <PointsBadge points={points} />
          </>
        }
        teams={teams}
        value={draft.teamId}
        onChange={(v) => onDraftChange("teamId", v)}
        disabled={disabled}
      />
      {isSaved && !disabled ? (
        <p className="font-geist text-xs text-primary">Campeón guardado</p>
      ) : null}
    </div>
  );
}
