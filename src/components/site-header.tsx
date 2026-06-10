import Link from "next/link";
import { MaterialIcon } from "@/components/material-icon";
import { cn } from "@/lib/utils";

type SiteHeaderProps = {
  userEmail?: string | null;
  isAdmin?: boolean;
  activeNav?: "home" | "matches" | "resultados" | "clasificacion" | "profile";
};

const navLinkClass =
  "flex items-center gap-2 rounded-lg px-4 py-2 text-sm font-medium transition-colors duration-150 active:scale-95";

export function SiteHeader({
  userEmail,
  isAdmin = false,
  activeNav = "home",
}: SiteHeaderProps) {
  return (
    <header className="fixed top-0 z-50 w-full border-b border-outline-variant/40 bg-surface/95 shadow-sm backdrop-blur-md">
      <div className="mx-auto flex h-header-height w-full max-w-7xl items-center justify-between px-gutter-md">
        <Link href="/" className="flex items-center gap-3 transition-opacity hover:opacity-80">
          <MaterialIcon name="sports_soccer" className="text-3xl text-primary" />
          <h1 className="font-headline text-lg font-bold text-primary md:text-xl">
            Mundial 2026
          </h1>
        </Link>

        <nav className="hidden items-center gap-2 md:flex">
          <Link
            href="/"
            className={cn(
              navLinkClass,
              activeNav === "home"
                ? "bg-surface-container-high font-bold text-primary"
                : "text-on-surface-variant hover:bg-surface-container-high",
            )}
          >
            <MaterialIcon name="home" filled={activeNav === "home"} className="text-xl" />
            Inicio
          </Link>
          <Link
            href="/predictions"
            className={cn(
              navLinkClass,
              activeNav === "matches"
                ? "bg-surface-container-high font-bold text-primary"
                : "text-on-surface-variant hover:bg-surface-container-high",
            )}
          >
            <MaterialIcon name="event_note" filled={activeNav === "matches"} className="text-xl" />
            Apuestas
          </Link>
          <Link
            href="/resultados"
            className={cn(
              navLinkClass,
              activeNav === "resultados"
                ? "bg-surface-container-high font-bold text-primary"
                : "text-on-surface-variant hover:bg-surface-container-high",
            )}
          >
            <MaterialIcon
              name="grid_view"
              filled={activeNav === "resultados"}
              className="text-xl"
            />
            Resultados
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
            href="/profile"
            className={cn(
              navLinkClass,
              activeNav === "profile"
                ? "bg-surface-container-high font-bold text-primary"
                : "text-on-surface-variant hover:bg-surface-container-high",
            )}
          >
            <MaterialIcon name="person" filled={activeNav === "profile"} className="text-xl" />
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
