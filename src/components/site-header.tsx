import Link from "next/link";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";

type SiteHeaderProps = {
  userEmail?: string | null;
};

const navLinkClass =
  "inline-flex h-8 items-center justify-center rounded-lg px-3 text-xs font-medium transition-colors";

export function SiteHeader({ userEmail }: SiteHeaderProps) {
  return (
    <header className="sticky top-0 z-50 border-b border-border bg-card/80 backdrop-blur-md">
      <div className="mx-auto flex h-16 max-w-4xl items-center justify-between px-6">
        <Link
          href="/"
          className="flex flex-col gap-0.5 transition-opacity hover:opacity-80"
        >
          <span className="text-lg font-bold tracking-tight text-foreground">
            Polla Mundial 2026
          </span>
          <span className="text-xs text-muted-foreground">
            Prode del Mundial USA, México y Canadá 2026
          </span>
        </Link>

        <nav className="flex items-center gap-2">
          {userEmail ? (
            <>
              <span className="hidden max-w-48 truncate text-sm text-muted-foreground sm:inline">
                {userEmail}
              </span>
              <form action="/auth/signout" method="post">
                <Button type="submit" variant="outline" size="sm">
                  Salir
                </Button>
              </form>
            </>
          ) : (
            <>
              <Link
                href="/login"
                className={cn(navLinkClass, "text-foreground hover:bg-muted")}
              >
                Ingresar
              </Link>
              <Link
                href="/register"
                className={cn(
                  navLinkClass,
                  "bg-primary text-primary-foreground hover:bg-primary-hover shadow-sm",
                )}
              >
                Registro
              </Link>
            </>
          )}
        </nav>
      </div>
    </header>
  );
}
