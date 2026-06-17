import { MaterialIcon } from "@/components/material-icon";
import { FixtureRowCard } from "@/components/fixture-row-card";
import { isMatchCompleted, type MatchResultScore } from "@/lib/home-fixtures";
import type { MatchGoalPublicRow } from "@/lib/match-goals-display";
import { formatScore } from "@/lib/prediction-scoring";
import type { FixtureRow, PredictionRow } from "@/lib/predictions-types";

type MatchResultsListProps = {
  fixtures: FixtureRow[];
  resultsByMatch: Record<number, MatchResultScore>;
  goalsByMatch: Record<number, MatchGoalPublicRow[]>;
  predictionsByMatch?: Record<number, PredictionRow>;
};

function MyBetFooter({ goalsHome, goalsAway }: { goalsHome: number; goalsAway: number }) {
  return (
    <p className="font-geist text-sm text-on-surface">
      <span className="font-medium text-on-surface-variant">Mi apuesta:</span>{" "}
      <span className="font-headline font-semibold tabular-nums text-primary">
        {formatScore(goalsHome, goalsAway)}
      </span>
    </p>
  );
}

function hasCompletePrediction(prediction: PredictionRow | undefined): prediction is PredictionRow & {
  goals_home: number;
  goals_away: number;
} {
  return prediction?.goals_home != null && prediction?.goals_away != null;
}

export function MatchResultsList({
  fixtures,
  resultsByMatch,
  goalsByMatch,
  predictionsByMatch,
}: MatchResultsListProps) {
  return (
    <section className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
      <div className="flex flex-wrap items-start justify-between gap-3 border-b border-outline-variant/50 bg-surface-container-lowest p-4">
        <div className="flex min-w-0 items-center gap-3">
          <MaterialIcon name="sports_soccer" className="text-2xl text-accent" />
          <div className="flex flex-col gap-0">
            <h2 className="font-geist text-lg font-semibold text-on-surface">
              Partidos del torneo
            </h2>
            <p className="font-geist text-sm text-on-surface-variant">
              Resultados oficiales cargados · Ordenados por fecha
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

            const goals = goalsByMatch[fixture.id_match] ?? [];
            const prediction = predictionsByMatch?.[fixture.id_match];
            const showMyBet =
              predictionsByMatch != null &&
              !isMatchCompleted(fixture.id_match, resultsByMatch) &&
              hasCompletePrediction(prediction);

            return (
              <FixtureRowCard
                key={fixture.id_match}
                fixture={fixture}
                score={score}
                goals={goals.length > 0 ? goals : undefined}
                showPredictLink={false}
                showVenue
                footer={
                  showMyBet ? (
                    <MyBetFooter
                      goalsHome={prediction.goals_home}
                      goalsAway={prediction.goals_away}
                    />
                  ) : undefined
                }
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
