/**
 * Generates supabase/migrations/20260603000005_seed_teams_venues_matches.sql
 */
import { writeFileSync } from "fs";
import { join, dirname } from "path";
import { fileURLToPath } from "url";

const __dirname = dirname(fileURLToPath(import.meta.url));

const GROUPS = {
  A: ["Mexico", "South Africa", "South Korea", "Czech Republic"],
  B: ["Canada", "Bosnia and Herzegovina", "Qatar", "Switzerland"],
  C: ["Brazil", "Morocco", "Haiti", "Scotland"],
  D: ["United States", "Paraguay", "Australia", "Turkey"],
  E: ["Germany", "Curaçao", "Ivory Coast", "Ecuador"],
  F: ["Netherlands", "Japan", "Sweden", "Tunisia"],
  G: ["Belgium", "Egypt", "Iran", "New Zealand"],
  H: ["Spain", "Cape Verde", "Saudi Arabia", "Uruguay"],
  I: ["France", "Senegal", "Iraq", "Norway"],
  J: ["Argentina", "Algeria", "Austria", "Jordan"],
  K: ["Portugal", "DR Congo", "Uzbekistan", "Colombia"],
  L: ["England", "Croatia", "Ghana", "Panama"],
};

const CODES = Object.fromEntries(
  Object.values(GROUPS)
    .flat()
    .map((c) => {
      const map = {
        Mexico: "MEX",
        "South Africa": "RSA",
        "South Korea": "KOR",
        "Czech Republic": "CZE",
        Canada: "CAN",
        "Bosnia and Herzegovina": "BIH",
        Qatar: "QAT",
        Switzerland: "SUI",
        Brazil: "BRA",
        Morocco: "MAR",
        Haiti: "HAI",
        Scotland: "SCO",
        "United States": "USA",
        Paraguay: "PAR",
        Australia: "AUS",
        Turkey: "TUR",
        Germany: "GER",
        Curaçao: "CUW",
        "Ivory Coast": "CIV",
        Ecuador: "ECU",
        Netherlands: "NED",
        Japan: "JPN",
        Sweden: "SWE",
        Tunisia: "TUN",
        Belgium: "BEL",
        Egypt: "EGY",
        Iran: "IRN",
        "New Zealand": "NZL",
        Spain: "ESP",
        "Cape Verde": "CPV",
        "Saudi Arabia": "KSA",
        Uruguay: "URY",
        France: "FRA",
        Senegal: "SEN",
        Iraq: "IRQ",
        Norway: "NOR",
        Argentina: "ARG",
        Algeria: "ALG",
        Austria: "AUT",
        Jordan: "JOR",
        Portugal: "POR",
        "DR Congo": "COD",
        Uzbekistan: "UZB",
        Colombia: "COL",
        England: "ENG",
        Croatia: "CRO",
        Ghana: "GHA",
        Panama: "PAN",
      };
      return [c, map[c]];
    })
);

const VENUES = [
  ["Mexico City", "Estadio Azteca"],
  ["Guadalajara", "Estadio Akron"],
  ["Monterrey", "Estadio BBVA"],
  ["Toronto", "BMO Field"],
  ["Vancouver", "BC Place"],
  ["Los Angeles", "SoFi Stadium"],
  ["San Francisco Bay Area", "Levi's Stadium"],
  ["Seattle", "Lumen Field"],
  ["Boston", "Gillette Stadium"],
  ["New York/New Jersey", "MetLife Stadium"],
  ["Philadelphia", "Lincoln Financial Field"],
  ["Houston", "NRG Stadium"],
  ["Dallas", "AT&T Stadium"],
  ["Kansas City", "Arrowhead Stadium"],
  ["Miami", "Hard Rock Stadium"],
  ["Atlanta", "Mercedes-Benz Stadium"],
];

const GROUP_MATCHES = `1|2026-06-11|13:00|Mexico|South Africa|A|1
2|2026-06-11|20:00|South Korea|Czech Republic|A|2
3|2026-06-12|15:00|Canada|Bosnia and Herzegovina|B|4
4|2026-06-12|18:00|United States|Paraguay|D|6
5|2026-06-13|21:00|Haiti|Scotland|C|9
6|2026-06-13|21:00|Australia|Turkey|D|5
7|2026-06-13|18:00|Brazil|Morocco|C|10
8|2026-06-13|12:00|Qatar|Switzerland|B|7
9|2026-06-14|19:00|Ivory Coast|Ecuador|E|11
10|2026-06-14|12:00|Germany|Curaçao|E|12
11|2026-06-14|15:00|Netherlands|Japan|F|13
12|2026-06-14|20:00|Sweden|Tunisia|F|3
13|2026-06-15|18:00|Saudi Arabia|Uruguay|H|15
14|2026-06-15|12:00|Spain|Cape Verde|H|16
15|2026-06-15|18:00|Iran|New Zealand|G|6
16|2026-06-15|12:00|Belgium|Egypt|G|8
17|2026-06-16|15:00|France|Senegal|I|10
18|2026-06-16|18:00|Iraq|Norway|I|9
19|2026-06-16|20:00|Argentina|Algeria|J|14
20|2026-06-16|21:00|Austria|Jordan|J|7
21|2026-06-17|19:00|Ghana|Panama|L|4
22|2026-06-17|15:00|England|Croatia|L|13
23|2026-06-17|12:00|Portugal|DR Congo|K|12
24|2026-06-17|20:00|Uzbekistan|Colombia|K|1
25|2026-06-18|12:00|Czech Republic|South Africa|A|16
26|2026-06-18|12:00|Switzerland|Bosnia and Herzegovina|B|6
27|2026-06-18|15:00|Canada|Qatar|B|5
28|2026-06-18|19:00|Mexico|South Korea|A|2
29|2026-06-19|21:00|Brazil|Haiti|C|11
30|2026-06-19|18:00|Scotland|Morocco|C|9
31|2026-06-19|20:00|Turkey|Paraguay|D|7
32|2026-06-19|12:00|United States|Australia|D|8
33|2026-06-20|16:00|Germany|Ivory Coast|E|4
34|2026-06-20|19:00|Ecuador|Curaçao|E|14
35|2026-06-20|12:00|Netherlands|Sweden|F|12
36|2026-06-20|22:00|Tunisia|Japan|F|3
37|2026-06-21|18:00|Uruguay|Cape Verde|H|15
38|2026-06-21|12:00|Spain|Saudi Arabia|H|16
39|2026-06-21|12:00|Belgium|Iran|G|6
40|2026-06-21|18:00|New Zealand|Egypt|G|5
41|2026-06-22|20:00|Norway|Senegal|I|10
42|2026-06-22|17:00|France|Iraq|I|11
43|2026-06-22|12:00|Argentina|Austria|J|13
44|2026-06-22|20:00|Jordan|Algeria|J|7
45|2026-06-23|16:00|England|Ghana|L|9
46|2026-06-23|19:00|Panama|Croatia|L|4
47|2026-06-23|12:00|Portugal|Uzbekistan|K|12
48|2026-06-23|20:00|Colombia|DR Congo|K|2
49|2026-06-24|18:00|Scotland|Brazil|C|15
50|2026-06-24|18:00|Morocco|Haiti|C|16
51|2026-06-24|12:00|Switzerland|Canada|B|5
52|2026-06-24|12:00|Bosnia and Herzegovina|Qatar|B|8
53|2026-06-24|19:00|Czech Republic|Mexico|A|1
54|2026-06-24|19:00|South Africa|South Korea|A|3
55|2026-06-25|16:00|Curaçao|Ivory Coast|E|11
56|2026-06-25|16:00|Ecuador|Germany|E|10
57|2026-06-25|18:00|Japan|Sweden|F|13
58|2026-06-25|18:00|Tunisia|Netherlands|F|14
59|2026-06-25|19:00|Turkey|United States|D|6
60|2026-06-25|19:00|Paraguay|Australia|D|7
61|2026-06-26|15:00|Norway|France|I|9
62|2026-06-26|15:00|Senegal|Iraq|I|4
63|2026-06-26|20:00|Egypt|Iran|G|8
64|2026-06-26|20:00|New Zealand|Belgium|G|5
65|2026-06-26|19:00|Cape Verde|Saudi Arabia|H|12
66|2026-06-26|18:00|Uruguay|Spain|H|2
67|2026-06-27|17:00|Panama|England|L|10
68|2026-06-27|17:00|Croatia|Ghana|L|11
69|2026-06-27|21:00|Algeria|Austria|J|14
70|2026-06-27|21:00|Jordan|Argentina|J|13
71|2026-06-27|19:30|Colombia|Portugal|K|15
72|2026-06-27|19:30|DR Congo|Uzbekistan|K|16`;

// [id, round, date, time, homeLabel, awayLabel, venueIndex 1-based]
const KO = [
  [73, 2, "2026-06-28", "12:00", "Segundo A", "Segundo B", 6],
  [74, 2, "2026-06-29", "16:30", "Primero E", "3rd ABCDEF", 9],
  [75, 2, "2026-06-29", "19:00", "Primero F", "Segundo C", 3],
  [76, 2, "2026-06-29", "12:00", "Primero C", "Segundo F", 12],
  [77, 2, "2026-06-30", "17:00", "Primero I", "3rd CDFGH", 10],
  [78, 2, "2026-06-30", "12:00", "Segundo E", "Segundo I", 13],
  [79, 2, "2026-06-30", "19:00", "Primero A", "3rd CEFHI", 1],
  [80, 2, "2026-07-01", "12:00", "Primero L", "3rd EHIJK", 16],
  [81, 2, "2026-07-01", "17:00", "Primero D", "3rd BEFIJ", 7],
  [82, 2, "2026-07-01", "13:00", "Primero G", "3rd AEHIJ", 8],
  [83, 2, "2026-07-02", "19:00", "Segundo K", "Segundo L", 4],
  [84, 2, "2026-07-02", "12:00", "Primero H", "Segundo J", 6],
  [85, 2, "2026-07-02", "20:00", "Primero B", "3rd EFGIJ", 5],
  [86, 2, "2026-07-03", "18:00", "Primero J", "Segundo H", 15],
  [87, 2, "2026-07-03", "20:30", "Primero K", "3rd DEIJL", 14],
  [88, 2, "2026-07-03", "13:00", "Segundo D", "Segundo G", 13],
  [89, 3, "2026-07-04", "17:00", "Ganador 74", "Ganador 77", 11],
  [90, 3, "2026-07-04", "12:00", "Ganador 73", "Ganador 75", 12],
  [91, 3, "2026-07-05", "16:00", "Ganador 76", "Ganador 78", 10],
  [92, 3, "2026-07-05", "18:00", "Ganador 79", "Ganador 80", 1],
  [93, 3, "2026-07-06", "14:00", "Ganador 83", "Ganador 84", 13],
  [94, 3, "2026-07-06", "17:00", "Ganador 81", "Ganador 82", 8],
  [95, 3, "2026-07-07", "12:00", "Ganador 86", "Ganador 88", 16],
  [96, 3, "2026-07-07", "13:00", "Ganador 85", "Ganador 87", 5],
  [97, 4, "2026-07-09", "16:00", "Ganador 89", "Ganador 90", 9],
  [98, 4, "2026-07-10", "12:00", "Ganador 93", "Ganador 94", 6],
  [99, 4, "2026-07-11", "17:00", "Ganador 91", "Ganador 92", 15],
  [100, 4, "2026-07-11", "20:00", "Ganador 95", "Ganador 96", 14],
  [101, 5, "2026-07-14", "14:00", "Ganador 97", "Ganador 98", 13],
  [102, 5, "2026-07-15", "15:00", "Ganador 99", "Ganador 100", 16],
  [103, 6, "2026-07-18", "17:00", "Perdedor 101", "Perdedor 102", 15],
  [104, 7, "2026-07-19", "15:00", "Ganador 101", "Ganador 102", 10],
];

const PLACEHOLDER_LABELS = new Set();
for (const row of KO) {
  PLACEHOLDER_LABELS.add(row[4]);
  PLACEHOLDER_LABELS.add(row[5]);
}
for (let n = 73; n <= 104; n++) {
  PLACEHOLDER_LABELS.add(`Ganador ${n}`);
  if (n <= 102) PLACEHOLDER_LABELS.add(`Perdedor ${n}`);
}

function esc(s) {
  return String(s).replace(/'/g, "''");
}

const usedCodes = new Set(Object.values(CODES));
const PH_ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

function phCode(label) {
  let h = 0;
  for (const c of label) h = (Math.imul(h, 31) + c.charCodeAt(0)) >>> 0;
  for (let attempt = 0; attempt < 100000; attempt++) {
    const n = (h + attempt * 7919) >>> 0;
    const code =
      PH_ALPHABET[(n >>> 0) % 36] +
      PH_ALPHABET[(n >>> 6) % 36] +
      PH_ALPHABET[(n >>> 12) % 36];
    if (!usedCodes.has(code)) {
      usedCodes.add(code);
      return code;
    }
  }
  throw new Error(`Could not assign 3-char code for placeholder: ${label}`);
}

const out = [];
out.push("-- Seed: 48 teams, 16 venues, 104 matches");
out.push("BEGIN;");

out.push(`DELETE FROM public.match_results;
DELETE FROM public.predictions;
DELETE FROM public.matches;
DELETE FROM public.teams;
DELETE FROM public.venues;`);

// Extended knockout slots
out.push(`INSERT INTO public.knockout_slots (id_slot, label) VALUES
  (25,'3rd ABCDEF'),(26,'3rd CDFGH'),(27,'3rd CEFHI'),(28,'3rd EHIJK'),
  (29,'3rd BEFIJ'),(30,'3rd AEHIJ'),(31,'3rd EFGIJ'),(32,'3rd DEIJL')
ON CONFLICT (id_slot) DO NOTHING;`);

for (let n = 73; n <= 104; n++) {
  out.push(
    `INSERT INTO public.knockout_slots (id_slot, label) VALUES (${32 + (n - 72)}, 'Ganador ${n}') ON CONFLICT (id_slot) DO NOTHING;`
  );
}
for (let n = 73; n <= 102; n++) {
  out.push(
    `INSERT INTO public.knockout_slots (id_slot, label) VALUES (${64 + (n - 72)}, 'Perdedor ${n}') ON CONFLICT (id_slot) DO NOTHING;`
  );
}

out.push("INSERT INTO public.venues (city, stadium) VALUES");
VENUES.forEach(([city, st], i) => {
  out.push(`  ('${esc(city)}','${esc(st)}')${i < VENUES.length - 1 ? "," : ""}`);
});
out.push(";");

for (const [g, teams] of Object.entries(GROUPS)) {
  for (const country of teams) {
    out.push(
      `INSERT INTO public.teams (country, id_group, code) SELECT '${esc(country)}', id_group, '${CODES[country]}' FROM public.groups WHERE group_code='${g}';`
    );
  }
}

const realCountries = new Set(Object.values(GROUPS).flat());
for (const label of PLACEHOLDER_LABELS) {
  if (realCountries.has(label)) continue;
  out.push(
    `INSERT INTO public.teams (country, id_group, code) VALUES ('${esc(label)}', NULL, '${phCode(label)}') ON CONFLICT (country) DO NOTHING;`
  );
}

for (const line of GROUP_MATCHES.trim().split("\n")) {
  const [id, date, time, home, away, group, vi] = line.split("|");
  const [city, st] = VENUES[+vi - 1];
  out.push(
    `INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT ${id},1,g.id_group,'${date}'::date,'${time}'::time,v.id_venue,th.id_team,ta.id_team,NULL,NULL
FROM public.groups g, public.venues v, public.teams th, public.teams ta
WHERE g.group_code='${group}' AND v.city='${esc(city)}' AND v.stadium='${esc(st)}'
  AND th.country='${esc(home)}' AND ta.country='${esc(away)}';`
  );
}

for (const [id, round, date, time, home, away, vi] of KO) {
  const [city, st] = VENUES[vi - 1];
  out.push(
    `INSERT INTO public.matches (id_match,id_round,id_group,match_date,match_time,id_venue,home_team_id,away_team_id,home_slot_id,away_slot_id)
SELECT ${id},${round},NULL,'${date}'::date,'${time}'::time,v.id_venue,th.id_team,ta.id_team,hs.id_slot,aslot.id_slot
FROM public.venues v, public.teams th, public.teams ta, public.knockout_slots hs, public.knockout_slots aslot
WHERE v.city='${esc(city)}' AND v.stadium='${esc(st)}'
  AND th.country='${esc(home)}' AND ta.country='${esc(away)}'
  AND hs.label='${esc(home)}' AND aslot.label='${esc(away)}';`
  );
}

out.push("COMMIT;");

const path = join(__dirname, "../supabase/migrations/20260603000005_seed_teams_venues_matches.sql");
writeFileSync(path, out.join("\n"));
console.log("OK", path);
