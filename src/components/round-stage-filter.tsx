"use client";

import { cn } from "@/lib/utils";
import type { RoundPhaseRow } from "@/lib/predictions-types";

const selectClass =
  "h-9 w-full rounded-md border border-outline-variant bg-white px-3 font-geist text-sm text-black focus-visible:border-primary focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary/20";

type RoundStageFilterProps = {
  rounds: Pick<RoundPhaseRow, "id_round" | "name_round">[];
  value: string;
  onChange: (value: string) => void;
  className?: string;
  id?: string;
};

export function RoundStageFilter({
  rounds,
  value,
  onChange,
  className,
  id = "round-stage",
}: RoundStageFilterProps) {
  return (
    <div className={cn("flex min-w-0 flex-col gap-1.5", className)}>
      <label htmlFor={id} className="font-geist text-sm font-medium text-on-surface">
        Fase del torneo
      </label>
      <select
        id={id}
        value={value}
        onChange={(e) => onChange(e.target.value)}
        className={selectClass}
        aria-label="Filtrar por fase del torneo"
      >
        <option value="">Todas las fases</option>
        {rounds.map((round) => (
          <option key={round.id_round} value={round.id_round.toString()}>
            {round.name_round}
          </option>
        ))}
      </select>
    </div>
  );
}
