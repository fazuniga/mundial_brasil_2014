import type { ReactNode } from "react";
import { cn } from "@/lib/utils";

type FilterFieldProps = {
  label: string;
  children: ReactNode;
  className?: string;
  labelClassName?: string;
};

export function FilterField({ label, children, className, labelClassName }: FilterFieldProps) {
  return (
    <div className={cn("flex flex-col gap-1.5", className)}>
      <p
        className={cn(
          "font-geist text-sm font-medium leading-5 text-on-surface",
          labelClassName,
        )}
      >
        {label}
      </p>
      {children}
    </div>
  );
}
