import { MaterialIcon } from "@/components/material-icon";
import { scoringRuleLabel } from "@/lib/scoring-labels";
import type { PoolRankingRow } from "@/lib/pool-rankings-types";

type PoolRankingsTableProps = {
  rows: PoolRankingRow[];
  currentUserId?: string | null;
};

function rankMedal(position: number): string | null {
  if (position === 1) return "emoji_events";
  if (position === 2) return "military_tech";
  if (position === 3) return "workspace_premium";
  return null;
}

export function PoolRankingsTable({ rows, currentUserId }: PoolRankingsTableProps) {
  if (rows.length === 0) {
    return (
      <div className="flex flex-col items-center gap-3 rounded-xl border border-dashed border-outline-variant/60 bg-surface-container-low px-6 py-12 text-center">
        <MaterialIcon name="leaderboard" className="text-4xl text-on-surface-variant/70" />
        <p className="font-geist text-sm text-on-surface-variant">
          Aún no hay participantes registrados en la polla.
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

  return (
    <div className="overflow-x-auto rounded-xl border border-outline-variant/60 bg-card shadow-sm">
      <table className="w-full min-w-[32rem] border-collapse text-left font-geist text-sm">
        <thead>
          <tr className="border-b border-outline-variant/50 bg-surface-container-lowest text-xs font-semibold uppercase tracking-wide text-on-surface-variant">
            <th className="px-4 py-3 text-center">#</th>
            <th className="px-4 py-3">Jugador</th>
            <th className="px-4 py-3 text-right">Puntos</th>
            {showBreakdown ? (
              <>
                <th className="hidden px-3 py-3 text-right sm:table-cell" title={scoringRuleLabel("exact_score")}>
                  Exactos
                </th>
                <th className="hidden px-3 py-3 text-right md:table-cell" title={scoringRuleLabel("goal_difference")}>
                  Dif.
                </th>
                <th className="hidden px-3 py-3 text-right lg:table-cell" title={scoringRuleLabel("winner")}>
                  Ganador
                </th>
                <th className="hidden px-3 py-3 text-right xl:table-cell">Apuestas</th>
                <th className="hidden px-3 py-3 text-right xl:table-cell">Torneo</th>
              </>
            ) : null}
          </tr>
        </thead>
        <tbody>
          {rows.map((row) => {
            const medal = rankMedal(row.rank_position);
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
                <td className="px-4 py-3 text-center tabular-nums">
                  <span className="inline-flex items-center justify-center gap-1 font-semibold text-on-surface">
                    {medal ? (
                      <MaterialIcon
                        name={medal}
                        className={
                          row.rank_position === 1
                            ? "text-xl text-amber-500"
                            : row.rank_position === 2
                              ? "text-xl text-slate-400"
                              : "text-xl text-amber-700"
                        }
                      />
                    ) : (
                      row.rank_position
                    )}
                  </span>
                </td>
                <td className="px-4 py-3">
                  <p className="font-medium text-on-surface">{row.display_name || row.username}</p>
                  {row.username ? (
                    <p className="font-mono text-xs text-on-surface-variant">@{row.username}</p>
                  ) : null}
                </td>
                <td className="px-4 py-3 text-right">
                  <span className="font-headline text-lg font-bold tabular-nums text-primary">
                    {row.total_points}
                  </span>
                </td>
                {showBreakdown ? (
                  <>
                    <td className="hidden px-3 py-3 text-right tabular-nums sm:table-cell">
                      {row.exact_hits}
                    </td>
                    <td className="hidden px-3 py-3 text-right tabular-nums md:table-cell">
                      {row.goal_diff_hits}
                    </td>
                    <td className="hidden px-3 py-3 text-right tabular-nums lg:table-cell">
                      {row.winner_hits}
                    </td>
                    <td className="hidden px-3 py-3 text-right tabular-nums xl:table-cell">
                      {row.side_bet_points}
                    </td>
                    <td className="hidden px-3 py-3 text-right tabular-nums xl:table-cell">
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
