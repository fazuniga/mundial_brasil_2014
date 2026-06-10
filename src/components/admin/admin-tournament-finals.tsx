"use client";

import { MaterialIcon } from "@/components/material-icon";
import { AdminTournamentScorer } from "@/components/admin/admin-tournament-scorer";
import { AdminTournamentWinner } from "@/components/admin/admin-tournament-winner";
import type {
  TournamentTopScorerSummary,
  TournamentWinnerSummary,
} from "@/lib/admin-types";

type AdminTournamentFinalsProps = {
  winnerSummary: TournamentWinnerSummary | null;
  topScorerSummary: TournamentTopScorerSummary | null;
};

export function AdminTournamentFinals({
  winnerSummary,
  topScorerSummary,
}: AdminTournamentFinalsProps) {
  return (
    <section className="overflow-hidden rounded-xl border border-border/50 bg-white shadow-sm">
      <div className="border-b border-border/40 bg-slate-50 px-5 py-4">
        <div className="flex items-center gap-3">
          <MaterialIcon name="emoji_events" className="text-2xl text-accent" />
          <h2 className="font-geist text-base font-semibold text-on-surface">
            Resultados Finales
          </h2>
        </div>
      </div>

      <div className="divide-y divide-border/40">
        <AdminTournamentWinner summary={winnerSummary} />
        <AdminTournamentScorer summary={topScorerSummary} />
      </div>
    </section>
  );
}
