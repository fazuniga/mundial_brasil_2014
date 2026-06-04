"use client";

import { useEffect, useMemo, useState } from "react";
import { MaterialIcon } from "@/components/material-icon";
import {
  formatElapsedSinceLock,
  formatRemainingUntilLock,
  getPredictionLockState,
  type PredictionLockState,
} from "@/lib/prediction-lock";
import { cn } from "@/lib/utils";

const TICK_MS = 30_000;

export function usePredictionLockTicker(
  matchDate: string,
  matchTime: string,
): PredictionLockState {
  const [now, setNow] = useState(() => Date.now());

  useEffect(() => {
    const intervalId = window.setInterval(() => setNow(Date.now()), TICK_MS);
    return () => window.clearInterval(intervalId);
  }, [matchDate, matchTime]);

  return useMemo(
    () => getPredictionLockState(matchDate, matchTime, new Date(now)),
    [matchDate, matchTime, now],
  );
}

type PredictionCountdownProps = {
  lockState: PredictionLockState;
};

export function PredictionCountdown({ lockState }: PredictionCountdownProps) {
  if (lockState.isOpen) {
    const label = formatRemainingUntilLock(lockState.msUntilClose);
    const closingSoon = lockState.msUntilClose <= 60_000;

    return (
      <div className="flex flex-col gap-0.5">
        <span className="inline-flex items-center gap-1 font-geist text-xs text-primary">
          <MaterialIcon name="edit_calendar" className="text-sm" />
          Abierto
        </span>
        <span
          className={cn(
            "font-geist text-[10px] tabular-nums",
            closingSoon ? "font-medium text-amber-700 dark:text-amber-400" : "text-on-surface-variant",
          )}
        >
          {label}
        </span>
      </div>
    );
  }

  const elapsed = formatElapsedSinceLock(lockState.msSinceClose);

  return (
    <div className="flex flex-col gap-0.5">
      <span className="inline-flex items-center gap-1 font-geist text-xs text-on-surface-variant">
        <MaterialIcon name="lock" className="text-sm" />
        Apuestas cerradas
      </span>
      <span className="font-geist text-[10px] text-on-surface-variant/80">
        Cerrado · {elapsed}
      </span>
    </div>
  );
}
