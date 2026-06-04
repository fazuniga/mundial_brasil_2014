const RULE_LABELS: Record<string, string> = {
  exact_score: "Resultado exacto",
  goal_difference: "Diferencia de goles",
  winner: "Ganador del partido",
  extra_time: "¿Habrá prórroga?",
  first_goal_minute: "Intervalo del primer gol",
  top_scorer_player: "Goleador del torneo (jugador)",
  top_scorer_goals: "Goleador del torneo (goles)",
};

const RULE_HELPERS: Record<string, string> = {
  extra_time: "Solo fases eliminatorias",
  top_scorer_player: "Bota de oro compartida: cualquier jugador empatado en el máximo cuenta",
  top_scorer_goals: "Debe coincidir con el total del líder (empates incluidos)",
};

function humanizeRuleKey(ruleKey: string): string {
  return ruleKey
    .split("_")
    .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
    .join(" ");
}

export function scoringRuleLabel(ruleKey: string): string {
  return RULE_LABELS[ruleKey] ?? humanizeRuleKey(ruleKey);
}

export function scoringRuleHelper(ruleKey: string): string | null {
  return RULE_HELPERS[ruleKey] ?? null;
}
