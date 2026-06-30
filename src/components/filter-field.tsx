import type { ReactNode } from "react";
import { cn } from "@/lib/utils";

type FilterFieldProps = {
  label: string;
  htmlFor?: string;
  children: ReactNode;
  className?: string;
  labelClassName?: string;
};

export function FilterField({
  label,
  htmlFor,
  children,
  className,
  labelClassName,
}: FilterFieldProps) {
  const labelClass = cn(
    "font-geist text-sm font-medium leading-5 text-on-surface",
    labelClassName,
  );

  return (
    <div className={cn("flex flex-col gap-1.5", className)}>
      {htmlFor ? (
        <label htmlFor={htmlFor} className={labelClass}>
          {label}
        </label>
      ) : (
        <p className={labelClass}>{label}</p>
      )}
      {children}
    </div>
  );
}
