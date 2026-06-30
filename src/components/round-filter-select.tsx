"use client";

import { FilterSelect } from "@/components/filter-select";
import type { FixtureRoundOption } from "@/lib/predictions-utils";

type RoundFilterSelectProps = {
  rounds: FixtureRoundOption[];
  value: number | null;
  onChange: (roundId: number | null) => void;
  id?: string;
  className?: string;
};

export function RoundFilterSelect({
  rounds,
  value,
  onChange,
  id = "round-filter",
  className,
}: RoundFilterSelectProps) {
  return (
    <FilterSelect
      id={id}
      value={value ?? ""}
      onChange={(event) => {
        const next = event.target.value;
        onChange(next === "" ? null : Number(next));
      }}
      className={className}
      aria-label="Fase del torneo"
    >
      <option value="">Todas las fases</option>
      {rounds.map((round) => (
        <option key={round.id_round} value={round.id_round}>
          {round.name_round}
        </option>
      ))}
    </FilterSelect>
  );
}
