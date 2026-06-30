/**
 * Generates supabase/migrations/20260625000001_seed_third_place_matrix.sql
 *
 * Maps FIFA Annex C (495 combinations) to third_place_matrix rows keyed by
 * qualifying_groups, with slot_mappings using knockout_slots labels from
 * scripts/generate-seed.mjs.
 *
 * Regenerate: node scripts/generate-third-place-matrix.mjs
 */
import { writeFileSync } from "fs";
import { join, dirname } from "path";
import { fileURLToPath } from "url";
import { ANNEX_C_WINNERS, ANNEX_C_ROWS } from "./annex-c-data.mjs";

const __dirname = dirname(fileURLToPath(import.meta.url));

/** Group winners in Annex C column order → composite R32 slot label. */
const WINNER_TO_SLOT_LABEL = {
  A: "3rd CEFHI",
  B: "3rd EFGIJ",
  D: "3rd BEFIJ",
  E: "3rd ABCDEF",
  G: "3rd AEHIJ",
  I: "3rd CDFGH",
  K: "3rd DEIJL",
  L: "3rd EHIJK",
};

const ALL_GROUPS = "ABCDEFGHIJKL".split("");

function combinations(groups, k) {
  const result = [];
  function pick(start, chosen) {
    if (chosen.length === k) {
      result.push(chosen.join(""));
      return;
    }
    for (let i = start; i <= groups.length - (k - chosen.length); i++) {
      pick(i + 1, [...chosen, groups[i]]);
    }
  }
  pick(0, []);
  return result;
}

function rowToEntry(row) {
  if (row.length !== ANNEX_C_WINNERS.length) {
    throw new Error(`Expected ${ANNEX_C_WINNERS.length} chars, got ${row.length}: ${row}`);
  }

  const assignments = {};
  const thirdGroups = new Set();

  for (let i = 0; i < ANNEX_C_WINNERS.length; i++) {
    const winner = ANNEX_C_WINNERS[i];
    const thirdGroup = row[i];
    const slotLabel = WINNER_TO_SLOT_LABEL[winner];
    if (!slotLabel) {
      throw new Error(`No slot label for winner group ${winner}`);
    }
    if (assignments[slotLabel]) {
      throw new Error(`Duplicate slot ${slotLabel} in row ${row}`);
    }
    assignments[slotLabel] = thirdGroup;
    thirdGroups.add(thirdGroup);
  }

  if (thirdGroups.size !== 8) {
    throw new Error(`Row must have 8 distinct third groups: ${row}`);
  }

  const qualifyingGroups = [...thirdGroups].sort().join("");

  return { qualifyingGroups, slotMappings: assignments };
}

function validate() {
  if (ANNEX_C_ROWS.length !== 495) {
    throw new Error(`Expected 495 Annex C rows, got ${ANNEX_C_ROWS.length}`);
  }

  const expected = new Set(combinations(ALL_GROUPS, 8));
  const seen = new Set();

  for (const row of ANNEX_C_ROWS) {
    const { qualifyingGroups } = rowToEntry(row);
    if (seen.has(qualifyingGroups)) {
      throw new Error(`Duplicate qualifying_groups: ${qualifyingGroups}`);
    }
    seen.add(qualifyingGroups);
    expected.delete(qualifyingGroups);
  }

  if (seen.size !== 495) {
    throw new Error(`Expected 495 unique combinations, got ${seen.size}`);
  }
  if (expected.size !== 0) {
    throw new Error(`Missing combinations: ${[...expected].slice(0, 5).join(", ")}…`);
  }

  // Spot-check FIFA Annex C option 1 (groups E–L qualify).
  const row1 = rowToEntry(ANNEX_C_ROWS[0]);
  if (row1.qualifyingGroups !== "EFGHIJKL") {
    throw new Error(`Row 1 qualifying groups expected EFGHIJKL, got ${row1.qualifyingGroups}`);
  }
  const expectedRow1 = {
    "3rd CEFHI": "E",
    "3rd EFGIJ": "J",
    "3rd BEFIJ": "I",
    "3rd ABCDEF": "F",
    "3rd AEHIJ": "H",
    "3rd CDFGH": "G",
    "3rd DEIJL": "L",
    "3rd EHIJK": "K",
  };
  for (const [slot, group] of Object.entries(expectedRow1)) {
    if (row1.slotMappings[slot] !== group) {
      throw new Error(`Row 1 mismatch for ${slot}: expected ${group}, got ${row1.slotMappings[slot]}`);
    }
  }

  console.log("Validation OK: 495 rows, full C(12,8) coverage, row 1 spot-check passed.");
}

function escJson(obj) {
  return JSON.stringify(obj).replace(/'/g, "''");
}

function generateSql() {
  const lines = [
    "-- FIFA World Cup 2026 Annex C: 495 third-place combination mappings",
    "-- Source: FWC2026 Regulations Annex C (see scripts/annex-c-data.mjs)",
    "-- Regenerate: node scripts/generate-third-place-matrix.mjs",
    "",
    "BEGIN;",
    "",
    "DELETE FROM public.third_place_matrix WHERE scenario_key = 'pending';",
    "",
  ];

  for (const row of ANNEX_C_ROWS) {
    const { qualifyingGroups, slotMappings } = rowToEntry(row);
    lines.push(
      `INSERT INTO public.third_place_matrix (scenario_key, qualifying_groups, slot_mappings)`,
      `VALUES ('${qualifyingGroups}', '${qualifyingGroups}', '${escJson(slotMappings)}'::jsonb)`,
      `ON CONFLICT (scenario_key) DO UPDATE SET`,
      `  qualifying_groups = EXCLUDED.qualifying_groups,`,
      `  slot_mappings = EXCLUDED.slot_mappings;`,
      "",
    );
  }

  lines.push("COMMIT;");
  return lines.join("\n");
}

validate();
const sql = generateSql();
const outPath = join(__dirname, "../supabase/migrations/20260625000001_seed_third_place_matrix.sql");
writeFileSync(outPath, sql);
console.log("Wrote", outPath, `(${sql.length} bytes, ${ANNEX_C_ROWS.length} rows)`);
