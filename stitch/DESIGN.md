# Polla Mundial 2026 — Design System Reference

Design tokens, components, and layout conventions extracted from `src/`. Use this document when building new UI so new screens match existing patterns.

**Sources of truth:** `src/app/globals.css`, `src/components/ui/*`, `src/components/*`, `src/app/layout.tsx`, `AGENTS.md`.

---

## Stack

| Layer | Implementation | Path |
|-------|----------------|------|
| CSS framework | Tailwind CSS v4 (`@import "tailwindcss"`) | `src/app/globals.css` |
| PostCSS | `@tailwindcss/postcss` | `postcss.config.mjs` |
| Theme config | CSS custom properties + `@theme inline` (no `tailwind.config.*`) | `src/app/globals.css` |
| Fonts | Geist Sans + Geist Mono via `next/font/google` | `src/app/layout.tsx` |
| Class merging | `cn()` utility | `src/lib/utils.ts` |
| Component library | Hand-written shadcn-style primitives (no `components.json`) | `src/components/ui/*` |

---

## Typography

### Font families

Defined in `src/app/layout.tsx` and wired through `@theme inline`:

| Token | CSS variable | Usage |
|-------|--------------|-------|
| Sans (default) | `--font-geist-sans` → `--font-sans` | Body, UI, headings |
| Mono | `--font-geist-mono` → `--font-mono` | `code`, `team_code`, `rule_key`, numeric IDs |

Root layout applies fonts:

```tsx
// src/app/layout.tsx
<html className={`${geistSans.variable} ${geistMono.variable} h-full antialiased`}>
<body className="min-h-full bg-background font-sans text-foreground">
```

Body fallback: `system-ui, sans-serif` (`src/app/globals.css`).

### Type scale (in use)

| Element | Classes | Source |
|---------|---------|--------|
| Page title (h1) | `text-3xl font-bold tracking-tight` | `src/app/page.tsx` |
| Site title | `text-lg font-bold tracking-tight` | `src/components/site-header.tsx` |
| Card title | `text-lg font-semibold leading-none tracking-tight` | `src/components/ui/card.tsx` |
| Card description | `text-sm text-muted-foreground` | `src/components/ui/card.tsx` |
| Body / table | `text-sm` | Tables, lists, forms |
| Small / nav | `text-xs` | Header nav links, metadata |
| Auth kicker | `text-xs font-semibold uppercase tracking-widest text-accent` | `src/components/auth-layout.tsx` |
| Inline code | `font-mono text-xs` inside `rounded-md bg-secondary px-1.5 py-0.5` | `src/app/page.tsx` |

### Numeric data

Use `tabular-nums` for aligned numbers in tables and scoring lists (`src/components/standings-table.tsx`, `src/app/page.tsx`).

---

## Color palette

Semantic tokens follow a shadcn-style naming scheme. Values are defined in `:root` and overridden in `@media (prefers-color-scheme: dark)`.

### Light mode (`:root`)

| Token | CSS variable | Hex | Role |
|-------|--------------|-----|------|
| Background | `--background` | `#f4f7f6` | Page background |
| Foreground | `--foreground` | `#0f172a` | Primary text |
| Card | `--card` | `#ffffff` | Card / input surfaces |
| Card foreground | `--card-foreground` | `#0f172a` | Text on cards |
| Primary | `--primary` | `#047857` | Brand green (CTAs, accents) |
| Primary hover | `--primary-hover` | `#065f46` | Button hover |
| Primary foreground | `--primary-foreground` | `#ffffff` | Text on primary |
| Secondary | `--secondary` | `#e2e8f0` | Code pills, subtle fills |
| Secondary foreground | `--secondary-foreground` | `#1e293b` | Text on secondary |
| Muted | `--muted` | `#f1f5f9` | List rows, alert default bg |
| Muted foreground | `--muted-foreground` | `#64748b` | Descriptions, metadata |
| Accent | `--accent` | `#b45309` | Auth kicker, gradient accent |
| Accent foreground | `--accent-foreground` | `#ffffff` | Text on accent |
| Border | `--border` | `#cbd5e1` | Borders, dividers |
| Input | `--input` | `#cbd5e1` | Input borders |
| Ring | `--ring` | `#047857` | Focus ring |
| Destructive | `--destructive` | `#dc2626` | Errors |
| Destructive foreground | `--destructive-foreground` | `#ffffff` | Text on destructive |

### Dark mode (`prefers-color-scheme: dark`)

| Token | Hex |
|-------|-----|
| `--background` | `#0a100e` |
| `--foreground` | `#f1f5f9` |
| `--card` | `#111916` |
| `--card-foreground` | `#f1f5f9` |
| `--primary` | `#10b981` |
| `--primary-hover` | `#059669` |
| `--primary-foreground` | `#022c22` |
| `--secondary` | `#1e293b` |
| `--secondary-foreground` | `#f1f5f9` |
| `--muted` | `#1a2420` |
| `--muted-foreground` | `#94a3b8` |
| `--accent` | `#f59e0b` |
| `--accent-foreground` | `#1c1917` |
| `--border` | `#334155` |
| `--input` | `#334155` |
| `--ring` | `#10b981` |
| `--destructive` | `#ef4444` |
| `--destructive-foreground` | `#ffffff` |

### Tailwind color utilities

Mapped via `@theme inline` in `src/app/globals.css`:

```
bg-background, text-foreground, bg-card, text-card-foreground,
bg-primary, text-primary-foreground, hover:bg-primary-hover,
bg-secondary, text-secondary-foreground,
bg-muted, text-muted-foreground,
bg-accent, text-accent-foreground,
border-border, border-input, ring-ring,
text-destructive, bg-destructive/10, border-destructive/30
```

### Opacity modifiers in use

| Pattern | Usage |
|---------|-------|
| `border-primary/20` | Featured card border (`src/app/page.tsx`) |
| `border-primary/15` | Auth card border (`src/components/auth-layout.tsx`) |
| `bg-card/80` | Sticky header backdrop (`src/components/site-header.tsx`) |
| `bg-muted/50` | Table header row (`src/components/standings-table.tsx`) |
| `bg-destructive/10`, `border-destructive/30` | Destructive alert (`src/components/ui/alert.tsx`) |

### Background gradient

Fixed pseudo-element on `body::before` (`src/app/globals.css`):

- Primary radial: `ellipse 80% 50% at 50% -20%`, 12% primary mixed with transparent
- Accent radial: `ellipse 60% 40% at 100% 0%`, 6% accent mixed with transparent
- `z-index: -1`, `pointer-events: none`

---

## Radius

| Token | Value | Tailwind utility |
|-------|-------|------------------|
| `--radius` | `0.75rem` (12px) | Base |
| `--radius-lg` | `var(--radius)` | — |
| `--radius-md` | `calc(var(--radius) - 2px)` | — |
| `--radius-sm` | `calc(var(--radius) - 4px)` | — |

Applied in components:

| Utility | Used on |
|---------|---------|
| `rounded-xl` | `Card` |
| `rounded-lg` | `Button`, `Input`, `Alert`, tables, list rows, nav links |
| `rounded-md` | Inline `<code>` |

---

## Shadows

| Utility | Used on |
|---------|---------|
| `shadow-sm` | `Card`, primary `Button`, nav CTA links |

No other shadow tokens are defined. Prefer `shadow-sm` for elevated surfaces.

---

## Spacing & layout

### PageShell widths (`src/components/page-shell.tsx`)

| Prop | Max width | Default padding |
|------|-----------|-----------------|
| (default) | `max-w-4xl` | `px-6 py-8` |
| `narrow` | `max-w-md` | Auth forms |
| `wide` | `max-w-6xl` | Home page content |

Always `mx-auto w-full`.

### Header (`src/components/site-header.tsx`)

| Property | Value |
|----------|-------|
| Height | `h-16` (matches `--header-height: 4rem`) |
| Position | `sticky top-0 z-50` |
| Inner max width | `max-w-4xl` |
| Horizontal padding | `px-6` |

Auth main area: `min-h-[calc(100vh-4rem)]` to account for header (`src/components/auth-layout.tsx`).

### Vertical rhythm

| Context | Spacing |
|---------|---------|
| Home page sections | `flex flex-col gap-8 py-10` on `PageShell` |
| Two-column grid | `grid gap-6 lg:grid-cols-2` |
| Card header | `p-6 pb-4`, inner `gap-1.5` |
| Card content | `p-6 pt-0` |
| Form | `flex flex-col gap-4` |
| Form field group | `flex flex-col gap-2` |
| Nav / CTA row | `gap-2` or `gap-3` |
| List items | `grid gap-2` |

### Table cell padding

| Table | Header | Body |
|-------|--------|------|
| Standings (`standings-table.tsx`) | `px-3 py-3` | `px-3 py-2.5` |
| Format note (`format-2026-note.tsx`) | `px-4 py-3` | `px-4 py-2.5` |

---

## Focus & accessibility

Global focus style (`src/app/globals.css`):

```css
:focus-visible {
  outline: 2px solid var(--ring);
  outline-offset: 2px;
}
```

Input components use ring-based focus instead of outline:

```
focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring
focus-visible:ring-offset-2 focus-visible:ring-offset-background
```

(`src/components/ui/input.tsx`)

- `Alert` uses `role="alert"` (`src/components/ui/alert.tsx`)
- Root `<html lang="es">` (`src/app/layout.tsx`)
- Disabled states: `disabled:opacity-50`, `disabled:pointer-events-none` on buttons

---

## Component library

### Primitives (`src/components/ui/`)

#### Button (`button.tsx`)

| Variant | Classes |
|---------|---------|
| `default` | `bg-primary text-primary-foreground hover:bg-primary-hover shadow-sm` |
| `outline` | `border border-border bg-card text-foreground hover:bg-muted` |
| `ghost` | `text-foreground hover:bg-muted` |
| `link` | `text-primary underline-offset-4 hover:underline p-0 h-auto` |

| Size | Height / padding / text |
|------|-------------------------|
| `default` | `h-10 px-4 py-2 text-sm` |
| `sm` | `h-8 px-3 text-xs` |
| `lg` | `h-11 px-6 text-base` |

Base: `inline-flex items-center justify-center gap-2 rounded-lg font-medium transition-colors`.

#### Card (`card.tsx`)

Compound component: `Card`, `CardHeader`, `CardTitle`, `CardDescription`, `CardContent`.

```
Card:        rounded-xl border border-border bg-card text-card-foreground shadow-sm
CardHeader:  flex flex-col gap-1.5 p-6 pb-4
CardTitle:   text-lg font-semibold leading-none tracking-tight  (renders <h2>)
CardDescription: text-sm text-muted-foreground
CardContent: p-6 pt-0
```

#### Input (`input.tsx`)

```
h-10 w-full rounded-lg border border-input bg-card px-3 py-2 text-sm
placeholder:text-muted-foreground
```

#### Label (`label.tsx`)

```
text-sm font-medium leading-none text-foreground
peer-disabled:cursor-not-allowed peer-disabled:opacity-70
```

#### Alert (`alert.tsx`)

| Variant | Classes |
|---------|---------|
| `default` | `border-border bg-muted text-foreground` |
| `destructive` | `border-destructive/30 bg-destructive/10 text-destructive` |

Base: `rounded-lg border px-4 py-3 text-sm`.

### Layout components (`src/components/`)

#### SiteHeader (`site-header.tsx`)

- Sticky header with product title from `layout.tsx` metadata
- Title: **Polla Mundial 2026**
- Subtitle: **Prode del Mundial USA, México y Canadá 2026**
- Auth nav: **Ingresar**, **Registro**, **Salir** (outline `Button` sm)
- Nav link base class: `inline-flex h-8 items-center justify-center rounded-lg px-3 text-xs font-medium transition-colors`

#### PageShell (`page-shell.tsx`)

Centered content container. Pass `narrow`, `wide`, or neither for max-width.

#### AuthLayout (`auth-layout.tsx`)

Pattern for login/register:

```
SiteHeader → main (centered) → PageShell narrow → Card
```

- Card kicker: `Polla Mundial 2026` in accent uppercase
- Card border: `border-primary/15`

### Domain components

| Component | Path | Role |
|-----------|------|------|
| `StandingsTable` | `src/components/standings-table.tsx` | `v_group_standings` data table |
| `Format2026Note` | `src/components/format-2026-note.tsx` | README "What changed from 2014" block |

---

## UI patterns

### Page structure

**Standard page:**

```tsx
<>
  <SiteHeader userEmail={user?.email} />
  <main>
    <PageShell>{/* content */}</PageShell>
  </main>
</>
```

**Auth page:**

```tsx
<AuthLayout title="…" description="…">
  <form className="flex flex-col gap-4">…</form>
</AuthLayout>
```

### Home page hierarchy (`AGENTS.md`, `src/app/page.tsx`)

1. Hero section — `border-l-4 border-primary pl-5`, title + description
2. `v_group_standings` — primary card (`border-primary/20`)
3. `rounds` + `scoring_rules` — two-column grid
4. `Format2026Note` — README comparison table

### Card + list row

Repeated pattern for catalog data:

```tsx
<li className="flex items-baseline justify-between gap-3 rounded-lg bg-muted px-3 py-2.5 text-sm">
  <span className="font-medium">{name}</span>
  <span className="font-mono text-xs text-muted-foreground">{id}</span>
</li>
```

### Data table

Wrapper + table pattern (see `StandingsTable`, `Format2026Note`):

```tsx
<div className="overflow-x-auto rounded-lg border border-border">
  <table className="w-full text-left text-sm">
    <thead>
      <tr className="border-b border-border bg-muted/50">…</tr>
    </thead>
    <tbody>
      <tr className="border-b border-border last:border-0">…</tr>
    </tbody>
  </table>
</div>
```

### Inline code / migration references

```tsx
<code className="rounded-md bg-secondary px-1.5 py-0.5 font-mono text-xs">
  supabase/apply-all.sql
</code>
```

### Link-as-button (when not using `Button`)

Primary CTA:

```
inline-flex h-8 items-center justify-center rounded-lg bg-primary px-3 text-xs font-medium
text-primary-foreground shadow-sm transition-colors hover:bg-primary-hover
```

Secondary:

```
inline-flex h-8 items-center justify-center rounded-lg border border-border bg-card px-3
text-xs font-medium text-foreground transition-colors hover:bg-muted
```

Used in `src/app/page.tsx` and mirrored in `src/components/site-header.tsx`.

### Text links

```
font-medium text-primary hover:underline
```

Used below auth forms for cross-navigation.

### Form layout

```tsx
<form className="flex flex-col gap-4">
  <div className="flex flex-col gap-2">
    <Label htmlFor="…">…</Label>
    <Input id="…" … />
  </div>
  {error && <Alert variant="destructive">{error}</Alert>}
  <Button type="submit" className="w-full">…</Button>
</form>
```

Register page uses `grid gap-4 sm:grid-cols-2` for `first_name` / `last_name`.

---

## Terminology (do not invent copy)

Pull UI strings from these sources (`AGENTS.md`):

| Term | Source |
|------|--------|
| Polla Mundial 2026 | `README.md`, `src/app/layout.tsx` metadata |
| Prode del Mundial USA, México y Canadá 2026 | `src/app/layout.tsx` description |
| Fase de Grupos, Dieciseisavos de Final, … | `20260603000003_seed_catalog.sql` → `rounds.name_round` |
| Primero A, Segundo A, Mejor Tercero X | `knockout_slots`, `v_group_qualifiers` |
| scoring_rules / rule_key / points | Schema + seed catalog |
| v_group_standings columns | `20260603000002_engine_views.sql` |
| first_name, last_name | `profiles` table, register form labels |

Auth UI strings already in codebase: **Ingresar**, **Registro**, **Salir**, **Crear cuenta**, **Entrar**, **Contraseña**, **Email**.

---

## How to build new UI

### 1. Start from layout primitives

- Use `SiteHeader` on every page.
- Wrap content in `PageShell` — pick `narrow` (forms), `wide` (dashboards), or default.
- Group content in `Card` with `CardHeader` / `CardContent`.

### 2. Use semantic tokens, not raw hex

Prefer Tailwind utilities mapped to CSS variables:

```tsx
className="bg-card text-foreground border-border text-muted-foreground"
```

Add one-off overrides via `className` prop + `cn()` from `@/lib/utils`.

### 3. Import from `@/components/ui/*`

```tsx
import { Button } from "@/components/ui/button";
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Alert } from "@/components/ui/alert";
```

### 4. Match existing spacing

- Section stacks: `gap-8`
- Card grids: `gap-6 lg:grid-cols-2`
- Forms: `gap-4` / field `gap-2`
- Page padding: inherit from `PageShell` (`px-6`)

### 5. Tables and data

- Wrap in `overflow-x-auto rounded-lg border border-border`
- Header row: `bg-muted/50`
- Numeric columns: `text-right tabular-nums`
- IDs / codes: `font-mono text-xs text-muted-foreground`

### 6. Emphasize primary content

- Hero / page intro: left border accent `border-l-4 border-primary pl-5`
- Primary data card: `border-primary/20`
- Auth surfaces: `border-primary/15`, accent kicker label

### 7. Adding new tokens

Extend `:root` and `@theme inline` in `src/app/globals.css`. Mirror dark mode values under `@media (prefers-color-scheme: dark)`. Do not add a separate Tailwind config file unless the project adopts one.

### 8. Adding new UI primitives

Follow existing `src/components/ui/*` conventions:

- `forwardRef` + `cn()` for class merging
- Variant/size maps as plain objects (see `button.tsx`)
- Export named components with `displayName`
- Use semantic color tokens and `rounded-lg` / `rounded-xl` consistently

---

## File reference

| Path | Purpose |
|------|---------|
| `src/app/globals.css` | CSS variables, `@theme inline`, body styles, focus, gradient |
| `src/app/layout.tsx` | Fonts, metadata, root HTML/body classes |
| `src/lib/utils.ts` | `cn()` class helper |
| `src/components/ui/button.tsx` | Button variants and sizes |
| `src/components/ui/card.tsx` | Card compound component |
| `src/components/ui/input.tsx` | Text input |
| `src/components/ui/label.tsx` | Form label |
| `src/components/ui/alert.tsx` | Alert / error messages |
| `src/components/site-header.tsx` | Global sticky header |
| `src/components/page-shell.tsx` | Content width container |
| `src/components/auth-layout.tsx` | Auth page shell |
| `src/components/standings-table.tsx` | Standings data table |
| `src/components/format-2026-note.tsx` | 2014 vs 2026 comparison |
| `src/app/page.tsx` | Home — reference for page hierarchy and patterns |
| `src/app/login/page.tsx` | Login form pattern |
| `src/app/register/page.tsx` | Register form pattern |
| `postcss.config.mjs` | Tailwind v4 PostCSS plugin |
| `AGENTS.md` | Product terminology and home hierarchy rules |
