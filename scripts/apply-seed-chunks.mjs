#!/usr/bin/env node
/**
 * Prints seed SQL chunks for MCP execute_sql (one chunk per line marker).
 * Usage: node scripts/apply-seed-chunks.mjs [chunkIndex]
 * Regenerate migration first: node scripts/generate-seed.mjs
 */
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const migrationPath = path.join(
  __dirname,
  '../supabase/migrations/20260603000005_seed_teams_venues_matches.sql',
);

function splitMigration(sql) {
  const lines = sql.split('\n');
  const venueEnd = lines.findIndex((l) =>
    l.startsWith('INSERT INTO public.teams (country, id_group, code) SELECT'),
  );
  const realEnd = lines.findIndex((l) => l.includes("VALUES ('Segundo A'"));
  const matchStart = lines.findIndex((l) =>
    l.startsWith('INSERT INTO public.matches'),
  );

  const chunks = [];
  // 0a: cleanup + slots + venues (no BEGIN/COMMIT)
  chunks.push(
    lines
      .slice(2, venueEnd)
      .filter((l) => l !== 'BEGIN;')
      .join('\n'),
  );
  // 0b: real teams
  chunks.push(lines.slice(venueEnd, realEnd).join('\n'));
  // 0c: placeholder teams
  chunks.push(lines.slice(realEnd, matchStart).join('\n'));
  // match inserts: ~12 per chunk
  const matchLines = lines.slice(matchStart);
  const matchSql = matchLines.filter((l) => l !== 'COMMIT;').join('\n');
  const inserts = matchSql.split(/(?=INSERT INTO public\.matches)/).filter(Boolean);
  const perChunk = 12;
  for (let i = 0; i < inserts.length; i += perChunk) {
    chunks.push(inserts.slice(i, i + perChunk).join(''));
  }
  return chunks;
}

const sql = fs.readFileSync(migrationPath, 'utf8');
const chunks = splitMigration(sql);
const idx = process.argv[2] !== undefined ? Number(process.argv[2]) : null;

if (idx !== null) {
  if (Number.isNaN(idx) || idx < 0 || idx >= chunks.length) {
    console.error(`Chunk index 0-${chunks.length - 1} required`);
    process.exit(1);
  }
  process.stdout.write(chunks[idx]);
} else {
  chunks.forEach((c, i) => console.log(i, c.length));
}
