import Link from "next/link";
import type { ReactNode } from "react";
import { MaterialIcon } from "@/components/material-icon";
import type { MatchResultScore } from "@/lib/home-fixtures";
import { MATCH_TIMEZONE_ABBR } from "@/lib/match-timezone";
import type { FixtureRow } from "@/lib/predictions-types";
import { formatFixtureDateTime } from "@/lib/predictions-utils";
import { teamFlagUrl, teamInitials } from "@/lib/team-display";
import { cn } from "@/lib/utils";

type HomeFixturesSectionProps = {
  upcoming: FixtureRow[];
  completed: FixtureRow[];
  resultsByMatch: Record<number, MatchResultScore>;
};

function TeamBadge({
  country,
  code,
  align,
}: {
  country: string;
  code: string;
  align: "left" | "right";
}) {
  const flagUrl = teamFlagUrl(code);

  return (
    <div
      className={cn(
        "flex min-w-0 flex-1 items-center gap-2",
        align === "right" && "flex-row-reverse text-right",
      )}
    >
      <div className="flex h-8 w-8 shrink-0 items-center justify-center overflow-hidden rounded-full border border-outline-variant/50 bg-surface-container-high">
        {flagUrl ? (
          // eslint-disable-next-line @next/next/no-img-element
          <img
            src={flagUrl}
            alt=""
            className="h-full w-full object-cover"
          />
        ) : (
          <span className="font-mono text-[10px] font-bold text-primary">
            {teamInitials(code)}
          </span>
        )}
      </div>
      <p className="truncate font-geist text-sm font-medium text-on-surface">
        {country}
      </p>
    </div>
  );
}

function FixtureRowCard({
  fixture,
  score,
  showPredictLink,
}: {
  fixture: FixtureRow;
  score?: { home: number; away: number };
  showPredictLink: boolean;
}) {
  const { dateShort, timeShort } = formatFixtureDateTime(
    fixture.match_date,
    fixture.match_time,
  );
  const meta = [fixture.name_round, fixture.group_code && `Grupo ${fixture.group_code}`]
    .filter(Boolean)
    .join(" · ");

  return (
    <li className="border-b border-outline-variant/40 last:border-b-0">
      <div className="flex flex-col gap-3 px-4 py-4 sm:flex-row sm:items-center sm:gap-4">
        <div className="min-w-0 shrink-0 sm:w-36">
          <p className="font-geist text-xs font-medium capitalize text-on-surface">
            {dateShort}
          </p>
          <p className="font-geist text-xs text-on-surface-variant">
            {timeShort} {MATCH_TIMEZONE_ABBR}
          </p>
          {meta ? (
            <p className="font-geist mt-1 truncate text-[11px] text-on-surface-variant">
              {meta}
            </p>
          ) : null}
        </div>

        <div className="flex min-w-0 flex-1 items-center gap-2">
          <TeamBadge
            country={fixture.home_country}
            code={fixture.home_code}
            align="right"
          />
          <div className="flex shrink-0 flex-col items-center px-1">
            {score ? (
              <p className="font-headline text-xl font-bold tabular-nums text-primary">
                {score.home}
                <span className="mx-1 text-on-surface-variant">-</span>
                {score.away}
              </p>
            ) : (
              <span className="font-geist text-xs font-semibold text-on-surface-variant">
                vs
              </span>
            )}
          </div>
          <TeamBadge
            country={fixture.away_country}
            code={fixture.away_code}
            align="left"
          />
        </div>

        {showPredictLink && fixture.predictions_open ? (
          <Link
            href="/predictions"
            className="font-geist flex shrink-0 items-center gap-1 self-start text-xs font-medium text-primary hover:underline sm:self-center"
          >
            Pronosticar
            <MaterialIcon name="chevron_right" className="text-base" />
          </Link>
        ) : null}
      </div>
    </li>
  );
}

function FixturesCard({
  title,
  description,
  icon,
  action,
  fixtures,
  resultsByMatch,
  variant,
}: {
  title: string;
  description: string;
  icon: string;
  action?: ReactNode;
  fixtures: FixtureRow[];
  resultsByMatch: Record<number, MatchResultScore>;
  variant: "upcoming" | "completed";
}) {
  return (
    <section className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
      <div className="flex flex-wrap items-start justify-between gap-3 border-b border-outline-variant/50 bg-surface-container-lowest p-5">
        <div className="flex min-w-0 items-start gap-3">
          <MaterialIcon name={icon} className="mt-0.5 text-2xl text-accent" />
          <div>
            <h3 className="font-geist text-lg font-semibold text-on-surface">
              {title}
            </h3>
            <p className="font-geist mt-1 text-sm text-on-surface-variant">
              {description}
            </p>
          </div>
        </div>
        {action}
      </div>

      {fixtures.length > 0 ? (
        <ul>
          {fixtures.map((fixture) => {
            const result = resultsByMatch[fixture.id_match];
            const score =
              variant === "completed" &&
              result?.goals_home != null &&
              result?.goals_away != null
                ? { home: result.goals_home, away: result.goals_away }
                : undefined;

            return (
              <FixtureRowCard
                key={fixture.id_match}
                fixture={fixture}
                score={score}
                showPredictLink={variant === "upcoming"}
              />
            );
          })}
        </ul>
      ) : (
        <p className="font-geist px-5 py-8 text-sm text-on-surface-variant">
          {variant === "upcoming"
            ? "No hay partidos programados por ahora."
            : "Aún no hay partidos con resultado cargado."}
        </p>
      )}
    </section>
  );
}

export function HomeFixturesSection({
  upcoming,
  completed,
  resultsByMatch,
}: HomeFixturesSectionProps) {
  return (
    <div className="grid grid-cols-1 gap-stack-gap xl:grid-cols-2">
      <FixturesCard
        title="Próximos partidos"
        description="Calendario del torneo · horarios en Chile"
        icon="schedule"
        variant="upcoming"
        fixtures={upcoming}
        resultsByMatch={resultsByMatch}
        action={
          <Link
            href="/predictions"
            className="font-geist flex items-center gap-1 rounded-lg border border-outline-variant px-3 py-2 text-xs font-medium text-on-surface transition-colors hover:bg-surface-variant"
          >
            Ver todos
            <MaterialIcon name="arrow_forward" className="text-base" />
          </Link>
        }
      />
      <FixturesCard
        title="Partidos finalizados"
        description="Últimos resultados oficiales cargados"
        icon="sports_soccer"
        variant="completed"
        fixtures={completed}
        resultsByMatch={resultsByMatch}
      />
    </div>
  );
}
