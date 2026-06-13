/**
 * Compare scripts/player-squads.mjs against Wikipedia FIFA 2026 official squads.
 * Usage: node scripts/compare-squads.mjs [wikipedia-squads.txt]
 */
import { PLAYER_SQUADS } from "./player-squads.mjs";
import {
  ensureWikiSquadsCache,
  parseWikiSquads,
  normName,
} from "./load-wikipedia-squads.mjs";

const wikiPath = process.argv[2];

const wikiText = await ensureWikiSquadsCache(wikiPath);
const official = parseWikiSquads(wikiText);

let totalExtra = 0;
let teamsWithIssues = 0;
const dupes = [];

for (const [code, players] of Object.entries(PLAYER_SQUADS)) {
  const off = official[code];
  if (!off?.length) {
    console.log(`\n=== ${code}: NO WIKIPEDIA DATA ===`);
    continue;
  }
  const offSet = new Set(off.map((p) => p.norm));
  const dbNames = players.map(([name]) => name);
  const dbNorms = dbNames.map(normName);
  const dbSet = new Set(dbNorms);

  const missing = dbNorms.filter((n) => !offSet.has(n));
  const nameDupes = dbNames.filter((n, i) => dbNorms.indexOf(normName(n)) !== i);

  if (missing.length || nameDupes.length) {
    teamsWithIssues++;
    console.log(`\n=== ${code} (DB: ${players.length}, FIFA: ${off.length}) ===`);
    if (nameDupes.length) {
      console.log(`  DUPLICATES: ${[...new Set(nameDupes)].join(", ")}`);
      dupes.push({ code, nameDupes });
    }
    if (missing.length) {
      console.log(`  NOT IN FIFA SQUAD (${missing.length}):`);
      missing.forEach((n) => {
        const orig = dbNames[dbNorms.indexOf(n)];
        console.log(`    - ${orig}`);
      });
      totalExtra += missing.length;
    }
  }
}

console.log("\n--- SUMMARY ---");
console.log(`Teams in DB: ${Object.keys(PLAYER_SQUADS).length}`);
console.log(`Teams parsed from Wikipedia: ${Object.keys(official).length}`);
console.log(`Teams with issues: ${teamsWithIssues}`);
console.log(`Players in DB not on FIFA squad: ${totalExtra}`);
console.log(`Teams with duplicates: ${dupes.length}`);
