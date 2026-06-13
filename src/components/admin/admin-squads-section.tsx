"use client";

import { useEffect, useMemo, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import {
  CollapsibleInlineHeader,
  CollapsibleSection,
} from "@/components/collapsible-section";
import { MaterialIcon } from "@/components/material-icon";
import { TeamFlag } from "@/components/team-flag";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import {
  Dialog,
  DialogContent,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import type { AdminTeamRow } from "@/lib/admin-types";
import type { PlayerRow } from "@/lib/predictions-types";
import { cn } from "@/lib/utils";

const POSITIONS = [
  { value: "GK", label: "Arquero" },
  { value: "DF", label: "Defensor" },
  { value: "MF", label: "Mediocampista" },
  { value: "FW", label: "Delantero" },
] as const;

type PositionCode = (typeof POSITIONS)[number]["value"];

function positionLabel(code: string | null | undefined): string {
  if (!code) return "—";
  return POSITIONS.find((p) => p.value === code)?.label ?? code;
}

const SAVE_BUTTON_CLASS =
  "w-full max-w-xs bg-primary! text-white! hover:bg-primary-hover! hover:text-white!";

type PlayerDraft = {
  name: string;
  position: string;
  club: string;
};

type AdminSquadsSectionProps = {
  teams: AdminTeamRow[];
  players: PlayerRow[];
};

const EMPTY_DRAFT: PlayerDraft = {
  name: "",
  position: "MF",
  club: "",
};

function playerToDraft(player: PlayerRow): PlayerDraft {
  return {
    name: player.name,
    position: player.position ?? "MF",
    club: player.club ?? "",
  };
}

function draftIsValid(draft: PlayerDraft): boolean {
  return draft.name.trim().length > 0;
}

function filterPlayers(players: PlayerRow[], query: string): PlayerRow[] {
  const q = query.trim().toLowerCase();
  if (!q) return [];
  return players.filter(
    (p) =>
      p.name.toLowerCase().includes(q) ||
      p.team_country.toLowerCase().includes(q) ||
      p.team_code.toLowerCase().includes(q) ||
      (p.group_code ?? "").toLowerCase().includes(q) ||
      (p.position ?? "").toLowerCase().includes(q) ||
      positionLabel(p.position).toLowerCase().includes(q) ||
      (p.club ?? "").toLowerCase().includes(q) ||
      (p.club_country ?? "").toLowerCase().includes(q),
  );
}

function teamLabel(team: AdminTeamRow): string {
  return team.group_code
    ? `Grupo ${team.group_code} · ${team.country} (${team.code})`
    : `${team.country} (${team.code})`;
}

function filterTeams(teams: AdminTeamRow[], query: string): AdminTeamRow[] {
  const q = query.trim().toLowerCase();
  if (!q) return teams;
  return teams.filter(
    (team) =>
      team.country.toLowerCase().includes(q) ||
      team.code.toLowerCase().includes(q) ||
      (team.group_code ?? "").toLowerCase().includes(q) ||
      teamLabel(team).toLowerCase().includes(q),
  );
}

type TeamSelectProps = {
  id: string;
  teams: AdminTeamRow[];
  value: string;
  onChange: (teamId: string) => void;
};

function TeamSelect({ id, teams, value, onChange }: TeamSelectProps) {
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
    () => teams.find((team) => team.id_team.toString() === value) ?? null,
    [teams, value],
  );

  const filtered = useMemo(
    () => filterTeams(teams, query).slice(0, 50),
    [teams, query],
  );

  function handleSelect(teamId: number) {
    onChange(teamId.toString());
    setQuery("");
    setOpen(false);
  }

  return (
    <div ref={containerRef} className="relative flex flex-col gap-1.5">
      <Label htmlFor={id} className="font-geist text-xs text-on-surface-variant">
        Selección
      </Label>
      {selected && !open ? (
        <button
          type="button"
          id={id}
          onClick={() => setOpen(true)}
          className="flex h-10 w-full items-center justify-between rounded-lg border border-outline-variant bg-surface-container-lowest px-3 text-left font-geist text-sm text-on-surface"
        >
          <span className="flex min-w-0 items-center gap-2">
            <TeamFlag code={selected.code} country={selected.country} />
            <span className="truncate">{teamLabel(selected)}</span>
          </span>
          <span className="ml-2 shrink-0 text-xs text-primary">Cambiar</span>
        </button>
      ) : (
        <>
          <Input
            id={id}
            type="search"
            placeholder="Buscar selección o grupo…"
            value={query}
            onChange={(e) => {
              setQuery(e.target.value);
              setOpen(true);
            }}
            onFocus={() => setOpen(true)}
            className="h-10 border-outline-variant bg-surface-container-lowest font-geist text-sm text-on-surface"
            autoComplete="off"
          />
          {open ? (
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
                      className="flex w-full items-center gap-2 p-3! text-left font-geist text-sm hover:bg-surface-container-high"
                    >
                      <TeamFlag code={team.code} country={team.country} />
                      <span className="min-w-0 truncate text-on-surface">
                        {teamLabel(team)}
                      </span>
                    </button>
                  </li>
                ))
              )}
            </ul>
          ) : null}
        </>
      )}
    </div>
  );
}

type PositionSelectProps = {
  id: string;
  label: string;
  value: string;
  onChange: (position: PositionCode) => void;
  disabled?: boolean;
};

function PositionSelect({
  id,
  label,
  value,
  onChange,
  disabled,
}: PositionSelectProps) {
  const [open, setOpen] = useState(false);
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!open) return;

    function close() {
      setOpen(false);
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

  const selected = POSITIONS.find((position) => position.value === value);

  function handleSelect(code: PositionCode) {
    onChange(code);
    setOpen(false);
  }

  return (
    <div ref={containerRef} className="relative flex flex-col gap-1.5 w-full">
      <Label htmlFor={id} className="font-geist text-xs text-on-surface-variant">
        {label}
      </Label>
      <button
        type="button"
        id={id}
        disabled={disabled}
        aria-haspopup="listbox"
        aria-expanded={open}
        onClick={() => setOpen((current) => !current)}
        className={cn(
          "flex h-10 w-full items-center justify-between rounded-md border border-outline-variant bg-surface-container-lowest px-3 text-left font-geist text-sm text-on-surface",
          disabled && "cursor-not-allowed opacity-50",
        )}
      >
        <span>{selected?.label ?? positionLabel(value)}</span>
        <MaterialIcon
          name="expand_more"
          className={cn("text-lg text-on-surface-variant transition-transform", open && "rotate-180")}
        />
      </button>
      {open ? (
        <ul
          role="listbox"
          aria-labelledby={id}
          className="absolute top-full z-20 mt-1 w-full overflow-hidden rounded-md border border-outline-variant bg-card shadow-lg"
        >
          {POSITIONS.map((position) => (
            <li key={position.value}>
              <button
                type="button"
                role="option"
                aria-selected={value === position.value}
                onClick={() => handleSelect(position.value)}
                className={cn(
                  "flex w-full items-center px-3 py-2 text-left font-geist text-sm hover:bg-surface-container-high",
                  value === position.value
                    ? "bg-surface-container-high text-primary"
                    : "text-on-surface",
                )}
              >
                {position.label}
              </button>
            </li>
          ))}
        </ul>
      ) : null}
    </div>
  );
}

export function AdminSquadsSection({
  teams,
  players: initialPlayers,
}: AdminSquadsSectionProps) {
  const router = useRouter();
  const [players, setPlayers] = useState(initialPlayers);
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedTeamId, setSelectedTeamId] = useState<string>(
    teams[0]?.id_team.toString() ?? "",
  );
  const [newPlayer, setNewPlayer] = useState<PlayerDraft>(EMPTY_DRAFT);
  const [addDialogOpen, setAddDialogOpen] = useState(false);
  const [editingId, setEditingId] = useState<number | null>(null);
  const [editDraft, setEditDraft] = useState<PlayerDraft>(EMPTY_DRAFT);
  const [saving, setSaving] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  const searchResults = useMemo(
    () => filterPlayers(players, searchQuery).slice(0, 50),
    [players, searchQuery],
  );

  const selectedTeam = useMemo(
    () => teams.find((t) => t.id_team.toString() === selectedTeamId) ?? null,
    [teams, selectedTeamId],
  );

  const squadPlayers = useMemo(() => {
    if (!selectedTeam) return [];
    return players
      .filter((p) => p.id_team === selectedTeam.id_team)
      .sort((a, b) => a.name.localeCompare(b.name, "es"));
  }, [players, selectedTeam]);

  const summaryDetail =
    players.length === 0
      ? "Sin jugadores en plantillas"
      : `${players.length} jugadores · ${teams.length} selecciones`;

  function clearMessages() {
    setError(null);
    setSuccess(null);
  }

  function selectTeamFromPlayer(player: PlayerRow) {
    setSelectedTeamId(player.id_team.toString());
    setSearchQuery("");
    clearMessages();
  }

  function handleTeamChange(teamId: string) {
    setSelectedTeamId(teamId);
    cancelEdit();
    clearMessages();
  }

  function openAddDialog() {
    setNewPlayer(EMPTY_DRAFT);
    clearMessages();
    setAddDialogOpen(true);
  }

  function closeAddDialog() {
    setAddDialogOpen(false);
    setNewPlayer(EMPTY_DRAFT);
  }

  function startEdit(player: PlayerRow) {
    setEditingId(player.id_player);
    setEditDraft(playerToDraft(player));
    clearMessages();
  }

  function cancelEdit() {
    setEditingId(null);
    setEditDraft(EMPTY_DRAFT);
  }

  async function handleAddPlayer(event: React.FormEvent) {
    event.preventDefault();
    if (!selectedTeam || !draftIsValid(newPlayer)) return;

    const payload = {
      id_team: selectedTeam.id_team,
      name: newPlayer.name.trim(),
      position: newPlayer.position || null,
      club: newPlayer.club.trim() || null,
      club_country: null,
    };

    setSaving("add");
    clearMessages();

    const supabase = createClient();
    const { data, error: insertError } = await supabase
      .from("players")
      .insert(payload)
      .select("id_player, name, position, club, club_country, id_team")
      .single();

    setSaving(null);

    if (insertError) {
      setError(insertError.message);
      return;
    }

    const inserted: PlayerRow = {
      id_player: data.id_player,
      name: data.name,
      position: data.position,
      club: data.club,
      club_country: data.club_country,
      id_team: data.id_team,
      team_code: selectedTeam.code,
      team_country: selectedTeam.country,
      group_code: selectedTeam.group_code,
    };

    setPlayers((prev) => [...prev, inserted]);
    closeAddDialog();
    setSuccess(`${inserted.name} agregado a ${selectedTeam.country}.`);
    router.refresh();
  }

  async function handleSaveEdit(idPlayer: number) {
    if (!draftIsValid(editDraft)) return;

    const existing = players.find((p) => p.id_player === idPlayer);
    if (!existing) return;

    const payload = {
      name: editDraft.name.trim(),
      position: editDraft.position || null,
      club: editDraft.club.trim() || null,
    };

    setSaving(`edit:${idPlayer}`);
    clearMessages();

    const supabase = createClient();
    const { error: updateError } = await supabase
      .from("players")
      .update(payload)
      .eq("id_player", idPlayer);

    setSaving(null);

    if (updateError) {
      setError(updateError.message);
      return;
    }

    setPlayers((prev) =>
      prev.map((p) =>
        p.id_player === idPlayer
          ? {
              ...p,
              name: payload.name,
              position: payload.position,
              club: payload.club,
            }
          : p,
      ),
    );
    setEditingId(null);
    setSuccess(`${payload.name} actualizado.`);
    router.refresh();
  }

  async function handleDelete(idPlayer: number) {
    const existing = players.find((p) => p.id_player === idPlayer);
    if (!existing) return;
    if (
      !window.confirm(
        `¿Eliminar a ${existing.name} de la plantilla de ${existing.team_country}?`,
      )
    ) {
      return;
    }

    setSaving(`delete:${idPlayer}`);
    clearMessages();

    const supabase = createClient();
    const { error: deleteError } = await supabase
      .from("players")
      .delete()
      .eq("id_player", idPlayer);

    setSaving(null);

    if (deleteError) {
      setError(deleteError.message);
      return;
    }

    setPlayers((prev) => prev.filter((p) => p.id_player !== idPlayer));
    if (editingId === idPlayer) cancelEdit();
    setSuccess(`${existing.name} eliminado de la plantilla.`);
    router.refresh();
  }

  return (
    <CollapsibleSection
      title="Plantillas de los equipos"
      subtitle={summaryDetail}
      titleContent={
        <CollapsibleInlineHeader
          title="Plantillas"
          detail={summaryDetail}
          layout="responsive"
          className="text-black [&_span]:text-black!"
        />
      }
      defaultOpen={false}
      className="admin-light-surface bg-white"
      headerClassName="bg-white transition-[background-color] hover:bg-surface-container-lowest/60"
    >
      <div className="flex flex-col gap-4 px-4 py-4">
        <p className="font-geist text-xs md:text-sm text-on-surface-variant">
          Busca jugadores en todas las selecciones, edita plantillas y agrega
          nuevos jugadores a cada equipo.
        </p>

        {error ? (
          <Alert variant="destructive">
            <p className="font-geist text-sm">{error}</p>
          </Alert>
        ) : null}
        {success ? (
          <Alert>
            <p className="font-geist text-sm">{success}</p>
          </Alert>
        ) : null}

        <div className="flex flex-col gap-1.5">
          <div className="relative">
            <MaterialIcon
              name="search"
              className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-lg text-on-surface-variant"
            />
            <Input
              type="search"
              role="searchbox"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="Buscar jugador, selección o club…"
              aria-label="Buscar jugador, selección o club"
              autoComplete="off"
              className="h-11 border-outline-variant bg-surface-container-lowest pl-10 pr-10 font-geist text-sm text-on-surface placeholder:text-on-surface-variant"
            />
            {searchQuery.trim() ? (
              <button
                type="button"
                onClick={() => setSearchQuery("")}
                className="absolute right-1 top-1/2 flex h-10 w-10 -translate-y-1/2 items-center justify-center rounded-md text-on-surface-variant transition-colors hover:bg-surface-container-high hover:text-primary"
                aria-label="Limpiar búsqueda"
              >
                <MaterialIcon name="close" className="text-lg" />
              </button>
            ) : null}
          </div>
          {searchQuery.trim() ? (
            <p className="font-geist text-xs text-on-surface-variant">
              {searchResults.length === 0
                ? "Ningún jugador coincide con la búsqueda"
                : `${searchResults.length} jugador${searchResults.length === 1 ? "" : "es"} encontrado${searchResults.length === 1 ? "" : "s"}`}
            </p>
          ) : null}
        </div>

        {searchQuery.trim() ? (
          <div className="rounded-md border border-black/10">
            {searchResults.length === 0 ? (
              <p className="px-3 py-2 font-geist text-sm text-on-surface-variant">
                Ningún jugador coincide con la búsqueda
              </p>
            ) : (
              <ul className="max-h-64 divide-y divide-black/10 overflow-y-auto">
                {searchResults.map((player) => (
                  <li key={player.id_player}>
                    <button
                      type="button"
                      onClick={() => selectTeamFromPlayer(player)}
                      className="flex w-full items-center gap-3 px-3 py-2 text-left hover:bg-surface-container-high"
                    >
                      <TeamFlag code={player.team_code} country={player.team_country} />
                      <span className="min-w-0 flex-1">
                        <span className="block truncate font-geist text-sm font-medium text-on-surface">
                          {player.name}
                        </span>
                        <span className="block truncate font-geist text-xs text-on-surface-variant">
                          {player.team_country}
                          {player.group_code ? ` · Grupo ${player.group_code}` : ""}
                          {player.position ? ` · ${positionLabel(player.position)}` : ""}
                          {player.club ? ` · ${player.club}` : ""}
                        </span>
                      </span>
                    </button>
                  </li>
                ))}
              </ul>
            )}
          </div>
        ) : null}

        <TeamSelect
          id="admin-squad-team"
          teams={teams}
          value={selectedTeamId}
          onChange={handleTeamChange}
        />

        {selectedTeam ? (
          <>
            <div className="flex items-start justify-between gap-2">
              <div className="flex min-w-0 flex-col items-start gap-0.5">
                <div className="flex items-center gap-1">
                  <TeamFlag code={selectedTeam.code} country={selectedTeam.country} />
                  <h3 className="font-geist text-sm font-semibold text-on-surface">
                    {selectedTeam.country}
                    {selectedTeam.group_code ? ` (Grupo ${selectedTeam.group_code})` : ""}
                  </h3>
                </div>
                <span className="font-geist text-xs text-on-surface-variant">
                  {squadPlayers.length} jugador{squadPlayers.length === 1 ? "" : "es"}
                </span>
              </div>
              <Button
                type="button"
                size="sm"
                variant="outline"
                onClick={openAddDialog}
                className="shrink-0"
              >
                <MaterialIcon name="person_add" className="text-base" />
                Agregar jugador
              </Button>
            </div>

            {squadPlayers.length === 0 ? (
              <p className="font-geist text-sm text-on-surface-variant">
                Esta selección aún no tiene jugadores registrados.
              </p>
            ) : (
              <ul className="max-h-96 divide-y divide-black/10 overflow-y-auto rounded-md border border-black/10">
                {squadPlayers.map((player) => {
                  const isEditing = editingId === player.id_player;
                  const isSaving =
                    saving === `edit:${player.id_player}` ||
                    saving === `delete:${player.id_player}`;

                  if (isEditing) {
                    return (
                      <li key={player.id_player} className="flex flex-col gap-3 p-3">
                        <PlayerFields
                          idPrefix={`edit-${player.id_player}`}
                          draft={editDraft}
                          onChange={setEditDraft}
                          disabled={isSaving}
                          spanishLabels
                        />
                        <div className="flex flex-wrap gap-2">
                          <Button
                            type="button"
                            size="sm"
                            disabled={!draftIsValid(editDraft) || isSaving}
                            onClick={() => handleSaveEdit(player.id_player)}
                            className="text-white!"
                          >
                            Guardar
                          </Button>
                          <Button
                            type="button"
                            size="sm"
                            variant="outline"
                            disabled={isSaving}
                            onClick={cancelEdit}
                          >
                            Cancelar
                          </Button>
                        </div>
                      </li>
                    );
                  }

                  return (
                    <li
                      key={player.id_player}
                      className="flex flex-col gap-2 p-3 sm:flex-row sm:items-center sm:justify-between"
                    >
                      <div className="min-w-0">
                        <p className="font-geist text-sm font-medium text-on-surface">
                          {player.name}
                        </p>
                        <p className="font-geist text-xs text-on-surface-variant">
                          {positionLabel(player.position)}
                          {player.club ? ` · ${player.club}` : ""}
                          {player.club_country ? ` (${player.club_country})` : ""}
                        </p>
                      </div>
                      <div className="flex shrink-0 gap-2">
                        <Button
                          type="button"
                          size="sm"
                          variant="outline"
                          disabled={isSaving}
                          onClick={() => startEdit(player)}
                        >
                          Editar
                        </Button>
                        <Button
                          type="button"
                          size="sm"
                          variant="ghost"
                          disabled={isSaving}
                          onClick={() => handleDelete(player.id_player)}
                          className="text-destructive hover:text-destructive"
                        >
                          Eliminar
                        </Button>
                      </div>
                    </li>
                  );
                })}
              </ul>
            )}

            <Dialog
              open={addDialogOpen}
              onOpenChange={(open) => {
                if (!open) closeAddDialog();
              }}
            >
              <DialogContent>
                <form onSubmit={handleAddPlayer} className="flex flex-col gap-4">
                  <DialogHeader>
                    <DialogTitle>Agregar jugador</DialogTitle>
                    <p className="font-geist text-sm text-on-surface-variant">
                      {selectedTeam.country}
                      {selectedTeam.group_code ? ` · Grupo ${selectedTeam.group_code}` : ""}
                    </p>
                  </DialogHeader>
                  <PlayerFields
                    idPrefix="new"
                    draft={newPlayer}
                    onChange={setNewPlayer}
                    disabled={saving === "add"}
                    spanishLabels
                  />
                  <DialogFooter className="flex-col items-center gap-3 sm:items-center">
                    <Button
                      type="submit"
                      disabled={!draftIsValid(newPlayer) || saving === "add"}
                      className={SAVE_BUTTON_CLASS}
                    >
                      {saving === "add" ? (
                        <>
                          <MaterialIcon
                            name="progress_activity"
                            className="animate-spin text-base"
                          />
                          Guardando…
                        </>
                      ) : (
                        "Agregar a plantilla"
                      )}
                    </Button>
                    <Button
                      type="button"
                      variant="outline"
                      disabled={saving === "add"}
                      onClick={closeAddDialog}
                    >
                      Cancelar
                    </Button>
                  </DialogFooter>
                </form>
              </DialogContent>
            </Dialog>
          </>
        ) : null}
      </div>
    </CollapsibleSection>
  );
}

type PlayerFieldsProps = {
  idPrefix: string;
  draft: PlayerDraft;
  onChange: (draft: PlayerDraft) => void;
  disabled?: boolean;
  spanishLabels?: boolean;
};

function PlayerFields({
  idPrefix,
  draft,
  onChange,
  disabled,
  spanishLabels = false,
}: PlayerFieldsProps) {
  const labels = spanishLabels
    ? {
        name: "Nombre",
        position: "Posición",
        club: "Club",
      }
    : {
        name: "name",
        position: "position",
        club: "club",
      };

  return (
    <div className="flex flex-col gap-2">
      <div className="flex flex-col gap-1.5 sm:col-span-2">
        <Label htmlFor={`${idPrefix}-name`} className="font-geist text-xs text-on-surface-variant">
          {labels.name}
        </Label>
        <Input
          id={`${idPrefix}-name`}
          value={draft.name}
          onChange={(e) => onChange({ ...draft, name: e.target.value })}
          disabled={disabled}
          required
          className="h-9 rounded-md border-outline-variant bg-surface-container-lowest font-geist text-sm text-on-surface"
        />
      </div>
      <PositionSelect
        id={`${idPrefix}-position`}
        label={labels.position}
        value={draft.position}
        onChange={(position) => onChange({ ...draft, position })}
        disabled={disabled}
      />
      <div className="flex flex-col gap-1.5 sm:col-span-2">
        <Label htmlFor={`${idPrefix}-club`} className="font-geist text-xs text-on-surface-variant">
          {labels.club}
        </Label>
        <Input
          id={`${idPrefix}-club`}
          value={draft.club}
          onChange={(e) => onChange({ ...draft, club: e.target.value })}
          disabled={disabled}
          className="h-9 rounded-md border-outline-variant bg-surface-container-lowest font-geist text-sm text-on-surface"
        />
      </div>
    </div>
  );
}
