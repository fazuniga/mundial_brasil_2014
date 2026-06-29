import type { Metadata } from "next";
import { createClient } from "@/lib/supabase/server";
import { MatchResultsList } from "@/components/match-results-list";
import { MobileBottomNav } from "@/components/mobile-bottom-nav";
import { SiteHeader } from "@/components/site-header";
import { buildResultsByMatch, type MatchResultScore } from "@/lib/home-fixtures";
import { buildGoalsByMatch } from "@/lib/match-goals-display";
import { FIXTURE_SELECT, FIXTURE_VIEW } from "@/lib/fixture-query";
import {
  ensureUserPool,
  filterEnabledRoundFixtures,
  parseRoundSearchParam,
} from "@/lib/predictions-utils";
import type { FixtureRow, PredictionRow, RoundPhaseRow } from "@/lib/predictions-types";

export const metadata: Metadata = {
  title: "Resultados · Polla Mundial 2026",
};

type ResultadosPageProps = {
  searchParams: Promise<{ ronda?: string }>;
};

export default async function ResultadosPage({ searchParams }: ResultadosPageProps) {
  const { ronda } = await searchParams;
  const initialRoundId = parseRoundSearchParam(ronda);

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
    { data: fixturesRaw, error: fixturesError },
    { data: resultsRaw },
    { data: goalsRaw },
    { data: roundsRaw },
  ] = await Promise.all([
    supabase
      .from(FIXTURE_VIEW)
      .select(FIXTURE_SELECT)
      .order("match_date")
      .order("match_time"),
    supabase.from("match_results").select("id_match, goals_home, goals_away"),
    supabase
      .from("match_goals")
      .select("id_goal, id_match, minute, is_own_goal, players(name, teams(code))")
      .order("id_match")
      .order("minute"),
    supabase.from("rounds").select("id_round, name_round").order("id_round"),
  ]);

  const resultsByMatch = buildResultsByMatch((resultsRaw ?? []) as MatchResultScore[]);
  const goalsByMatch = buildGoalsByMatch(goalsRaw ?? []);
  const fixtures = filterEnabledRoundFixtures((fixturesRaw ?? []) as FixtureRow[]);
  const rounds = (roundsRaw ?? []) as Pick<RoundPhaseRow, "id_round" | "name_round">[];

  const predictionsByMatch: Record<number, PredictionRow> = {};
  if (user) {
    const poolId = await ensureUserPool(supabase, user.id);
    const { data: predictions } = await supabase
      .from("predictions")
      .select("id_pool, id_match, goals_home, goals_away, extra_time, first_goal_minute")
      .eq("id_pool", poolId);

    for (const row of predictions ?? []) {
      predictionsByMatch[row.id_match] = row as PredictionRow;
    }
  }

  return (
    <>
      <SiteHeader userEmail={user?.email} isAdmin={isAdmin} activeNav="partidos" />
      <main className="mx-auto flex w-full max-w-5xl flex-col gap-section-gap px-gutter-md py-24 md:pb-8">
        <header className="space-y-2">
          <p className="font-geist text-xs font-semibold uppercase tracking-widest text-accent">
            Polla Mundial 2026
          </p>
          <h1 className="font-headline text-2xl font-bold text-primary md:text-3xl">
            Resultados
          </h1>
          <p className="font-geist max-w-2xl text-sm text-on-surface-variant">
            Resultados oficiales del torneo por fase: Fase de Grupos, Dieciseisavos de
            Final, Octavos de Final, Cuartos de Final, Semifinal, Tercer Lugar y Final.
          </p>
        </header>

        <div className="light-surface-panel flex flex-col gap-4">
          {fixturesError ? (
            <div className="rounded-xl border border-destructive/40 bg-destructive/10 px-4 py-3 font-geist text-sm text-destructive">
              No se pudieron cargar los resultados. Vuelve a intentar más tarde.
            </div>
          ) : (
            <MatchResultsList
              fixtures={fixtures}
              resultsByMatch={resultsByMatch}
              goalsByMatch={goalsByMatch}
              predictionsByMatch={
                Object.keys(predictionsByMatch).length > 0 ? predictionsByMatch : undefined
              }
              rounds={rounds}
              initialRoundId={initialRoundId}
              syncRoundToUrl
            />
          )}
        </div>
      </main>
      <MobileBottomNav active="partidos" isAdmin={isAdmin} />
    </>
  );
}
