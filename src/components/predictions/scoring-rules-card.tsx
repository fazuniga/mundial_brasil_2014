"use client";

import { useState } from "react";
import { MaterialIcon } from "@/components/material-icon";
import { scoringRuleHelper, scoringRuleLabel } from "@/lib/scoring-labels";
import type { ScoringRuleRow } from "@/lib/predictions-types";
import { cn } from "@/lib/utils";

const MATCH_MAIN_RULE_KEYS = new Set([
  "exact_score",
  "goal_difference",
  "winner",
]);

type ScoringRulesCardProps = {
  rules: ScoringRuleRow[];
  compact?: boolean;
  collapsible?: boolean;
};

type ListSegment =
  | { type: "rule"; rule: ScoringRuleRow }
  | { type: "match_main_group"; rules: ScoringRuleRow[] };

function buildListSegments(rules: ScoringRuleRow[]): ListSegment[] {
  const segments: ListSegment[] = [];
  let matchGroup: ScoringRuleRow[] = [];

  for (const rule of rules) {
    if (MATCH_MAIN_RULE_KEYS.has(rule.rule_key)) {
      matchGroup.push(rule);
      continue;
    }

    if (matchGroup.length > 0) {
      segments.push({ type: "match_main_group", rules: matchGroup });
      matchGroup = [];
    }
    segments.push({ type: "rule", rule });
  }

  if (matchGroup.length > 0) {
    segments.push({ type: "match_main_group", rules: matchGroup });
  }

  return segments;
}

function ScoringRuleItem({
  rule,
  compact,
}: {
  rule: ScoringRuleRow;
  compact: boolean;
}) {
  return (
    <li
      className={cn(
        "flex items-center justify-between gap-3 rounded-lg border border-outline-variant/40 bg-surface-container-low",
        compact ? "px-3 py-2" : "px-4 py-3",
      )}
    >
      <div className="min-w-0">
        <p className="font-geist text-sm font-medium text-on-surface">
          {scoringRuleLabel(rule.rule_key)}
        </p>
        {scoringRuleHelper(rule.rule_key) && (
          <p className="font-geist text-xs text-on-surface-variant">
            {scoringRuleHelper(rule.rule_key)}
          </p>
        )}
      </div>
      <span className="font-headline shrink-0 text-lg font-bold tabular-nums text-primary">
        +{rule.points}
      </span>
    </li>
  );
}

export function ScoringRulesCard({
  rules,
  compact = false,
  collapsible = false,
}: ScoringRulesCardProps) {
  const [open, setOpen] = useState(!collapsible);
  const segments = buildListSegments(rules);

  const header = (
    <div className="flex items-center gap-2">
      <MaterialIcon name="emoji_events" className="text-xl text-accent" />
      <div className="min-w-0">
        <h3 className="font-geist text-base font-semibold text-on-surface">
          Reglas de puntuación
        </h3>
        <p className="font-geist text-xs text-on-surface-variant">
          Así se calculan los puntos por acierto
        </p>
      </div>
    </div>
  );

  const list = (
    <ul className={cn("flex flex-col gap-2", compact ? "p-3" : "p-4")}>
      {segments.map((segment, index) => {
        if (segment.type === "rule") {
          return (
            <ScoringRuleItem
              key={segment.rule.id}
              rule={segment.rule}
              compact={compact}
            />
          );
        }

        return (
          <li
            key={`match-main-${index}`}
            className={cn(
              "rounded-lg border border-outline-variant/30 bg-surface-variant/30",
              compact ? "p-2.5" : "p-3",
            )}
          >
            <p className="mb-2 font-geist text-xs font-normal text-on-surface-variant">
              En cada partido, obtendrás hasta uno de estos
            </p>
            <ul className="flex flex-col gap-2">
              {segment.rules.map((rule) => (
                <ScoringRuleItem
                  key={rule.id}
                  rule={rule}
                  compact={compact}
                />
              ))}
            </ul>
          </li>
        );
      })}
    </ul>
  );

  if (collapsible) {
    return (
      <div className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
        <button
          type="button"
          onClick={() => setOpen((value) => !value)}
          className="flex w-full items-center justify-between gap-3 border-b border-outline-variant/50 bg-surface-container-lowest p-4 text-left"
          aria-expanded={open}
          aria-label={open ? "Ocultar reglas de puntuación" : "Mostrar reglas de puntuación"}
        >
          {header}
          <MaterialIcon
            name={open ? "expand_less" : "expand_more"}
            className="shrink-0 text-xl text-on-surface-variant"
          />
        </button>
        {open ? list : null}
      </div>
    );
  }

  return (
    <div className="flex h-full flex-col overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
      <div className="border-b border-outline-variant/50 bg-surface-container-lowest p-4">
        {header}
      </div>
      {list}
    </div>
  );
}
