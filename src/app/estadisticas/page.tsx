import type { Metadata } from "next";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { MatchPredictionStatsList } from "@/components/closed-match-prediction-stats-list";
import { MobileBottomNav } from "@/components/mobile-bottom-nav";
import { SiteHeader } from "@/components/site-header";
import { SpecialBetsPredictionStats } from "@/components/special-bets-prediction-stats";
import type { MatchPredictionStatsRow } from "@/lib/closed-match-prediction-stats";
import { fetchSpecialBetsPredictionStats } from "@/lib/fetch-special-bets-stats";
import { buildResultsByMatch, type MatchResultScore } from "@/lib/home-fixtures";
import { buildGoalsByMatch } from "@/lib/match-goals-display";
import { formatPredictionLockWindowShort } from "@/lib/prediction-lock";

export const metadata: Metadata = {
  title: "Estadísticas · Polla Mundial 2026",
  description: `Rondas con pronósticos activos · cerrados ${formatPredictionLockWindowShort()} antes del inicio`,
};

function sortMatchStats(rows: MatchPredictionStatsRow[]): MatchPredictionStatsRow[] {
  return [...rows].sort((a, b) => {
    const dateCompare = a.match_date.localeCompare(b.match_date);
    if (dateCompare !== 0) return dateCompare;
    return a.match_time.localeCompare(b.match_time);
  });
}

export default async function EstadisticasPage() {
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
    { data: matchStatsRaw, error: matchStatsError },
    { data: resultsRaw },
    { data: goalsRaw },
    specialBetsPredictionStats,
  ] = await Promise.all([
    supabase
      .from("v_match_prediction_stats")
      .select(
        "id_match, id_round, name_round, group_code, dow, match_date, match_time, home_code, home_country, away_code, away_country, city, stadium, round_predictions_enabled, predictions_open, bet_count, home_win_count, away_win_count, draw_count, with_goals_count, no_goals_count",
      )
      .order("match_date")
      .order("match_time"),
    supabase.from("match_results").select("id_match, goals_home, goals_away"),
    supabase
      .from("match_goals")
      .select("id_goal, id_match, minute, is_own_goal, players(name, teams(code))")
      .order("id_match")
      .order("minute"),
    fetchSpecialBetsPredictionStats(supabase),
  ]);

  const matchStats = sortMatchStats((matchStatsRaw ?? []) as MatchPredictionStatsRow[]);
  const resultsByMatch = buildResultsByMatch(
    (resultsRaw ?? []) as MatchResultScore[],
  );
  const goalsByMatch = buildGoalsByMatch(goalsRaw ?? []);

  return (
    <>
      <SiteHeader userEmail={user.email} isAdmin={isAdmin} activeNav="estadisticas" />
      <main className="mx-auto flex w-full max-w-7xl flex-col gap-section-gap px-gutter-md py-24 md:pb-8">
        <header className="space-y-2">
          <p className="font-geist text-xs font-semibold uppercase tracking-widest text-accent">
            Polla Mundial 2026
          </p>
          <h1 className="font-headline text-2xl font-bold text-primary md:text-3xl">
            Estadísticas
          </h1>
          <p className="font-geist max-w-2xl text-sm text-on-surface-variant">
            Pronósticos agregados por partido · rondas con pronósticos activos
          </p>
        </header>

        {specialBetsPredictionStats ? (
          <section className="light-surface-panel overflow-hidden rounded-xl border border-outline-variant/60 bg-white shadow-sm">
            <SpecialBetsPredictionStats stats={specialBetsPredictionStats} />
          </section>
        ) : null}

        {matchStatsError ? (
          <div className="rounded-xl border border-destructive/40 bg-destructive/10 px-4 py-3 font-geist text-sm text-destructive">
            No se pudieron cargar las estadísticas. Vuelve a intentar más tarde.
          </div>
        ) : (
          <MatchPredictionStatsList
            rows={matchStats}
            resultsByMatch={resultsByMatch}
            goalsByMatch={goalsByMatch}
          />
        )}
      </main>
      <MobileBottomNav active="estadisticas" isAdmin={isAdmin} />
    </>
  );
}
