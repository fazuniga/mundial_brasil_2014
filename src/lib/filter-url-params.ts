export type FixtureListFilters = {
  selectedRound: number | null;
  todayOnly: boolean;
  searchQuery: string;
};

export function parseFixtureFiltersFromSearchParams(
  params: { r?: string; hoy?: string; q?: string },
  defaults: { todayOnly: boolean },
): FixtureListFilters {
  const selectedRound =
    params.r != null && /^\d+$/.test(params.r) ? Number(params.r) : null;

  let todayOnly = defaults.todayOnly;
  if (params.hoy === "1") todayOnly = true;
  if (params.hoy === "0") todayOnly = false;

  return {
    selectedRound,
    todayOnly,
    searchQuery: params.q ?? "",
  };
}

export function buildFilterQueryString(
  filters: FixtureListFilters,
  defaults: { todayOnly: boolean },
  extra: Record<string, string | undefined> = {},
): string {
  const params = new URLSearchParams();

  for (const [key, value] of Object.entries(extra)) {
    if (value) params.set(key, value);
  }

  if (filters.selectedRound != null) {
    params.set("r", String(filters.selectedRound));
  }

  if (filters.todayOnly !== defaults.todayOnly) {
    params.set("hoy", filters.todayOnly ? "1" : "0");
  }

  const query = filters.searchQuery.trim();
  if (query) params.set("q", query);

  const serialized = params.toString();
  return serialized ? `?${serialized}` : "";
}

export function replaceFilterUrl(
  pathname: string,
  filters: FixtureListFilters,
  defaults: { todayOnly: boolean },
  extra: Record<string, string | undefined> = {},
): string {
  return `${pathname}${buildFilterQueryString(filters, defaults, extra)}`;
}
