/** How match_date + match_time are interpreted in v_fixture / predictions_open. */
export const MATCH_STORAGE_TIMEZONE = "America/New_York";

/** User-facing kickoff display timezone. */
export const MATCH_TIMEZONE = "America/Santiago";

export const MATCH_TIMEZONE_LABEL = "hora de Chile";

/** Short suffix for compact tables (e.g. predictions grid). */
export const MATCH_TIMEZONE_ABBR = "CLT";

/**
 * Resolve stored match_date + match_time to a UTC instant.
 * Seed data and predictions_open treat wall time as MATCH_STORAGE_TIMEZONE.
 */
export function parseMatchKickoff(
  matchDate: string,
  matchTime: string,
  timeZone: string = MATCH_STORAGE_TIMEZONE,
): Date {
  const [year, month, day] = matchDate.split("-").map(Number);
  const timeParts = matchTime.split(":");
  const hour = Number(timeParts[0] ?? 0);
  const minute = Number(timeParts[1] ?? 0);

  let utcMs = Date.UTC(year, month - 1, day, hour, minute);

  const formatter = new Intl.DateTimeFormat("en-US", {
    timeZone,
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
    hourCycle: "h23",
  });

  for (let i = 0; i < 4; i++) {
    const parts = formatter.formatToParts(new Date(utcMs));
    const get = (type: Intl.DateTimeFormatPartTypes) =>
      Number(parts.find((p) => p.type === type)?.value ?? 0);

    const targetMs = Date.UTC(year, month - 1, day, hour, minute);
    const actualMs = Date.UTC(
      get("year"),
      get("month") - 1,
      get("day"),
      get("hour"),
      get("minute"),
    );
    const deltaMs = targetMs - actualMs;

    if (deltaMs === 0) break;
    utcMs += deltaMs;
  }

  return new Date(utcMs);
}

function formatYmdInTimezone(date: Date, timeZone: string): string {
  return new Intl.DateTimeFormat("en-CA", {
    timeZone,
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
  }).format(date);
}

/** Kickoff calendar date in MATCH_TIMEZONE (YYYY-MM-DD). */
export function fixtureKickoffYmdInDisplayTimezone(
  matchDate: string,
  matchTime: string,
): string {
  return formatYmdInTimezone(
    parseMatchKickoff(matchDate, matchTime),
    MATCH_TIMEZONE,
  );
}

export function todayYmdInDisplayTimezone(now = new Date()): string {
  return formatYmdInTimezone(now, MATCH_TIMEZONE);
}

export function isFixtureToday(
  matchDate: string,
  matchTime: string,
  now = new Date(),
): boolean {
  return (
    fixtureKickoffYmdInDisplayTimezone(matchDate, matchTime) ===
    todayYmdInDisplayTimezone(now)
  );
}

export function filterFixturesToday<
  T extends { match_date: string; match_time: string },
>(fixtures: T[], todayOnly: boolean, now = new Date()): T[] {
  if (!todayOnly) return fixtures;
  const today = todayYmdInDisplayTimezone(now);
  return fixtures.filter(
    (fixture) =>
      fixtureKickoffYmdInDisplayTimezone(
        fixture.match_date,
        fixture.match_time,
      ) === today,
  );
}
