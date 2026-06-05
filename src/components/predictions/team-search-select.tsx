"use client";

import { useEffect, useMemo, useRef, useState } from "react";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { TeamFlag } from "@/components/team-flag";
import type { TeamRow } from "@/lib/predictions-types";
import { cn } from "@/lib/utils";

type TeamSearchSelectProps = {
  id: string;
  label: React.ReactNode;
  teams: TeamRow[];
  value: string;
  onChange: (teamId: string) => void;
  disabled?: boolean;
};

export function TeamSearchSelect({
  id,
  label,
  teams,
  value,
  onChange,
  disabled = false,
}: TeamSearchSelectProps) {
  const [query, setQuery] = useState("");
  const [open, setOpen] = useState(false);
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!open) return;

    function close() {
      setOpen(false);
      setQuery("");
    }

    function handlePointerDown(event: PointerEvent) {
      if (containerRef.current?.contains(event.target as Node)) return;
      close();
    }

    function handleKeyDown(event: KeyboardEvent) {
      if (event.key === "Escape") close();
    }

    document.addEventListener("pointerdown", handlePointerDown);
    document.addEventListener("keydown", handleKeyDown);
    return () => {
      document.removeEventListener("pointerdown", handlePointerDown);
      document.removeEventListener("keydown", handleKeyDown);
    };
  }, [open]);

  const selected = useMemo(
    () => teams.find((t) => t.id_team.toString() === value),
    [teams, value],
  );

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    if (!q) return teams.slice(0, 50);
    return teams
      .filter(
        (t) =>
          t.country.toLowerCase().includes(q) ||
          t.code.toLowerCase().includes(q) ||
          (t.group_code?.toLowerCase().includes(q) ?? false),
      )
      .slice(0, 50);
  }, [teams, query]);

  function handleSelect(teamId: number) {
    onChange(teamId.toString());
    setQuery("");
    setOpen(false);
  }

  return (
    <div ref={containerRef} className="relative flex flex-col gap-2">
      <Label htmlFor={id} className="flex items-center gap-2 font-geist text-xs text-on-surface-variant">
        {label}
      </Label>
      {selected && !open ? (
        <button
          type="button"
          id={id}
          disabled={disabled}
          onClick={() => !disabled && setOpen(true)}
          className={cn(
            "flex h-9 w-full items-center justify-between rounded-md border border-outline-variant bg-surface-container-lowest px-3 text-left font-geist text-sm text-on-surface",
            disabled && "cursor-not-allowed opacity-50",
          )}
        >
          <span className="flex min-w-0 items-center gap-2">
            <TeamFlag code={selected.code} country={selected.country} />
            <span className="truncate">
              {selected.country}{" "}
              <span className="text-on-surface-variant">
                ({selected.code}
                {selected.group_code ? ` · Grupo ${selected.group_code}` : ""})
              </span>
            </span>
          </span>
          {!disabled && (
            <span className="ml-2 shrink-0 text-xs text-primary">Cambiar</span>
          )}
        </button>
      ) : (
        <>
          <Input
            id={id}
            type="search"
            placeholder="Buscar país o código…"
            value={query}
            onChange={(e) => {
              setQuery(e.target.value);
              setOpen(true);
            }}
            onFocus={() => setOpen(true)}
            disabled={disabled}
            className="h-9 font-geist text-sm"
            autoComplete="off"
          />
          {open && !disabled && (
            <ul
              role="listbox"
              className="absolute top-full z-20 mt-1 max-h-56 w-full overflow-y-auto rounded-md border border-outline-variant bg-card shadow-lg"
            >
              {filtered.length === 0 ? (
                <li className="px-3 py-2 font-geist text-sm text-on-surface-variant">
                  Sin resultados
                </li>
              ) : (
                filtered.map((team) => (
                  <li key={team.id_team}>
                    <button
                      type="button"
                      role="option"
                      aria-selected={value === team.id_team.toString()}
                      onClick={() => handleSelect(team.id_team)}
                      className="flex w-full items-center gap-2 px-3 py-2 text-left font-geist text-sm hover:bg-surface-container-high"
                    >
                      <TeamFlag code={team.code} country={team.country} />
                      <span className="min-w-0 flex flex-col">
                        <span className="font-medium text-on-surface">{team.country}</span>
                        <span className="text-xs text-on-surface-variant">
                          {team.code}
                          {team.group_code ? ` · Grupo ${team.group_code}` : ""}
                        </span>
                      </span>
                    </button>
                  </li>
                ))
              )}
            </ul>
          )}
        </>
      )}
    </div>
  );
}
