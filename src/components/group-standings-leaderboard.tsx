import { MaterialIcon } from "@/components/material-icon";
import { cn } from "@/lib/utils";

type StandingRow = {
  group_code: string;
  team_name: string;
  team_code: string;
  played: number;
  wins: number;
  draws: number;
  losses: number;
  goals_for: number;
  goals_against: number;
  goal_diff: number;
  points: number;
};

type GroupStandingsLeaderboardProps = {
  rows: StandingRow[];
};

const AVATAR_COLORS = [
  "bg-primary-container text-white",
  "bg-secondary-container text-secondary-foreground",
  "bg-tertiary-container text-on-tertiary-container",
  "bg-surface-variant text-on-surface",
];

function teamInitials(teamCode: string): string {
  return teamCode.slice(0, 2).toUpperCase();
}

function sortStandings(rows: StandingRow[]): StandingRow[] {
  return [...rows].sort((a, b) => {
    if (b.points !== a.points) return b.points - a.points;
    if (b.goal_diff !== a.goal_diff) return b.goal_diff - a.goal_diff;
    if (b.goals_for !== a.goals_for) return b.goals_for - a.goals_for;
    return a.team_name.localeCompare(b.team_name);
  });
}

export function GroupStandingsLeaderboard({ rows }: GroupStandingsLeaderboardProps) {
  const sorted = sortStandings(rows);

  return (
    <div className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
      <div className="flex items-center justify-between border-b border-outline-variant/50 bg-surface-container-lowest p-6">
        <div>
          <h3 className="font-geist text-lg font-semibold text-on-surface">
            Clasificación global
          </h3>
          <p className="font-geist mt-1 text-sm text-on-surface-variant">
            Clasificación actual según los puntos de la fase de grupos.
          </p>
        </div>
        <div className="flex gap-2">
          <button
            type="button"
            aria-label="Filtrar clasificación"
            className="flex items-center justify-center rounded-md border border-outline-variant p-2 text-on-surface transition-colors hover:bg-surface-variant"
          >
            <MaterialIcon name="filter_list" className="text-[20px]" />
          </button>
          <button
            type="button"
            aria-label="Más opciones"
            className="flex items-center justify-center rounded-md border border-outline-variant p-2 text-on-surface transition-colors hover:bg-surface-variant"
          >
            <MaterialIcon name="more_vert" className="text-[20px]" />
          </button>
        </div>
      </div>

      {sorted.length > 0 ? (
        <>
          <div className="overflow-x-auto">
            <table className="w-full border-collapse text-left">
              <thead>
                <tr className="border-b border-outline-variant/50 bg-muted font-geist text-xs font-semibold text-on-surface-variant">
                  <th className="w-16 p-4 text-center">Pos.</th>
                  <th className="p-4">Equipo</th>
                  <th className="p-4 text-center">Grupo</th>
                  <th className="p-4 text-center">PJ</th>
                  <th className="p-4 text-center">G</th>
                  <th className="p-4 text-center">E</th>
                  <th className="p-4 text-right text-primary">Pts</th>
                </tr>
              </thead>
              <tbody className="font-geist text-sm text-on-surface">
                {sorted.map((row, index) => (
                  <tr
                    key={`${row.group_code}-${row.team_code}`}
                    className={cn(
                      "border-b border-outline-variant/20 transition-colors hover:bg-surface-container-low",
                      index % 2 === 1 && "bg-surface-container-lowest",
                    )}
                  >
                    <td
                      className={cn(
                        "p-4 text-center font-mono font-bold",
                        index === 0 ? "text-primary" : "font-medium text-on-surface-variant",
                      )}
                    >
                      {index + 1}
                    </td>
                    <td className="p-4">
                      <div className="flex items-center gap-3">
                        <div
                          className={cn(
                            "flex h-8 w-8 items-center justify-center rounded-full text-xs font-bold",
                            AVATAR_COLORS[index % AVATAR_COLORS.length],
                          )}
                        >
                          {teamInitials(row.team_code)}
                        </div>
                        <span className="font-medium">{row.team_name}</span>
                      </div>
                    </td>
                    <td className="p-4 text-center font-mono text-on-surface-variant">
                      {row.group_code}
                    </td>
                    <td className="p-4 text-center tabular-nums text-on-surface-variant">
                      {row.played}
                    </td>
                    <td className="p-4 text-center tabular-nums text-on-surface-variant">
                      {row.wins}
                    </td>
                    <td className="p-4 text-center tabular-nums text-on-surface-variant">
                      {row.draws}
                    </td>
                    <td className="p-4 text-right font-mono font-bold tabular-nums text-primary">
                      {row.points}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          <div className="border-t border-outline-variant/50 bg-surface-container-lowest p-4 text-center">
            <button
              type="button"
              className="font-geist mx-auto flex items-center justify-center gap-1 text-xs font-semibold text-primary hover:underline"
            >
              Ver clasificación completa
              <MaterialIcon name="chevron_right" className="text-[16px]" />
            </button>
          </div>
        </>
      ) : (
        <div className="p-6 text-sm text-on-surface-variant">
          Datos iniciales (equipos, sedes, partidos): la migración{" "}
          <code className="rounded-md bg-surface-container-high px-1.5 py-0.5 font-mono text-xs text-on-surface">
            20260603000005_seed_teams_venues_matches.sql
          </code>{" "}
          carga 48 equipos de grupos, 16 sedes y 104 partidos. Ejecuta{" "}
          <code className="rounded-md bg-surface-container-high px-1.5 py-0.5 font-mono text-xs text-on-surface">
            supabase/apply-all.sql
          </code>{" "}
          en el Editor SQL.
        </div>
      )}
    </div>
  );
}
