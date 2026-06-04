import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { HomeFixturesSection } from "@/components/home-fixtures-section";
import { HomeHero } from "@/components/home-hero";
import { MaterialIcon } from "@/components/material-icon";
import { MobileBottomNav } from "@/components/mobile-bottom-nav";
import { SiteHeader } from "@/components/site-header";
import { TournamentRoadmap } from "@/components/tournament-roadmap";
import {
  buildResultsByMatch,
  splitHomeFixtures,
  type MatchResultScore,
} from "@/lib/home-fixtures";
import type { FixtureRow } from "@/lib/predictions-types";

export default async function HomePage() {
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

  const { data: rounds } = await supabase
    .from("rounds")
    .select("id_round, name_round")
    .order("id_round");

  const [{ data: fixturesRaw }, { data: resultsRaw }] = await Promise.all([
    supabase
      .from("v_fixture")
      .select(
        "id_match, id_round, name_round, group_code, dow, match_date, match_time, home_code, home_country, away_code, away_country, city, stadium, round_predictions_enabled, predictions_open",
      )
      .order("match_date")
      .order("match_time"),
    supabase
      .from("match_results")
      .select("id_match, goals_home, goals_away"),
  ]);

  const resultsByMatch = buildResultsByMatch(
    (resultsRaw ?? []) as MatchResultScore[],
  );
  const { upcoming, completed } = splitHomeFixtures(
    (fixturesRaw ?? []) as FixtureRow[],
    resultsByMatch,
  );

  return (
    <>
      <SiteHeader userEmail={user?.email} isAdmin={isAdmin} activeNav="home" />
      <main className="mx-auto flex w-full max-w-7xl flex-col gap-section-gap px-gutter-md pb-24 pt-[calc(4rem+2rem)] md:pb-8">
        <HomeHero isAuthenticated={!!user} />
        <TournamentRoadmap rounds={rounds ?? []} />

        <Link
          href="/grupos"
          className="font-geist inline-flex w-max items-center gap-1.5 text-sm font-medium text-primary transition-colors hover:text-primary-container"
        >
          <MaterialIcon name="grid_view" className="text-lg" />
          Ver posiciones por grupo
        </Link>

        <HomeFixturesSection
          upcoming={upcoming}
          completed={completed}
          resultsByMatch={resultsByMatch}
        />
      </main>
      <MobileBottomNav active="home" isAdmin={isAdmin} />
    </>
  );
}
