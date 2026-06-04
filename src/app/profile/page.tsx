import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { MobileBottomNav } from "@/components/mobile-bottom-nav";
import { SiteHeader } from "@/components/site-header";
import { MaterialIcon } from "@/components/material-icon";

function profileInitials(firstName: string, lastName: string): string {
  const first = firstName.trim().charAt(0);
  const last = lastName.trim().charAt(0);
  if (first && last) return `${first}${last}`.toUpperCase();
  if (first) return first.toUpperCase();
  return "?";
}

export default async function ProfilePage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user) {
    redirect("/login");
  }

  const { data: profile } = await supabase
    .from("profiles")
    .select("first_name, last_name, username, created_at, is_admin")
    .eq("id", user.id)
    .maybeSingle();

  const isAdmin = profile?.is_admin ?? false;

  const { data: pools } = await supabase
    .from("pools")
    .select("id_pool")
    .eq("owner_id", user.id);

  const poolIds = (pools ?? []).map((p) => p.id_pool);
  let predictionsCount = 0;

  if (poolIds.length > 0) {
    const { count } = await supabase
      .from("predictions")
      .select("*", { count: "exact", head: true })
      .in("id_pool", poolIds);

    predictionsCount = count ?? 0;
  }

  const hasSavedPredictions = predictionsCount > 0;

  const displayName = profile
    ? `${profile.first_name} ${profile.last_name}`.trim() || profile.username || user.email
    : user.email;

  const initials = profile
    ? profileInitials(profile.first_name, profile.last_name)
    : (user.email?.charAt(0).toUpperCase() ?? "?");

  const memberSince = profile?.created_at
    ? new Intl.DateTimeFormat("es-ES", { month: "long", year: "numeric" }).format(
        new Date(profile.created_at),
      )
    : null;

  return (
    <>
      <SiteHeader userEmail={user.email} isAdmin={isAdmin} activeNav="profile" />
      <main className="mx-auto flex w-full max-w-7xl flex-col gap-section-gap px-gutter-md pb-24 pt-[calc(4rem+2rem)] md:pb-8">
        <header className="space-y-2 hidden">
          <p className="font-geist text-xs font-semibold uppercase tracking-widest text-accent">
            Cuenta
          </p>
          <h1 className="font-headline text-2xl font-bold text-primary md:text-3xl">
            Perfil
          </h1>
        </header>

        <div className="light-surface-panel flex flex-col gap-stack-gap">
        <div className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
          <div className="flex flex-col gap-4 border-b border-outline-variant/50 bg-surface-container-lowest p-6">
            <div className="flex items-start gap-4">
              <div className="flex h-20 w-20 shrink-0 items-center justify-center rounded-full bg-primary-container text-2xl font-bold text-white shadow-sm">
                {initials}
              </div>
              <div className="min-w-0 flex-1 space-y-0.5">
                <h2 className="font-headline truncate text-xl font-bold text-on-surface">
                  {displayName}
                </h2>
                {profile?.username ? (
                  <p className="font-mono text-sm text-on-surface-variant">@{profile.username}</p>
                ) : null}
                <p className="font-geist truncate text-sm text-on-surface-variant">{user.email}</p>
                {memberSince ? (
                  <p className="font-geist pt-1 text-xs text-on-surface-variant">
                    Miembro desde {memberSince}
                  </p>
                ) : null}
              </div>
            </div>
            <Link
              href="/predictions"
              className="font-geist text-white flex w-full items-center justify-center gap-2 rounded-lg bg-primary px-4 py-2.5 text-sm font-medium text-primary-foreground shadow-sm transition-colors hover:bg-primary-container"
            >
              <MaterialIcon name="event_note" className="text-[18px]" />
              Ir a partidos
            </Link>
          </div>

          <div className="grid grid-cols-1 gap-4 p-6 sm:grid-cols-2">
            <div className="rounded-lg border border-outline-variant/40 bg-surface-container-low px-4 py-4">
              <p className="font-geist text-xs font-medium uppercase tracking-wide text-on-surface-variant">
                Pronósticos guardados
              </p>
              <p className="font-headline mt-2 text-3xl font-bold tabular-nums text-primary">
                {predictionsCount}
              </p>
            </div>
            <div className="rounded-lg border border-outline-variant/40 bg-surface-container-low px-4 py-4">
              <p className="font-geist text-xs font-medium uppercase tracking-wide text-on-surface-variant">
                Participación
              </p>
              <p className="font-headline mt-2 text-lg font-bold text-primary">
                {hasSavedPredictions ? "Activa" : "Sin pronósticos"}
              </p>
            </div>
          </div>
        </div>

        <div className="grid grid-cols-1 gap-stack-gap lg:grid-cols-2">
          <section className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
            <div className="border-b border-outline-variant/50 bg-surface-container-lowest p-5">
              <div className="flex items-center gap-2">
                <MaterialIcon name="settings" className="text-xl text-primary" />
                <h3 className="font-geist text-base font-semibold text-on-surface">
                  Configuración de cuenta
                </h3>
              </div>
            </div>
            <div className="space-y-4 p-5">
              <div className="rounded-lg border border-outline-variant/40 bg-surface-container-low px-4 py-3">
                <p className="font-geist text-xs font-medium uppercase tracking-wide text-on-surface-variant">
                  Correo electrónico
                </p>
                <p className="font-geist mt-1 text-sm text-on-surface">{user.email}</p>
              </div>
              {profile?.is_admin ? (
                <div className="rounded-lg border border-accent/30 bg-accent/10 px-4 py-3">
                  <p className="font-geist text-sm font-medium text-on-surface">
                    Rol de administrador activo
                  </p>
                  <p className="font-geist mt-1 text-xs text-on-surface-variant">
                    Usa el enlace Administración en la cabecera.
                  </p>
                </div>
              ) : null}
              <form action="/auth/signout" method="post">
                <button
                  type="submit"
                  className="font-geist flex w-full items-center justify-center gap-2 rounded-lg border border-outline-variant bg-surface-container-lowest px-4 py-2.5 text-sm font-medium text-on-surface transition-colors hover:bg-surface-container-high"
                >
                  <MaterialIcon name="logout" className="text-[18px]" />
                  Cerrar sesión
                </button>
              </form>
            </div>
          </section>

          <section className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
            <div className="border-b border-outline-variant/50 bg-surface-container-lowest p-5">
              <div className="flex items-center gap-2">
                <MaterialIcon name="event_note" className="text-xl text-primary" />
                <h3 className="font-geist text-base font-semibold text-on-surface">
                  Mis pronósticos
                </h3>
              </div>
            </div>
            <div className="space-y-4 p-5">
              {hasSavedPredictions ? (
                <p className="font-geist text-sm text-on-surface-variant">
                  Tienes {predictionsCount}{" "}
                  {predictionsCount === 1 ? "pronóstico guardado" : "pronósticos guardados"} en
                  tu prode del Mundial.
                </p>
              ) : (
                <p className="font-geist text-sm text-on-surface-variant">
                  Aún no has guardado pronósticos. Ve a Partidos para registrar tu prode.
                </p>
              )}
              <Link
                href="/predictions"
                className="font-geist inline-flex items-center gap-2 text-sm font-medium text-primary transition-colors hover:text-primary-container"
              >
                <MaterialIcon name="arrow_forward" className="text-[18px]" />
                Ver y editar pronósticos
              </Link>
            </div>
          </section>
        </div>
        </div>
      </main>
      <MobileBottomNav active="profile" isAdmin={isAdmin} />
    </>
  );
}
