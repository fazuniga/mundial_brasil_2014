import type { Metadata } from "next";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { ClosedMatchPredictionStatsList } from "@/components/closed-match-prediction-stats-list";
import { MobileBottomNav } from "@/components/mobile-bottom-nav";
import { SiteHeader } from "@/components/site-header";
import type { ClosedMatchPredictionStatsRow } from "@/lib/closed-match-prediction-stats";
import { buildResultsByMatch, type MatchResultScore } from "@/lib/home-fixtures";
import { buildGoalsByMatch } from "@/lib/match-goals-display";

export const metadata: Metadata = {
  title: "Estadísticas · Polla Mundial 2026",
  description: "Rondas con pronósticos activos · cerrados 60 min antes del inicio",
};

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
    { data: closedMatchesRaw, error: closedMatchesError },
    { data: resultsRaw },
    { data: goalsRaw },
  ] = await Promise.all([
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

  const closedMatches = (closedMatchesRaw ?? []) as ClosedMatchPredictionStatsRow[];
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
            Rondas con pronósticos activos · cerrados 60 min antes del inicio
          </p>
        </header>

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
      <MobileBottomNav active="estadisticas" isAdmin={isAdmin} />
    </>
  );
}
