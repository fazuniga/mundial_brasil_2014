"use client";

import { createClient } from "@/lib/supabase/client";
import { MaterialIcon } from "@/components/material-icon";
import { Alert } from "@/components/ui/alert";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useState } from "react";

const inputClassName =
  "h-10 rounded border border-outline-variant bg-surface-container-lowest px-3 text-sm text-on-surface transition-all placeholder:text-on-surface-variant/60 focus:border-primary focus:outline-none focus:ring-2 focus:ring-primary/20";

export default function RegisterPage() {
  const router = useRouter();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  async function handleRegister(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setError(null);
    const supabase = createClient();
    const { error: signUpError } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: { first_name: firstName, last_name: lastName },
      },
    });
    if (signUpError) {
      setLoading(false);
      setError(signUpError.message);
      return;
    }
    setLoading(false);
    router.push("/");
    router.refresh();
  }

  return (
    <main className="flex min-h-screen flex-grow items-center justify-center p-gutter-md">
      <div className="mx-auto flex w-full max-w-7xl justify-center">
        <div className="w-full max-w-md">
        <div className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-md">
          <div className="flex flex-col gap-6 p-6 md:p-8">
            <div className="space-y-2 text-center">
              <p className="font-geist text-xs font-semibold uppercase tracking-widest text-accent">
                Polla Mundial 2026
              </p>
              <h1 className="font-headline flex items-center justify-center gap-2 text-3xl font-bold text-primary">
                <MaterialIcon name="sports_soccer" filled className="text-3xl" />
                Registrarse
              </h1>
              <p className="font-geist text-sm text-on-surface-variant">
                Crea tu cuenta para unirte a los pronósticos y la clasificación del torneo.
              </p>
            </div>

            <form onSubmit={handleRegister} className="space-y-4">
              <div className="grid gap-4 sm:grid-cols-2">
                <div className="flex flex-col gap-2">
                  <label
                    htmlFor="firstName"
                    className="font-geist text-xs font-medium text-on-surface"
                  >
                    Nombre
                  </label>
                  <input
                    id="firstName"
                    name="firstName"
                    type="text"
                    required
                    autoComplete="given-name"
                    placeholder="Nombre"
                    value={firstName}
                    onChange={(e) => setFirstName(e.target.value)}
                    className={inputClassName}
                  />
                </div>
                <div className="flex flex-col gap-2">
                  <label
                    htmlFor="lastName"
                    className="font-geist text-xs font-medium text-on-surface"
                  >
                    Apellido
                  </label>
                  <input
                    id="lastName"
                    name="lastName"
                    type="text"
                    required
                    autoComplete="family-name"
                    placeholder="Apellido"
                    value={lastName}
                    onChange={(e) => setLastName(e.target.value)}
                    className={inputClassName}
                  />
                </div>
              </div>

              <div className="flex flex-col gap-2">
                <label
                  htmlFor="email"
                  className="font-geist text-xs font-medium text-on-surface"
                >
                  Correo electrónico
                </label>
                <input
                  id="email"
                  name="email"
                  type="email"
                  required
                  autoComplete="email"
                  placeholder="nombre@ejemplo.com"
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
                  minLength={6}
                  autoComplete="new-password"
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
                  className="font-geist flex h-10 w-full items-center justify-center gap-2 rounded-lg bg-primary text-xs font-medium text-primary-foreground shadow-sm transition-all hover:bg-primary-container active:scale-[0.98] disabled:opacity-50"
                >
                  {loading ? "Creando cuenta…" : "Crear cuenta"}
                  <MaterialIcon name="person_add" className="text-[18px]" />
                </button>
              </div>
            </form>

            <div className="pt-2 text-center">
              <p className="font-geist text-sm text-on-surface-variant">
                ¿Ya tienes cuenta?{" "}
                <Link
                  href="/login"
                  className="font-medium text-primary underline-offset-4 hover:underline"
                >
                  Iniciar sesión
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
