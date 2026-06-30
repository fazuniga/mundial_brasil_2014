import { cn } from "@/lib/utils";
import { HTMLAttributes, forwardRef } from "react";

export const Alert = forwardRef<
  HTMLDivElement,
  HTMLAttributes<HTMLDivElement> & {
    variant?: "default" | "destructive";
    live?: "polite" | "assertive" | "off";
  }
>(({ className, variant = "default", live, ...props }, ref) => (
  <div
    ref={ref}
    role={variant === "destructive" ? "alert" : live ? "status" : undefined}
    aria-live={
      live ?? (variant === "destructive" ? "assertive" : undefined)
    }
    className={cn(
      "rounded-lg border px-4 py-3 text-sm",
      variant === "destructive"
        ? "border-destructive/30 bg-destructive/10 text-destructive"
        : "border-border bg-muted text-foreground",
      className,
    )}
    {...props}
  />
));
Alert.displayName = "Alert";
