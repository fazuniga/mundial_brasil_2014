import Link from "next/link";
import type { ReactNode } from "react";
import { FixtureRowCard } from "@/components/fixture-row-card";
import { MaterialIcon } from "@/components/material-icon";
import type { MatchResultScore } from "@/lib/home-fixtures";
import type { FixtureRow } from "@/lib/predictions-types";

type HomeFixturesSectionProps = {
  upcoming: FixtureRow[];
  completed: FixtureRow[];
  resultsByMatch: Record<number, MatchResultScore>;
};

function FixturesCard({
  title,
  description,
  icon,
  action,
  fixtures,
  resultsByMatch,
  variant,
}: {
  title: string;
  description: string;
  icon: string;
  action?: ReactNode;
  fixtures: FixtureRow[];
  resultsByMatch: Record<number, MatchResultScore>;
  variant: "upcoming" | "completed";
}) {
  return (
    <section className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
      <div className="flex flex-wrap items-start justify-between gap-3 border-b border-outline-variant/50 bg-surface-container-lowest p-5">
        <div className="flex min-w-0 items-start gap-3">
          <MaterialIcon name={icon} className="mt-0.5 text-2xl text-accent" />
          <div>
            <h3 className="font-geist text-lg font-semibold text-on-surface">
              {title}
            </h3>
            <p className="font-geist mt-1 text-sm text-on-surface-variant">
              {description}
            </p>
          </div>
        </div>
        {action}
      </div>

      {fixtures.length > 0 ? (
        <ul>
          {fixtures.map((fixture) => {
            const result = resultsByMatch[fixture.id_match];
            const score =
              variant === "completed" &&
              result?.goals_home != null &&
              result?.goals_away != null
                ? { home: result.goals_home, away: result.goals_away }
                : undefined;

            return (
              <FixtureRowCard
                key={fixture.id_match}
                fixture={fixture}
                score={score}
                showPredictLink={variant === "upcoming"}
              />
            );
          })}
        </ul>
      ) : (
        <p className="font-geist px-5 py-8 text-sm text-on-surface-variant">
          {variant === "upcoming"
            ? "No hay partidos programados por ahora."
            : "Aún no hay partidos con resultado cargado."}
        </p>
      )}
    </section>
  );
}

export function HomeFixturesSection({
  upcoming,
  completed,
  resultsByMatch,
}: HomeFixturesSectionProps) {
  return (
    <div className="grid grid-cols-1 gap-stack-gap xl:grid-cols-2">
      <FixturesCard
        title="Próximos partidos"
        description="Calendario del torneo · horarios en Chile"
        icon="schedule"
        variant="upcoming"
        fixtures={upcoming}
        resultsByMatch={resultsByMatch}
        action={
          <Link
            href="/apuestas"
            className="font-geist flex items-center gap-1 rounded-lg border border-outline-variant px-3 py-2 text-xs font-medium text-on-surface transition-colors hover:bg-surface-variant"
          >
            Ver todos
            <MaterialIcon name="arrow_forward" className="text-base" />
          </Link>
        }
      />
      <FixturesCard
        title="Partidos finalizados"
        description="Últimos resultados oficiales cargados"
        icon="sports_soccer"
        variant="completed"
        fixtures={completed}
        resultsByMatch={resultsByMatch}
      />
    </div>
  );
}
