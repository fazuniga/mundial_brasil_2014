export const FIRST_GOAL_RANGE_KEYS = [
  "0-15",
  "16-30",
  "31-45",
  "45+_1T",
  "46-60",
  "61-75",
  "76-90",
  "90+_2T",
] as const;

export type FirstGoalRangeKey = (typeof FIRST_GOAL_RANGE_KEYS)[number];

export const FIRST_GOAL_RANGES: ReadonlyArray<{
  key: FirstGoalRangeKey;
  label: string;
}> = [
  { key: "0-15", label: "0–15 min" },
  { key: "16-30", label: "16–30 min" },
  { key: "31-45", label: "31–45 min" },
  { key: "45+_1T", label: "Tiempo agregado 1.er tiempo" },
  { key: "46-60", label: "46–60 min" },
  { key: "61-75", label: "61–75 min" },
  { key: "76-90", label: "76–90 min" },
  { key: "90+_2T", label: "Tiempo agregado 2.º tiempo" },
];

export function isFirstGoalRangeKey(value: string): value is FirstGoalRangeKey {
  return (FIRST_GOAL_RANGE_KEYS as readonly string[]).includes(value);
}
