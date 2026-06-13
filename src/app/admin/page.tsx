import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { MobileBottomNav } from "@/components/mobile-bottom-nav";
import { SiteHeader } from "@/components/site-header";
import { AdminClient } from "@/components/admin/admin-client";
import { AdminPoolsSection } from "@/components/admin/admin-pools-section";
import { AdminSquadsSection } from "@/components/admin/admin-squads-section";
import { AdminRoundPhases } from "@/components/admin/admin-round-phases";
import type { FixtureRow, PlayerRow } from "@/lib/predictions-types";
import type {
  AdminFixtureRow,
  AdminPoolRow,
  AdminTeamRow,
  MatchGoalRow,
  MatchResultRow,
} from "@/lib/admin-types";
import { filterAdminVisibleFixtures } from "@/lib/admin-utils";

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
    { data: playersRaw },
    { data: goalsRaw },
    { data: topScorerSummary },
    { data: winnerSummaryRaw },
    { data: poolsRaw },
    { data: teamsRaw },
    { data: specialBetsSettingsRaw },
  ] = await Promise.all([
    supabase
      .from("v_fixture_resolved")
      .select(
        "id_match, id_round, name_round, group_code, dow, match_date, match_time, home_code, home_country, away_code, away_country, city, stadium, round_predictions_enabled, predictions_open, home_team_id, away_team_id",
      )
      .order("match_date")
      .order("match_time"),
    supabase
      .from("rounds")
      .select("id_round, name_round, predictions_enabled")
      .order("id_round"),
    supabase.from("match_results").select("*"),
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
    supabase
      .from("v_tournament_winner_summary")
      .select("winner_team_id, winner_country, winner_code")
      .single(),
    supabase
      .from("pools")
      .select("id_pool, description, is_paid_group_phase, is_paid_knockout, owner_id, profiles(first_name, last_name, username)")
      .order("id_pool"),
    supabase
      .from("teams")
      .select("id_team, country, code, groups(group_code)")
      .not("id_group", "is", null)
      .order("country"),
    supabase
      .from("v_tournament_bet_open")
      .select("tournament_bet_open, tournament_bet_auto_open, special_bets_open_override")
      .single(),
  ]);

  const specialBetsSettings = {
    tournament_bet_open: specialBetsSettingsRaw?.tournament_bet_open ?? true,
    tournament_bet_auto_open: specialBetsSettingsRaw?.tournament_bet_auto_open ?? true,
    special_bets_open_override:
      specialBetsSettingsRaw?.special_bets_open_override ?? null,
  };

  const adminTeams: AdminTeamRow[] = (teamsRaw ?? [])
    .map((row) => {
      const nested = row.groups as { group_code: string } | { group_code: string }[] | null;
      const group = Array.isArray(nested) ? nested[0] : nested;
      return {
        id_team: row.id_team,
        country: row.country,
        code: row.code,
        group_code: group?.group_code ?? null,
      };
    })
    .sort((a, b) => {
      const groupCmp = (a.group_code ?? "").localeCompare(b.group_code ?? "");
      if (groupCmp !== 0) return groupCmp;
      return a.country.localeCompare(b.country, "es");
    });

  const adminPools: AdminPoolRow[] = (poolsRaw ?? []).map((row) => {
    const nested = row.profiles as
      | { first_name: string; last_name: string; username: string | null }
      | { first_name: string; last_name: string; username: string | null }[]
      | null;
    const profile = Array.isArray(nested) ? nested[0] : nested;
    const displayName = profile
      ? `${profile.first_name} ${profile.last_name}`.trim()
      : null;
    return {
      id_pool: row.id_pool,
      description: row.description,
      is_paid_group_phase: row.is_paid_group_phase,
      is_paid_knockout: row.is_paid_knockout,
      owner_id: row.owner_id,
      display_name: displayName || null,
      username: profile?.username ?? null,
    };
  });

  const fixtures: AdminFixtureRow[] = filterAdminVisibleFixtures(
    (fixturesRaw ?? []).map((row) => ({
      ...(row as FixtureRow),
      home_team_id: (row as AdminFixtureRow).home_team_id ?? 0,
      away_team_id: (row as AdminFixtureRow).away_team_id ?? 0,
    })),
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
      <SiteHeader userEmail={user.email} isAdmin activeNav="perfil" />
      <main className="mx-auto flex w-full max-w-7xl flex-col gap-4 px-gutter-md py-24 md:pb-8">
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

        <AdminPoolsSection pools={adminPools} />

        <AdminSquadsSection teams={adminTeams} players={players} />

        <AdminClient
          fixtures={fixtures}
          resultsByMatch={resultsByMatch}
          goalsByMatch={goalsByMatch}
          players={players}
          topScorerSummary={topScorerSummary}
          winnerSummary={winnerSummaryRaw}
          specialBetsSettings={specialBetsSettings}
        />
      </main>
      <MobileBottomNav active="admin" isAdmin />
    </>
  );
}
