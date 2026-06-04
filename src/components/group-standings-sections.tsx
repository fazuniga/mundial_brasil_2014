"use client";

import { CollapsibleSection } from "@/components/collapsible-section";
import { StandingsTable } from "@/components/standings-table";
import { GROUP_CODES, groupHasPlayedMatches, type GroupStandingRow } from "@/lib/group-standings";

type GroupStandingsSectionsProps = {
  grouped: Record<string, GroupStandingRow[]>;
};

export function GroupStandingsSections({ grouped }: GroupStandingsSectionsProps) {
  return (
    <div className="flex flex-col gap-stack-gap">
      {GROUP_CODES.map((code) => {
        const rows = grouped[code] ?? [];
        const hasPlayed = groupHasPlayedMatches(rows);
        const maxPlayed = rows.reduce((max, row) => Math.max(max, row.played), 0);
        const subtitle = hasPlayed
          ? `${maxPlayed} partido${maxPlayed === 1 ? "" : "s"} jugado${maxPlayed === 1 ? "" : "s"}`
          : "Sin partidos jugados";

        return (
          <CollapsibleSection
            key={code}
            title={`Grupo ${code}`}
            subtitle={subtitle}
            defaultOpen
          >
            {rows.length === 0 ? (
              <p className="px-4 py-6 font-geist text-sm text-on-surface-variant">
                Sin equipos en este grupo.
              </p>
            ) : (
              <StandingsTable rows={rows} variant="group" />
            )}
          </CollapsibleSection>
        );
      })}
    </div>
  );
}
