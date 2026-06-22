import { redirect } from "next/navigation";

type ResultadosRedirectProps = {
  searchParams: Promise<{ v?: string }>;
};

export default async function ResultadosRedirectPage({
  searchParams,
}: ResultadosRedirectProps) {
  const { v } = await searchParams;
  const query = v === "grupo" ? "?v=grupo" : "";
  redirect(`/partidos${query}`);
}
