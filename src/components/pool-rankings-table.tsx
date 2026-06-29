import { MaterialIcon } from "@/components/material-icon";
import { scoringRuleLabel } from "@/lib/scoring-labels";
import { cn } from "@/lib/utils";
import type { PoolRankingRow } from "@/lib/pool-rankings-types";

type PoolRankingsTableProps = {
  rows: PoolRankingRow[];
  currentUserId?: string | null;
};

function isPodiumPosition(position: number): boolean {
  return position >= 1 && position <= 3;
}

function rankAriaLabel(position: number): string | null {
  if (position === 1) return "Primer lugar";
  if (position === 2) return "Segundo lugar";
  if (position === 3) return "Tercer lugar";
  return null;
}

function rankRowClassName(position: number): string | null {
  if (position === 1) return "bg-amber-50";
  if (position === 2) return "bg-slate-100";
  if (position === 3) return "bg-orange-50";
  return null;
}

function rankBadgeClassName(position: number): string {
  if (position === 1) return "bg-amber-500 text-white";
  if (position === 2) return "bg-slate-400 text-white";
  return "bg-amber-700 text-white";
}

function paymentStatusLabel(phase: string, isPaid: boolean): string {
  return `${phase}: ${isPaid ? "Pagado" : "Pendiente de pago"}`;
}

function PaymentStatusIcon({
  phase,
  isPaid,
  size = "default",
}: {
  phase: string;
  isPaid: boolean;
  size?: "default" | "tiny";
}) {
  const label = paymentStatusLabel(phase, isPaid);
  return (
    <span title={label} aria-label={label} className="inline-flex shrink-0">
      <MaterialIcon
        name={isPaid ? "paid" : "money_off"}
        className={cn(
          isPaid ? "text-primary" : "text-accent",
          size === "tiny" ? "text-[16px]! leading-none" : "text-sm",
        )}
      />
    </span>
  );
}

function PlayerPaymentIcons({ row }: { row: PoolRankingRow }) {
  if (row.id_pool == null) return null;

  return (
    <div className="mt-0.5 flex items-center gap-1.5">
      <PaymentStatusIcon
        phase="Fase de Grupos"
        isPaid={row.is_paid_group_phase}
        size="tiny"
      />
      <PaymentStatusIcon
        phase="Fases eliminatorias"
        isPaid={row.is_paid_knockout}
        size="tiny"
      />
    </div>
  );
}

function PlayerCell({
  row,
  showPayment,
}: {
  row: PoolRankingRow;
  showPayment: boolean;
}) {
  return (
    <div role="cell" className="min-w-0 px-2 py-2 sm:px-3 sm:py-3">
      <p className="truncate text-sm font-medium text-on-surface">
        {row.display_name || row.username}
      </p>
      {showPayment ? <PlayerPaymentIcons row={row} /> : null}
    </div>
  );
}

function RankCell({ row }: { row: PoolRankingRow }) {
  const podium = isPodiumPosition(row.rank_position);
  const podiumLabel = rankAriaLabel(row.rank_position);

  return (
    <div
      role="cell"
      className="px-1.5 py-2 text-center tabular-nums sm:px-2 sm:py-3"
    >
      {podium ? (
        <span
          title={podiumLabel ?? undefined}
          aria-label={podiumLabel ?? undefined}
          className={cn(
            "inline-flex size-6 items-center justify-center rounded-full text-xs font-bold sm:size-7 sm:text-sm",
            rankBadgeClassName(row.rank_position),
          )}
        >
          {row.rank_position}
        </span>
      ) : (
        <span className="font-semibold text-on-surface">{row.rank_position}</span>
      )}
    </div>
  );
}

function PointsCell({ row }: { row: PoolRankingRow }) {
  return (
    <div role="cell" className="px-2 py-2 text-center sm:px-3 sm:py-3">
      <span className="font-headline text-base font-bold tabular-nums text-primary sm:text-lg">
        {row.total_points}
      </span>
    </div>
  );
}

function BetsCell({ row }: { row: PoolRankingRow }) {
  return (
    <div
      role="cell"
      className="px-2 py-2 text-center tabular-nums sm:px-3 sm:py-3"
    >
      {row.bets_placed}
    </div>
  );
}

function gridColumns(variant: "compact" | "full"): string {
  if (variant === "compact") {
    return "2.25rem minmax(0,12rem) minmax(3rem, 1fr) minmax(3.75rem, 1fr)";
  }
  return [
    "2.5rem",
    "minmax(0,12rem)",
    "3.25rem",
    "4rem",
    "minmax(3.75rem,1fr)",
    "minmax(3.5rem,1fr)",
    "minmax(4rem,1fr)",
    "minmax(4rem,1fr)",
    "minmax(4rem,1fr)",
    "minmax(4rem,1fr)",
    "minmax(4rem,1fr)",
  ].join(" ");
}

type RankingRowProps = {
  row: PoolRankingRow;
  currentUserId?: string | null;
  showPayment: boolean;
  variant: "compact" | "full";
};

function RankingRow({
  row,
  currentUserId,
  showPayment,
  variant,
}: RankingRowProps) {
  const podium = isPodiumPosition(row.rank_position);
  const isCurrentUser = currentUserId != null && row.owner_id === currentUserId;

  return (
    <div
      role="row"
      className={cn(
        "grid items-center gap-x-2 border-b border-outline-variant/30",
        rankRowClassName(row.rank_position),
        isCurrentUser && !podium && "border-outline-variant/40 bg-primary-container/15",
        isCurrentUser && podium && "ring-inset ring-primary/35",
      )}
      style={{ gridTemplateColumns: gridColumns(variant) }}
    >
      <RankCell row={row} />
      <PlayerCell row={row} showPayment={showPayment} />
      <BetsCell row={row} />
      <PointsCell row={row} />
      {variant === "full" ? (
        <>
          <div role="cell" className="text-base px-2 py-2 text-center tabular-nums sm:px-3 sm:py-3">
            {row.exact_hits}
          </div>
          <div role="cell" className="text-base px-2 py-2 text-center tabular-nums sm:px-3 sm:py-3">
            {row.goal_diff_hits}
          </div>
          <div role="cell" className="text-base px-2 py-2 text-center tabular-nums sm:px-3 sm:py-3">
            {row.winner_hits}
          </div>
          <div role="cell" className="text-base px-2 py-2 text-center tabular-nums sm:px-3 sm:py-3">
            {row.extra_time_hits}
          </div>
          <div role="cell" className="text-base px-2 py-2 text-center tabular-nums sm:px-3 sm:py-3">
            {row.first_goal_hits}
          </div>
          <div role="cell" className="text-base px-2 py-2 text-center tabular-nums sm:px-3 sm:py-3">
            {row.tournament_points}
          </div>
        </>
      ) : null}
    </div>
  );
}

const headerClass =
  "border-b border-outline-variant/50 bg-surface-container-lowest text-[10px]! font-semibold uppercase text-on-surface-variant";

function RankingsHeader({ variant }: { variant: "compact" | "full" }) {
  const compactPad = "p-2"
  const statPad = "p-2 text-center"

  return (
    <div
      role="row"
      className={cn("grid items-center gap-x-1.5", headerClass)}
      style={{ gridTemplateColumns: gridColumns(variant) }}
    >
      <div role="columnheader" className={`${compactPad} text-center`}>
        #
      </div>
      <div role="columnheader" className={compactPad}>
        Jugador
      </div>
      <div
        role="columnheader"
        className={cn(statPad, "whitespace-nowrap")}
        title="Partidos con pronóstico"
      >
        Pron.
      </div>
      <div role="columnheader" className={cn(statPad, "whitespace-nowrap")}>
        Pts
      </div>
      {variant === "full" ? (
        <>
          <div
            role="columnheader"
            className={cn(compactPad, "text-center")}
            title={scoringRuleLabel("exact_score")}
          >
            Exactos
          </div>
          <div
            role="columnheader"
            className={cn(compactPad, "text-center")}
            title={scoringRuleLabel("goal_difference")}
          >
            Dif.
          </div>
          <div
            role="columnheader"
            className={cn(compactPad, "text-center")}
            title={scoringRuleLabel("winner")}
          >
            Ganador
          </div>
          <div
            role="columnheader"
            className={cn(compactPad, "text-center")}
            title={scoringRuleLabel("extra_time")}
          >
            Prór.
          </div>
          <div
            role="columnheader"
            className={cn(compactPad, "text-center")}
            title={scoringRuleLabel("first_goal_minute")}
          >
            1er gol
          </div>
          <div role="columnheader" className={cn(compactPad, "text-center")}>
            Torneo
          </div>
        </>
      ) : null}
    </div>
  );
}

export function PoolRankingsTable({ rows, currentUserId }: PoolRankingsTableProps) {
  if (rows.length === 0) {
    return (
      <div className="flex flex-col items-center gap-3 rounded-lg border border-dashed border-outline-variant/60 bg-surface-container-low px-6 py-12 text-center">
        <MaterialIcon name="leaderboard" className="text-4xl text-on-surface-variant/70" />
        <p className="font-geist text-sm text-on-surface-variant">
          Aún no hay participantes con pronósticos.
        </p>
      </div>
    );
  }

  const showPayment = rows.some((r) => r.id_pool != null);
  const showBreakdown = rows.some(
    (r) =>
      r.exact_hits > 0 ||
      r.goal_diff_hits > 0 ||
      r.winner_hits > 0 ||
      r.extra_time_hits > 0 ||
      r.first_goal_hits > 0 ||
      r.tournament_points > 0,
  );

  const tableClass = "font-geist text-xs";

  return (
    <div className="overflow-x-auto rounded-lg border border-outline-variant/60 bg-card shadow-sm">
      <div
        className={cn(tableClass, showBreakdown ? "sm:hidden" : undefined)}
        role="table"
        aria-label="Clasificación de jugadores"
      >
        <RankingsHeader variant="compact" />
        {rows.map((row) => (
          <RankingRow
            key={row.owner_id}
            row={row}
            currentUserId={currentUserId}
            showPayment={showPayment}
            variant="compact"
          />
        ))}
      </div>

      {showBreakdown ? (
        <div
          className={cn(tableClass, "hidden sm:block")}
          role="table"
          aria-label="Clasificación de jugadores"
        >
          <RankingsHeader variant="full" />
          {rows.map((row) => (
            <RankingRow
              key={row.owner_id}
              row={row}
              currentUserId={currentUserId}
              showPayment={showPayment}
              variant="full"
            />
          ))}
        </div>
      ) : null}
    </div>
  );
}
