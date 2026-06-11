"use client";

import { useRouter } from "next/navigation";
import { Label } from "@/components/ui/label";
import { cn } from "@/lib/utils";

const selectClass =
  "ml-auto h-9 w-full max-w-xs rounded-md border border-outline-variant bg-white px-3 font-geist text-sm text-black focus:border-primary focus:outline-none focus:ring-2 focus:ring-primary/20";

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
    <select
      id="results-view"
      value={view}
      onChange={(e) => handleChange(e.target.value)}
      className={cn(selectClass)}
      aria-label="Ver por"
    >
      <option value="grupo">Ver resultados por grupo</option>
      <option value="partido">Ver resultados por partido</option>
    </select>
  );
}
