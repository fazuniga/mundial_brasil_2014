import { cn } from "@/lib/utils";

type MaterialIconProps = {
  name: string;
  filled?: boolean;
  className?: string;
};

export function MaterialIcon({ name, filled = false, className }: MaterialIconProps) {
  return (
    <span
      aria-hidden="true"
      className={cn("material-symbols-outlined", filled && "filled", className)}
    >
      {name}
    </span>
  );
}
