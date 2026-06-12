import Link from "next/link";
import { MaterialIcon } from "@/components/material-icon";
import { cn } from "@/lib/utils";

type MobileBottomNavProps = {
  active?: "partidos" | "apuestas" | "clasificacion" | "perfil" | "admin";
  isAdmin?: boolean;
};

const itemClass =
  "flex min-w-0 flex-1 flex-col items-center justify-center rounded-lg transition-colors";

export function MobileBottomNav({
  active = "partidos",
  isAdmin = false,
}: MobileBottomNavProps) {
  const compact = true;

  return (
    <nav
      className={cn(
        "fixed bottom-0 left-0 z-50 flex w-full items-center justify-around rounded-t-xl border-t border-outline-variant/40 bg-surface shadow-[0_-2px_10px_rgba(0,0,0,0.08)] md:hidden",
        compact ? "gap-0 px-1 py-2" : "px-4 py-3",
      )}
    >
      <Link
        href="/partidos"
        className={cn(
          itemClass,
          compact ? "p-1" : "p-2",
          active === "partidos" ? "text-primary" : "text-on-surface-variant",
        )}
      >
        <MaterialIcon
          name="grid_view"
          filled={active === "partidos"}
          className={cn("mb-0.5", compact ? "text-xl" : "mb-1 text-2xl")}
        />
        <span
          className={cn(
            compact ? "text-[10px] leading-tight" : "text-xs",
            active === "partidos" ? "font-bold" : "font-medium",
          )}
        >
          Partidos
        </span>
      </Link>

      <Link
        href="/apuestas"
        className={cn(
          itemClass,
          compact ? "p-1" : "p-2",
          active === "apuestas" ? "text-primary" : "text-on-surface-variant",
        )}
      >
        <MaterialIcon
          name="event_note"
          filled={active === "apuestas"}
          className={cn("mb-0.5", compact ? "text-xl" : "mb-1 text-2xl")}
        />
        <span
          className={cn(
            compact ? "text-[10px] leading-tight" : "text-xs",
            active === "apuestas" ? "font-bold" : "font-medium",
          )}
        >
          Apuestas
        </span>
      </Link>

      <Link
        href="/clasificacion"
        className={cn(
          itemClass,
          compact ? "p-1" : "p-2",
          active === "clasificacion" ? "text-primary" : "text-on-surface-variant",
        )}
      >
        <MaterialIcon
          name="leaderboard"
          filled={active === "clasificacion"}
          className={cn("mb-0.5", compact ? "text-xl" : "mb-1 text-2xl")}
        />
        <span
          className={cn(
            compact ? "text-[10px] leading-tight" : "text-xs",
            active === "clasificacion" ? "font-bold" : "font-medium",
          )}
        >
          Clasificación
        </span>
      </Link>

      <Link
        href="/perfil"
        className={cn(
          itemClass,
          compact ? "p-1" : "p-2",
          active === "perfil" ? "text-primary" : "text-on-surface-variant",
        )}
      >
        <MaterialIcon
          name="person"
          filled={active === "perfil"}
          className={cn("mb-0.5", compact ? "text-xl" : "mb-1 text-2xl")}
        />
        <span
          className={cn(
            compact ? "text-[10px] leading-tight" : "text-xs",
            active === "perfil" ? "font-bold" : "font-medium",
          )}
        >
          Perfil
        </span>
      </Link>

      {isAdmin ? (
        <Link
          href="/admin"
          className={cn(
            itemClass,
            "p-1",
            active === "admin" ? "text-primary" : "text-on-surface-variant",
          )}
        >
          <MaterialIcon
            name="admin_panel_settings"
            filled={active === "admin"}
            className="mb-0.5 text-xl"
          />
          <span
            className={cn(
              "max-w-full truncate text-[10px] leading-tight",
              active === "admin" ? "font-bold" : "font-medium",
            )}
          >
            Admin
          </span>
        </Link>
      ) : null}
    </nav>
  );
}
