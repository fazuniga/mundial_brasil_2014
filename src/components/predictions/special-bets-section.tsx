"use client";

import { MaterialIcon } from "@/components/material-icon";
import { TopScorerBet } from "@/components/predictions/top-scorer-bet";
import { WorldCupWinnerBet } from "@/components/predictions/world-cup-winner-bet";
import type { PlayerRow, ScoringRuleRow, TeamRow } from "@/lib/predictions-types";
import type { TopScorerDraft, WinnerDraft } from "@/lib/predictions-utils";

type SpecialBetsSectionProps = {
  teams: TeamRow[];
  players: PlayerRow[];
  scoringRules: ScoringRuleRow[];
  winnerDraft: WinnerDraft;
  topScorerDraft: TopScorerDraft;
  onWinnerChange: (field: keyof WinnerDraft, value: string) => void;
  onTopScorerChange: (field: keyof TopScorerDraft, value: string) => void;
  disabled: boolean;
  winnerSaved: boolean;
  topScorerSaved: boolean;
};

function rulePoints(rules: ScoringRuleRow[], ruleKey: string, fallback: number): number {
  return rules.find((r) => r.rule_key === ruleKey)?.points ?? fallback;
}

export function SpecialBetsSection({
  teams,
  players,
  scoringRules,
  winnerDraft,
  topScorerDraft,
  onWinnerChange,
  onTopScorerChange,
  disabled,
  winnerSaved,
  topScorerSaved,
}: SpecialBetsSectionProps) {
  const winnerPoints = rulePoints(scoringRules, "tournament_winner", 15);
  const topScorerPlayerPoints = rulePoints(scoringRules, "top_scorer_player", 10);
  const topScorerGoalsPoints = rulePoints(scoringRules, "top_scorer_goals", 15);

  return (
    <section className="overflow-hidden rounded-xl border border-outline-variant/60 bg-card shadow-sm">
      <div className="border-b border-outline-variant/50 bg-surface-container-lowest px-4 py-3">
        <div className="flex items-center gap-2">
          <MaterialIcon name="stars" className="text-xl text-accent" />
          <div>
            <h2 className="font-geist text-sm font-semibold text-on-surface">
              Apuestas Especiales
            </h2>
            <p className="font-geist text-xs text-on-surface-variant">
              Pronósticos del torneo completo. Se cierran 60 min antes del primer partido.
            </p>
          </div>
        </div>
      </div>

      <div className="flex flex-col gap-6 p-4">
        <WorldCupWinnerBet
          teams={teams}
          draft={winnerDraft}
          onDraftChange={onWinnerChange}
          disabled={disabled}
          isSaved={winnerSaved}
          points={winnerPoints}
        />

        <div className="border-t border-outline-variant/40 pt-6">
          <TopScorerBet
            players={players}
            draft={topScorerDraft}
            onDraftChange={onTopScorerChange}
            disabled={disabled}
            isSaved={topScorerSaved}
            playerPoints={topScorerPlayerPoints}
            goalsPoints={topScorerGoalsPoints}
          />
        </div>
      </div>

      <div className="border-t border-outline-variant/40 px-4 py-2">
        {disabled ? (
          <p className="flex items-center gap-1 font-geist text-xs text-on-surface-variant">
            <MaterialIcon name="lock" className="text-sm" />
            Cerrado (60 min antes del primer partido)
          </p>
        ) : winnerSaved && topScorerSaved ? (
          <p className="flex items-center gap-1 font-geist text-xs text-primary">
            <MaterialIcon name="check_circle" className="text-sm" />
            Apuestas especiales guardadas
          </p>
        ) : (
          <p className="font-geist text-xs text-on-surface-variant">
            Se guardan con &quot;Guardar todo&quot;.
          </p>
        )}
      </div>
    </section>
  );
}
