import Link from "next/link";
import { MaterialIcon } from "@/components/material-icon";
import { MATCH_TIMEZONE_ABBR } from "@/lib/match-timezone";
import { MatchGoalsDetail } from "@/components/match-goals-detail";
import type { MatchGoalPublicRow } from "@/lib/match-goals-display";
import type { FixtureRow } from "@/lib/predictions-types";
import { formatFixtureDateTime } from "@/lib/predictions-utils";
import { teamFlagUrl, teamInitials } from "@/lib/team-display";
import { cn } from "@/lib/utils";

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

type FixtureRowCardProps = {
  fixture: FixtureRow;
  score?: { home: number; away: number };
  goals?: MatchGoalPublicRow[];
  showPredictLink: boolean;
  showVenue?: boolean;
};

export function FixtureRowCard({
  fixture,
  score,
  goals,
  showPredictLink,
  showVenue = false,
}: FixtureRowCardProps) {
  const { dateShort, timeShort } = formatFixtureDateTime(
    fixture.match_date,
    fixture.match_time,
  );
  const meta = [fixture.name_round, fixture.group_code && `Grupo ${fixture.group_code}`]
    .filter(Boolean)
    .join(" · ");

  return (
    <li className="border-b border-outline-variant/40 last:border-b-0">
      <div className="flex flex-col gap-3 px-4 py-3 sm:flex-row sm:items-center sm:gap-4">
        <div className="min-w-0 shrink-0 sm:w-36">
          <p className="font-geist text-xs font-medium capitalize text-on-surface">
            {dateShort} · {timeShort} {MATCH_TIMEZONE_ABBR}
          </p>
          {meta ? (
            <p className="font-geist mt-1 truncate text-[11px] text-on-surface-variant">
              {meta}
            </p>
          ) : null}
          {showVenue && (fixture.city || fixture.stadium) ? (
            <p className="font-geist mt-1 truncate text-[11px] text-on-surface-variant">
              {fixture.city}
              {fixture.stadium ? ` · ${fixture.stadium}` : ""}
            </p>
          ) : null}
        </div>

        <div className="flex min-w-0 flex-1 flex-col gap-1.5">
          <div className="flex items-center gap-2">
            <TeamBadge
              country={fixture.home_country}
              code={fixture.home_code}
              align="right"
            />
            <div className="flex w-14 shrink-0 flex-col items-center px-1 sm:w-16">
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

          {goals && goals.length > 0 ? (
            <MatchGoalsDetail
              goals={goals}
              homeCode={fixture.home_code}
              awayCode={fixture.away_code}
            />
          ) : null}
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
