"use client";

import { Label } from "@/components/ui/label";
import { cn } from "@/lib/utils";

type TodayMatchesToggleProps = {
  checked: boolean;
  onChange: (checked: boolean) => void;
  className?: string;
};

export function TodayMatchesToggle({
  checked,
  onChange,
  className,
}: TodayMatchesToggleProps) {
  return (
    <label
      className={cn(
        "flex h-11 cursor-pointer items-center gap-2.5 rounded-lg border border-outline-variant/60 bg-surface-container-lowest px-3",
        className,
      )}
    >
      <input
        type="checkbox"
        role="switch"
        checked={checked}
        onChange={(event) => onChange(event.target.checked)}
        aria-label="Solo partidos de hoy"
        className="h-5 w-9 shrink-0 cursor-pointer appearance-none rounded-full border border-outline-variant bg-surface-container-high transition-colors checked:border-primary checked:bg-primary"
      />
      <Label className="cursor-pointer font-geist text-sm font-medium text-on-surface">
        Solo partidos de hoy
      </Label>
    </label>
  );
}
