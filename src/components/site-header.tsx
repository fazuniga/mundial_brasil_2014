import Link from "next/link";
import { MaterialIcon } from "@/components/material-icon";
import { cn } from "@/lib/utils";

type SiteHeaderProps = {
  userEmail?: string | null;
  isAdmin?: boolean;
  activeNav?: "partidos" | "apuestas" | "estadisticas" | "clasificacion" | "perfil";
};

const navLinkClass =
  "flex items-center gap-2 rounded-lg px-4 py-2 text-sm font-medium transition-colors duration-150 active:scale-95";

export function SiteHeader({
  userEmail,
  isAdmin = false,
  activeNav = "partidos",
}: SiteHeaderProps) {
  return (
    <header className="fixed top-0 z-50 w-full border-b border-outline-variant/40 bg-surface/95 shadow-sm backdrop-blur-md">
      <div className="mx-auto flex h-header-height w-full max-w-7xl items-center justify-between px-gutter-md">
        <Link href="/partidos" className="flex items-center gap-3 transition-opacity hover:opacity-80">
          <MaterialIcon name="sports_soccer" className="text-3xl text-primary" />
          <h1 className="font-headline text-lg font-bold text-primary md:text-xl">
            Mundial 2026
          </h1>
        </Link>

        <nav className="hidden items-center gap-2 md:flex">
          <Link
            href="/partidos"
            className={cn(
              navLinkClass,
              activeNav === "partidos"
                ? "bg-surface-container-high font-bold text-primary"
                : "text-on-surface-variant hover:bg-surface-container-high",
            )}
          >
            <MaterialIcon
              name="grid_view"
              filled={activeNav === "partidos"}
              className="text-xl"
            />
            Partidos
          </Link>
          <Link
            href="/apuestas"
            className={cn(
              navLinkClass,
              activeNav === "apuestas"
                ? "bg-surface-container-high font-bold text-primary"
                : "text-on-surface-variant hover:bg-surface-container-high",
            )}
          >
            <MaterialIcon name="event_note" filled={activeNav === "apuestas"} className="text-xl" />
            Apuestas
          </Link>
          <Link
            href="/estadisticas"
            className={cn(
              navLinkClass,
              activeNav === "estadisticas"
                ? "bg-surface-container-high font-bold text-primary"
                : "text-on-surface-variant hover:bg-surface-container-high",
            )}
          >
            <MaterialIcon
              name="query_stats"
              filled={activeNav === "estadisticas"}
              className="text-xl"
            />
            Estadísticas
          </Link>
          <Link
            href="/clasificacion"
            className={cn(
              navLinkClass,
              activeNav === "clasificacion"
                ? "bg-surface-container-high font-bold text-primary"
                : "text-on-surface-variant hover:bg-surface-container-high",
            )}
          >
            <MaterialIcon
              name="leaderboard"
              filled={activeNav === "clasificacion"}
              className="text-xl"
            />
            Clasificación
          </Link>
          <Link
            href="/perfil"
            className={cn(
              navLinkClass,
              activeNav === "perfil"
                ? "bg-surface-container-high font-bold text-primary"
                : "text-on-surface-variant hover:bg-surface-container-high",
            )}
          >
            <MaterialIcon name="person" filled={activeNav === "perfil"} className="text-xl" />
            Perfil
          </Link>
        </nav>

        <div className="hidden md:flex">
          {userEmail ? (
            <div className="flex items-center gap-3">
              {isAdmin ? (
                <Link
                  href="/admin"
                  className={cn(
                    navLinkClass,
                    "border border-accent/30 bg-accent/10 text-primary hover:bg-accent/20",
                  )}
                >
                  <MaterialIcon name="admin_panel_settings" className="text-xl" />
                  Admin
                </Link>
              ) : null}
              <span className="max-w-40 truncate text-sm text-on-surface-variant">
                {userEmail}
              </span>
              <form action="/auth/signout" method="post">
                <button
                  type="submit"
                  className="rounded-lg border border-outline-variant px-4 py-2 text-xs font-medium transition-colors hover:bg-surface-container-high"
                >
                  Salir
                </button>
              </form>
            </div>
          ) : (
            <Link
              href="/login"
              className="flex items-center justify-center rounded-lg bg-primary px-4 py-2 text-xs font-medium text-primary-foreground shadow-sm transition-colors duration-150 hover:bg-primary-container active:scale-95"
            >
              Iniciar sesión
            </Link>
          )}
        </div>
      </div>
    </header>
  );
}
