"use client";

import { MaterialIcon } from "@/components/material-icon";
import { Input } from "@/components/ui/input";
import { cn } from "@/lib/utils";

type PredictionsSearchBarProps = {
  value: string;
  onChange: (value: string) => void;
  resultCount?: number;
  className?: string;
};

export function PredictionsSearchBar({
  value,
  onChange,
  resultCount,
  className,
}: PredictionsSearchBarProps) {
  const hasQuery = value.trim().length > 0;

  const resultLabel =
    hasQuery && resultCount != null
      ? resultCount === 0
        ? "Ningún partido coincide con la búsqueda"
        : `${resultCount} partido${resultCount === 1 ? "" : "s"} encontrado${resultCount === 1 ? "" : "s"}`
      : "\u00a0";

  return (
    <div className={cn("flex flex-col gap-1.5", className)}>
      <div className="relative">
        <MaterialIcon
          name="search"
          className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-lg text-on-surface-variant"
        />
        <Input
          type="text"
          role="searchbox"
          value={value}
          onChange={(e) => onChange(e.target.value)}
          placeholder="Buscar partido, equipo o grupo…"
          aria-label="Buscar partido, equipo o grupo"
          autoComplete="off"
          className="h-11 border-outline-variant bg-surface-container-lowest pl-10 pr-10 font-geist text-sm text-on-surface placeholder:text-on-surface-variant"
        />
        {hasQuery && (
          <button
            type="button"
            onClick={() => onChange("")}
            className="absolute right-1 top-1/2 flex h-10 w-10 -translate-y-1/2 items-center justify-center rounded-md text-on-surface-variant transition-colors hover:bg-surface-container-high hover:text-primary"
            aria-label="Limpiar búsqueda"
          >
            <MaterialIcon name="close" className="text-lg" />
          </button>
        )}
      </div>
      <p
        className={cn(
          "min-h-5 font-geist text-xs leading-5",
          hasQuery && resultCount != null ? "text-on-surface-variant" : "invisible",
        )}
        aria-live="polite"
      >
        {resultLabel}
      </p>
    </div>
  );
}
