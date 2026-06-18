import { MaterialIcon } from "@/components/material-icon";
import { FixtureRowCard } from "@/components/fixture-row-card";
import {
  formatPredictionStatPercent,
  type MatchPredictionStatsRow,
} from "@/lib/closed-match-prediction-stats";
import type { MatchResultScore } from "@/lib/home-fixtures";
import type { MatchGoalPublicRow } from "@/lib/match-goals-display";
import { getFixturePredictionLock } from "@/lib/predictions-utils";
import { formatPredictionLockWindowShort } from "@/lib/prediction-lock";
import { cn } from "@/lib/utils";

type MatchPredictionStatsListProps = {
  rows: MatchPredictionStatsRow[];
  resultsByMatch: Record<number, MatchResultScore>;
  goalsByMatch: Record<number, MatchGoalPublicRow[]>;
};

function predictionLockLabel(row: MatchPredictionStatsRow): string {
  const lock = getFixturePredictionLock(row);
  if (lock === "open") return "Pronósticos abiertos";
  return `Cerrados ${formatPredictionLockWindowShort()} antes del inicio`;
}

function PredictionStatsFooter({ row }: { row: MatchPredictionStatsRow }) {
  const lock = getFixturePredictionLock(row);
  const total = row.bet_count;

  const stats = [
    { label: "Local", value: formatPredictionStatPercent(row.home_win_count, total) },
    { label: "Empate", value: formatPredictionStatPercent(row.draw_count, total) },
    { label: "Visitante", value: formatPredictionStatPercent(row.away_win_count, total) },
    {
      label: "Con goles",
      value: formatPredictionStatPercent(row.with_goals_count, total),
    },
    {
      label: "Sin goles",
      value: formatPredictionStatPercent(row.no_goals_count, total),
    },
  ];

  return (
    <div className="flex flex-col gap-2">
      <p
        className={cn(
          "font-geist text-[11px] font-medium",
          lock === "open"
            ? "text-primary"
            : "uppercase tracking-wide text-on-surface-variant",
        )}
      >
        {predictionLockLabel(row)}
      </p>
      <p className="font-geist text-[11px] font-medium uppercase tracking-wide text-on-surface-variant">
        Pronósticos agregados
        {total > 0 ? (
          <span className="font-normal normal-case tracking-normal text-on-surface-variant">
            {" "}
            · {total} {total === 1 ? "apuesta" : "apuestas"}
          </span>
        ) : null}
      </p>
      <dl className="grid grid-cols-3 gap-x-4 gap-y-2 sm:grid-cols-5">
        {stats.map((stat) => (
          <div key={stat.label} className="min-w-0">
            <dt className="font-geist text-[11px] text-on-surface-variant">{stat.label}</dt>
            <dd className="font-headline text-base font-semibold tabular-nums text-primary">
              {stat.value}
            </dd>
          </div>
        ))}
      </dl>
      {total === 0 ? (
        <p className="font-geist text-xs text-on-surface-variant">
          {lock === "open"
            ? "Aún no hay pronósticos registrados para este partido."
            : "Sin pronósticos registrados para este partido."}
        </p>
      ) : lock === "open" ? (
        <p className="font-geist text-xs text-on-surface-variant">
          Totales parciales · los pronósticos siguen abiertos.
        </p>
      ) : null}
    </div>
  );
}

export function MatchPredictionStatsList({
  rows,
  resultsByMatch,
  goalsByMatch,
}: MatchPredictionStatsListProps) {
  return (
    <section className="light-surface-panel overflow-hidden rounded-xl border border-outline-variant/60 bg-white shadow-sm">
      <div className="flex flex-wrap items-start justify-between gap-3 border-b border-outline-variant/50 bg-white p-4">
        <div className="flex min-w-0 items-center gap-3">
          <MaterialIcon name="bar_chart" className="text-2xl text-accent" />
          <div className="flex flex-col gap-0">
            <h2 className="font-geist text-lg font-semibold text-on-surface">
              ¿Qué apostó la gente?
            </h2>
            <p className="font-geist text-sm text-on-surface-variant">
              Partidos con pronósticos
            </p>
          </div>
        </div>
      </div>

      {rows.length > 0 ? (
        <ul className="flex flex-col gap-stack-gap p-3 sm:p-4">
          {rows.map((row) => {
            const result = resultsByMatch[row.id_match];
            const score =
              result?.goals_home != null && result?.goals_away != null
                ? { home: result.goals_home, away: result.goals_away }
                : undefined;
            const goals = goalsByMatch[row.id_match] ?? [];

            return (
              <FixtureRowCard
                key={row.id_match}
                fixture={row}
                score={score}
                goals={goals.length > 0 ? goals : undefined}
                showPredictLink={false}
                showVenue
                layout="card"
                footer={<PredictionStatsFooter row={row} />}
              />
            );
          })}
        </ul>
      ) : (
        <p className="font-geist px-5 py-8 text-sm text-muted-foreground">
          No hay partidos en rondas con pronósticos activos.
        </p>
      )}
    </section>
  );
}

/** @deprecated Use MatchPredictionStatsList */
export const ClosedMatchPredictionStatsList = MatchPredictionStatsList;
