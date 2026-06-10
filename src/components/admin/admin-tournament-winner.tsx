"use client";

import { MaterialIcon } from "@/components/material-icon";
import type { TournamentWinnerSummary } from "@/lib/admin-types";
import { scoringRuleLabel } from "@/lib/scoring-labels";

type AdminTournamentWinnerProps = {
  summary: TournamentWinnerSummary | null;
};

export function AdminTournamentWinner({ summary }: AdminTournamentWinnerProps) {
  const country = summary?.winner_country ?? null;
  const hasWinner = summary?.winner_team_id != null && country != null;

  return (
    <div className="space-y-3 p-5">
      <div className="flex items-center gap-3">
        <MaterialIcon name="trophy" className="text-xl text-accent" />
        <div>
          <h3 className="font-geist text-base font-semibold text-on-surface">
            {scoringRuleLabel("tournament_winner")}
          </h3>
        </div>
      </div>

      {hasWinner ? (
        <p className="font-geist text-sm text-slate-900">
          Campeón:{" "}
          <span className="font-semibold text-primary">{country}</span>
        </p>
      ) : (
        <p className="font-geist text-sm text-on-surface-variant">
          Aún no hay campeón definido. Se actualiza al cargar el resultado de la
          Final.
        </p>
      )}
    </div>
  );
}
