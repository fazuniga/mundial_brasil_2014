import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { MobileBottomNav } from "@/components/mobile-bottom-nav";
import { SiteHeader } from "@/components/site-header";
import { AdminClient } from "@/components/admin/admin-client";
import { AdminRoundPhases } from "@/components/admin/admin-round-phases";
import type { FixtureRow, PlayerRow } from "@/lib/predictions-types";
import type { MatchGoalRow, MatchResultRow, MatchTeamRow } from "@/lib/admin-types";
import { mergeFixturesWithTeams } from "@/lib/admin-utils";

export default async function AdminPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    redirect("/login");
  }

  const { data: profile } = await supabase
    .from("profiles")
    .select("is_admin")
    .eq("id", user.id)
    .maybeSingle();

  if (!profile?.is_admin) {
    redirect("/");
  }

  const [
    { data: fixturesRaw },
    { data: roundsRaw },
    { data: resultsRaw },
    { data: teamsRaw },
    { data: playersRaw },
    { data: goalsRaw },
    { data: topScorerSummary },
  ] = await Promise.all([
    supabase
      .from("v_fixture")
      .select(
        "id_match, id_round, name_round, group_code, dow, match_date, match_time, home_code, home_country, away_code, away_country, city, stadium, round_predictions_enabled, predictions_open",
      )
      .order("match_date")
      .order("match_time"),
    supabase
      .from("rounds")
      .select("id_round, name_round, predictions_enabled")
      .order("id_round"),
    supabase.from("match_results").select("*"),
    supabase.from("matches").select("id_match, home_team_id, away_team_id"),
    supabase
      .from("v_players")
      .select(
        "id_player, name, position, club, club_country, id_team, team_code, team_country, group_code",
      )
      .order("team_country")
      .order("name"),
    supabase
      .from("match_goals")
      .select("id_goal, id_match, id_player, minute, is_own_goal, players(name)")
      .order("id_match")
      .order("minute"),
    supabase.from("v_tournament_top_scorer_summary").select("*").single(),
  ]);

  const fixtures = mergeFixturesWithTeams(
    (fixturesRaw ?? []) as FixtureRow[],
    (teamsRaw ?? []) as MatchTeamRow[],
  );

  const players = (playersRaw ?? []) as PlayerRow[];
  const playerNameById = new Map(players.map((p) => [p.id_player, p.name]));

  const resultsByMatch: Record<number, MatchResultRow> = {};
  for (const row of (resultsRaw ?? []) as MatchResultRow[]) {
    resultsByMatch[row.id_match] = row;
  }

  const goalsByMatch: Record<number, MatchGoalRow[]> = {};
  for (const row of goalsRaw ?? []) {
    const nested = row.players as { name: string } | { name: string }[] | null;
    const joinedName = Array.isArray(nested) ? nested[0]?.name : nested?.name;
    const goal: MatchGoalRow = {
      id_goal: row.id_goal,
      id_match: row.id_match,
      id_player: row.id_player,
      minute: row.minute,
      is_own_goal: row.is_own_goal,
      player_name: joinedName ?? playerNameById.get(row.id_player) ?? null,
    };
    if (!goalsByMatch[row.id_match]) goalsByMatch[row.id_match] = [];
    goalsByMatch[row.id_match].push(goal);
  }

  return (
    <>
      <SiteHeader userEmail={user.email} isAdmin activeNav="profile" />
      <main className="mx-auto flex w-full max-w-7xl flex-col gap-section-gap px-gutter-md pb-24 pt-[calc(4rem+2rem)] md:pb-8">
        <header className="space-y-3">
          <p className="font-geist text-sm font-semibold uppercase tracking-widest text-accent">
            Administración
          </p>
          <h1 className="font-headline text-3xl font-bold text-primary md:text-4xl">
            Panel de administración
          </h1>
          <p className="font-geist max-w-2xl text-base leading-relaxed text-on-surface-variant">
            Carga marcadores y goles de cada partido. El goleador del torneo y el
            primer gol se calculan automáticamente. Solo usuarios con permiso de
            administrador.
          </p>
        </header>

        <AdminRoundPhases rounds={roundsRaw ?? []} />

        <AdminClient
          fixtures={fixtures}
          resultsByMatch={resultsByMatch}
          goalsByMatch={goalsByMatch}
          players={players}
          topScorerSummary={topScorerSummary}
        />
      </main>
      <MobileBottomNav active="admin" isAdmin />
    </>
  );
}
