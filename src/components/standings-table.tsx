import { teamFlagUrl, teamInitials } from "@/lib/team-display";
import type { GroupStandingRow } from "@/lib/group-standings";
import { cn } from "@/lib/utils";

type StandingsTableProps = {
  rows: GroupStandingRow[];
  variant?: "all" | "group";
};

function TeamNameCell({ name, code }: { name: string; code: string }) {
  const flagUrl = teamFlagUrl(code);

  return (
    <div className="flex min-w-0 items-center gap-2">
      <div className="flex h-7 w-7 shrink-0 items-center justify-center overflow-hidden rounded-full border border-outline-variant/50 bg-surface-container-high">
        {flagUrl ? (
          // eslint-disable-next-line @next/next/no-img-element
          <img src={flagUrl} alt="" className="h-full w-full object-cover" />
        ) : (
          <span className="font-mono text-[10px] font-bold text-primary">
            {teamInitials(code)}
          </span>
        )}
      </div>
      <span className="truncate font-medium">{name}</span>
    </div>
  );
}

function formatGoalDiff(value: number): string {
  if (value > 0) return `+${value}`;
  return String(value);
}

export function StandingsTable({ rows, variant = "all" }: StandingsTableProps) {
  const isGroup = variant === "group";

  return (
    <div className="overflow-x-auto">
      <table className="w-full min-w-[28rem] border-collapse text-left font-geist text-sm">
        <thead>
          <tr className="border-b border-outline-variant/50 bg-surface-container-lowest text-xs font-semibold uppercase tracking-wide text-on-surface-variant">
            {isGroup ? <th className="px-4 py-3 text-center">#</th> : null}
            {!isGroup ? <th className="px-4 py-3">Grupo</th> : null}
            <th className="px-4 py-3">Equipo</th>
            {!isGroup ? <th className="px-4 py-3">Código</th> : null}
            <th className="px-3 py-3 text-right">PJ</th>
            <th className="px-3 py-3 text-right">G</th>
            <th className="px-3 py-3 text-right">E</th>
            <th className="px-3 py-3 text-right">P</th>
            <th className="px-3 py-3 text-right">GF</th>
            <th className="px-3 py-3 text-right">GC</th>
            <th className="px-3 py-3 text-right">DG</th>
            <th className="px-4 py-3 text-right">Pts</th>
          </tr>
        </thead>
        <tbody>
          {rows.map((row, index) => (
            <tr
              key={`${row.group_code}-${row.team_code}`}
              className={cn(
                "border-b border-outline-variant/30 last:border-0",
                isGroup && index < 2 && row.played > 0 && "bg-primary-container/10",
              )}
            >
              {isGroup ? (
                <td className="px-4 py-3 text-center tabular-nums font-semibold text-on-surface">
                  {index + 1}
                </td>
              ) : null}
              {!isGroup ? (
                <td className="px-4 py-3 font-mono text-muted-foreground">{row.group_code}</td>
              ) : null}
              <td className="px-4 py-3">
                <TeamNameCell name={row.team_name} code={row.team_code} />
              </td>
              {!isGroup ? (
                <td className="px-4 py-3 font-mono text-xs">{row.team_code}</td>
              ) : null}
              <td className="px-3 py-3 text-right tabular-nums">{row.played}</td>
              <td className="px-3 py-3 text-right tabular-nums">{row.wins}</td>
              <td className="px-3 py-3 text-right tabular-nums">{row.draws}</td>
              <td className="px-3 py-3 text-right tabular-nums">{row.losses}</td>
              <td className="px-3 py-3 text-right tabular-nums">{row.goals_for}</td>
              <td className="px-3 py-3 text-right tabular-nums">{row.goals_against}</td>
              <td className="px-3 py-3 text-right tabular-nums">
                {formatGoalDiff(row.goal_diff)}
              </td>
              <td className="px-4 py-3 text-right font-semibold tabular-nums">{row.points}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
