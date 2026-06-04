import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";

/** Copy from README.md § What changed from 2014 */
export function Format2026Note() {
  return (
    <Card>
      <CardHeader>
        <CardTitle>What changed from 2014</CardTitle>
        <CardDescription>README.md</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="overflow-x-auto rounded-lg border border-border">
          <table className="w-full text-left text-sm">
            <thead>
              <tr className="border-b border-border bg-muted/50">
                <th className="px-4 py-3 font-medium">Area</th>
                <th className="px-4 py-3 font-medium">2014</th>
                <th className="px-4 py-3 font-medium">2026</th>
              </tr>
            </thead>
            <tbody className="text-muted-foreground">
              <tr className="border-b border-border">
                <td className="px-4 py-2.5 font-medium text-foreground">Teams</td>
                <td className="px-4 py-2.5">32</td>
                <td className="px-4 py-2.5">48</td>
              </tr>
              <tr className="border-b border-border">
                <td className="px-4 py-2.5 font-medium text-foreground">Groups</td>
                <td className="px-4 py-2.5">A–H (8)</td>
                <td className="px-4 py-2.5">A–L (12)</td>
              </tr>
              <tr className="border-b border-border">
                <td className="px-4 py-2.5 font-medium text-foreground">
                  First knockout
                </td>
                <td className="px-4 py-2.5">Octavos (id_ronda = 2)</td>
                <td className="px-4 py-2.5">Dieciseisavos (id_round = 2)</td>
              </tr>
              <tr className="border-b border-border">
                <td className="px-4 py-2.5 font-medium text-foreground">
                  Qualifiers
                </td>
                <td className="px-4 py-2.5">Top 2 per group</td>
                <td className="px-4 py-2.5">Top 2 + 8 best 3rd</td>
              </tr>
              <tr>
                <td className="px-4 py-2.5 font-medium text-foreground">Bracket</td>
                <td className="px-4 py-2.5">Fixed 1A vs 2B</td>
                <td className="px-4 py-2.5">FIFA third-place matrix</td>
              </tr>
            </tbody>
          </table>
        </div>
        <p className="mt-4 text-sm text-muted-foreground">
          Core logic preserved: v_results (winner/points), predictions_open lock 60
          min before kickoff, scoring via scoring_rules.
        </p>
      </CardContent>
    </Card>
  );
}
