#!/usr/bin/env node
/**
 * Apply /tmp/player-seed-batch-{1..6}.sql via stdin to psql when DATABASE_URL is set.
 * Fallback: prints batch paths for Supabase MCP execute_sql.
 */
import fs from "fs";

const batches = [];
for (let i = 1; i <= 6; i++) {
  const path = `/tmp/player-seed-batch-${i}.sql`;
  let sql = fs.readFileSync(path, "utf8");
  if (i === 6) sql = sql.replace(/\nCOMMIT;\s*(\n--[^\n]*)?$/s, "\n");
  batches.push({ i, path, bytes: sql.length, sql });
}

const url = process.env.DATABASE_URL || process.env.SUPABASE_DB_URL;
if (url) {
  const { spawnSync } = await import("child_process");
  for (const b of batches) {
    const r = spawnSync("psql", [url, "-v", "ON_ERROR_STOP=1", "-f", b.path], {
      encoding: "utf8",
    });
    if (r.status !== 0) {
      console.error(`Batch ${b.i} failed:`, r.stderr || r.stdout);
      process.exit(1);
    }
    console.log(`Batch ${b.i} ok (${b.bytes} bytes)`);
  }
  process.exit(0);
}

console.log(
  JSON.stringify({
    hint: "Set DATABASE_URL or apply via Supabase MCP execute_sql",
    batches: batches.map((b) => ({ i: b.i, path: b.path, bytes: b.bytes })),
  })
);
