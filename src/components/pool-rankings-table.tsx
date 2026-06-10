import { MaterialIcon } from "@/components/material-icon";
import { scoringRuleLabel } from "@/lib/scoring-labels";
import { cn } from "@/lib/utils";
import type { PoolRankingRow } from "@/lib/pool-rankings-types";

type PoolRankingsTableProps = {
  rows: PoolRankingRow[];
  currentUserId?: string | null;
};

function rankMedalIcon(position: number): string | null {
  if (position === 1) return "emoji_events";
  if (position === 2) return "military_tech";
  if (position === 3) return "workspace_premium";
  return null;
}

function rankMedalAriaLabel(position: number): string | null {
  if (position === 1) return "Primer lugar";
  if (position === 2) return "Segundo lugar";
  if (position === 3) return "Tercer lugar";
  return null;
}

function rankMedalClassName(position: number): string {
  if (position === 1) return "text-base text-amber-500 sm:text-lg";
  if (position === 2) return "text-base text-slate-400 sm:text-lg";
  return "text-base text-amber-700 sm:text-lg";
}

function paymentStatusLabel(phase: string, isPaid: boolean): string {
  return `${phase}: ${isPaid ? "Pagado" : "Pendiente de pago"}`;
}

function PaymentStatusIcon({
  phase,
  isPaid,
}: {
  phase: string;
  isPaid: boolean;
}) {
  const label = paymentStatusLabel(phase, isPaid);
  return (
    <span title={label} aria-label={label} className="inline-flex shrink-0">
      <MaterialIcon
        name={isPaid ? "paid" : "money_off"}
        className={
          isPaid
            ? "text-sm text-primary sm:text-base"
            : "text-sm text-accent sm:text-base"
        }
      />
    </span>
  );
}

function buildGridTemplateColumns(showPayment: boolean, showBreakdown: boolean): string {
  const cols = ["2.25rem", "2rem", "minmax(0,1fr)"];
  if (showPayment) cols.push("3.5rem", "3.25rem");
  cols.push("3rem", "3.25rem");
  if (showBreakdown) {
    cols.push("3rem", "3rem", "3.25rem", "3.5rem", "3.5rem");
  }
  return cols.join(" ");
}

const cellPad = "px-2 py-2 sm:px-3 sm:py-3";
const compactCellPad = "px-1 py-2 sm:px-1.5 sm:py-3";
const headerClass =
  "border-b border-outline-variant/50 bg-surface-container-lowest text-[10px] font-semibold uppercase tracking-wide text-on-surface-variant sm:text-xs";
const breakdownHeaderClass = "hidden text-right sm:block";
const breakdownCellClass = "hidden text-right tabular-nums sm:block";

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
      r.side_bet_points > 0 ||
      r.tournament_points > 0,
  );

  const gridStyle = { gridTemplateColumns: buildGridTemplateColumns(showPayment, showBreakdown) };

  return (
    <div className="overflow-x-auto rounded-lg border border-outline-variant/60 bg-card shadow-sm">
      <div
        className={cn(
          "font-geist text-xs sm:text-sm",
          showBreakdown && "min-w-[32rem]",
        )}
        role="table"
        aria-label="Clasificación de jugadores"
      >
        <div
          role="row"
          className={cn("grid items-center gap-x-1", headerClass)}
          style={gridStyle}
        >
          <div role="columnheader" className={`${compactCellPad} text-center`}>
            #
          </div>
          <div role="columnheader" className={`${compactCellPad} text-center`} aria-hidden />
          <div role="columnheader" className={cellPad}>
            Jugador
          </div>
          {showPayment ? (
            <>
              <div
                role="columnheader"
                className={`${compactCellPad} whitespace-nowrap text-center`}
              >
                Grupos
              </div>
              <div
                role="columnheader"
                className={`${compactCellPad} whitespace-nowrap text-center`}
              >
                Resto
              </div>
            </>
          ) : null}
          <div
            role="columnheader"
            className={`${compactCellPad} whitespace-nowrap text-center`}
            title="Partidos con pronóstico"
          >
            Pron.
          </div>
          <div role="columnheader" className={`${compactCellPad} whitespace-nowrap text-center`}>
            Pts
          </div>
          {showBreakdown ? (
            <>
              <div
                role="columnheader"
                className={cn(cellPad, breakdownHeaderClass)}
                title={scoringRuleLabel("exact_score")}
              >
                Exactos
              </div>
              <div
                role="columnheader"
                className={cn(cellPad, breakdownHeaderClass, "md:block")}
                title={scoringRuleLabel("goal_difference")}
              >
                Dif.
              </div>
              <div
                role="columnheader"
                className={cn(cellPad, breakdownHeaderClass, "lg:block")}
                title={scoringRuleLabel("winner")}
              >
                Ganador
              </div>
              <div
                role="columnheader"
                className={cn(cellPad, breakdownHeaderClass, "xl:block")}
              >
                Apuestas
              </div>
              <div
                role="columnheader"
                className={cn(cellPad, breakdownHeaderClass, "xl:block")}
              >
                Torneo
              </div>
            </>
          ) : null}
        </div>

        {rows.map((row) => {
          const medal = rankMedalIcon(row.rank_position);
          const medalLabel = rankMedalAriaLabel(row.rank_position);
          const isCurrentUser = currentUserId != null && row.owner_id === currentUserId;

          return (
            <div
              key={row.owner_id}
              role="row"
              className={cn(
                "grid items-center gap-x-1 border-b border-outline-variant/30",
                isCurrentUser && "border-outline-variant/40 bg-primary-container/15",
              )}
              style={gridStyle}
            >
              <div role="cell" className={`${compactCellPad} text-center tabular-nums`}>
                <span className="font-semibold text-on-surface">{row.rank_position}</span>
              </div>
              <div role="cell" className={`${compactCellPad} text-center`}>
                {medal && medalLabel ? (
                  <span
                    title={medalLabel}
                    aria-label={medalLabel}
                    className="inline-flex shrink-0 justify-center"
                  >
                    <MaterialIcon
                      name={medal}
                      className={rankMedalClassName(row.rank_position)}
                    />
                  </span>
                ) : null}
              </div>
              <div role="cell" className={`${cellPad} min-w-0`}>
                <p className="truncate font-medium text-on-surface">
                  {row.display_name || row.username}
                </p>
                {row.username ? (
                  <p className="hidden truncate font-mono text-xs text-on-surface-variant sm:block">
                    @{row.username}
                  </p>
                ) : null}
              </div>
              {showPayment ? (
                <>
                  <div role="cell" className={`${compactCellPad} text-center`}>
                    {row.id_pool != null ? (
                      <PaymentStatusIcon
                        phase="Fase de Grupos"
                        isPaid={row.is_paid_group_phase}
                      />
                    ) : null}
                  </div>
                  <div role="cell" className={`${compactCellPad} text-center`}>
                    {row.id_pool != null ? (
                      <PaymentStatusIcon
                        phase="Fases eliminatorias"
                        isPaid={row.is_paid_knockout}
                      />
                    ) : null}
                  </div>
                </>
              ) : null}
              <div role="cell" className={`${compactCellPad} text-center tabular-nums`}>
                {row.bets_placed}
              </div>
              <div role="cell" className={`${compactCellPad} text-center`}>
                <span className="font-headline text-base font-bold tabular-nums text-primary sm:text-lg">
                  {row.total_points}
                </span>
              </div>
              {showBreakdown ? (
                <>
                  <div role="cell" className={cn(cellPad, breakdownCellClass)}>
                    {row.exact_hits}
                  </div>
                  <div role="cell" className={cn(cellPad, breakdownCellClass, "md:block")}>
                    {row.goal_diff_hits}
                  </div>
                  <div role="cell" className={cn(cellPad, breakdownCellClass, "lg:block")}>
                    {row.winner_hits}
                  </div>
                  <div role="cell" className={cn(cellPad, breakdownCellClass, "xl:block")}>
                    {row.side_bet_points}
                  </div>
                  <div role="cell" className={cn(cellPad, breakdownCellClass, "xl:block")}>
                    {row.tournament_points}
                  </div>
                </>
              ) : null}
            </div>
          );
        })}
      </div>
    </div>
  );
}
