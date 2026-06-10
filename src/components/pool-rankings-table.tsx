import { MaterialIcon } from "@/components/material-icon";
import { scoringRuleLabel } from "@/lib/scoring-labels";
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

export function PoolRankingsTable({ rows, currentUserId }: PoolRankingsTableProps) {
  if (rows.length === 0) {
    return (
      <div className="flex flex-col items-center gap-3 rounded-xl border border-dashed border-outline-variant/60 bg-surface-container-low px-6 py-12 text-center">
        <MaterialIcon name="leaderboard" className="text-4xl text-on-surface-variant/70" />
        <p className="font-geist text-sm text-on-surface-variant">
          Aún no hay participantes con pronósticos.
        </p>
      </div>
    );
  }

  const showBreakdown = rows.some(
    (r) =>
      r.exact_hits > 0 ||
      r.goal_diff_hits > 0 ||
      r.winner_hits > 0 ||
      r.side_bet_points > 0 ||
      r.tournament_points > 0,
  );

  const cellPad = "px-2 py-2 sm:px-4 sm:py-3";
  const breakdownHead = "hidden px-2 py-2 text-right sm:px-3 sm:py-3";
  const breakdownCell = "hidden px-2 py-2 text-right tabular-nums sm:px-3 sm:py-3";

  return (
    <div className="overflow-x-auto rounded-xl border border-outline-variant/60 bg-card shadow-sm sm:overflow-visible">
      <table className="w-full table-fixed border-collapse text-left font-geist text-xs sm:table-auto sm:min-w-[32rem] sm:text-sm">
        <thead>
          <tr className="border-b border-outline-variant/50 bg-surface-container-lowest text-[10px] font-semibold uppercase tracking-wide text-on-surface-variant sm:text-xs">
            <th className={`${cellPad} w-9 text-center sm:w-auto`}>#</th>
            <th className={cellPad}>
              <span className="sr-only">Estado de pago</span>
              Jugador
            </th>
            <th className={`${cellPad} w-14 text-center sm:w-auto`}>Pts</th>
            {showBreakdown ? (
              <>
                <th
                  className={`${breakdownHead} sm:table-cell`}
                  title={scoringRuleLabel("exact_score")}
                >
                  Exactos
                </th>
                <th
                  className={`${breakdownHead} md:table-cell`}
                  title={scoringRuleLabel("goal_difference")}
                >
                  Dif.
                </th>
                <th
                  className={`${breakdownHead} lg:table-cell`}
                  title={scoringRuleLabel("winner")}
                >
                  Ganador
                </th>
                <th className={`${breakdownHead} xl:table-cell`}>Apuestas</th>
                <th className={`${breakdownHead} xl:table-cell`}>Torneo</th>
              </>
            ) : null}
          </tr>
        </thead>
        <tbody>
          {rows.map((row) => {
            const medal = rankMedalIcon(row.rank_position);
            const medalLabel = rankMedalAriaLabel(row.rank_position);
            const isCurrentUser = currentUserId != null && row.owner_id === currentUserId;

            return (
              <tr
                key={row.owner_id}
                className={
                  isCurrentUser
                    ? "border-b border-outline-variant/40 bg-primary-container/15"
                    : "border-b border-outline-variant/30"
                }
              >
                <td className={`${cellPad} w-9 text-center tabular-nums sm:w-auto`}>
                  <span className="font-semibold text-on-surface">{row.rank_position}</span>
                </td>
                <td className={cellPad}>
                  <div className="flex min-w-0 items-center gap-1.5 sm:gap-2">
                    {medal && medalLabel ? (
                      <span
                        title={medalLabel}
                        aria-label={medalLabel}
                        className="inline-flex shrink-0"
                      >
                        <MaterialIcon
                          name={medal}
                          className={rankMedalClassName(row.rank_position)}
                        />
                      </span>
                    ) : null}
                    {row.id_pool != null ? (
                      <span className="inline-flex shrink-0 items-center gap-0.5">
                        <PaymentStatusIcon
                          phase="Fase de Grupos"
                          isPaid={row.is_paid_group_phase}
                        />
                        <PaymentStatusIcon
                          phase="Fases eliminatorias"
                          isPaid={row.is_paid_knockout}
                        />
                      </span>
                    ) : null}
                    <div className="min-w-0">
                      <p className="truncate font-medium text-on-surface">
                        {row.display_name || row.username}
                      </p>
                      {row.username ? (
                        <p className="hidden truncate font-mono text-xs text-on-surface-variant sm:block">
                          @{row.username}
                        </p>
                      ) : null}
                    </div>
                  </div>
                </td>
                <td className={`${cellPad} w-14 text-center sm:w-auto`}>
                  <span className="font-headline text-base font-bold tabular-nums text-primary sm:text-lg">
                    {row.total_points}
                  </span>
                </td>
                {showBreakdown ? (
                  <>
                    <td className={`${breakdownCell} sm:table-cell`}>
                      {row.exact_hits}
                    </td>
                    <td className={`${breakdownCell} md:table-cell`}>
                      {row.goal_diff_hits}
                    </td>
                    <td className={`${breakdownCell} lg:table-cell`}>
                      {row.winner_hits}
                    </td>
                    <td className={`${breakdownCell} xl:table-cell`}>
                      {row.side_bet_points}
                    </td>
                    <td className={`${breakdownCell} xl:table-cell`}>
                      {row.tournament_points}
                    </td>
                  </>
                ) : null}
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
}
