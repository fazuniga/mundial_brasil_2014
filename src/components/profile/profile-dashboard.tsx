import Link from "next/link";
import { MaterialIcon } from "@/components/material-icon";
import { scoringRuleLabel } from "@/lib/scoring-labels";
import type { PoolRankingRow } from "@/lib/pool-rankings-types";
import { formatPredictionLockWindowLabel } from "@/lib/prediction-lock";
import { cn } from "@/lib/utils";

type ProfileData = {
  first_name: string;
  last_name: string;
  username: string | null;
};

type ProfileDashboardProps = {
  userEmail: string | undefined;
  profile: ProfileData | null;
  ranking: PoolRankingRow | null;
  participantCount: number;
  pendingCount: number;
  openFixtureCount: number;
  enabledFixtureCount: number;
};

function profileInitials(firstName: string, lastName: string): string {
  const first = firstName.trim().charAt(0);
  const last = lastName.trim().charAt(0);
  if (first && last) return `${first}${last}`.toUpperCase();
  if (first) return first.toUpperCase();
  return "?";
}

function StatCard({
  label,
  value,
  detail,
  highlight,
}: {
  label: string;
  value: string;
  detail?: string;
  highlight?: boolean;
}) {
  return (
    <div className="rounded-lg border border-outline-variant/40 bg-surface-container-low px-4 py-4">
      <p className="font-geist text-xs font-medium uppercase tracking-wide text-on-surface-variant">
        {label}
      </p>
      <p
        className={cn(
          "font-headline mt-2 text-3xl font-bold tabular-nums",
          highlight ? "text-accent" : "text-primary",
        )}
      >
        {value}
      </p>
      {detail ? (
        <p className="font-geist mt-1 text-xs text-on-surface-variant">{detail}</p>
      ) : null}
    </div>
  );
}

export function ProfileDashboard({
  userEmail,
  profile,
  ranking,
  participantCount,
  pendingCount,
  openFixtureCount,
  enabledFixtureCount,
}: ProfileDashboardProps) {
  const displayName = profile
    ? `${profile.first_name} ${profile.last_name}`.trim() ||
      profile.username ||
      userEmail
    : userEmail;

  const initials = profile
    ? profileInitials(profile.first_name, profile.last_name)
    : (userEmail?.charAt(0).toUpperCase() ?? "?");

  const hasRanking = ranking != null;
  const betsPlaced = ranking?.bets_placed ?? 0;

  const scoringBreakdown = hasRanking
    ? [
        { label: scoringRuleLabel("exact_score"), value: ranking.exact_hits },
        { label: scoringRuleLabel("goal_difference"), value: ranking.goal_diff_hits },
        { label: scoringRuleLabel("winner"), value: ranking.winner_hits },
        { label: scoringRuleLabel("extra_time"), value: ranking.extra_time_hits },
        { label: scoringRuleLabel("first_goal_minute"), value: ranking.first_goal_hits },
        {
          label: `${scoringRuleLabel("tournament_winner")} + ${scoringRuleLabel("top_scorer_player")}`,
          value: ranking.tournament_points,
          isPoints: true,
        },
      ]
    : [];

  return (
    <div className="flex flex-col gap-stack-gap">
      <div className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
        <div className="flex flex-col gap-5 border-b border-outline-variant/50 bg-surface-container-lowest p-6">
          <div className="flex items-center gap-4">
            <div className="flex h-20 w-20 shrink-0 items-center justify-center rounded-full bg-primary-container text-2xl font-bold text-white shadow-sm">
              {initials}
            </div>
            <div className="min-w-0 flex-1 space-y-0.5">
              <h2 className="font-headline truncate text-xl font-bold text-on-surface">
                {displayName}
              </h2>
              {profile?.username ? (
                <p className="font-mono text-xs text-on-surface-variant">
                  @{profile.username} · {userEmail}
                </p>
              ) : null}
              {hasRanking && ranking.rank_position > 0 ? (
                <Link
                  href="/clasificacion"
                  className="font-geist mt-2 inline-flex items-center gap-1.5 rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold text-primary transition-colors hover:bg-primary/15 md:hidden"
                >
                  <MaterialIcon name="leaderboard" className="text-[16px]" />
                  Posición {ranking.rank_position}
                  {participantCount > 0 ? ` de ${participantCount}` : ""}
                </Link>
              ) : null}
            </div>
            {hasRanking && ranking.rank_position > 0 ? (
              <Link
                href="/clasificacion"
                className="font-geist hidden shrink-0 items-center gap-1.5 rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold text-primary transition-colors hover:bg-primary/15 md:inline-flex"
              >
                <MaterialIcon name="leaderboard" className="text-[16px]" />
                Posición {ranking.rank_position}
                {participantCount > 0 ? ` de ${participantCount}` : ""}
              </Link>
            ) : null}
          </div>

          <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
            <StatCard
              label="Puntos totales"
              value={hasRanking ? String(ranking.total_points) : "—"}
              detail="Puntos en pronósticos y apuestas especiales"
              highlight={hasRanking && ranking.total_points > 0}
            />
            <StatCard
              label="Pronósticos guardados"
              value={String(betsPlaced)}
              detail={
                enabledFixtureCount > 0
                  ? `de ${enabledFixtureCount} partidos con pronósticos habilitados`
                  : undefined
              }
            />
            <StatCard
              label="Partidos abiertos"
              value={String(openFixtureCount)}
              detail={`Abiertos hasta ${formatPredictionLockWindowLabel()} antes del partido`}
            />
            <StatCard
              label="Pendientes"
              value={String(pendingCount)}
              detail={
                pendingCount > 0
                  ? "Sin pronóstico y aún abiertos"
                  : openFixtureCount === 0
                    ? "Ningún partido abierto"
                    : "Al día con tus pronósticos"
              }
              highlight={pendingCount > 0}
            />
          </div>
        </div>

        {hasRanking && (ranking.match_points > 0 || ranking.tournament_points > 0) ? (
          <div className="border-b border-outline-variant/50 p-6">
            <div className="mb-4 flex flex-col md:flex-row items-start justify-between gap-1">
              <h3 className="font-geist text-sm font-semibold text-on-surface">
                Desglose de puntos
              </h3>
              <p className="font-geist text-xs text-on-surface-variant">
                {ranking.match_points} pts en partidos · {ranking.tournament_points} pts en
                apuestas especiales
              </p>
            </div>
            <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-5">
              {scoringBreakdown.map((item) => (
                <div
                  key={item.label}
                  className="rounded-lg border border-outline-variant/30 bg-surface-container-lowest px-3 py-2.5"
                >
                  <p className="font-geist text-[11px] leading-tight text-on-surface-variant">
                    {item.label}
                  </p>
                  <p className="font-headline mt-1 text-lg font-bold tabular-nums text-primary">
                    {item.value}
                    {item.isPoints ? (
                      <span className="font-geist ml-0.5 text-xs font-normal text-on-surface-variant">
                        pts
                      </span>
                    ) : null}
                  </p>
                </div>
              ))}
            </div>
          </div>
        ) : null}

        <div className="flex flex-wrap gap-3 p-6 items-center justify-center">
          <Link
            href="/apuestas"
            className="font-geist inline-flex flex-1 items-center justify-center gap-2 rounded-lg bg-primary px-4 py-2.5 text-sm font-medium text-white shadow-sm transition-colors hover:bg-primary-container sm:flex-none"
          >
            <MaterialIcon name="event_note" className="text-[18px]" />
            {pendingCount > 0 ? `Pronosticar (${pendingCount})` : "Ir a Apuestas"}
          </Link>
          <Link
            href="/clasificacion"
            className="font-geist inline-flex flex-1 items-center justify-center gap-2 rounded-lg border border-outline-variant bg-surface-container-lowest px-4 py-2.5 text-sm font-medium text-on-surface transition-colors hover:bg-surface-container-high sm:flex-none"
          >
            <MaterialIcon name="leaderboard" className="text-[18px]" />
            Clasificación
          </Link>
          <Link
            href="/partidos"
            className="font-geist inline-flex flex-1 items-center justify-center gap-2 rounded-lg border border-outline-variant bg-surface-container-lowest px-4 py-2.5 text-sm font-medium text-on-surface transition-colors hover:bg-surface-container-high sm:flex-none"
          >
            <MaterialIcon name="sports_soccer" className="text-[18px]" />
            Partidos
          </Link>
        </div>
      </div>
    </div>
  );
}
