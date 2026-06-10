"use client";

import { useRouter } from "next/navigation";
import { Label } from "@/components/ui/label";
import { cn } from "@/lib/utils";

const selectClass =
  "h-9 w-full max-w-xs rounded-md border border-outline-variant bg-surface-container-lowest px-3 font-geist text-sm text-on-surface focus:border-primary focus:outline-none focus:ring-2 focus:ring-primary/20";

type ResultsView = "grupo" | "partido";

type ResultsViewSwitcherProps = {
  view: ResultsView;
};

export function ResultsViewSwitcher({ view }: ResultsViewSwitcherProps) {
  const router = useRouter();

  function handleChange(next: string) {
    if (next === "grupo") {
      router.push("/resultados");
      return;
    }
    router.push("/resultados?v=partido");
  }

  return (
    <div className="flex flex-col gap-2">
      <Label htmlFor="results-view" className="font-geist text-xs text-on-surface-variant">
        Ver por
      </Label>
      <select
        id="results-view"
        value={view}
        onChange={(e) => handleChange(e.target.value)}
        className={cn(selectClass)}
        aria-label="Ver por"
      >
        <option value="grupo">Por grupo</option>
        <option value="partido">Por partido</option>
      </select>
    </div>
  );
}
