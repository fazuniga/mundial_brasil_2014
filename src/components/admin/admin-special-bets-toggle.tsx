"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { MaterialIcon } from "@/components/material-icon";
import { Alert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import type { SpecialBetsSettings } from "@/lib/admin-types";
import { formatPredictionLockWindowShort } from "@/lib/prediction-lock";
import { cn } from "@/lib/utils";

type AdminSpecialBetsToggleProps = {
  settings: SpecialBetsSettings;
};

export function AdminSpecialBetsToggle({
  settings: initialSettings,
}: AdminSpecialBetsToggleProps) {
  const router = useRouter();
  const [settings, setSettings] = useState(initialSettings);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  const isAutomatic = settings.special_bets_open_override === null;
  const effectiveOpen = settings.tournament_bet_open;

  async function persistOverride(nextOverride: boolean | null): Promise<boolean> {
    setSaving(true);
    setError(null);
    setSuccess(null);

    const supabase = createClient();
    const { error: updateError } = await supabase
      .from("tournament_results")
      .update({ special_bets_open: nextOverride })
      .eq("id", 1);

    setSaving(false);

    if (updateError) {
      setError(updateError.message);
      return false;
    }

    const nextAutoOpen = settings.tournament_bet_auto_open;
    const nextEffective = nextOverride ?? nextAutoOpen;
    setSettings({
      tournament_bet_open: nextEffective,
      tournament_bet_auto_open: nextAutoOpen,
      special_bets_open_override: nextOverride,
    });

    if (nextOverride === null) {
      setSuccess(
        nextEffective
          ? "Apuestas Especiales: regla automática (abiertas)."
          : "Apuestas Especiales: regla automática (cerradas).",
      );
    } else {
      setSuccess(
        nextOverride
          ? "Apuestas Especiales: abiertas (forzado por admin)."
          : "Apuestas Especiales: cerradas (forzado por admin).",
      );
    }
    router.refresh();
    return true;
  }

  async function handleToggle(enabled: boolean) {
    const previous = settings;
    setSettings((prev) => ({
      ...prev,
      special_bets_open_override: enabled,
      tournament_bet_open: enabled,
    }));

    const ok = await persistOverride(enabled);
    if (!ok) {
      setSettings(previous);
    }
  }

  return (
    <div className="overflow-hidden rounded-xl border border-border/50 bg-white shadow-sm">
      <div className="border-b border-border/40 bg-slate-50 px-5 py-4">
        <div className="flex items-center gap-3">
          <MaterialIcon name="stars" className="text-2xl text-accent" />
          <div>
            <h2 className="font-geist text-base font-semibold text-on-surface">
              Apuestas Especiales
            </h2>
            <p className="font-geist text-xs text-on-surface-variant">
              Campeón del Mundial y goleador del torneo. Por defecto se cierran{" "}
              {formatPredictionLockWindowShort()} antes del primer partido.
            </p>
          </div>
        </div>
      </div>

      <div className="flex flex-col gap-4 px-5 py-4">
        {error ? (
          <Alert variant="destructive">
            <p className="font-geist text-sm">{error}</p>
          </Alert>
        ) : null}
        {success ? (
          <Alert>
            <p className="font-geist text-sm">{success}</p>
          </Alert>
        ) : null}

        <div
          className={cn(
            "flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between",
            !effectiveOpen && "opacity-90",
          )}
        >
          <div className="min-w-0 space-y-1">
            <p className="font-geist text-sm font-medium text-on-surface">
              {effectiveOpen ? "Abiertas para pronósticos" : "Cerradas para pronósticos"}
            </p>
            <p className="font-geist text-xs text-on-surface-variant">
              {isAutomatic
                ? `Regla automática: ${settings.tournament_bet_auto_open ? "abiertas" : `cerradas (${formatPredictionLockWindowShort()} antes del primer partido)`}.`
                : effectiveOpen
                  ? "Forzado abierto por administrador."
                  : "Forzado cerrado por administrador."}
            </p>
          </div>

          <div className="flex shrink-0 flex-wrap items-center gap-3">
            {!isAutomatic ? (
              <Button
                type="button"
                size="sm"
                variant="outline"
                disabled={saving}
                onClick={() => persistOverride(null)}
              >
                Usar automático
              </Button>
            ) : null}
            <label className="flex cursor-pointer items-center gap-2">
              <span className="font-geist text-xs text-on-surface-variant">
                {effectiveOpen ? "Abierta" : "Cerrada"}
              </span>
              <input
                type="checkbox"
                role="switch"
                aria-label="Apuestas Especiales abiertas"
                checked={effectiveOpen}
                disabled={saving}
                onChange={(e) => handleToggle(e.target.checked)}
                className="h-5 w-9 cursor-pointer appearance-none rounded-full border border-outline-variant bg-surface-container-high transition-colors checked:border-primary checked:bg-primary disabled:cursor-not-allowed disabled:opacity-50"
              />
              {saving ? (
                <MaterialIcon
                  name="progress_activity"
                  className="animate-spin text-base text-on-surface-variant"
                />
              ) : null}
            </label>
          </div>
        </div>
      </div>
    </div>
  );
}
