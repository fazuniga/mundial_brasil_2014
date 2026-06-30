"use client";

import { createClient } from "@/lib/supabase/client";
import { MaterialIcon } from "@/components/material-icon";
import { Alert } from "@/components/ui/alert";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useRef, useState } from "react";

const inputClassName =
  "h-10 rounded border border-outline-variant bg-surface-container-lowest px-3 text-sm text-on-surface transition-[border-color,box-shadow] placeholder:text-on-surface-variant/60 focus-visible:border-primary focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary/20";

export default function LoginPage() {
  const router = useRouter();
  const emailRef = useRef<HTMLInputElement>(null);
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  async function handleLogin(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setError(null);
    const supabase = createClient();
    const { error: signInError } = await supabase.auth.signInWithPassword({
      email,
      password,
    });
    setLoading(false);
    if (signInError) {
      setError(signInError.message);
      emailRef.current?.focus();
      return;
    }
    router.push("/");
    router.refresh();
  }

  return (
    <main id="main-content" className="flex min-h-screen flex-grow items-center justify-center p-gutter-md">
      <div className="mx-auto flex w-full max-w-7xl justify-center">
        <div className="w-full max-w-md">
        <div className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-md">
          <div className="flex flex-col gap-6 p-6 md:p-8">
            <div className="space-y-2 text-center">
              <p className="font-geist text-xs font-semibold uppercase tracking-widest text-accent">
                Polla Mundial 2026
              </p>
              <h1 className="font-headline flex items-center justify-center gap-2 text-3xl font-bold text-primary text-balance">
                <MaterialIcon name="sports_soccer" filled className="text-3xl" />
                Iniciar sesión
              </h1>
              <p className="font-geist text-sm text-on-surface-variant">
                Accede a tus pronósticos y la clasificación del torneo.
              </p>
            </div>

            <form onSubmit={handleLogin} className="space-y-4">
              <div className="flex flex-col gap-2">
                <label
                  htmlFor="email"
                  className="font-geist text-xs font-medium text-on-surface"
                >
                  Correo electrónico
                </label>
                <input
                  ref={emailRef}
                  id="email"
                  name="email"
                  type="email"
                  required
                  autoComplete="email"
                  spellCheck={false}
                  placeholder="nombre@ejemplo.com…"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  className={inputClassName}
                />
              </div>

              <div className="flex flex-col gap-2">
                <label
                  htmlFor="password"
                  className="font-geist text-xs font-medium text-on-surface"
                >
                  Contraseña
                </label>
                <input
                  id="password"
                  name="password"
                  type="password"
                  required
                  autoComplete="current-password"
                  placeholder="••••••••"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  className={inputClassName}
                />
              </div>

              {error && <Alert variant="destructive">{error}</Alert>}

              <div className="pt-4">
                <button
                  type="submit"
                  disabled={loading}
                  className="font-geist flex h-10 w-full items-center justify-center gap-2 rounded-lg bg-primary text-xs font-medium text-primary-foreground shadow-sm transition-colors hover:bg-primary-container motion-safe:active:scale-[0.98] disabled:opacity-50"
                >
                  {loading ? "Iniciando sesión…" : "Iniciar sesión"}
                  <MaterialIcon name="login" className="text-[18px]" />
                </button>
              </div>
            </form>

            <div className="pt-2 text-center">
              <p className="font-geist text-sm text-on-surface-variant">
                ¿No tienes cuenta?{" "}
                <Link
                  href="/register"
                  className="font-medium text-primary underline-offset-4 hover:underline"
                >
                  Regístrate para jugar
                </Link>
              </p>
            </div>
          </div>
        </div>

        <div className="mx-auto mt-8 max-w-sm px-4 text-center">
          <p className="font-geist text-sm italic text-on-surface-variant">
            &ldquo;La pelota es redonda, el partido dura noventa minutos y todo lo
            demás es pura teoría.&rdquo;
          </p>
        </div>
        </div>
      </div>
    </main>
  );
}
