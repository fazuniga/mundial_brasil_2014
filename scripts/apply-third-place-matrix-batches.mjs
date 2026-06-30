#!/usr/bin/env node
/** Prints batch SQL files as JSON for remote apply. */
import { readFileSync, readdirSync } from "fs";
import { join, dirname } from "path";
import { fileURLToPath } from "url";

const dir = join(dirname(fileURLToPath(import.meta.url)), ".matrix-batches");
const files = readdirSync(dir)
  .filter((f) => f.startsWith("batch-") && f.endsWith(".sql"))
  .sort((a, b) => Number(a.match(/\d+/)[0]) - Number(b.match(/\d+/)[0]));

const batches = files.map((f) => readFileSync(join(dir, f), "utf8"));
console.log(JSON.stringify(batches));
