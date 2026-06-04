"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { MaterialIcon } from "@/components/material-icon";
import { Alert } from "@/components/ui/alert";
import type { RoundPhaseRow } from "@/lib/predictions-types";
import { cn } from "@/lib/utils";

type AdminRoundPhasesProps = {
  rounds: RoundPhaseRow[];
};

export function AdminRoundPhases({ rounds: initialRounds }: AdminRoundPhasesProps) {
  const router = useRouter();
  const [rounds, setRounds] = useState(initialRounds);
  const [savingRoundId, setSavingRoundId] = useState<number | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  async function handleToggle(idRound: number, enabled: boolean) {
    const previous = rounds;
    setRounds((prev) =>
      prev.map((r) =>
        r.id_round === idRound ? { ...r, predictions_enabled: enabled } : r,
      ),
    );
    setSavingRoundId(idRound);
    setError(null);
    setSuccess(null);

    const supabase = createClient();
    const { error: updateError } = await supabase
      .from("rounds")
      .update({ predictions_enabled: enabled })
      .eq("id_round", idRound);

    setSavingRoundId(null);

    if (updateError) {
      setRounds(previous);
      setError(updateError.message);
      return;
    }

    const name = rounds.find((r) => r.id_round === idRound)?.name_round ?? "";
    setSuccess(
      enabled
        ? `${name}: pronósticos habilitados.`
        : `${name}: pronósticos deshabilitados.`,
    );
    router.refresh();
  }

  const enabledCount = rounds.filter((r) => r.predictions_enabled).length;

  return (
    <section className="rounded-xl border border-border/50 bg-white px-5 py-4 shadow-sm">
      <div className="flex flex-col gap-1">
        <h2 className="font-headline text-lg font-bold text-primary">
          Fases del torneo
        </h2>
        <p className="font-geist text-sm text-on-surface-variant">
          Activa las fases en las que los usuarios pueden pronosticar partidos.
        </p>
        <p className="font-geist text-sm text-on-surface-variant">
          Recomendado: una fase a la vez (primero Fase de Grupos, luego
          Dieciseisavos, etc.).
        </p>
        <p className="font-geist text-sm text-on-surface-variant">
          El cierre por partido sigue siendo 60 min antes del inicio.
        </p>
        <p className="font-geist text-xs text-on-surface-variant">
          {enabledCount} de {rounds.length} fases abiertas para pronósticos
        </p>
      </div>

      {error ? (
        <Alert variant="destructive" className="mt-4">
          <p className="font-geist text-sm">{error}</p>
        </Alert>
      ) : null}
      {success ? (
        <Alert className="mt-4">
          <p className="font-geist text-sm">{success}</p>
        </Alert>
      ) : null}

      <ul className="mt-4 divide-y divide-outline-variant/40">
        {rounds.map((round) => {
          const isSaving = savingRoundId === round.id_round;
          return (
            <li
              key={round.id_round}
              className={cn(
                "flex items-center justify-between gap-4 py-3 first:pt-0 last:pb-0",
                !round.predictions_enabled && "opacity-80",
              )}
            >
              <div className="min-w-0">
                <p className="font-geist font-medium text-black">
                  {round.name_round}
                </p>
              </div>
              <label className="flex shrink-0 cursor-pointer items-center gap-2">
                <span className="font-geist text-xs text-on-surface-variant">
                  {round.predictions_enabled ? "Abierta" : "Cerrada"}
                </span>
                <input
                  type="checkbox"
                  role="switch"
                  aria-label={`Pronósticos en ${round.name_round}`}
                  checked={round.predictions_enabled}
                  disabled={isSaving}
                  onChange={(e) => handleToggle(round.id_round, e.target.checked)}
                  className="h-5 w-9 cursor-pointer appearance-none rounded-full border border-outline-variant bg-surface-container-high transition-colors checked:border-primary checked:bg-primary disabled:cursor-not-allowed disabled:opacity-50"
                />
                {isSaving ? (
                  <MaterialIcon
                    name="progress_activity"
                    className="animate-spin text-base text-on-surface-variant"
                  />
                ) : null}
              </label>
            </li>
          );
        })}
      </ul>
    </section>
  );
}
