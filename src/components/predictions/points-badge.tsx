import { cn } from "@/lib/utils";

type PointsBadgeProps = {
  points: number;
  className?: string;
};

export function PointsBadge({ points, className }: PointsBadgeProps) {
  return (
    <span
      className={cn(
        "inline-flex shrink-0 items-center rounded-md bg-primary/10 px-2 py-0.5 font-headline text-xs font-bold tabular-nums text-primary",
        className,
      )}
    >
      +{points}
    </span>
  );
}
