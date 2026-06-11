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

type PaymentField = "is_paid_group_phase" | "is_paid_knockout";

const PAYMENT_PHASES: { field: PaymentField; label: string }[] = [
  { field: "is_paid_group_phase", label: "Fase de Grupos" },
  { field: "is_paid_knockout", label: "Fases eliminatorias" },
];

function ownerLabel(pool: AdminPoolRow): string {
  const name = pool.display_name?.trim();
  if (name) return name;
  if (pool.username) return `@${pool.username}`;
  return "Usuario sin nombre";
}

function phaseLabel(field: PaymentField): string {
  return PAYMENT_PHASES.find((p) => p.field === field)?.label ?? field;
}

export function AdminPoolsSection({ pools: initialPools }: AdminPoolsSectionProps) {
  const router = useRouter();
  const [pools, setPools] = useState(initialPools);
  const [savingKey, setSavingKey] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  const groupPaidCount = pools.filter((p) => p.is_paid_group_phase).length;
  const knockoutPaidCount = pools.filter((p) => p.is_paid_knockout).length;

  async function handleTogglePaid(idPool: number, field: PaymentField, isPaid: boolean) {
    const previous = pools;
    setPools((prev) =>
      prev.map((p) => (p.id_pool === idPool ? { ...p, [field]: isPaid } : p)),
    );
    setSavingKey(`${idPool}:${field}`);
    setError(null);
    setSuccess(null);

    const supabase = createClient();
    const { error: updateError } = await supabase
      .from("pools")
      .update({ [field]: isPaid })
      .eq("id_pool", idPool);

    setSavingKey(null);

    if (updateError) {
      setPools(previous);
      setError(updateError.message);
      return;
    }

    const label = previous.find((p) => p.id_pool === idPool);
    const phase = phaseLabel(field);
    setSuccess(
      isPaid
        ? `${ownerLabel(label!)}: ${phase} marcada como pagada.`
        : `${ownerLabel(label!)}: ${phase} marcada como pendiente de pago.`,
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
          Marca si cada participante pagó la Fase de Grupos y las fases
          eliminatorias por separado.
        </p>
        <div className="mt-1 flex flex-col gap-1 border border-black/10 items-start rounded-md shadow-sm bg-gray-50 p-2 px-3">
          <p className="font-geist text-xs text-black">
            Fase de Grupos: {groupPaidCount} de {pools.length} pagadas
          </p>
          <p className="font-geist text-xs text-black">
            Fases eliminatorias: {knockoutPaidCount} de {pools.length} pagadas
          </p>
        </div>
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
        <ul className="mt-4 divide-y divide-black/10">
          {pools.map((pool) => {
            const hasPending =
              !pool.is_paid_group_phase || !pool.is_paid_knockout;
            return (
              <li
                key={pool.id_pool}
                className={cn(
                  "flex flex-col py-2 first:pt-0 last:pb-0 sm:flex-row sm:items-center sm:justify-between",
                  hasPending && "opacity-90",
                )}
              >
                <div className="min-w-0">
                  <div className="flex flex-row gap-1 items-center font-geist font-medium text-black">
                    <span>{ownerLabel(pool)}</span>
                    <span>·</span>
                    {pool.username ? <span className="font-mono text-xs text-on-surface-variant">@{pool.username}</span> : null}
                  </div>
                </div>
                <div className="flex shrink-0 flex-col gap-0.5 sm:items-end">
                  {PAYMENT_PHASES.map(({ field, label }) => {
                    const isPaid = pool[field];
                    const isSaving = savingKey === `${pool.id_pool}:${field}`;
                    return (
                      <label
                        key={field}
                        className="flex w-full cursor-pointer items-center justify-between gap-2"
                      >
                        <span className="font-geist text-xs text-on-surface-variant">
                          {label}: {isPaid ? "Pagada" : "Pendiente"}
                        </span>
                        <div className="flex items-center gap-2">
                          <input
                            type="checkbox"
                            role="switch"
                            aria-label={`Pago ${label} de ${ownerLabel(pool)}`}
                            checked={isPaid}
                            disabled={isSaving}
                            onChange={(e) =>
                              handleTogglePaid(pool.id_pool, field, e.target.checked)
                            }
                            className="h-5 w-9 cursor-pointer appearance-none rounded-full border border-outline-variant bg-surface-container-high transition-colors checked:border-primary checked:bg-primary disabled:cursor-not-allowed disabled:opacity-50"
                          />
                          {isSaving ? (
                            <MaterialIcon
                              name="progress_activity"
                              className="animate-spin text-base text-on-surface-variant"
                            />
                          ) : isPaid ? (
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
                        </div>
                      </label>
                    );
                  })}
                </div>
              </li>
            );
          })}
        </ul>
      )}
    </section>
  );
}
