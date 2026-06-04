import { createClient } from "@/lib/supabase/server";
import { GroupStandingsSections } from "@/components/group-standings-sections";
import { MobileBottomNav } from "@/components/mobile-bottom-nav";
import { SiteHeader } from "@/components/site-header";
import {
  GROUP_CODES,
  groupStandingsByCode,
  type GroupStandingRow,
} from "@/lib/group-standings";

export default async function GruposPage() {
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

  const { data: standingsRaw, error } = await supabase
    .from("v_group_standings")
    .select(
      "group_code, id_team, team_name, team_code, played, wins, draws, losses, goals_for, goals_against, goal_diff, points",
    )
    .order("group_code")
    .order("points", { ascending: false })
    .order("goal_diff", { ascending: false })
    .order("goals_for", { ascending: false });

  const standings = (standingsRaw ?? []) as GroupStandingRow[];
  const groupedMap = groupStandingsByCode(standings);
  const grouped = Object.fromEntries(
    GROUP_CODES.map((code) => [code, groupedMap.get(code) ?? []]),
  );

  return (
    <>
      <SiteHeader userEmail={user?.email} isAdmin={isAdmin} activeNav="grupos" />
      <main className="mx-auto flex w-full max-w-7xl flex-col gap-section-gap px-gutter-md pb-24 pt-[calc(4rem+2rem)] md:pb-8">
        <header className="space-y-2">
          <p className="font-geist text-xs font-semibold uppercase tracking-widest text-accent">
            Fase de Grupos
          </p>
          <h1 className="font-headline text-2xl font-bold text-primary md:text-3xl">
            Grupos
          </h1>
          <p className="font-geist max-w-2xl text-sm text-on-surface-variant">
            Posiciones por grupo según resultados oficiales del torneo. Los dos
            primeros de cada grupo avanzan a Dieciseisavos de Final.
          </p>
        </header>

        <div className="light-surface-panel flex flex-col gap-stack-gap">
          {error ? (
            <div className="rounded-xl border border-destructive/40 bg-destructive/10 px-4 py-3 font-geist text-sm text-destructive">
              No se pudieron cargar las posiciones. Vuelve a intentar más tarde.
            </div>
          ) : null}

          {!error ? <GroupStandingsSections grouped={grouped} /> : null}
        </div>
      </main>
      <MobileBottomNav active="grupos" isAdmin={isAdmin} />
    </>
  );
}
