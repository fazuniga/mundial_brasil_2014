import { MaterialIcon } from "@/components/material-icon";
import { FixtureRowCard } from "@/components/fixture-row-card";
import type { MatchResultScore } from "@/lib/home-fixtures";
import type { FixtureRow } from "@/lib/predictions-types";

type MatchResultsListProps = {
  fixtures: FixtureRow[];
  resultsByMatch: Record<number, MatchResultScore>;
};

export function MatchResultsList({ fixtures, resultsByMatch }: MatchResultsListProps) {
  return (
    <section className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
      <div className="flex flex-wrap items-start justify-between gap-3 border-b border-outline-variant/50 bg-surface-container-lowest p-5">
        <div className="flex min-w-0 items-start gap-3">
          <MaterialIcon name="sports_soccer" className="mt-0.5 text-2xl text-accent" />
          <div>
            <h2 className="font-geist text-lg font-semibold text-on-surface">
              Partidos del torneo
            </h2>
            <p className="font-geist mt-1 text-sm text-on-surface-variant">
              Resultados oficiales cargados · ordenados por fecha
            </p>
          </div>
        </div>
      </div>

      {fixtures.length > 0 ? (
        <ul>
          {fixtures.map((fixture) => {
            const result = resultsByMatch[fixture.id_match];
            const score =
              result?.goals_home != null && result?.goals_away != null
                ? { home: result.goals_home, away: result.goals_away }
                : undefined;

            return (
              <FixtureRowCard
                key={fixture.id_match}
                fixture={fixture}
                score={score}
                showPredictLink={false}
              />
            );
          })}
        </ul>
      ) : (
        <p className="font-geist px-5 py-8 text-sm text-on-surface-variant">
          Aún no hay partidos con resultado cargado.
        </p>
      )}
    </section>
  );
}
