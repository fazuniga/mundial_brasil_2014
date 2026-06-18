import { parseMatchKickoff } from "@/lib/match-timezone";

/** Matches v_fixture.predictions_open: lock when kickoff is less than this many minutes away. */
export const PREDICTION_LOCK_MINUTES_BEFORE_KICKOFF = 30;

/** User-facing label, e.g. "30 minutos". */
export function formatPredictionLockWindowLabel(
  minutes: number = PREDICTION_LOCK_MINUTES_BEFORE_KICKOFF,
): string {
  return `${minutes} minuto${minutes === 1 ? "" : "s"}`;
}

/** Compact label, e.g. "30 min". */
export function formatPredictionLockWindowShort(): string {
  return `${PREDICTION_LOCK_MINUTES_BEFORE_KICKOFF} min`;
}

export type PredictionLockState = {
  isOpen: boolean;
  /** Milliseconds until betting closes; positive while still open. */
  msUntilClose: number;
  /** Milliseconds since betting closed; positive when closed. */
  msSinceClose: number;
};

export function getPredictionLockDeadline(
  matchDate: string,
  matchTime: string,
): Date {
  const kickoff = parseMatchKickoff(matchDate, matchTime);
  return new Date(
    kickoff.getTime() - PREDICTION_LOCK_MINUTES_BEFORE_KICKOFF * 60 * 1000,
  );
}

/**
 * Client-side mirror of v_fixture.predictions_open using America/New_York kickoff math.
 */
export function getPredictionLockState(
  matchDate: string,
  matchTime: string,
  now: Date = new Date(),
): PredictionLockState {
  const kickoff = parseMatchKickoff(matchDate, matchTime);
  const nowMs = now.getTime();
  const kickoffMs = kickoff.getTime();
  const lockDeadlineMs =
    kickoffMs - PREDICTION_LOCK_MINUTES_BEFORE_KICKOFF * 60 * 1000;

  const minutesUntilKickoff = (kickoffMs - nowMs) / 60_000;
  const isOpen = minutesUntilKickoff >= PREDICTION_LOCK_MINUTES_BEFORE_KICKOFF;

  if (isOpen) {
    return {
      isOpen: true,
      msUntilClose: lockDeadlineMs - nowMs,
      msSinceClose: 0,
    };
  }

  return {
    isOpen: false,
    msUntilClose: 0,
    msSinceClose: nowMs - lockDeadlineMs,
  };
}

export function getMinutesUntilLock(
  matchDate: string,
  matchTime: string,
  now: Date = new Date(),
): number {
  const { msUntilClose, isOpen } = getPredictionLockState(matchDate, matchTime, now);
  if (!isOpen) return 0;
  return Math.max(0, Math.ceil(msUntilClose / 60_000));
}

export function formatRemainingUntilLock(msUntilClose: number): string {
  if (msUntilClose <= 0) return "Cierra pronto";

  const totalMinutes = Math.ceil(msUntilClose / 60_000);
  if (totalMinutes < 1) return "Cierra pronto";
  if (totalMinutes < 60) return `Cierra en ${totalMinutes} min`;

  const hours = Math.floor(totalMinutes / 60);
  const minutes = totalMinutes % 60;
  if (minutes === 0) return `Cierra en ${hours} h`;
  return `Cierra en ${hours} h ${minutes} min`;
}

export function formatElapsedSinceLock(msSinceClose: number): string {
  if (msSinceClose < 60_000) return "hace un momento";

  const totalMinutes = Math.floor(msSinceClose / 60_000);
  if (totalMinutes < 60) return `hace ${totalMinutes} min`;

  const hours = Math.floor(totalMinutes / 60);
  const minutes = totalMinutes % 60;
  if (minutes === 0) return `hace ${hours} h`;
  return `hace ${hours} h ${minutes} min`;
}
