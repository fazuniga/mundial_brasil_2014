import { MaterialIcon } from "@/components/material-icon";
import { cn } from "@/lib/utils";

type Round = {
  id_round: number;
  name_round: string;
};

type TournamentRoadmapProps = {
  rounds: Round[];
};

type Phase = {
  label: string;
  title: string;
  description: string;
  icon: string;
  complete: boolean;
};

function buildPhases(rounds: Round[]): Phase[] {
  const groupRound = rounds.find((r) => r.id_round === 1);
  const knockoutRound = rounds.find((r) => r.id_round === 2);
  const finalRound = rounds.find((r) => r.id_round === 7);

  return [
    {
      label: "Fase 1",
      title: groupRound?.name_round ?? "Fase de Grupos",
      description: "Envía tus marcadores de todos los partidos de grupos.",
      icon: "check",
      complete: true,
    },
    {
      label: "Fase 2",
      title: knockoutRound?.name_round ?? "Dieciseisavos de Final",
      description: "Pronostica el camino del cuadro hasta la final.",
      icon: "radio_button_unchecked",
      complete: false,
    },
    {
      label: "Fase 3",
      title: finalRound?.name_round ?? "Final",
      description: "Pronósticos finales y clasificación global.",
      icon: "emoji_events",
      complete: false,
    },
  ];
}

export function TournamentRoadmap({ rounds }: TournamentRoadmapProps) {
  const phases = buildPhases(rounds);

  return (
    <section
      className="rounded-xl border border-outline-variant/60 bg-card p-4 shadow-sm sm:p-6"
      aria-labelledby="tournament-roadmap-heading"
    >
      <div className="mb-4 flex items-center gap-2 sm:mb-6">
        <MaterialIcon name="timeline" className="text-xl text-primary" />
        <h2
          id="tournament-roadmap-heading"
          className="font-geist text-lg font-semibold text-on-surface"
        >
          Ruta del torneo
        </h2>
      </div>

      <ol className="grid grid-cols-1 gap-6 sm:grid-cols-3 sm:gap-4">
        {phases.map((phase, index) => (
          <li
            key={phase.label}
            className={cn(
              "relative flex min-w-0 flex-col gap-3 sm:px-2",
              !phase.complete && "opacity-90",
              index < phases.length - 1 &&
                "sm:after:absolute sm:after:left-[calc(50%+1.25rem)] sm:after:top-3 sm:after:h-px sm:after:w-[calc(100%-2.5rem)] sm:after:bg-outline-variant/50",
            )}
          >
            <div className="flex items-start gap-3 sm:flex-col sm:items-center sm:text-center">
              <div
                className={cn(
                  "flex h-6 w-6 shrink-0 items-center justify-center rounded-full outline outline-4 outline-card",
                  phase.complete
                    ? "bg-primary-container text-white"
                    : "bg-surface-variant text-on-surface",
                )}
              >
                <MaterialIcon name={phase.icon} className="text-[14px]" />
              </div>
              <div className="min-w-0 flex-1 sm:flex-none">
                <p
                  className={cn(
                    "font-geist mb-1 text-xs font-medium",
                    phase.complete ? "text-primary" : "text-on-surface-variant",
                  )}
                >
                  {phase.label}
                </p>
                <h3 className="font-geist text-base font-semibold leading-6 text-on-surface">
                  {phase.title}
                </h3>
              </div>
            </div>
            <p className="font-geist pl-9 text-sm text-on-surface-variant sm:pl-0 sm:text-center">
              {phase.description}
            </p>
          </li>
        ))}
      </ol>
    </section>
  );
}
