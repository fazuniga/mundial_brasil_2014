#!/usr/bin/env node
/**
 * Prints batch SQL paths and sizes for remote apply via Supabase MCP execute_sql.
 * Run: node scripts/apply-player-seed-batches.mjs
 */
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const root = path.join(path.dirname(fileURLToPath(import.meta.url)), "..");
const dir = path.join(root, "supabase/.player-seed-batches");

for (let i = 1; i <= 6; i++) {
  const sqlPath = path.join(dir, `apply-${i}.sql`);
  let sql = fs.readFileSync(sqlPath, "utf8");
  if (i === 6) sql = sql.replace(/\nCOMMIT;\s*(\n--[^\n]*)?$/s, "\n");
  const out = path.join("/tmp", `player-seed-batch-${i}.sql`);
  fs.writeFileSync(out, sql);
  const teams = (sql.match(/WHERE t\.code = '/g) || []).length;
  console.log(JSON.stringify({ batch: i, path: out, bytes: sql.length, teams }));
}
