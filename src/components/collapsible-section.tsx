"use client";

import { useState, type ReactNode } from "react";
import { MaterialIcon } from "@/components/material-icon";
import { cn } from "@/lib/utils";

type CollapsibleSectionProps = {
  title: string;
  subtitle?: string;
  defaultOpen?: boolean;
  children: ReactNode;
  className?: string;
};

export function CollapsibleSection({
  title,
  subtitle,
  defaultOpen = true,
  children,
  className,
}: CollapsibleSectionProps) {
  const [open, setOpen] = useState(defaultOpen);

  const matchLabel = subtitle ?? title;

  return (
    <section
      className={cn(
        "overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm",
        className,
      )}
    >
      <button
        type="button"
        onClick={() => setOpen((value) => !value)}
        className="flex w-full items-center justify-between gap-3 border-b border-outline-variant/50 bg-surface-container-lowest px-4 py-3 text-left transition-colors hover:bg-surface-container-low/80"
        aria-expanded={open}
        aria-label={open ? `Ocultar ${matchLabel}` : `Mostrar ${matchLabel}`}
      >
        <div className="min-w-0">
          <h2 className="font-geist text-sm font-semibold text-on-surface">{title}</h2>
          {subtitle ? (
            <p className="font-geist text-xs text-on-surface-variant">{subtitle}</p>
          ) : null}
        </div>
        <MaterialIcon
          name={open ? "expand_less" : "expand_more"}
          className="shrink-0 text-xl text-on-surface-variant"
        />
      </button>
      {open ? children : null}
    </section>
  );
}
