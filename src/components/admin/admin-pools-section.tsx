"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { MaterialIcon } from "@/components/material-icon";
import { Alert } from "@/components/ui/alert";
import type { AdminPoolRow } from "@/lib/admin-types";
import { cn } from "@/lib/utils";

type AdminPoolsSectionProps = {
  pools: AdminPoolRow[];
};

function ownerLabel(pool: AdminPoolRow): string {
  const name = pool.display_name?.trim();
  if (name) return name;
  if (pool.username) return `@${pool.username}`;
  return "Usuario sin nombre";
}

export function AdminPoolsSection({ pools: initialPools }: AdminPoolsSectionProps) {
  const router = useRouter();
  const [pools, setPools] = useState(initialPools);
  const [savingPoolId, setSavingPoolId] = useState<number | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  const paidCount = pools.filter((p) => p.is_paid).length;

  async function handleTogglePaid(idPool: number, isPaid: boolean) {
    const previous = pools;
    setPools((prev) =>
      prev.map((p) => (p.id_pool === idPool ? { ...p, is_paid: isPaid } : p)),
    );
    setSavingPoolId(idPool);
    setError(null);
    setSuccess(null);

    const supabase = createClient();
    const { error: updateError } = await supabase
      .from("pools")
      .update({ is_paid: isPaid })
      .eq("id_pool", idPool);

    setSavingPoolId(null);

    if (updateError) {
      setPools(previous);
      setError(updateError.message);
      return;
    }

    const label = previous.find((p) => p.id_pool === idPool);
    setSuccess(
      isPaid
        ? `${ownerLabel(label!)}: marcada como pagada.`
        : `${ownerLabel(label!)}: marcada como pendiente de pago.`,
    );
    router.refresh();
  }

  return (
    <section className="rounded-xl border border-border/50 bg-white px-5 py-4 shadow-sm">
      <div className="flex flex-col gap-1">
        <h2 className="font-headline text-lg font-bold text-primary">
          Pagos de pollas
        </h2>
        <p className="font-geist text-sm text-on-surface-variant">
          Marca si cada participante ya pagó su inscripción a la polla.
        </p>
        <p className="font-geist text-xs text-on-surface-variant">
          {paidCount} de {pools.length} pollas pagadas
        </p>
      </div>

      {error ? (
        <Alert variant="destructive" className="mt-4">
          <p className="font-geist text-sm">{error}</p>
        </Alert>
      ) : null}
      {success ? (
        <Alert className="mt-4">
          <p className="font-geist text-sm">{success}</p>
        </Alert>
      ) : null}

      {pools.length === 0 ? (
        <p className="mt-4 font-geist text-sm text-on-surface-variant">
          Aún no hay pollas registradas.
        </p>
      ) : (
        <ul className="mt-4 divide-y divide-outline-variant/40">
          {pools.map((pool) => {
            const isSaving = savingPoolId === pool.id_pool;
            return (
              <li
                key={pool.id_pool}
                className={cn(
                  "flex items-center justify-between gap-4 py-3 first:pt-0 last:pb-0",
                  !pool.is_paid && "opacity-90",
                )}
              >
                <div className="min-w-0">
                  <p className="font-geist font-medium text-black">{ownerLabel(pool)}</p>
                  {pool.username ? (
                    <p className="font-mono text-xs text-on-surface-variant">
                      @{pool.username}
                    </p>
                  ) : null}
                  <p className="font-geist text-xs text-on-surface-variant">
                    {pool.description}
                  </p>
                </div>
                <label className="flex shrink-0 cursor-pointer items-center gap-2">
                  <span className="font-geist text-xs text-on-surface-variant">
                    {pool.is_paid ? "Pagada" : "Pendiente"}
                  </span>
                  <input
                    type="checkbox"
                    role="switch"
                    aria-label={`Pago de ${ownerLabel(pool)}`}
                    checked={pool.is_paid}
                    disabled={isSaving}
                    onChange={(e) => handleTogglePaid(pool.id_pool, e.target.checked)}
                    className="h-5 w-9 cursor-pointer appearance-none rounded-full border border-outline-variant bg-surface-container-high transition-colors checked:border-primary checked:bg-primary disabled:cursor-not-allowed disabled:opacity-50"
                  />
                  {isSaving ? (
                    <MaterialIcon
                      name="progress_activity"
                      className="animate-spin text-base text-on-surface-variant"
                    />
                  ) : pool.is_paid ? (
                    <MaterialIcon
                      name="paid"
                      className="text-base text-primary"
                      aria-hidden
                    />
                  ) : (
                    <MaterialIcon
                      name="pending"
                      className="text-base text-on-surface-variant"
                      aria-hidden
                    />
                  )}
                </label>
              </li>
            );
          })}
        </ul>
      )}
    </section>
  );
}
