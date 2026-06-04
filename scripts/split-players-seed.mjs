/**
 * Split player seed into batches for remote apply via MCP execute_sql.
 * Usage: node scripts/split-players-seed.mjs
 */
import { readFileSync, writeFileSync, mkdirSync } from "fs";
import { join, dirname } from "path";
import { fileURLToPath } from "url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const sql = readFileSync(
  join(__dirname, "../supabase/migrations/20260603000010_seed_players.sql"),
  "utf8",
);

const insertBlocks = sql.split(/(?=INSERT INTO public\.players)/).slice(1);
const header = sql
  .split("INSERT INTO public.players")[0]
  .trim()
  .replace(/\nBEGIN;\n/, "\n");
const footer = "";

const batchSize = 8;
const outDir = join(__dirname, "../supabase/.player-seed-batches");
mkdirSync(outDir, { recursive: true });

const batches = [];
for (let i = 0; i < insertBlocks.length; i += batchSize) {
  batches.push(insertBlocks.slice(i, i + batchSize).join("\n"));
}

batches.forEach((body, i) => {
  let content = body.trim();
  if (i === 0) content = `${header}\n\n${content}`;
  if (i === batches.length - 1) content = `${content}\n\n${footer}`;
  const path = join(outDir, `batch-${i + 1}.sql`);
  writeFileSync(path, content, "utf8");
  console.log(`Wrote ${path} (${content.length} bytes)`);
});

console.log(`Total batches: ${batches.length}`);
