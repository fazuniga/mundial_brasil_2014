import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { ClosedMatchPredictionStatsList } from "@/components/closed-match-prediction-stats-list";
import { MobileBottomNav } from "@/components/mobile-bottom-nav";
import { PoolRankingsTable } from "@/components/pool-rankings-table";
import { SiteHeader } from "@/components/site-header";
import type { ClosedMatchPredictionStatsRow } from "@/lib/closed-match-prediction-stats";
import { buildResultsByMatch, type MatchResultScore } from "@/lib/home-fixtures";
import { buildGoalsByMatch } from "@/lib/match-goals-display";
import type { PoolRankingRow } from "@/lib/pool-rankings-types";

export default async function ClasificacionPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    redirect("/login");
  }

  let isAdmin = false;
  const { data: profile } = await supabase
    .from("profiles")
    .select("is_admin")
    .eq("id", user.id)
    .maybeSingle();
  isAdmin = profile?.is_admin ?? false;

  const [
    { data: rankingsRaw, error },
    { data: closedMatchesRaw, error: closedMatchesError },
    { data: resultsRaw },
    { data: goalsRaw },
  ] = await Promise.all([
    supabase
      .from("v_pool_rankings")
      .select(
        "id_pool, owner_id, display_name, username, is_paid_group_phase, is_paid_knockout, bets_placed, match_points, exact_hits, goal_diff_hits, winner_hits, side_bet_points, tournament_points, total_points, rank_position",
      )
      .order("rank_position"),
    supabase
      .from("v_closed_match_prediction_stats")
      .select(
        "id_match, id_round, name_round, group_code, dow, match_date, match_time, home_code, home_country, away_code, away_country, city, stadium, round_predictions_enabled, predictions_open, bet_count, home_win_count, away_win_count, draw_count, with_goals_count, no_goals_count",
      )
      .order("match_date", { ascending: false })
      .order("match_time", { ascending: false }),
    supabase.from("match_results").select("id_match, goals_home, goals_away"),
    supabase
      .from("match_goals")
      .select("id_goal, id_match, minute, is_own_goal, players(name, teams(code))")
      .order("id_match")
      .order("minute"),
  ]);

  const rankings = (rankingsRaw ?? []) as PoolRankingRow[];
  const closedMatches = (closedMatchesRaw ?? []) as ClosedMatchPredictionStatsRow[];
  const resultsByMatch = buildResultsByMatch(
    (resultsRaw ?? []) as MatchResultScore[],
  );
  const goalsByMatch = buildGoalsByMatch(goalsRaw ?? []);

  return (
    <>
      <SiteHeader userEmail={user.email} isAdmin={isAdmin} activeNav="clasificacion" />
      <main className="mx-auto flex w-full max-w-7xl flex-col gap-section-gap px-gutter-md py-24 md:pb-8">
        <header className="space-y-2">
          <p className="font-geist text-xs font-semibold uppercase tracking-widest text-accent">
            Polla Mundial 2026
          </p>
          <h1 className="font-headline text-2xl font-bold text-primary md:text-3xl">
            Clasificación
          </h1>
          <p className="font-geist max-w-2xl text-sm text-on-surface-variant">
            Ranking de jugadores por puntos acumulados en pronósticos de partidos, apuestas
            laterales y goleador del torneo.
          </p>
        </header>

        <div className="light-surface-panel flex flex-col gap-stack-gap">
          {error ? (
            <div className="rounded-xl border border-destructive/40 bg-destructive/10 px-4 py-3 font-geist text-sm text-destructive">
              No se pudo cargar la clasificación. Vuelve a intentar más tarde.
            </div>
          ) : null}

          {!error ? (
            <PoolRankingsTable rows={rankings} currentUserId={user.id} />
          ) : null}
        </div>

        {closedMatchesError ? (
          <div className="rounded-xl border border-destructive/40 bg-destructive/10 px-4 py-3 font-geist text-sm text-destructive">
            No se pudieron cargar los pronósticos cerrados. Vuelve a intentar más tarde.
          </div>
        ) : (
          <ClosedMatchPredictionStatsList
            rows={closedMatches}
            resultsByMatch={resultsByMatch}
            goalsByMatch={goalsByMatch}
          />
        )}
      </main>
      <MobileBottomNav active="clasificacion" isAdmin={isAdmin} />
    </>
  );
}
