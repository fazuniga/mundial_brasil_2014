"use client";

import { FilterSelect } from "@/components/filter-select";

export type PartidosView = "posiciones" | "partidos";

type PartidosViewSelectProps = {
  value: PartidosView;
  onChange: (view: PartidosView) => void;
  standingsAvailable: boolean;
  id?: string;
  className?: string;
};

export function PartidosViewSelect({
  value,
  onChange,
  standingsAvailable,
  id = "partidos-view",
  className,
}: PartidosViewSelectProps) {
  return (
    <FilterSelect
      id={id}
      value={value}
      onChange={(event) => onChange(event.target.value as PartidosView)}
      className={className}
      aria-label="Vista"
    >
      <option value="partidos">Partidos por fecha</option>
      <option value="posiciones" disabled={!standingsAvailable}>
        Posiciones por grupo
      </option>
    </FilterSelect>
  );
}
