"use client";

import { useState, type ReactNode } from "react";
import { MaterialIcon } from "@/components/material-icon";
import { TeamFlag } from "@/components/team-flag";
import {
  formatBetStatLine,
  topBetStatRows,
  type SpecialBetsPredictionStatsData,
} from "@/lib/special-bets-stats";
import { scoringRuleLabel } from "@/lib/scoring-labels";
import { cn } from "@/lib/utils";

type SpecialBetsPredictionStatsProps = {
  stats: SpecialBetsPredictionStatsData | null;
  compact?: boolean;
};

type BetStatItem = {
  key: string;
  label: string;
  sublabel?: string;
  value: string;
  percent: number | null;
  flagCode?: string;
  flagCountry?: string;
  leading?: ReactNode;
};

function BetStatRow({ item }: { item: BetStatItem }) {
  const pct = item.percent ?? 0;

  return (
    <div className="rounded-lg border border-outline-variant/30 bg-surface-container-low/70 px-3 py-2.5">
      <div className="flex items-center gap-2.5">
        {item.flagCode && item.flagCountry ? (
          <TeamFlag
            code={item.flagCode}
            country={item.flagCountry}
            className="h-7 w-7"
          />
        ) : item.leading ? (
          <div
            aria-hidden
            className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full border border-outline-variant/50 bg-surface-container-high"
          >
            {item.leading}
          </div>
        ) : null}
        <div className="min-w-0 flex-1">
          <p className="truncate font-geist text-sm font-medium text-on-surface">
            {item.label}
          </p>
          {item.sublabel ? (
            <p className="truncate font-geist text-xs text-on-surface-variant">
              {item.sublabel}
            </p>
          ) : null}
        </div>
        <span className="shrink-0 font-headline text-sm font-semibold tabular-nums text-primary">
          {item.value}
        </span>
      </div>
      {item.percent != null ? (
        <div
          className="mt-2 h-1.5 overflow-hidden rounded-full bg-surface-container-high"
          role="presentation"
        >
          <div
            className="h-full rounded-full bg-primary/75"
            style={{ width: `${pct}%` }}
          />
        </div>
      ) : null}
    </div>
  );
}

function BetStatRowList({ items }: { items: BetStatItem[] }) {
  if (items.length === 0) return null;

  return (
    <ul className="flex flex-col gap-2">
      {items.map((item) => (
        <li key={item.key}>
          <BetStatRow item={item} />
        </li>
      ))}
    </ul>
  );
}

function StatBlock({
  title,
  total,
  emptyMessage,
  children,
}: {
  title: string;
  total: number;
  emptyMessage: string;
  children: ReactNode;
}) {
  return (
    <section className="space-y-3">
      <p className="font-geist text-[11px] font-medium uppercase tracking-wide text-on-surface-variant">
        {title}
        {total > 0 ? (
          <span className="font-normal normal-case tracking-normal text-on-surface-variant">
            {" "}
            · {total} {total === 1 ? "apuesta" : "apuestas"}
          </span>
        ) : null}
      </p>
      {total > 0 ? children : (
        <p className="font-geist text-xs text-on-surface-variant">{emptyMessage}</p>
      )}
    </section>
  );
}

function buildOtherItem(
  otherCount: number,
  total: number,
): BetStatItem {
  const line = formatBetStatLine("Otros", otherCount, total);
  return {
    key: "other",
    label: line.label,
    value: line.value,
    percent: line.percent,
    leading: (
      <MaterialIcon name="more_horiz" className="text-base text-on-surface-variant" />
    ),
  };
}

export function SpecialBetsPredictionStats({
  stats,
  compact = false,
}: SpecialBetsPredictionStatsProps) {
  const [open, setOpen] = useState(true);

  if (!stats) return null;

  const { summary, winnerStats, topScorerStats, goalsStats } = stats;
  const hasAnyBets =
    summary.winner_bet_count > 0 ||
    summary.top_scorer_bet_count > 0 ||
    summary.goals_bet_count > 0;

  const winnerTop = topBetStatRows(winnerStats, compact ? 3 : 5);
  const scorerTop = topBetStatRows(topScorerStats, compact ? 3 : 5);
  const goalsTop = topBetStatRows(goalsStats, compact ? 4 : 6);

  const winnerItems: BetStatItem[] = winnerTop.top.map((row) => {
    const line = formatBetStatLine(row.team_country, row.bet_count, summary.winner_bet_count);
    return {
      key: String(row.team_id),
      label: line.label,
      value: line.value,
      percent: line.percent,
      flagCode: row.team_code,
      flagCountry: row.team_country,
    };
  });
  if (winnerTop.otherCount > 0) {
    winnerItems.push(buildOtherItem(winnerTop.otherCount, summary.winner_bet_count));
  }

  const scorerItems: BetStatItem[] = scorerTop.top.map((row) => {
    const line = formatBetStatLine(row.player_name, row.bet_count, summary.top_scorer_bet_count);
    return {
      key: String(row.player_id),
      label: line.label,
      sublabel: row.team_country,
      value: line.value,
      percent: line.percent,
      flagCode: row.team_code,
      flagCountry: row.team_country,
    };
  });
  if (scorerTop.otherCount > 0) {
    scorerItems.push(buildOtherItem(scorerTop.otherCount, summary.top_scorer_bet_count));
  }

  const goalsItems: BetStatItem[] = goalsTop.top.map((row) => {
    const goalsLabel = `${row.goals} gol${row.goals === 1 ? "" : "es"}`;
    const line = formatBetStatLine(goalsLabel, row.bet_count, summary.goals_bet_count);
    return {
      key: String(row.goals),
      label: line.label,
      value: line.value,
      percent: line.percent,
      leading: (
        <span className="font-headline text-xs font-bold tabular-nums text-primary">
          {row.goals}
        </span>
      ),
    };
  });
  if (goalsTop.otherCount > 0) {
    goalsItems.push(buildOtherItem(goalsTop.otherCount, summary.goals_bet_count));
  }

  return (
    <>
      <button
        type="button"
        onClick={() => setOpen((value) => !value)}
        className="flex w-full flex-wrap items-start justify-between gap-3 border-b border-outline-variant/50 bg-white p-4 text-left transition-colors hover:bg-surface-container-low/30"
        aria-expanded={open}
        aria-label={
          open
            ? "Ocultar pronósticos de Apuestas Especiales"
            : "Mostrar pronósticos de Apuestas Especiales"
        }
      >
        <div className="flex min-w-0 items-center gap-3">
          <MaterialIcon name="bar_chart" className="text-2xl text-accent" />
          <div className="flex flex-col gap-0">
            <h2 className="font-geist text-lg font-semibold text-on-surface">
              ¿Qué apostó la gente?
            </h2>
            <p className="font-geist text-sm text-on-surface-variant">
              Pronósticos agregados de Apuestas Especiales
            </p>
          </div>
        </div>
        <MaterialIcon
          name={open ? "expand_less" : "expand_more"}
          className="shrink-0 text-xl text-on-surface-variant"
        />
      </button>

      {open ? (
        <div className="space-y-5 p-4">
          {!hasAnyBets ? (
            <p className="font-geist text-xs text-on-surface-variant">
              Aún no hay pronósticos registrados en Apuestas Especiales.
            </p>
          ) : (
            <div
              className={cn(
                "grid gap-5",
                compact ? "grid-cols-1" : "grid-cols-1 lg:grid-cols-3",
              )}
            >
              <StatBlock
                title={scoringRuleLabel("tournament_winner")}
                total={summary.winner_bet_count}
                emptyMessage="Sin apuestas de campeón registradas."
              >
                <BetStatRowList items={winnerItems} />
              </StatBlock>

              <StatBlock
                title={scoringRuleLabel("top_scorer_player")}
                total={summary.top_scorer_bet_count}
                emptyMessage="Sin apuestas de goleador registradas."
              >
                <BetStatRowList items={scorerItems} />
              </StatBlock>

              <StatBlock
                title={scoringRuleLabel("top_scorer_goals")}
                total={summary.goals_bet_count}
                emptyMessage="Sin apuestas de goles registradas."
              >
                <BetStatRowList items={goalsItems} />
              </StatBlock>
            </div>
          )}
        </div>
      ) : null}
    </>
  );
}
