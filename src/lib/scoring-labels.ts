const RULE_LABELS: Record<string, string> = {
  exact_score: "Resultado exacto",
  goal_difference: "Diferencia de goles",
  winner: "Ganador del partido",
  extra_time: "¿Habrá prórroga?",
  first_goal_minute: "Intervalo de tiempo del primer gol",
  tournament_winner: "Campeón del Mundial",
  top_scorer_player: "Goleador del torneo",
  top_scorer_goals: "Goles del máximo goleador",
};

const RULE_HELPERS: Record<string, string> = {
  extra_time: "Solo fases eliminatorias",
  tournament_winner: "País campeón del Mundial 2026",
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

/** Knockout main-score prediction (admin: goles prórroga total; penales aparte). */
export function knockoutScorePredictionHint(): string {
  return "El marcador pronosticado incluye prórroga; los penales no cuentan.";
}
