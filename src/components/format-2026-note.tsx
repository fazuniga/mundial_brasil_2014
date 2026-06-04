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
        <CardTitle>Qué cambió respecto a 2014</CardTitle>
        <CardDescription>README.md</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="overflow-x-auto rounded-lg border border-border">
          <table className="w-full text-left text-sm">
            <thead>
              <tr className="border-b border-border bg-muted/50">
                <th className="px-4 py-3 font-medium">Área</th>
                <th className="px-4 py-3 font-medium">2014</th>
                <th className="px-4 py-3 font-medium">2026</th>
              </tr>
            </thead>
            <tbody className="text-muted-foreground">
              <tr className="border-b border-border">
                <td className="px-4 py-2.5 font-medium text-foreground">Equipos</td>
                <td className="px-4 py-2.5">32</td>
                <td className="px-4 py-2.5">48</td>
              </tr>
              <tr className="border-b border-border">
                <td className="px-4 py-2.5 font-medium text-foreground">Grupos</td>
                <td className="px-4 py-2.5">A–H (8)</td>
                <td className="px-4 py-2.5">A–L (12)</td>
              </tr>
              <tr className="border-b border-border">
                <td className="px-4 py-2.5 font-medium text-foreground">
                  Primera fase eliminatoria
                </td>
                <td className="px-4 py-2.5">Octavos (id_ronda = 2)</td>
                <td className="px-4 py-2.5">Dieciseisavos (id_round = 2)</td>
              </tr>
              <tr className="border-b border-border">
                <td className="px-4 py-2.5 font-medium text-foreground">
                  Clasificados
                </td>
                <td className="px-4 py-2.5">2 primeros por grupo</td>
                <td className="px-4 py-2.5">2 primeros + 8 mejores terceros</td>
              </tr>
              <tr>
                <td className="px-4 py-2.5 font-medium text-foreground">Cuadro</td>
                <td className="px-4 py-2.5">Fijo 1A vs 2B</td>
                <td className="px-4 py-2.5">Matriz FIFA de terceros</td>
              </tr>
            </tbody>
          </table>
        </div>
        <p className="mt-4 text-sm text-muted-foreground">
          Lógica central preservada: resultados y puntos por acierto, cierre de
          apuestas 60 min antes del kickoff y reglas de puntuación del torneo.
        </p>
      </CardContent>
    </Card>
  );
}
