# Polla Mundial 2026

Next.js App Router + Supabase Auth + Postgres engine ported from the Brasil 2014 polla.

## What changed from 2014

| Area | 2014 | 2026 |
|------|------|------|
| Teams | 32 | 48 |
| Groups | A–H (8) | A–L (12) |
| First knockout | Octavos (`id_ronda = 2`) | Dieciseisavos (`id_round = 2`) |
| Qualifiers | Top 2 per group | Top 2 + 8 best 3rd |
| Bracket | Fixed 1A vs 2B | FIFA third-place matrix |

Core logic preserved: `v_results` (winner/points), `predictions_open` lock 30 min before kickoff, scoring via `scoring_rules`.

## Setup (project `rmhvjlizczjdnxoldhuc`)

1. **API keys** — [Project Settings → API](https://supabase.com/dashboard/project/rmhvjlizczjdnxoldhuc/settings/api): copy the **Publishable** key into `.env.local`:

```bash
NEXT_PUBLIC_SUPABASE_URL=https://rmhvjlizczjdnxoldhuc.supabase.co
NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY=<paste here>
```

2. **Schema** — [SQL Editor](https://supabase.com/dashboard/project/rmhvjlizczjdnxoldhuc/sql/new): run the full script `supabase/apply-all.sql` (or `supabase db push` after `supabase link --project-ref rmhvjlizczjdnxoldhuc`).

3. **Auth URLs** — [Authentication → URL Configuration](https://supabase.com/dashboard/project/rmhvjlizczjdnxoldhuc/auth/url-configuration):
   - Site URL: `http://localhost:3000`
   - Redirect URLs: `http://localhost:3000/auth/callback`

4. Enable **Email** provider under Authentication → Providers.

5. Dev server:

```bash
npm run dev
```

## Seed data (teams, venues, matches)

Migration `20260603000005_seed_teams_venues_matches.sql` loads 48 group teams, 16 venues, 104 matches, and placeholder knockout teams.

Regenerate from the Roadtrips 2026 schedule source:

```bash
node scripts/generate-seed.mjs
```

For MCP or SQL Editor size limits, split the migration into chunks:

```bash
node scripts/apply-seed-chunks.mjs        # list chunks
node scripts/apply-seed-chunks.mjs 3      # print chunk 3 SQL to stdout
```

Or run the full script in the [SQL Editor](https://supabase.com/dashboard/project/rmhvjlizczjdnxoldhuc/sql/new): `supabase/apply-all.sql`.

## Project layout

- `supabase/migrations/` — schema, engine views, seed
- `src/lib/supabase/` — browser/server clients + middleware session
- `src/app/` — pages (home, login, register)

Legacy PHP app remains in the parent folder for reference.
