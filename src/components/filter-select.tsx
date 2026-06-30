"use client";

import type { SelectHTMLAttributes } from "react";
import { MaterialIcon } from "@/components/material-icon";
import { cn } from "@/lib/utils";

export const filterSelectClass = cn(
  "h-11 w-full min-w-0 appearance-none rounded-lg border border-outline-variant bg-surface-container-lowest pl-3 pr-10 font-geist text-sm text-on-surface",
  "focus:border-primary focus:outline-none focus:ring-2 focus:ring-primary/20",
  "disabled:cursor-not-allowed disabled:opacity-50",
);

type FilterSelectProps = SelectHTMLAttributes<HTMLSelectElement>;

export function FilterSelect({ className, children, ...props }: FilterSelectProps) {
  return (
    <div className="relative w-full">
      <select className={cn(filterSelectClass, className)} {...props}>
        {children}
      </select>
      <MaterialIcon
        name="expand_more"
        className="pointer-events-none absolute right-3 top-1/2 -translate-y-1/2 text-xl text-on-surface-variant"
        aria-hidden
      />
    </div>
  );
}
