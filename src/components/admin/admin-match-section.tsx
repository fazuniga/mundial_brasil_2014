"use client";

import { Fragment, useState, type ComponentProps } from "react";
import { CollapsibleSection } from "@/components/collapsible-section";
import { MaterialIcon } from "@/components/material-icon";
import {
  AdminDerivedFirstGoal,
  AdminMatchGoals,
} from "@/components/admin/admin-match-goals";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import type { AdminFixtureRow, MatchGoalRow, MatchResultDraft } from "@/lib/admin-types";
import {
  deriveFirstGoalFromGoals,
  deriveScoreFromGoals,
  canSaveAdminMatch,
  isAdminMatchDirty,
} from "@/lib/admin-utils";
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
  baselineGoalsByMatch: Record<number, MatchGoalRow[]>;
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

const labeledScoreFieldClass =
  "flex items-center overflow-hidden rounded-md border border-border/60 bg-white transition-all focus-within:border-primary focus-within:outline-none focus-within:ring-2 focus-within:ring-primary/15 has-[:disabled]:cursor-not-allowed has-[:disabled]:opacity-50";

const labeledScoreInputClass =
  "h-10 min-w-0 flex-1 border-0 rounded-none bg-transparent px-2 font-geist text-base text-on-surface shadow-none focus-visible:border-0 focus-visible:outline-none focus-visible:ring-0 focus-visible:ring-offset-0 disabled:cursor-not-allowed";

function regulationScoreDisplay(
  fixture: AdminFixtureRow,
  goals: MatchGoalRow[],
  players: PlayerRow[],
  draft: MatchResultDraft,
  isSaved: boolean,
): { home: string; away: string } | null {
  if (goals.length > 0 || isSaved) {
    const derived = deriveScoreFromGoals(
      goals,
      fixture.home_team_id,
      fixture.away_team_id,
      players,
    );
    return {
      home: derived.goalsHome.toString(),
      away: derived.goalsAway.toString(),
    };
  }

  if (draft.goalsHome !== "" && draft.goalsAway !== "") {
    return { home: draft.goalsHome, away: draft.goalsAway };
  }

  return null;
}

function LabeledScoreInput({
  label,
  id,
  ...props
}: {
  label: string;
  id: string;
} & ComponentProps<typeof Input>) {
  return (
    <div className={labeledScoreFieldClass}>
      <span
        id={`${id}-label`}
        className="shrink-0 border-r border-border/40 px-2.5 py-2 font-geist text-xs leading-tight text-on-surface-variant"
      >
        {label}
      </span>
      <Input
        id={id}
        aria-labelledby={`${id}-label`}
        className={labeledScoreInputClass}
        {...props}
      />
    </div>
  );
}

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
        <p className="truncate font-geist text-xs md:text-sm font-medium text-on-surface">
          {country}
        </p>
        <p className="font-mono text-xs text-on-surface-variant">{code}</p>
      </div>
    </div>
  );
}

function AdminMatchCard({
  fixture,
  draft,
  baseline,
  goals,
  baselineGoals,
  players,
  isSaved,
  isExpanded,
  saving,
  dirty,
  onToggleExpanded,
  onDraftChange,
  onSave,
  onAddGoal,
  onDeleteGoal,
}: {
  fixture: AdminFixtureRow;
  draft: MatchResultDraft;
  baseline: MatchResultDraft;
  goals: MatchGoalRow[];
  baselineGoals: MatchGoalRow[];
  players: PlayerRow[];
  isSaved: boolean;
  isExpanded: boolean;
  saving: boolean;
  dirty: boolean;
  onToggleExpanded: () => void;
  onDraftChange: (field: keyof MatchResultDraft, value: string) => void;
  onSave: () => void;
  onAddGoal: (payload: {
    id_player: number;
    minute: number;
    is_own_goal: boolean;
  }) => Promise<string | null>;
  onDeleteGoal: (idGoal: number) => Promise<string | null>;
}) {
  const { dateShort, timeShort } = formatFixtureDateTime(
    fixture.match_date,
    fixture.match_time,
  );
  const score = regulationScoreDisplay(fixture, goals, players, draft, isSaved);

  return (
    <article className="rounded-lg border border-border/50 bg-slate-50/50 p-4 shadow-sm">
      <div className="flex flex-col gap-3">
        <div className="flex items-start justify-between gap-2">
          <div className="shrink-0">
            <p className="font-geist text-sm capitalize text-on-surface">{dateShort}</p>
            <p className="font-mono text-xs text-on-surface-variant">
              {timeShort} {MATCH_TIMEZONE_ABBR}
            </p>
          </div>
          <div className="text-right">
            {isSaved ? (
              <span className="inline-flex items-center gap-1 rounded-md bg-primary/10 px-2 py-0.5 font-geist text-xs font-medium text-primary">
                <MaterialIcon name="check_circle" className="text-base" />
                Con resultado
              </span>
            ) : (
              <span className="border border-border/40 inline-flex rounded-md bg-slate-100 px-2 py-0.5 font-geist text-xs font-medium text-slate-700">
                Pendiente
              </span>
            )}
            {dirty && !isExpanded ? (
              <span className="mt-1 block font-geist text-xs text-accent">
                Cambios sin guardar
              </span>
            ) : null}
          </div>
        </div>

        <div className="flex min-w-0 items-center gap-2">
          <div className="min-w-0 flex-1">
            <TeamCell
              country={fixture.home_country}
              code={fixture.home_code}
              align="left"
            />
          </div>
          <div className="flex shrink-0 items-center gap-1">
            <span
              className={cn(
                scoreInputClass,
                "flex h-9 w-10 items-center justify-center text-lg sm:h-10 sm:w-12 sm:text-xl",
              )}
            >
              {score?.home ?? "–"}
            </span>
            <span className="hidden md:block font-headline text-base font-bold text-slate-500 readonly">–</span>
            <span
              className={cn(
                scoreInputClass,
                "flex h-9 w-10 items-center justify-center text-lg sm:h-10 sm:w-12 sm:text-xl",
              )}
            >
              {score?.away ?? "–"}
            </span>
          </div>
          <div className="min-w-0 flex-1">
            <TeamCell
              country={fixture.away_country}
              code={fixture.away_code}
              align="right"
            />
          </div>
        </div>

        <div className="flex items-center border-t border-border/30 pt-3">
          <button
            type="button"
            onClick={onToggleExpanded}
            className="flex h-9 w-9 items-center justify-center rounded-md border border-border/40 text-slate-600 transition-colors hover:bg-slate-100 hover:text-primary"
            aria-expanded={isExpanded}
            aria-label={isExpanded ? "Ocultar formulario" : "Editar resultado"}
          >
            <MaterialIcon
              name={isExpanded ? "remove_circle" : "add_circle"}
              className="text-xl"
            />
          </button>
        </div>

        {isExpanded ? (
          <div className="border-t border-border/30 pt-4">
            <AdminMatchForm
              fixture={fixture}
              draft={draft}
              baseline={baseline}
              goals={goals}
              baselineGoals={baselineGoals}
              players={players}
              isSaved={isSaved}
              saving={saving}
              onDraftChange={onDraftChange}
              onSave={onSave}
              onAddGoal={onAddGoal}
              onDeleteGoal={onDeleteGoal}
            />
          </div>
        ) : null}
      </div>
    </article>
  );
}

function AdminMatchForm({
  fixture,
  draft,
  baseline,
  goals,
  baselineGoals,
  players,
  isSaved,
  saving,
  onDraftChange,
  onSave,
  onAddGoal,
  onDeleteGoal,
}: {
  fixture: AdminFixtureRow;
  draft: MatchResultDraft;
  baseline: MatchResultDraft;
  goals: MatchGoalRow[];
  baselineGoals: MatchGoalRow[];
  players: PlayerRow[];
  isSaved: boolean;
  saving: boolean;
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
  const derivedRegulation = deriveScoreFromGoals(
    goals,
    fixture.home_team_id,
    fixture.away_team_id,
    players,
  );
  const canSave = canSaveAdminMatch(
    draft,
    baseline,
    goals,
    baselineGoals,
    isSaved,
    derivedRegulation,
  );

  return (
    <div className="space-y-4">
      <p className="font-geist text-sm text-on-surface-variant">
        Registra cada gol del partido; el marcador de 90 minutos se calcula
        automáticamente. En eliminatorias, indica prórroga y penales solo si
        aplican.
      </p>

      <AdminMatchGoals
        fixture={fixture}
        goals={goals}
        players={players}
        saving={saving}
        onAddGoal={onAddGoal}
        onDeleteGoal={onDeleteGoal}
      />

      <div className="grid gap-2 md:grid-cols-2 md:[&>*]:h-full">
        <AdminDerivedFirstGoal derivedFirstGoal={derivedFirstGoal} />
        <div className="flex h-full min-w-0 flex-col rounded-xl border border-border/50 bg-white px-4 py-3">
          <p className="font-geist text-sm font-medium text-on-surface-variant">
            Marcador 90 min (automático)
          </p>
          <div className="mt-2 flex flex-1 items-center justify-center gap-2">
            <span className={cn(scoreInputClass, "flex items-center justify-center")}>
              {derivedRegulation.goalsHome}
            </span>
            <span className="font-headline text-lg font-bold text-slate-500">–</span>
            <span className={cn(scoreInputClass, "flex items-center justify-center")}>
              {derivedRegulation.goalsAway}
            </span>
          </div>
        </div>
      </div>

      {isKnockout ? (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <LabeledScoreInput
            id={`match-${fixture.id_match}-goals-home-et`}
            label="Goles local (prórroga total)"
            type="number"
            min={0}
            max={99}
            value={draft.goalsHomeEt}
            onChange={(e) => onDraftChange("goalsHomeEt", e.target.value)}
            disabled={saving}
            placeholder="Opcional"
          />
          <LabeledScoreInput
            id={`match-${fixture.id_match}-goals-away-et`}
            label="Goles visitante (prórroga total)"
            type="number"
            min={0}
            max={99}
            value={draft.goalsAwayEt}
            onChange={(e) => onDraftChange("goalsAwayEt", e.target.value)}
            disabled={saving}
            placeholder="Opcional"
          />
          <LabeledScoreInput
            id={`match-${fixture.id_match}-pens-home`}
            label="Penales local"
            type="number"
            min={0}
            max={20}
            value={draft.pensHome}
            onChange={(e) => onDraftChange("pensHome", e.target.value)}
            disabled={saving}
            placeholder="Opcional"
          />
          <LabeledScoreInput
            id={`match-${fixture.id_match}-pens-away`}
            label="Penales visitante"
            type="number"
            min={0}
            max={20}
            value={draft.pensAway}
            onChange={(e) => onDraftChange("pensAway", e.target.value)}
            disabled={saving}
            placeholder="Opcional"
          />
        </div>
      ) : null}

      <div className="flex justify-center">
        <Button type="button" onClick={onSave} disabled={saving || !canSave} className="w-full max-w-xs bg-white! hover:bg-primary-hover! hover:text-white!">
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
  baselineGoalsByMatch,
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
      <div className="flex flex-col gap-3 p-3 md:hidden">
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
          const isSaved = savedMatches.has(fixture.id_match);
          const isExpanded = expandedMatches.has(fixture.id_match);
          const saving = savingMatchId === fixture.id_match;
          const matchGoals = goalsByMatch[fixture.id_match] ?? [];
          const baselineGoals = baselineGoalsByMatch[fixture.id_match] ?? [];
          const dirty = isAdminMatchDirty(draft, baseline, matchGoals, baselineGoals);

          return (
            <AdminMatchCard
              key={fixture.id_match}
              fixture={fixture}
              draft={draft}
              baseline={baseline}
              goals={matchGoals}
              baselineGoals={baselineGoals}
              players={players}
              isSaved={isSaved}
              isExpanded={isExpanded}
              saving={saving}
              dirty={dirty}
              onToggleExpanded={() => toggleExpanded(fixture.id_match)}
              onDraftChange={(field, value) =>
                onDraftChange(fixture.id_match, field, value)
              }
              onSave={() => onSaveMatch(fixture.id_match)}
              onAddGoal={(payload) => onAddGoal(fixture.id_match, payload)}
              onDeleteGoal={(idGoal) => onDeleteGoal(fixture.id_match, idGoal)}
            />
          );
        })}
      </div>

      <div className="hidden overflow-x-auto px-1 pb-2 md:block">
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
              const matchGoals = goalsByMatch[fixture.id_match] ?? [];
              const baselineGoals = baselineGoalsByMatch[fixture.id_match] ?? [];
              const dirty = isAdminMatchDirty(draft, baseline, matchGoals, baselineGoals);
              const score = regulationScoreDisplay(
                fixture,
                matchGoals,
                players,
                draft,
                isSaved,
              );

              return (
                <Fragment key={fixture.id_match}>
                  <tr className="border-b border-border/30 hover:bg-muted/20">
                    <td className="px-2 py-4 align-middle">
                      <button
                        type="button"
                        onClick={() => toggleExpanded(fixture.id_match)}
                        className="flex h-9 w-9 border border-border/40 items-center justify-center rounded-md text-slate-600 transition-colors hover:bg-slate-100 hover:text-primary"
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
                          {score?.home ?? "–"}
                        </span>
                        <span className="font-headline text-lg font-bold text-slate-500">
                          –
                        </span>
                        <span className={cn(scoreInputClass, "flex items-center justify-center")}>
                          {score?.away ?? "–"}
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
                        <span className="inline-flex items-center gap-1 rounded-md bg-primary/10 px-2 py-0.5 font-geist text-xs font-medium text-primary">
                          <MaterialIcon name="check_circle" className="text-xs" />
                          Con resultado
                        </span>
                      ) : (
                        <span className="inline-flex rounded-md bg-slate-100 px-2 py-0.5 font-geist text-xs font-medium text-slate-700">
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
                          baseline={baseline}
                          goals={matchGoals}
                          baselineGoals={baselineGoals}
                          players={players}
                          isSaved={isSaved}
                          saving={saving}
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
