import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { Format2026Note } from "@/components/format-2026-note";
import { SiteHeader } from "@/components/site-header";
import { PageShell } from "@/components/page-shell";
import { StandingsTable } from "@/components/standings-table";
import { cn } from "@/lib/utils";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";

export default async function HomePage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  const { data: standings } = await supabase
    .from("v_group_standings")
    .select(
      "group_code, team_name, team_code, played, wins, draws, losses, goals_for, goals_against, goal_diff, points",
    )
    .order("group_code")
    .order("points", { ascending: false });

  const { data: rounds } = await supabase
    .from("rounds")
    .select("id_round, name_round")
    .order("id_round");

  const { data: scoringRules } = await supabase
    .from("scoring_rules")
    .select("rule_key, points")
    .order("rule_key");

  return (
    <>
      <SiteHeader userEmail={user?.email} />
      <main>
        <PageShell wide className="flex flex-col gap-8 py-10">
          <section className="border-l-4 border-primary pl-5">
            <h1 className="text-3xl font-bold tracking-tight">Polla Mundial 2026</h1>
            <p className="mt-3 max-w-3xl text-muted-foreground">
              Next.js App Router + Supabase Auth + Postgres engine ported from the
              Brasil 2014 polla.
            </p>
            {!user && (
              <div className="mt-5 flex flex-wrap gap-3">
                <Link
                  href="/register"
                  className={cn(
                    "inline-flex h-8 items-center justify-center rounded-lg bg-primary px-3 text-xs font-medium text-primary-foreground shadow-sm transition-colors hover:bg-primary-hover",
                  )}
                >
                  Registro
                </Link>
                <Link
                  href="/login"
                  className={cn(
                    "inline-flex h-8 items-center justify-center rounded-lg border border-border bg-card px-3 text-xs font-medium text-foreground transition-colors hover:bg-muted",
                  )}
                >
                  Ingresar
                </Link>
              </div>
            )}
          </section>

          <Card className="border-primary/20">
            <CardHeader>
              <CardTitle>v_group_standings</CardTitle>
              <CardDescription>
                Per-team group stage stats (from vw_results_by_group_tmp chain)
              </CardDescription>
            </CardHeader>
            <CardContent>
              {standings?.length ? (
                <StandingsTable rows={standings} />
              ) : (
                <p className="text-sm text-muted-foreground">
                  Seed data (teams, venues, matches): migration{" "}
                  <code className="rounded-md bg-secondary px-1.5 py-0.5 font-mono text-xs">
                    20260603000005_seed_teams_venues_matches.sql
                  </code>{" "}
                  loads 48 group teams, 16 venues, 104 matches. Run{" "}
                  <code className="rounded-md bg-secondary px-1.5 py-0.5 font-mono text-xs">
                    supabase/apply-all.sql
                  </code>{" "}
                  in the SQL Editor.
                </p>
              )}
            </CardContent>
          </Card>

          <div className="grid gap-6 lg:grid-cols-2">
            <Card>
              <CardHeader>
                <CardTitle>rounds</CardTitle>
                <CardDescription>Catalog seed (id_round, name_round)</CardDescription>
              </CardHeader>
              <CardContent>
                {(rounds ?? []).length > 0 ? (
                  <ul className="grid gap-2">
                    {(rounds ?? []).map((r) => (
                      <li
                        key={r.id_round}
                        className="flex items-baseline justify-between gap-3 rounded-lg bg-muted px-3 py-2.5 text-sm"
                      >
                        <span className="font-medium">{r.name_round}</span>
                        <span className="font-mono text-xs text-muted-foreground">
                          id_round {r.id_round}
                        </span>
                      </li>
                    ))}
                  </ul>
                ) : (
                  <p className="text-sm text-muted-foreground">
                    Run the full script{" "}
                    <code className="rounded-md bg-secondary px-1.5 py-0.5 font-mono text-xs">
                      supabase/apply-all.sql
                    </code>{" "}
                    (or migrations in{" "}
                    <code className="rounded-md bg-secondary px-1.5 py-0.5 font-mono text-xs">
                      supabase/migrations
                    </code>
                    ).
                  </p>
                )}
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle>scoring_rules</CardTitle>
                <CardDescription>
                  Scoring weights (was puntos_apuestas)
                </CardDescription>
              </CardHeader>
              <CardContent>
                {(scoringRules ?? []).length > 0 ? (
                  <ul className="grid gap-2">
                    {(scoringRules ?? []).map((rule) => (
                      <li
                        key={rule.rule_key}
                        className="flex items-baseline justify-between gap-3 rounded-lg bg-muted px-3 py-2.5 text-sm"
                      >
                        <span className="font-mono text-xs">{rule.rule_key}</span>
                        <span className="font-medium tabular-nums">
                          {rule.points} points
                        </span>
                      </li>
                    ))}
                  </ul>
                ) : (
                  <p className="text-sm text-muted-foreground">
                    Catalog seed in{" "}
                    <code className="rounded-md bg-secondary px-1.5 py-0.5 font-mono text-xs">
                      20260603000003_seed_catalog.sql
                    </code>
                    .
                  </p>
                )}
              </CardContent>
            </Card>
          </div>

          <Format2026Note />
        </PageShell>
      </main>
    </>
  );
}
