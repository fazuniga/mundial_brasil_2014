import { Suspense } from "react";
import { createClient } from "@/lib/supabase/server";
import { MobileBottomNav } from "@/components/mobile-bottom-nav";
import { SiteHeader } from "@/components/site-header";
import { PredictionsClient } from "@/components/predictions/predictions-client";
import type { FixtureRow, PlayerRow, PredictionRow } from "@/lib/predictions-types";
import type { MatchResultDetail, SideBetOutcome } from "@/lib/prediction-scoring";

function sortFixtures(fixtures: FixtureRow[]): FixtureRow[] {
  return [...fixtures].sort((a, b) => {
    if (a.predictions_open !== b.predictions_open) {
      return a.predictions_open ? -1 : 1;
    }
    const dateCompare = a.match_date.localeCompare(b.match_date);
    if (dateCompare !== 0) return dateCompare;
    return a.match_time.localeCompare(b.match_time);
  });
}

export default async function PredictionsPage() {
  const supabase = await createClient();

  const {
    data: { user },
  } = await supabase.auth.getUser();

  const [
    { data: fixturesRaw },
    { data: scoringRules },
    { data: playersRaw },
    { data: tournamentBetOpenRaw },
    { data: resultsRaw },
  ] = await Promise.all([
    supabase
      .from("v_fixture")
      .select(
        "id_match, id_round, name_round, group_code, dow, match_date, match_time, home_code, home_country, away_code, away_country, city, stadium, round_predictions_enabled, predictions_open",
      )
      .order("match_date")
      .order("match_time"),
    supabase.from("scoring_rules").select("id, rule_key, points").order("points", { ascending: false }),
    supabase
      .from("v_players")
      .select(
        "id_player, name, position, club, club_country, id_team, team_code, team_country, group_code",
      )
      .order("team_country")
      .order("name"),
    supabase.from("v_tournament_bet_open").select("tournament_bet_open").single(),
    supabase
      .from("v_results")
      .select(
        "id_match, goals_home, goals_away, goals_home_et, goals_away_et, pens_home, pens_away, first_goal_minute_range",
      ),
  ]);

  const fixtures = sortFixtures((fixturesRaw ?? []) as FixtureRow[]);
  const players = (playersRaw ?? []) as PlayerRow[];
  const tournamentBetOpen = tournamentBetOpenRaw?.tournament_bet_open ?? true;

  const resultsByMatch: Record<number, MatchResultDetail> = {};
  for (const row of resultsRaw ?? []) {
    resultsByMatch[row.id_match] = row as MatchResultDetail;
  }

  let isAdmin = false;
  let poolId: number | null = null;
  const predictionsByMatch: Record<number, PredictionRow> = {};
  const sideBetsByMatch: Record<number, SideBetOutcome> = {};
  let tournamentPrediction = null;

  if (user) {
    const { data: profile } = await supabase
      .from("profiles")
      .select("is_admin")
      .eq("id", user.id)
      .maybeSingle();
    isAdmin = profile?.is_admin ?? false;

    const { data: pools } = await supabase
      .from("pools")
      .select("id_pool")
      .eq("owner_id", user.id)
      .order("id_pool")
      .limit(1);

    if (pools && pools.length > 0) {
      poolId = pools[0].id_pool;

      const [{ data: predictions }, { data: tournamentPred }, { data: sideBets }] =
        await Promise.all([
          supabase
            .from("predictions")
            .select(
              "id_pool, id_match, goals_home, goals_away, extra_time, first_goal_minute",
            )
            .eq("id_pool", poolId),
          supabase
            .from("tournament_predictions")
            .select("id_pool, top_scorer_player_id, top_scorer_goals")
            .eq("id_pool", poolId)
            .maybeSingle(),
          supabase
            .from("v_prediction_side_bets")
            .select(
              "id_match, actual_first_goal_range, predicted_first_goal_range, first_goal_minute_hit, extra_time_hit",
            )
            .eq("id_pool", poolId),
        ]);

      for (const row of predictions ?? []) {
        predictionsByMatch[row.id_match] = row;
      }

      for (const row of sideBets ?? []) {
        sideBetsByMatch[row.id_match] = {
          actualFirstGoalRange: row.actual_first_goal_range,
          predictedFirstGoalRange: row.predicted_first_goal_range,
          firstGoalMinuteHit: row.first_goal_minute_hit,
          extraTimeHit: row.extra_time_hit,
        };
      }

      tournamentPrediction = tournamentPred;
    }
  }

  return (
    <>
      <SiteHeader userEmail={user?.email} isAdmin={isAdmin} activeNav="matches" />
      <main className="mx-auto flex w-full max-w-7xl flex-col gap-section-gap px-gutter-md pb-24 pt-[calc(4rem+2rem)] md:pb-8">
        <header className="space-y-2">
          <p className="font-geist text-xs font-semibold uppercase tracking-widest text-accent">
            Apuestas
          </p>
          <h1 className="font-headline text-2xl font-bold text-primary md:text-3xl">
            Pronosticar marcador
          </h1>
          <p className="font-geist max-w-2xl text-sm text-on-surface-variant">
            Ingresa tu marcador y apuestas adicionales en cada partido. El goleador
            del torneo se pronostica una sola vez. El plazo de apuestas por partido
            cierra 60 min antes del inicio del partido.
          </p>
        </header>

        <Suspense
          fallback={
            <p className="font-geist text-sm text-on-surface-variant">Cargando partidos…</p>
          }
        >
          <PredictionsClient
            fixtures={fixtures}
            scoringRules={scoringRules ?? []}
            predictionsByMatch={predictionsByMatch}
            resultsByMatch={resultsByMatch}
            sideBetsByMatch={sideBetsByMatch}
            players={players}
            tournamentPrediction={tournamentPrediction}
            tournamentBetOpen={tournamentBetOpen}
            poolId={poolId}
            isAuthenticated={!!user}
          />
        </Suspense>
      </main>
      <MobileBottomNav active="matches" isAdmin={isAdmin} />
    </>
  );
}
