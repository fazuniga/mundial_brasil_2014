"use client";

import { useEffect, useMemo, useRef, useState } from "react";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { TeamFlag } from "@/components/team-flag";
import type { PlayerRow } from "@/lib/predictions-types";
import { cn } from "@/lib/utils";

type PlayerSearchSelectProps = {
  id: string;
  label: React.ReactNode;
  players: PlayerRow[];
  value: string;
  onChange: (playerId: string) => void;
  disabled?: boolean;
};

export function PlayerSearchSelect({
  id,
  label,
  players,
  value,
  onChange,
  disabled = false,
}: PlayerSearchSelectProps) {
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
    () => players.find((p) => p.id_player.toString() === value),
    [players, value],
  );

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    if (!q) return players.slice(0, 50);
    return players
      .filter(
        (p) =>
          p.name.toLowerCase().includes(q) ||
          p.team_country.toLowerCase().includes(q) ||
          p.team_code.toLowerCase().includes(q),
      )
      .slice(0, 50);
  }, [players, query]);

  function handleSelect(playerId: number) {
    onChange(playerId.toString());
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
            disabled && "cursor-not-allowed",
          )}
        >
          <span className="flex min-w-0 items-center gap-2">
            <TeamFlag code={selected.team_code} country={selected.team_country} />
            <span className="truncate">
              {selected.name}{" "}
              <span className="text-on-surface-variant">({selected.team_country})</span>
            </span>
          </span>
          {!disabled && (
            <span className="ml-2 shrink-0 text-xs text-primary">Cambiar</span>
          )}
        </button>
      ) : value && !open ? (
        <div
          id={id}
          className="flex h-9 w-full items-center rounded-md border border-outline-variant bg-surface-container-lowest px-3 font-geist text-sm text-on-surface"
        >
          <span className="truncate">Jugador guardado (plantilla actualizada)</span>
        </div>
      ) : (
        <>
          <Input
            id={id}
            type="search"
            placeholder="Buscar jugador o selección…"
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
                filtered.map((player) => (
                  <li key={player.id_player}>
                    <button
                      type="button"
                      role="option"
                      aria-selected={value === player.id_player.toString()}
                      onClick={() => handleSelect(player.id_player)}
                      className="flex w-full items-center gap-2 p-3! text-left font-geist text-sm hover:bg-surface-container-high"
                    >
                      <TeamFlag code={player.team_code} country={player.team_country} />
                      <span className="min-w-0 flex flex-col">
                        <span className="font-medium text-on-surface">{player.name}</span>
                        <span className="text-xs text-on-surface-variant">
                          {player.team_country} · {player.position ?? "—"}
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
