"use client";

import { FixtureRowCard } from "@/components/fixture-row-card";
import { isMatchCompleted, type MatchResultScore } from "@/lib/home-fixtures";
import type { MatchGoalPublicRow } from "@/lib/match-goals-display";
import { formatScore, firstGoalRangeLabel } from "@/lib/prediction-scoring";
import { scoringRuleLabel } from "@/lib/scoring-labels";
import type { FixtureRow, PredictionRow } from "@/lib/predictions-types";

type MatchResultsFeedProps = {
  fixtures: FixtureRow[];
  resultsByMatch: Record<number, MatchResultScore>;
  goalsByMatch: Record<number, MatchGoalPublicRow[]>;
  predictionsByMatch?: Record<number, PredictionRow>;
  todayOnly: boolean;
  selectedRound: number | null;
  searchQuery: string;
};

function MyBetFooter({
  goalsHome,
  goalsAway,
  firstGoalMinute,
}: {
  goalsHome: number;
  goalsAway: number;
  firstGoalMinute?: string | null;
}) {
  const rangeLabel = firstGoalMinute ? firstGoalRangeLabel(firstGoalMinute) : null;

  return (
    <div className="flex flex-col gap-0.5 font-geist text-xs text-on-surface md:text-sm">
      <p>
        <span className="font-medium text-on-surface-variant">Mi apuesta:</span>{" "}
        <span className="font-headline font-semibold tabular-nums text-primary">
          {formatScore(goalsHome, goalsAway)}
        </span>
      </p>
      {rangeLabel ? (
        <p>
          <span className="font-medium text-on-surface-variant">
            {scoringRuleLabel("first_goal_minute")}:
          </span>{" "}
          <span className="font-medium text-primary">{rangeLabel}</span>
        </p>
      ) : null}
    </div>
  );
}

function hasCompletePrediction(prediction: PredictionRow | undefined): prediction is PredictionRow & {
  goals_home: number;
  goals_away: number;
} {
  return prediction?.goals_home != null && prediction?.goals_away != null;
}

export function MatchResultsFeed({
  fixtures,
  resultsByMatch,
  goalsByMatch,
  predictionsByMatch,
  todayOnly,
  selectedRound,
  searchQuery,
}: MatchResultsFeedProps) {
  if (fixtures.length > 0) {
    return (
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
                    firstGoalMinute={prediction.first_goal_minute}
                  />
                ) : undefined
              }
            />
          );
        })}
      </ul>
    );
  }

  return (
    <p className="font-geist px-5 py-8 text-sm text-on-surface-variant">
      {searchQuery.trim()
        ? `Ningún partido coincide con "${searchQuery.trim()}".`
        : todayOnly
          ? "No hay partidos programados para hoy."
          : selectedRound
            ? "No hay partidos en esta fase."
            : "Aún no hay partidos con resultado cargado."}
    </p>
  );
}
