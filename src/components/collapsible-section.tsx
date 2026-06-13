"use client";

import { useState, type ReactNode } from "react";
import { MaterialIcon } from "@/components/material-icon";
import { cn } from "@/lib/utils";

type CollapsibleInlineHeaderProps = {
  title: string;
  detail: string;
  /** inline: single row (predictions). responsive: stack on mobile, inline from sm. */
  layout?: "inline" | "responsive";
  className?: string;
};

/** Single-line header used in bet/predictions group sections. */
export function CollapsibleInlineHeader({
  title,
  detail,
  layout = "inline",
  className,
}: CollapsibleInlineHeaderProps) {
  const isResponsive = layout === "responsive";

  return (
    <h2
      className={cn(
        "font-geist text-sm text-on-surface",
        isResponsive
          ? "flex flex-col gap-0.5 sm:flex-row sm:items-center sm:gap-1"
          : "flex items-center gap-1",
        className,
      )}
    >
      <span className="font-semibold">{title}</span>
      <span className={cn("font-normal", isResponsive && "hidden sm:inline")}>·</span>
      <span className="text-xs font-normal text-on-surface-variant">{detail}</span>
    </h2>
  );
}

type CollapsibleSectionProps = {
  title: string;
  subtitle?: string;
  titleContent?: ReactNode;
  defaultOpen?: boolean;
  children: ReactNode;
  className?: string;
  headerClassName?: string;
};

export function CollapsibleSection({
  title,
  subtitle,
  titleContent,
  defaultOpen = true,
  children,
  className,
  headerClassName,
}: CollapsibleSectionProps) {
  const [open, setOpen] = useState(defaultOpen);

  const matchLabel = subtitle ?? title;

  return (
    <section
      className={cn(
        "overflow-hidden rounded-lg bg-card shadow-sm",
        className,
      )}
    >
      <button
        type="button"
        onClick={() => setOpen((value) => !value)}
        className={cn(
          "flex w-full items-center justify-between gap-3 border-b border-outline-variant/50 bg-surface-container-lowest px-4 py-3 text-left transition-colors hover:bg-surface-container-low/80",
          headerClassName,
        )}
        aria-expanded={open}
        aria-label={open ? `Ocultar ${matchLabel}` : `Mostrar ${matchLabel}`}
      >
        <div className="min-w-0">
          {titleContent ?? (
            <>
              <h2 className="font-geist text-sm font-semibold text-on-surface">{title}</h2>
              {subtitle ? (
                <p className="font-geist text-xs text-on-surface-variant">{subtitle}</p>
              ) : null}
            </>
          )}
        </div>
        <MaterialIcon
          name={open ? "remove_circle" : "add_circle"}
          className="shrink-0 text-xl text-on-surface-variant"
        />
      </button>
      {open ? children : null}
    </section>
  );
}
