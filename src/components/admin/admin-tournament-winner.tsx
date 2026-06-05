"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { MaterialIcon } from "@/components/material-icon";
import { TeamSearchSelect } from "@/components/predictions/team-search-select";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { createClient } from "@/lib/supabase/client";
import { scoringRuleLabel } from "@/lib/scoring-labels";
import type { TeamRow } from "@/lib/predictions-types";

type AdminTournamentWinnerProps = {
  teams: TeamRow[];
  winnerTeamId: number | null;
  winnerCountry: string | null;
};

export function AdminTournamentWinner({
  teams,
  winnerTeamId,
  winnerCountry,
}: AdminTournamentWinnerProps) {
  const router = useRouter();
  const [teamId, setTeamId] = useState(winnerTeamId?.toString() ?? "");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  const hasChange = teamId !== (winnerTeamId?.toString() ?? "");

  async function handleSave() {
    if (!teamId) {
      setError("Selecciona el país campeón.");
      return;
    }

    setLoading(true);
    setError(null);
    setSuccess(null);

    try {
      const supabase = createClient();
      const { error: upsertError } = await supabase
        .from("tournament_results")
        .upsert(
          {
            id: 1,
            winner_team_id: Number(teamId),
            updated_at: new Date().toISOString(),
          },
          { onConflict: "id" },
        );

      if (upsertError) throw upsertError;

      setSuccess("Campeón del Mundial registrado.");
      router.refresh();
    } catch (err) {
      setError(err instanceof Error ? err.message : "No se pudo guardar el campeón.");
    } finally {
      setLoading(false);
    }
  }

  return (
    <section className="overflow-hidden rounded-xl border border-border/50 bg-white shadow-sm">
      <div className="border-b border-border/40 bg-slate-50 px-5 py-4">
        <div className="flex items-center gap-3">
          <MaterialIcon name="trophy" className="text-2xl text-accent" />
          <div>
            <h2 className="font-geist text-base font-semibold text-on-surface">
              {scoringRuleLabel("tournament_winner")}
            </h2>
            <p className="font-geist text-sm text-on-surface-variant">
              Resultado oficial para la apuesta de campeón (+15 puntos)
            </p>
          </div>
        </div>
      </div>

      <div className="space-y-4 p-5">
        {winnerCountry ? (
          <p className="font-geist text-base text-slate-900">
            Campeón actual:{" "}
            <span className="font-semibold text-primary">{winnerCountry}</span>
          </p>
        ) : (
          <p className="font-geist text-base text-on-surface-variant">
            Aún no se ha registrado el campeón del torneo.
          </p>
        )}

        <TeamSearchSelect
          id="admin-tournament-winner"
          label="País campeón"
          teams={teams}
          value={teamId}
          onChange={setTeamId}
        />

        {error ? <Alert variant="destructive">{error}</Alert> : null}
        {success ? <Alert>{success}</Alert> : null}

        <Button
          type="button"
          onClick={handleSave}
          disabled={loading || !hasChange}
          className="text-white"
        >
          {loading ? "Guardando…" : "Guardar campeón"}
        </Button>
      </div>
    </section>
  );
}
