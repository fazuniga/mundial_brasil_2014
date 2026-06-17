import type { Metadata } from "next";
import { createClient } from "@/lib/supabase/server";
import { GroupStandingsSections } from "@/components/group-standings-sections";
import { MatchResultsList } from "@/components/match-results-list";
import { MobileBottomNav } from "@/components/mobile-bottom-nav";
import { ResultsViewSwitcher } from "@/components/results-view-switcher";
import { SiteHeader } from "@/components/site-header";
import {
  GROUP_CODES,
  groupStandingsByCode,
  type GroupStandingRow,
} from "@/lib/group-standings";
import { buildResultsByMatch, type MatchResultScore } from "@/lib/home-fixtures";
import { buildGoalsByMatch } from "@/lib/match-goals-display";
import type { FixtureRow, PredictionRow } from "@/lib/predictions-types";
import { ensureUserPool } from "@/lib/predictions-utils";

export const metadata: Metadata = {
  title: "Partidos · Polla Mundial 2026",
};

type PartidosPageProps = {
  searchParams: Promise<{ v?: string }>;
};

export default async function PartidosPage({ searchParams }: PartidosPageProps) {
  const { v } = await searchParams;
  const view = v === "partido" ? "partido" : "grupo";

  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  let isAdmin = false;
  if (user) {
    const { data: profile } = await supabase
      .from("profiles")
      .select("is_admin")
      .eq("id", user.id)
      .maybeSingle();
    isAdmin = profile?.is_admin ?? false;
  }

  const [
    { data: standingsRaw, error: standingsError },
    { data: fixturesRaw, error: fixturesError },
    { data: resultsRaw },
    { data: goalsRaw },
  ] = await Promise.all([
    supabase
      .from("v_group_standings")
      .select(
        "group_code, id_team, team_name, team_code, played, wins, draws, losses, goals_for, goals_against, goal_diff, points",
      )
      .order("group_code")
      .order("points", { ascending: false })
      .order("goal_diff", { ascending: false })
      .order("goals_for", { ascending: false }),
    supabase
      .from("v_fixture")
      .select(
        "id_match, id_round, name_round, group_code, dow, match_date, match_time, home_code, home_country, away_code, away_country, city, stadium, round_predictions_enabled, predictions_open",
      )
      .order("match_date")
      .order("match_time"),
    supabase.from("match_results").select("id_match, goals_home, goals_away"),
    supabase
      .from("match_goals")
      .select("id_goal, id_match, minute, is_own_goal, players(name, teams(code))")
      .order("id_match")
      .order("minute"),
  ]);

  const standings = (standingsRaw ?? []) as GroupStandingRow[];
  const groupedMap = groupStandingsByCode(standings);
  const grouped = Object.fromEntries(
    GROUP_CODES.map((code) => [code, groupedMap.get(code) ?? []]),
  );
  const resultsByMatch = buildResultsByMatch(
    (resultsRaw ?? []) as MatchResultScore[],
  );
  const goalsByMatch = buildGoalsByMatch(goalsRaw ?? []);
  const fixtures = (fixturesRaw ?? []) as FixtureRow[];

  const predictionsByMatch: Record<number, PredictionRow> = {};
  if (user && view === "partido") {
    const poolId = await ensureUserPool(supabase, user.id);
    const { data: predictions } = await supabase
      .from("predictions")
      .select("id_pool, id_match, goals_home, goals_away, extra_time, first_goal_minute")
      .eq("id_pool", poolId);

    for (const row of predictions ?? []) {
      predictionsByMatch[row.id_match] = row as PredictionRow;
    }
  }

  const error = view === "grupo" ? standingsError : fixturesError;

  return (
    <>
      <SiteHeader userEmail={user?.email} isAdmin={isAdmin} activeNav="partidos" />
      <main className="mx-auto flex w-full max-w-7xl flex-col gap-section-gap px-gutter-md py-24 md:pb-8">
        <header className="space-y-2">
          <p className="font-geist text-xs font-semibold uppercase tracking-widest text-accent">
            Fase de Grupos
          </p>
          <h1 className="font-headline text-2xl font-bold text-primary md:text-3xl">
            Partidos
          </h1>
          <p className="font-geist max-w-2xl text-sm text-on-surface-variant">
            {view === "grupo"
              ? "Posiciones por grupo según resultados oficiales del torneo. Los dos primeros de cada grupo avanzan a Dieciseisavos de Final."
              : "Resultados oficiales del torneo por partido, ordenados por fecha."}
          </p>
        </header>

        <ResultsViewSwitcher view={view} />

        <div className="light-surface-panel flex flex-col gap-4">
          {error ? (
            <div className="rounded-xl border border-destructive/40 bg-destructive/10 px-4 py-3 font-geist text-sm text-destructive">
              {view === "grupo"
                ? "No se pudieron cargar las posiciones. Vuelve a intentar más tarde."
                : "No se pudieron cargar los partidos. Vuelve a intentar más tarde."}
            </div>
          ) : null}

          {!error && view === "grupo" ? (
            <GroupStandingsSections grouped={grouped} />
          ) : null}

          {!error && view === "partido" ? (
            <MatchResultsList
              fixtures={fixtures}
              resultsByMatch={resultsByMatch}
              goalsByMatch={goalsByMatch}
              predictionsByMatch={
                Object.keys(predictionsByMatch).length > 0 ? predictionsByMatch : undefined
              }
            />
          ) : null}
        </div>
      </main>
      <MobileBottomNav active="partidos" isAdmin={isAdmin} />
    </>
  );
}
