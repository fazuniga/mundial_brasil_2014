"use client";

import { teamFlagUrl, teamInitials } from "@/lib/team-display";
import { cn } from "@/lib/utils";

type TeamFlagProps = {
  code: string;
  country: string;
  className?: string;
};

export function TeamFlag({ code, country, className }: TeamFlagProps) {
  const flagUrl = teamFlagUrl(code);

  return (
    <div
      className={cn(
        "flex h-6 w-6 shrink-0 items-center justify-center overflow-hidden rounded-full border border-outline-variant/50 bg-surface-container-high",
        className,
      )}
    >
      {flagUrl ? (
        // eslint-disable-next-line @next/next/no-img-element
        <img
          src={flagUrl}
          alt={`Bandera de ${country}`}
          className="h-full w-full object-cover"
          onError={(e) => {
            e.currentTarget.style.display = "none";
          }}
        />
      ) : (
        <span className="font-mono text-[9px] font-bold text-primary">
          {teamInitials(code)}
        </span>
      )}
    </div>
  );
}
