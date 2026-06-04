import { cn } from "@/lib/utils";
import { HTMLAttributes } from "react";

type PageShellProps = HTMLAttributes<HTMLDivElement> & {
  narrow?: boolean;
  wide?: boolean;
};

export function PageShell({
  className,
  narrow = false,
  wide = false,
  children,
  ...props
}: PageShellProps) {
  return (
    <div
      className={cn(
        "mx-auto w-full px-6 py-8",
        narrow && "max-w-md",
        wide && "max-w-6xl",
        !narrow && !wide && "max-w-4xl",
        className,
      )}
      {...props}
    >
      {children}
    </div>
  );
}
