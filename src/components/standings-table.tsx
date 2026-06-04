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

type StandingsTableProps = {
  rows: StandingRow[];
};

export function StandingsTable({ rows }: StandingsTableProps) {
  return (
    <div className="overflow-x-auto rounded-lg border border-border">
      <table className="w-full text-left text-sm">
        <thead>
          <tr className="border-b border-border bg-muted/50">
            <th className="px-3 py-3 font-medium">group_code</th>
            <th className="px-3 py-3 font-medium">team_name</th>
            <th className="px-3 py-3 font-medium">team_code</th>
            <th className="px-3 py-3 font-medium text-right">played</th>
            <th className="px-3 py-3 font-medium text-right">wins</th>
            <th className="px-3 py-3 font-medium text-right">draws</th>
            <th className="px-3 py-3 font-medium text-right">losses</th>
            <th className="px-3 py-3 font-medium text-right">goals_for</th>
            <th className="px-3 py-3 font-medium text-right">goals_against</th>
            <th className="px-3 py-3 font-medium text-right">goal_diff</th>
            <th className="px-3 py-3 font-medium text-right">points</th>
          </tr>
        </thead>
        <tbody>
          {rows.map((row) => (
            <tr
              key={`${row.group_code}-${row.team_code}`}
              className="border-b border-border last:border-0"
            >
              <td className="px-3 py-2.5 font-mono text-muted-foreground">
                {row.group_code}
              </td>
              <td className="px-3 py-2.5 font-medium">{row.team_name}</td>
              <td className="px-3 py-2.5 font-mono text-xs">{row.team_code}</td>
              <td className="px-3 py-2.5 text-right tabular-nums">{row.played}</td>
              <td className="px-3 py-2.5 text-right tabular-nums">{row.wins}</td>
              <td className="px-3 py-2.5 text-right tabular-nums">{row.draws}</td>
              <td className="px-3 py-2.5 text-right tabular-nums">{row.losses}</td>
              <td className="px-3 py-2.5 text-right tabular-nums">{row.goals_for}</td>
              <td className="px-3 py-2.5 text-right tabular-nums">
                {row.goals_against}
              </td>
              <td className="px-3 py-2.5 text-right tabular-nums">{row.goal_diff}</td>
              <td className="px-3 py-2.5 text-right font-medium tabular-nums">
                {row.points}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
