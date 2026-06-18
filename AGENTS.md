# Polla Mundial 2026 — agent context

## Purpose

Next.js App Router + Supabase Auth + Postgres tournament/polla engine ported from the Brasil 2014 polla (parent folder legacy PHP). Users authenticate via Supabase; tournament data and engine logic live in Postgres views and tables.

## Primary product surface (README)

- **Engine:** `v_results` (winner/points), `predictions_open` (lock 30 min before kickoff), scoring via `scoring_rules`
- **2026 format:** 48 teams, groups A–L (12), first knockout `id_round = 2` = Dieciseisavos, qualifiers top 2 + 8 best 3rd, FIFA `third_place_matrix`
- **Seed:** `20260603000005_seed_teams_venues_matches.sql` — 48 group teams, 16 venues, 104 matches; regenerate with `node scripts/generate-seed.mjs`

## Critical paths

| Path | Role |
|------|------|
| `README.md` | Setup, 2014 vs 2026 table, Supabase project ref |
| `supabase/migrations/` | Schema, `v_*` views, catalog seed, team/fixture seed |
| `supabase/apply-all.sql` | Full apply script for SQL Editor |
| `src/app/page.tsx` | Home: `v_group_standings`, `rounds`, `scoring_rules` |
| `src/app/login/`, `register/` | Supabase Auth; profile via `handle_new_user` trigger |
| `src/lib/supabase/` | Browser/server clients, middleware session |
| `scripts/generate-seed.mjs` | Roadtrips 2026 schedule → seed migration |

## Terminology (use in UI — do not invent copy)

| Term | Source |
|------|--------|
| Polla Mundial 2026 | `README.md`, `layout.tsx` metadata |
| Prode del Mundial USA, México y Canadá 2026 | `layout.tsx` description |
| Fase de Grupos, Dieciseisavos de Final, … | `20260603000003_seed_catalog.sql` → `rounds.name_round` |
| Primero A, Segundo A, Mejor Tercero X | `knockout_slots`, `v_group_qualifiers` |
| scoring_rules / rule_key / points | `initial_schema.sql`, seed catalog |
| predictions, pools, profiles | `initial_schema.sql` tables |
| v_group_standings columns | `20260603000002_engine_views.sql` |
| puntos_apuestas (legacy) | Comment → `scoring_rules` |

## Design constraints

- **No placeholder marketing copy.** Pull strings from README, SQL comments, seed `name_round`, view/table/column names, or `layout.tsx` metadata.
- **Visual tokens:** `src/app/globals.css` (`--primary`, `--accent`, `--radius`, etc.) and `src/components/ui/*`.
- **Home hierarchy:** standings view first (tournament state), then `rounds` + `scoring_rules`, then README “What changed from 2014” block.

## Goals vs legacy 2014

| Area | 2014 (legacy) | 2026 (this app) |
|------|---------------|-----------------|
| Knockout entry | Octavos `id_ronda = 2` | Dieciseisavos `id_round = 2` |
| Groups | 8 (A–H) | 12 (A–L) |
| Third places | — | `v_best_third_places`, `third_place_matrix` |

Predictions UI and pool management are schema-ready (`predictions`, `pools`); not all flows are built in App Router yet.

## Commands

```bash
npm run dev
npm run build
node scripts/generate-seed.mjs
```

Supabase project: `rmhvjlizczjdnxoldhuc` (see README Setup).

---

<!-- BEGIN:nextjs-agent-rules -->
# This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` before writing any code. Heed deprecation notices.
<!-- END:nextjs-agent-rules -->
