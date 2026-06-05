"use client";

import { Fragment, useState } from "react";
import { CollapsibleSection } from "@/components/collapsible-section";
import { MaterialIcon } from "@/components/material-icon";
import { AdminMatchGoals } from "@/components/admin/admin-match-goals";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import type { AdminFixtureRow, MatchGoalRow, MatchResultDraft } from "@/lib/admin-types";
import { deriveFirstGoalFromGoals } from "@/lib/admin-utils";
import {
  formatFixtureDateTime,
  isKnockoutFixture,
} from "@/lib/predictions-utils";
import type { PlayerRow } from "@/lib/predictions-types";
import { MATCH_TIMEZONE_ABBR } from "@/lib/match-timezone";
import { teamFlagUrl, teamInitials } from "@/lib/team-display";
import { cn } from "@/lib/utils";

type AdminMatchSectionProps = {
  title: string;
  fixtures: AdminFixtureRow[];
  drafts: Record<number, MatchResultDraft>;
  baselines: Record<number, MatchResultDraft>;
  savedMatches: Set<number>;
  goalsByMatch: Record<number, MatchGoalRow[]>;
  players: PlayerRow[];
  savingMatchId: number | null;
  onDraftChange: (idMatch: number, field: keyof MatchResultDraft, value: string) => void;
  onSaveMatch: (idMatch: number) => void;
  onAddGoal: (
    idMatch: number,
    payload: { id_player: number; minute: number; is_own_goal: boolean },
  ) => Promise<string | null>;
  onDeleteGoal: (idMatch: number, idGoal: number) => Promise<string | null>;
};

const scoreInputClass =
  "h-10 w-12 rounded-md border border-border/60 bg-white text-center font-headline text-xl font-bold text-on-surface tabular-nums transition-all focus:border-primary focus:outline-none focus:ring-2 focus:ring-primary/15 sm:h-11 sm:w-14 sm:text-2xl";

const fieldInputClass =
  "h-10 rounded-md border border-border/60 bg-white font-geist text-base text-on-surface focus:border-primary focus:outline-none focus:ring-2 focus:ring-primary/15 disabled:cursor-not-allowed disabled:opacity-50";

function TeamCell({
  country,
  code,
  align,
}: {
  country: string;
  code: string;
  align: "left" | "right";
}) {
  const flagUrl = teamFlagUrl(code);

  return (
    <div
      className={cn(
        "flex items-center gap-2",
        align === "right" && "flex-row-reverse text-right",
      )}
    >
      <div className="flex h-8 w-8 shrink-0 items-center justify-center overflow-hidden rounded-full border border-border/50 bg-muted/50">
        {flagUrl ? (
          // eslint-disable-next-line @next/next/no-img-element
          <img
            src={flagUrl}
            alt={country}
            className="h-full w-full object-cover"
            onError={(e) => {
              e.currentTarget.style.display = "none";
            }}
          />
        ) : (
          <span className="font-mono text-[10px] font-bold text-primary">
            {teamInitials(code)}
          </span>
        )}
      </div>
      <div className="min-w-0">
        <p className="truncate font-geist text-base font-medium text-on-surface">
          {country}
        </p>
        <p className="font-mono text-xs text-on-surface-variant">{code}</p>
      </div>
    </div>
  );
}

function AdminMatchForm({
  fixture,
  draft,
  goals,
  players,
  saving,
  dirty,
  onDraftChange,
  onSave,
  onAddGoal,
  onDeleteGoal,
}: {
  fixture: AdminFixtureRow;
  draft: MatchResultDraft;
  goals: MatchGoalRow[];
  players: PlayerRow[];
  saving: boolean;
  dirty: boolean;
  onDraftChange: (field: keyof MatchResultDraft, value: string) => void;
  onSave: () => void;
  onAddGoal: (payload: {
    id_player: number;
    minute: number;
    is_own_goal: boolean;
  }) => Promise<string | null>;
  onDeleteGoal: (idGoal: number) => Promise<string | null>;
}) {
  const isKnockout = isKnockoutFixture(fixture);
  const derivedFirstGoal = deriveFirstGoalFromGoals(goals, players);

  return (
    <div className="space-y-4">
      <p className="font-geist text-sm text-on-surface-variant">
        Marcador de 90 minutos obligatorio. Prórroga y penales solo si aplican.
      </p>

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <div className="flex flex-col gap-2">
          <Label className="font-geist text-sm text-on-surface-variant">
            Goles local (90 min)
          </Label>
          <Input
            type="number"
            min={0}
            max={99}
            value={draft.goalsHome}
            onChange={(e) => onDraftChange("goalsHome", e.target.value)}
            disabled={saving}
            className={fieldInputClass}
          />
        </div>
        <div className="flex flex-col gap-2">
          <Label className="font-geist text-sm text-on-surface-variant">
            Goles visitante (90 min)
          </Label>
          <Input
            type="number"
            min={0}
            max={99}
            value={draft.goalsAway}
            onChange={(e) => onDraftChange("goalsAway", e.target.value)}
            disabled={saving}
            className={fieldInputClass}
          />
        </div>
        {isKnockout && (
          <>
            <div className="flex flex-col gap-2">
              <Label className="font-geist text-sm text-on-surface-variant">
                Goles local (prórroga total)
              </Label>
              <Input
                type="number"
                min={0}
                max={99}
                value={draft.goalsHomeEt}
                onChange={(e) => onDraftChange("goalsHomeEt", e.target.value)}
                disabled={saving}
                className={fieldInputClass}
                placeholder="Opcional"
              />
            </div>
            <div className="flex flex-col gap-2">
              <Label className="font-geist text-sm text-on-surface-variant">
                Goles visitante (prórroga total)
              </Label>
              <Input
                type="number"
                min={0}
                max={99}
                value={draft.goalsAwayEt}
                onChange={(e) => onDraftChange("goalsAwayEt", e.target.value)}
                disabled={saving}
                className={fieldInputClass}
                placeholder="Opcional"
              />
            </div>
            <div className="flex flex-col gap-2">
              <Label className="font-geist text-sm text-on-surface-variant">
                Penales local
              </Label>
              <Input
                type="number"
                min={0}
                max={20}
                value={draft.pensHome}
                onChange={(e) => onDraftChange("pensHome", e.target.value)}
                disabled={saving}
                className={fieldInputClass}
                placeholder="Opcional"
              />
            </div>
            <div className="flex flex-col gap-2">
              <Label className="font-geist text-sm text-on-surface-variant">
                Penales visitante
              </Label>
              <Input
                type="number"
                min={0}
                max={20}
                value={draft.pensAway}
                onChange={(e) => onDraftChange("pensAway", e.target.value)}
                disabled={saving}
                className={fieldInputClass}
                placeholder="Opcional"
              />
            </div>
          </>
        )}
      </div>

      <AdminMatchGoals
        fixture={fixture}
        draft={draft}
        goals={goals}
        players={players}
        derivedFirstGoal={derivedFirstGoal}
        saving={saving}
        onAddGoal={onAddGoal}
        onDeleteGoal={onDeleteGoal}
      />

      <div className="flex justify-end">
        <Button type="button" onClick={onSave} disabled={saving || !dirty}>
          {saving ? "Guardando…" : "Guardar partido"}
        </Button>
      </div>
    </div>
  );
}

export function AdminMatchSection({
  title,
  fixtures,
  drafts,
  baselines,
  savedMatches,
  goalsByMatch,
  players,
  savingMatchId,
  onDraftChange,
  onSaveMatch,
  onAddGoal,
  onDeleteGoal,
}: AdminMatchSectionProps) {
  const [expandedMatches, setExpandedMatches] = useState<Set<number>>(new Set());

  if (fixtures.length === 0) return null;

  function toggleExpanded(idMatch: number) {
    setExpandedMatches((prev) => {
      const next = new Set(prev);
      if (next.has(idMatch)) {
        next.delete(idMatch);
      } else {
        next.add(idMatch);
      }
      return next;
    });
  }

  const subtitle = `${fixtures.length} partido${fixtures.length === 1 ? "" : "s"}`;

  return (
    <CollapsibleSection
      title={title}
      subtitle={subtitle}
      defaultOpen
      className="border-border/50 bg-white shadow-sm [&_button]:border-border/40 [&_button]:bg-slate-50 [&_button]:px-5 [&_button]:py-4 [&_button]:hover:bg-slate-100 [&_button_h2]:text-base [&_button_h2]:text-slate-900 [&_button_p]:text-sm [&_button_p]:text-slate-600 [&_button_.material-symbols-outlined]:text-slate-600"
    >
      <div className="overflow-x-auto px-1 pb-2">
        <table className="w-full min-w-[720px] text-left text-base">
          <thead>
            <tr className="border-b border-border/40 bg-primary-fixed/25">
              <th className="w-10 px-2 py-3" aria-label="Editar resultado" />
              <th className="text-center px-3 py-3 font-geist text-sm font-semibold uppercase tracking-wide text-primary">
                Fecha/Hora
              </th>
              <th className="px-3 py-3 font-geist text-sm font-semibold uppercase tracking-wide text-primary">
                Local
              </th>
              <th className="px-3 py-3 text-center font-geist text-sm font-semibold uppercase tracking-wide text-primary">
                Marcador
              </th>
              <th className="text-right px-3 py-3 font-geist text-sm font-semibold uppercase tracking-wide text-primary">
                Visitante
              </th>
              <th className="text-center px-3 py-3 font-geist text-sm font-semibold uppercase tracking-wide text-primary">
                Resultado
              </th>
            </tr>
          </thead>
          <tbody>
            {fixtures.map((fixture) => {
              const draft = drafts[fixture.id_match] ?? {
                goalsHome: "",
                goalsAway: "",
                goalsHomeEt: "",
                goalsAwayEt: "",
                pensHome: "",
                pensAway: "",
                firstGoalMinute: "",
                firstGoalPlayerId: "",
              };
              const baseline = baselines[fixture.id_match] ?? draft;
              const { dateShort, timeShort } = formatFixtureDateTime(
                fixture.match_date,
                fixture.match_time,
              );
              const isSaved = savedMatches.has(fixture.id_match);
              const isExpanded = expandedMatches.has(fixture.id_match);
              const saving = savingMatchId === fixture.id_match;
              const dirty =
                draft.goalsHome !== baseline.goalsHome ||
                draft.goalsAway !== baseline.goalsAway ||
                draft.goalsHomeEt !== baseline.goalsHomeEt ||
                draft.goalsAwayEt !== baseline.goalsAwayEt ||
                draft.pensHome !== baseline.pensHome ||
                draft.pensAway !== baseline.pensAway;
              const matchGoals = goalsByMatch[fixture.id_match] ?? [];

              return (
                <Fragment key={fixture.id_match}>
                  <tr className="border-b border-border/30 hover:bg-muted/20">
                    <td className="px-2 py-4 align-middle">
                      <button
                        type="button"
                        onClick={() => toggleExpanded(fixture.id_match)}
                        className="flex h-9 w-9 items-center justify-center rounded-md text-slate-600 transition-colors hover:bg-slate-100 hover:text-primary"
                        aria-expanded={isExpanded}
                        aria-label={
                          isExpanded ? "Ocultar formulario" : "Editar resultado"
                        }
                      >
                        <MaterialIcon
                          name={isExpanded ? "remove_circle" : "add_circle"}
                          className="text-xl"
                        />
                      </button>
                    </td>

                    <td className="text-center px-3 py-4 align-middle">
                      <p className="font-geist text-sm capitalize text-on-surface">
                        {dateShort}
                      </p>
                      <p className="font-mono text-sm text-on-surface-variant">
                        {timeShort} {MATCH_TIMEZONE_ABBR}
                      </p>
                    </td>

                    <td className="px-3 py-4 align-middle">
                      <TeamCell
                        country={fixture.home_country}
                        code={fixture.home_code}
                        align="left"
                      />
                    </td>

                    <td className="px-3 py-4 align-middle">
                      <div className="flex items-center justify-center gap-1.5">
                        <span className={cn(scoreInputClass, "flex items-center justify-center")}>
                          {draft.goalsHome !== "" ? draft.goalsHome : "–"}
                        </span>
                        <span className="font-headline text-lg font-bold text-slate-500">
                          –
                        </span>
                        <span className={cn(scoreInputClass, "flex items-center justify-center")}>
                          {draft.goalsAway !== "" ? draft.goalsAway : "–"}
                        </span>
                      </div>
                    </td>

                    <td className="px-3 py-4 align-middle">
                      <TeamCell
                        country={fixture.away_country}
                        code={fixture.away_code}
                        align="right"
                      />
                    </td>

                    <td className="text-center px-3 py-4 align-middle">
                      {isSaved ? (
                        <span className="inline-flex items-center gap-1 rounded-md bg-primary/10 px-2 py-0.5 font-geist text-sm font-medium text-primary">
                          <MaterialIcon name="check_circle" className="text-base" />
                          Con resultado
                        </span>
                      ) : (
                        <span className="inline-flex rounded-md bg-slate-100 px-2 py-0.5 font-geist text-sm font-medium text-slate-700">
                          Pendiente
                        </span>
                      )}
                      {dirty && !isExpanded && (
                        <span className="mt-1 block font-geist text-xs text-accent">
                          Cambios sin guardar
                        </span>
                      )}
                    </td>
                  </tr>

                  {isExpanded && (
                    <tr className="border-b border-border/30 bg-slate-50 last:border-0">
                      <td colSpan={6} className="px-5 py-5">
                        <AdminMatchForm
                          fixture={fixture}
                          draft={draft}
                          goals={matchGoals}
                          players={players}
                          saving={saving}
                          dirty={dirty}
                          onDraftChange={(field, value) =>
                            onDraftChange(fixture.id_match, field, value)
                          }
                          onSave={() => onSaveMatch(fixture.id_match)}
                          onAddGoal={(payload) => onAddGoal(fixture.id_match, payload)}
                          onDeleteGoal={(idGoal) => onDeleteGoal(fixture.id_match, idGoal)}
                        />
                      </td>
                    </tr>
                  )}
                </Fragment>
              );
            })}
          </tbody>
        </table>
      </div>
    </CollapsibleSection>
  );
}
