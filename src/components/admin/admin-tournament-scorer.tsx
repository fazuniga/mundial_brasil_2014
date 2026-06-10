"use client";

import { MaterialIcon } from "@/components/material-icon";
import type { TournamentTopScorerSummary } from "@/lib/admin-types";
import { scoringRuleLabel } from "@/lib/scoring-labels";

type AdminTournamentScorerProps = {
  summary: TournamentTopScorerSummary | null;
};

export function AdminTournamentScorer({ summary }: AdminTournamentScorerProps) {
  const goals = summary?.top_scorer_goals ?? 0;
  const names = summary?.top_scorer_names ?? "";
  const tiedCount = summary?.tied_leaders_count ?? 0;
  const hasLeader = goals > 0 && tiedCount > 0;

  return (
    <div className="space-y-3 p-5">
      <div className="flex items-center gap-3">
        <MaterialIcon name="emoji_events" className="text-xl text-accent" />
        <div>
          <h3 className="font-geist text-base font-semibold text-on-surface">
            Goleador del torneo
          </h3>
        </div>
      </div>

      {hasLeader ? (
        <>
          <p className="font-geist text-base text-slate-900">
            <span className="font-semibold text-primary">{names}</span>
            {" · "}
            <span className="font-medium tabular-nums text-slate-800">{goals}</span>
            {" "}
            gol{goals === 1 ? "" : "es"}
          </p>
          {tiedCount > 1 ? (
            <p className="font-geist text-sm text-on-surface-variant">
              Bota de oro compartida ({tiedCount} jugadores empatados): cualquiera
              de ellos cuenta para la apuesta de jugador.
            </p>
          ) : null}
        </>
      ) : (
        <p className="font-geist text-sm text-on-surface-variant">
          Aún no hay goles registrados en el torneo. Se actualiza al cargar goles
          en los partidos (excluye autogoles).
        </p>
      )}
    </div>
  );
}
