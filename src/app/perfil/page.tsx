import { redirect } from "next/navigation";
import { ProfileDashboard } from "@/components/profile/profile-dashboard";
import { MobileBottomNav } from "@/components/mobile-bottom-nav";
import { SiteHeader } from "@/components/site-header";
import type { PoolRankingRow } from "@/lib/pool-rankings-types";
import { FIXTURE_SELECT, FIXTURE_VIEW } from "@/lib/fixture-query";
import { filterEnabledRoundFixtures } from "@/lib/predictions-utils";
import { createClient } from "@/lib/supabase/server";

export default async function ProfilePage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    redirect("/login");
  }

  const [
    { data: profile },
    { data: pools },
    { data: fixturesRaw },
    { data: rankingsRaw },
    { count: participantCount },
  ] = await Promise.all([
    supabase
      .from("profiles")
      .select("first_name, last_name, username, created_at, is_admin")
      .eq("id", user.id)
      .maybeSingle(),
    supabase
      .from("pools")
      .select("id_pool")
      .eq("owner_id", user.id)
      .order("id_pool")
      .limit(1),
    supabase
      .from(FIXTURE_VIEW)
      .select(FIXTURE_SELECT)
      .order("match_date")
      .order("match_time"),
    supabase
      .from("v_pool_rankings")
      .select(
        "id_pool, owner_id, display_name, username, is_paid_group_phase, is_paid_knockout, bets_placed, match_points, exact_hits, goal_diff_hits, winner_hits, side_bet_points, tournament_points, total_points, rank_position",
      )
      .eq("owner_id", user.id)
      .maybeSingle(),
    supabase.from("v_pool_rankings").select("*", { count: "exact", head: true }),
  ]);

  const isAdmin = profile?.is_admin ?? false;
  const poolId = pools?.[0]?.id_pool ?? null;
  const fixtures = filterEnabledRoundFixtures(fixturesRaw ?? []);
  const ranking = (rankingsRaw ?? null) as PoolRankingRow | null;

  const predictedMatchIds = new Set<number>();
  if (poolId != null) {
    const { data: predictions } = await supabase
      .from("predictions")
      .select("id_match")
      .eq("id_pool", poolId);

    for (const row of predictions ?? []) {
      predictedMatchIds.add(row.id_match);
    }
  }

  const enabledFixtureCount = fixtures.filter((f) => f.round_predictions_enabled).length;
  const openFixtureCount = fixtures.filter(
    (f) => f.round_predictions_enabled && f.predictions_open,
  ).length;
  const pendingCount = fixtures.filter(
    (f) =>
      f.round_predictions_enabled &&
      f.predictions_open &&
      !predictedMatchIds.has(f.id_match),
  ).length;

  return (
    <>
      <SiteHeader userEmail={user.email} isAdmin={isAdmin} activeNav="perfil" />
      <main className="mx-auto flex w-full max-w-7xl flex-col gap-section-gap px-gutter-md py-24 md:pb-8">
        <header className="space-y-2">
          <p className="font-geist text-xs font-semibold uppercase tracking-widest text-accent">
            Polla Mundial 2026
          </p>
          <h1 className="font-headline text-2xl font-bold text-primary md:text-3xl">
            Perfil
          </h1>
          <p className="font-geist max-w-2xl text-sm text-on-surface-variant">
            Tu posición en la polla, puntos acumulados y partidos pendientes de
            pronosticar.
          </p>
        </header>

        <div className="light-surface-panel">
          <ProfileDashboard
            userEmail={user.email}
            profile={profile}
            ranking={ranking}
            participantCount={participantCount ?? 0}
            pendingCount={pendingCount}
            openFixtureCount={openFixtureCount}
            enabledFixtureCount={enabledFixtureCount}
          />
        </div>
      </main>
      <MobileBottomNav active="perfil" isAdmin={isAdmin} />
    </>
  );
}
