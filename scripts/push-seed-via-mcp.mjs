#!/usr/bin/env node
/**
 * Prints SQL chunks for manual MCP execute_sql (or pipe to supabase db execute).
 * Usage: node scripts/push-seed-via-mcp.mjs | head -1
 */
import { readFileSync, readdirSync } from "fs";
import { join, dirname } from "path";
import { fileURLToPath } from "url";

const dir = "/tmp";
const files = readdirSync(dir)
  .filter((f) => f.startsWith("schunk") && f.endsWith(".sql"))
  .sort((a, b) => a.localeCompare(b, undefined, { numeric: true }));

for (const f of files) {
  const sql = readFileSync(join(dir, f), "utf8")
    .replace(/^--.*\n/gm, "")
    .replace(/^BEGIN;\n?/m, "")
    .trim();
  console.log("---FILE:" + f + "---");
  console.log(sql);
}
