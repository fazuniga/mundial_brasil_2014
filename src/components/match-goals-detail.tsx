import {
  formatGoalLabel,
  goalCreditsSide,
  type MatchGoalPublicRow,
} from "@/lib/match-goals-display";

type MatchGoalsDetailProps = {
  goals: MatchGoalPublicRow[];
  homeCode: string;
  awayCode: string;
};

export function MatchGoalsDetail({ goals, homeCode, awayCode }: MatchGoalsDetailProps) {
  if (goals.length === 0) return null;

  const homeGoals = goals.filter(
    (goal) => goalCreditsSide(goal, homeCode, awayCode) === "home",
  );
  const awayGoals = goals.filter(
    (goal) => goalCreditsSide(goal, homeCode, awayCode) === "away",
  );

  return (
    <div className="flex items-start gap-2 border-t border-outline-variant/25 pt-1.5">
      <ul className="min-w-0 flex-1 space-y-0.5 text-right">
        {homeGoals.map((goal) => (
          <li key={goal.id_goal} className="font-geist text-xs text-on-surface-variant">
            {formatGoalLabel(goal)}
          </li>
        ))}
      </ul>
      <div className="w-14 shrink-0 sm:w-16" aria-hidden />
      <ul className="min-w-0 flex-1 space-y-0.5 text-left">
        {awayGoals.map((goal) => (
          <li key={goal.id_goal} className="font-geist text-xs text-on-surface-variant">
            {formatGoalLabel(goal)}
          </li>
        ))}
      </ul>
    </div>
  );
}
