"use client";

import { cn } from "@/lib/utils";

type TodayMatchesToggleProps = {
  checked: boolean;
  onChange: (checked: boolean) => void;
  id?: string;
  className?: string;
};

export function TodayMatchesToggle({
  checked,
  onChange,
  id = "today-matches-toggle",
  className,
}: TodayMatchesToggleProps) {
  return (
    <label
      htmlFor={id}
      className={cn(
        "flex h-11 cursor-pointer items-center gap-2.5 rounded-lg border border-outline-variant/60 bg-surface-container-lowest px-3",
        className,
      )}
    >
      <input
        id={id}
        type="checkbox"
        checked={checked}
        onChange={(event) => onChange(event.target.checked)}
        className="h-5 w-9 shrink-0 cursor-pointer appearance-none rounded-full border border-outline-variant bg-surface-container-high transition-colors checked:border-primary checked:bg-primary"
      />
      <span className="cursor-pointer font-geist text-sm font-medium text-on-surface">
        Solo partidos de hoy
      </span>
    </label>
  );
}
