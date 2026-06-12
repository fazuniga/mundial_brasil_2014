import Link from "next/link";
import { MaterialIcon } from "@/components/material-icon";

const STADIUM_IMAGE =
  "https://lh3.googleusercontent.com/aida-public/AB6AXuDZ3lZ_e3QvlCnAkT6lMbvC72Y2-wNHyZn7WqkQhFFLxhJXVYxNNa1h-Ivi2s_r6sbTXFE-jttnQQZUqgVa0vd06PPA2wg_Yay8X8MGLnODWh9yXB7wRwTCBmP2CMDzU5j6YGqoVwhv9Fdw8nLVdWQ3VHgbLcp7Z28qnr4SpWqYcmHddMe1tg7zphCm8YPBvMynoeLBb7SG_fLqKuDtrSkPeflwg_acOlWwF8YpxH9Ndic09iW1m2UCo7qvV01wftIvxKf1DtrWTLpG";

type HomeHeroProps = {
  isAuthenticated: boolean;
};

export function HomeHero({ isAuthenticated }: HomeHeroProps) {
  const ctaHref = isAuthenticated ? "/apuestas" : "/register";

  return (
    <section
      className="relative flex min-h-[280px] w-full flex-col justify-end overflow-hidden rounded-xl border border-outline-variant/60 bg-card p-6 shadow-md md:min-h-[300px]"
      aria-labelledby="home-hero-heading"
      style={{
        backgroundImage: `linear-gradient(to top, rgba(16, 25, 22, 0.95) 0%, rgba(16, 25, 22, 0.55) 55%, rgba(16, 25, 22, 0.25) 100%), url('${STADIUM_IMAGE}')`,
        backgroundSize: "cover",
        backgroundPosition: "center",
      }}
    >
      <div className="relative z-10 text-primary-foreground">
        <p className="font-geist mb-2 text-xs font-semibold uppercase tracking-widest text-primary-fixed">
          Inicio del torneo
        </p>
        <h2
          id="home-hero-heading"
          className="font-headline mb-4 text-2xl font-bold text-white md:text-3xl"
        >
          Bienvenido al pronosticador definitivo
        </h2>
        <p className="font-geist mb-6 max-w-md text-sm text-white/90">
          Haz tus pronósticos, sigue la clasificación en tiempo real y compite
          con tus amigos en la arena global. El camino al campeonato empieza aquí.
        </p>
        <Link
          href={ctaHref}
          className="font-geist flex w-max items-center gap-2 rounded-lg bg-primary-fixed px-6 py-3 text-xs font-medium text-on-primary-fixed shadow-md transition-colors duration-150 hover:bg-primary-fixed-dim active:scale-95"
        >
          <MaterialIcon name="play_arrow" className="text-[18px]" />
          Empezar a pronosticar
        </Link>
      </div>
    </section>
  );
}
