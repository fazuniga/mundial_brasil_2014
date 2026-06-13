/**
 * Regenerate scripts/player-squads.mjs from Wikipedia FIFA 2026 official squads.
 * Source: https://en.wikipedia.org/wiki/2026_FIFA_World_Cup_squads
 *
 * Usage:
 *   node scripts/sync-players-from-wikipedia.mjs [wikipedia-squads.txt]
 *   node scripts/generate-players-seed.mjs
 */
import { writeFileSync } from "fs";
import { join, dirname } from "path";
import { fileURLToPath } from "url";
import { PLAYER_SQUADS as OLD_SQUADS } from "./player-squads.mjs";
import { ensureWikiSquadsCache, parseWikiSquads, normName } from "./load-wikipedia-squads.mjs";

const __dirname = dirname(fileURLToPath(import.meta.url));
const wikiPath = process.argv[2];

const TEAM_ORDER = [
  "MEX", "RSA", "KOR", "CZE", "CAN", "BIH", "QAT", "SUI", "BRA", "MAR", "HAI", "SCO",
  "USA", "PAR", "AUS", "TUR", "GER", "CUW", "CIV", "ECU", "NED", "JPN", "SWE", "TUN",
  "BEL", "EGY", "IRN", "NZL", "ESP", "CPV", "KSA", "URU", "FRA", "SEN", "IRQ", "NOR",
  "ARG", "ALG", "AUT", "JOR", "POR", "DRC", "UZB", "COL", "ENG", "CRO", "GHA", "PAN",
];

const TEAM_DEFAULT_COUNTRY = {
  MEX: "MEX", RSA: "RSA", KOR: "KOR", CZE: "CZE", CAN: "CAN", BIH: "BIH", QAT: "QAT",
  SUI: "SUI", BRA: "BRA", MAR: "MAR", HAI: "HAI", SCO: "SCO", USA: "USA", PAR: "PAR",
  AUS: "AUS", TUR: "TUR", GER: "GER", CUW: "CUW", CIV: "CIV", ECU: "ECU", NED: "NED",
  JPN: "JPN", SWE: "SWE", TUN: "TUN", BEL: "BEL", EGY: "EGY", IRN: "IRN", NZL: "NZL",
  ESP: "ESP", CPV: "CPV", KSA: "KSA", URU: "URU", FRA: "FRA", SEN: "SEN", IRQ: "IRQ",
  NOR: "NOR", ARG: "ARG", ALG: "ALG", AUT: "AUT", JOR: "JOR", POR: "POR", DRC: "DRC",
  UZB: "UZB", COL: "COL", ENG: "ENG", CRO: "CRO", GHA: "GHA", PAN: "PAN",
};

/** Known club → FIFA association (3-letter) overrides for WC squad clubs. */
const CLUB_COUNTRY = {
  "Manchester United": "ENG",
  "Manchester City": "ENG",
  "Liverpool": "ENG",
  "Arsenal": "ENG",
  "Chelsea": "ENG",
  "Tottenham": "ENG",
  "Tottenham Hotspur": "ENG",
  "Newcastle United": "ENG",
  "Aston Villa": "ENG",
  "West Ham United": "ENG",
  "West Ham": "ENG",
  "Brighton": "ENG",
  "Brighton & Hove Albion": "ENG",
  "Crystal Palace": "ENG",
  "Fulham": "ENG",
  "Bournemouth": "ENG",
  "AFC Bournemouth": "ENG",
  "Nottingham Forest": "ENG",
  "Everton": "ENG",
  "Leeds United": "ENG",
  "Leicester City": "ENG",
  "Wolverhampton Wanderers": "ENG",
  "Brentford": "ENG",
  "Coventry City": "ENG",
  "Birmingham City": "ENG",
  "Sheffield United": "ENG",
  "Real Madrid": "ESP",
  "Barcelona": "ESP",
  "Atlético Madrid": "ESP",
  "Real Sociedad": "ESP",
  "Villarreal": "ESP",
  "Real Betis": "ESP",
  "Getafe": "ESP",
  "Sevilla": "ESP",
  "Valencia": "ESP",
  "Bayern Munich": "GER",
  "Borussia Dortmund": "GER",
  "Bayer Leverkusen": "GER",
  "RB Leipzig": "GER",
  "Stuttgart": "GER",
  "VfB Stuttgart": "GER",
  "Eintracht Frankfurt": "GER",
  "Borussia Mönchengladbach": "GER",
  "Wolfsburg": "GER",
  "VfL Wolfsburg": "GER",
  "Mainz 05": "GER",
  "Freiburg": "GER",
  "SC Freiburg": "GER",
  "Union Berlin": "GER",
  "Hoffenheim": "GER",
  "TSG Hoffenheim": "GER",
  "Hamburger SV": "GER",
  "Inter Milan": "ITA",
  "Milan": "ITA",
  "AC Milan": "ITA",
  "Juventus": "ITA",
  "Napoli": "ITA",
  "Roma": "ITA",
  "Lazio": "ITA",
  "Atalanta": "ITA",
  "Fiorentina": "ITA",
  "Bologna": "ITA",
  "Paris Saint-Germain": "FRA",
  "Monaco": "FRA",
  "Marseille": "FRA",
  "Lille": "FRA",
  "Lyon": "FRA",
  "Nice": "FRA",
  "Lens": "FRA",
  "Rennes": "FRA",
  "Ajax": "NED",
  "PSV Eindhoven": "NED",
  "PSV": "NED",
  "Feyenoord": "NED",
  "Benfica": "POR",
  "Porto": "POR",
  "Sporting CP": "POR",
  "Celtic": "SCO",
  "Rangers": "SCO",
  "Galatasaray": "TUR",
  "Fenerbahçe": "TUR",
  "Beşiktaş": "TUR",
  "Trabzonspor": "TUR",
  "Minnesota United FC": "USA",
  "Atlanta United FC": "USA",
  "FC Dallas": "USA",
  "El Paso Locomotive FC": "USA",
  "PAOK": "GRE",
  "Lokomotiv Moscow": "RUS",
  "FC St. Pauli": "GER",
  "St. Pauli": "GER",
  "Dynamo Moscow": "RUS",
  "Al-Qadsiah": "KSA",
  "AEL Limassol": "CYP",
  "Santos Laguna": "MEX",
  "Real Betis": "ESP",
  "Atlético Madrid": "ESP",
  "Genoa": "ITA",
  "Polokwane City": "RSA",
  "Gangwon FC": "KOR",
  "Chicago Fire FC": "USA",
  "New York City FC": "USA",
  "FC Cincinnati": "USA",
  "Seattle Sounders FC": "USA",
  "Melbourne City": "AUS",
  "Sydney FC": "AUS",
  "Los Angeles FC": "USA",
  "Inter Miami CF": "USA",
  "New York City FC": "USA",
  "Chicago Fire FC": "USA",
  "Seattle Sounders FC": "USA",
  "Columbus Crew": "USA",
  "Charlotte FC": "USA",
  "New England Revolution": "USA",
  "Guadalajara": "MEX",
  "América": "MEX",
  "Cruz Azul": "MEX",
  "Toluca": "MEX",
  "Tigres": "MEX",
  "Monterrey": "MEX",
  "Palmeiras": "BRA",
  "Flamengo": "BRA",
  "Fluminense": "BRA",
  "São Paulo": "BRA",
  "Corinthians": "BRA",
  "Al Hilal": "KSA",
  "Al-Nassr": "KSA",
  "Al Ahly": "EGY",
  "Mamelodi Sundowns": "RSA",
  "Burnley": "ENG",
  "Midtjylland": "DEN",
  "Genk": "BEL",
  "Club Brugge": "BEL",
  "Anderlecht": "BEL",
  "Reims": "FRA",
  "Stoke City": "ENG",
  "Swansea City": "WAL",
  "Hull City": "ENG",
  "Preston North End": "ENG",
  "Southampton": "ENG",
  "Schalke 04": "GER",
  "Karlsruher SC": "GER",
  "Young Boys": "SUI",
  "Basel": "SUI",
  "Servette": "SUI",
  "Slavia Prague": "CZE",
  "Sparta Prague": "CZE",
  "Viktoria Plzeň": "CZE",
  "Braga": "POR",
  "Orlando Pirates": "RSA",
  "Kaizer Chiefs": "RSA",
  "SuperSport United": "RSA",
  "Stellenbosch": "RSA",
  "Cape Town City": "RSA",
  "AmaZulu": "RSA",
  "TS Galaxy": "RSA",
  "Polokwane City": "RSA",
  "Siwelele": "RSA",
  "Tondela": "POR",
  "AEL Limassol": "CYP",
  "Molde": "NOR",
  "Hannover 96": "GER",
  "Philadelphia Union": "USA",
  "Chicago Fire": "USA",
  "Orlando City SC": "USA",
  "Portland Timbers": "USA",
  "Vancouver Whitecaps FC": "CAN",
  "Toronto FC": "CAN",
  "CF Montréal": "CAN",
  "FC Cincinnati": "USA",
  "Nashville SC": "USA",
  "Dallas": "USA",
  "Cardiff City": "WAL",
  "Reading": "ENG",
  "Mallorca": "ESP",
  "Gent": "BEL",
  "Watford": "ENG",
  "Hearts": "SCO",
  "Hibernian": "SCO",
  "St. Mirren": "SCO",
  "Millwall": "ENG",
  "Middlesbrough": "ENG",
  "QPR": "ENG",
  "Norwich City": "ENG",
  "New York Red Bulls": "USA",
  "Machida Zelvia": "JPN",
  "Volendam": "NED",
  "Western Sydney": "AUS",
  "Melbourne City": "AUS",
  "Adelaide United": "AUS",
  "Newcastle Jets": "AUS",
  "Heerenveen": "NED",
  "Rosenborg": "NOR",
  "AIK": "SWE",
  "Malmö FF": "SWE",
  "Hammarby": "SWE",
  "Werder Bremen": "GER",
  "Parma": "ITA",
  "Sassuolo": "ITA",
  "Sampdoria": "ITA",
  "Genoa": "ITA",
  "Torino": "ITA",
  "Udinese": "ITA",
  "Salernitana": "ITA",
  "Cagliari": "ITA",
  "Como": "ITA",
  "NEC": "NED",
  "Le Havre": "FRA",
  "Copenhagen": "DEN",
  "Kashima Antlers": "JPN",
  "Sanfrecce Hiroshima": "JPN",
  "FC Tokyo": "JPN",
  "Ulsan HD": "KOR",
  "Jeonbuk Hyundai Motors": "KOR",
  "Gangwon FC": "KOR",
  "Daejeon Hana Citizen": "KOR",
  "Sint-Truiden": "BEL",
  "Cerezo Osaka": "JPN",
  "Fortuna Düsseldorf": "GER",
  "Sporting CP": "POR",
  "Brugge": "BEL",
  "Al-Sadd": "QAT",
  "Al-Duhail": "QAT",
  "Al-Gharafa": "QAT",
  "Al-Rayyan": "QAT",
  "Al-Wakrah": "QAT",
  "Al-Arabi": "QAT",
  "Al-Qadsiah": "KSA",
  "Al-Shabab": "KSA",
  "Al Hilal": "KSA",
  "Al Ahli": "KSA",
  "Al Ittihad": "KSA",
  "Al Ettifaq": "KSA",
  "Al Fateh": "KSA",
  "Al Khaleej": "KSA",
  "Al Riyadh": "KSA",
  "Al Taawoun": "KSA",
  "Al Wehda": "KSA",
  "Al-Fateh": "KSA",
  "Al-Najma": "KSA",
  "Al Okhdood": "KSA",
  "Al Raed": "KSA",
  "Al Hazem": "KSA",
  "Al Kholood": "KSA",
  "Al Orobah": "KSA",
  "Al Qadsiah": "KSA",
  "Al Shabab": "KSA",
  "Al Taawon": "KSA",
  "Al Nassr": "KSA",
  "Al Hilal": "KSA",
  "Al Ahly": "EGY",
  "Zamalek": "EGY",
  "Pyramids": "EGY",
  "Ceramica Cleopatra": "EGY",
  "Modern Future": "EGY",
  "Ismaily": "EGY",
  "Al Masry": "EGY",
  "Smouha": "EGY",
  "ENPPI": "EGY",
  "Pharco": "EGY",
  "National Bank": "EGY",
  "Future FC": "EGY",
  "El Gouna": "EGY",
  "Ghazl El Mahalla": "EGY",
  "Al Ittihad Alexandria": "EGY",
  "Aswan": "EGY",
  "Wadi Degla": "EGY",
  "Tala'ea El Gaish": "EGY",
  "Petrojet": "EGY",
  "Baladiyat El Mahalla": "EGY",
  "Al Mokawloon": "EGY",
  "Al Ahly": "EGY",
  "Persepolis": "IRN",
  "Sepahan": "IRN",
  "Tractor": "IRN",
  "Esteghlal": "IRN",
  "Foolad": "IRN",
  "Shabab Al Ahli": "UAE",
  "Sharjah": "UAE",
  "Al Jazira": "UAE",
  "Al Ain": "UAE",
  "Al Wahda": "UAE",
  "Al Wasl": "UAE",
  "Al Nasr": "UAE",
  "Baniyas": "UAE",
  "Ajman": "UAE",
  "Al Dhafra": "UAE",
  "Al Bataeh": "UAE",
  "Khor Fakkan": "UAE",
  "Al Urooba": "UAE",
  "Hatta": "UAE",
  "Dibba Al Fujairah": "UAE",
  "Emirates": "UAE",
  "Al Ittihad Kalba": "UAE",
  "Al Nasr Dubai": "UAE",
  "Al Wasl": "UAE",
  "Al Wahda": "UAE",
  "Al Ain": "UAE",
  "Al Jazira": "UAE",
  "Sharjah": "UAE",
  "Shabab Al Ahli": "UAE",
  "Al Nasr": "UAE",
  "Al Wasl": "UAE",
  "Al Wahda": "UAE",
  "Al Ain": "UAE",
  "Al Jazira": "UAE",
  "Sharjah": "UAE",
  "Shabab Al Ahli": "UAE",
};

function normClub(s) {
  return s.trim().toLowerCase();
}

function buildClubCountryLookup() {
  const map = new Map(Object.entries(CLUB_COUNTRY).map(([k, v]) => [normClub(k), v]));
  for (const players of Object.values(OLD_SQUADS)) {
    for (const [, , club, country] of players) {
      if (!map.has(normClub(club))) map.set(normClub(club), country);
    }
  }
  return map;
}

function inferClubCountry(club, teamCode, lookup, clubnat) {
  if (clubnat) return clubnat;
  const direct = lookup.get(normClub(club));
  if (direct) return direct;
  return TEAM_DEFAULT_COUNTRY[teamCode] || "UNK";
}

function pick18(squad) {
  const gks = squad.filter((p) => p.pos === "GK");
  const dfs = squad.filter((p) => p.pos === "DF");
  const mfs = squad.filter((p) => p.pos === "MF");
  const fws = squad.filter((p) => p.pos === "FW");

  const selected = [];
  const seen = new Set();

  const add = (list, max) => {
    for (const p of list) {
      if (selected.length >= 18) break;
      const key = normName(p.name);
      if (seen.has(key)) continue;
      if (max <= 0) continue;
      selected.push(p);
      seen.add(key);
      max--;
    }
  };

  add(gks, 3);
  add(dfs, 5);
  add(mfs, 5);
  add(fws, 5);

  for (const p of squad) {
    if (selected.length >= 18) break;
    const key = normName(p.name);
    if (!seen.has(key)) {
      selected.push(p);
      seen.add(key);
    }
  }

  return selected.slice(0, 18);
}

function esc(s) {
  return s.replace(/\\/g, "\\\\").replace(/'/g, "\\'");
}

const wikiText = await ensureWikiSquadsCache(wikiPath);
const official = parseWikiSquads(wikiText);
const clubLookup = buildClubCountryLookup();

const lines = [
  "/**",
  " * Projected WC 2026 squad-style rosters for 48 group-phase nations.",
  " * Source: FIFA official squads (published June 2, 2026) via Wikipedia",
  " *   https://en.wikipedia.org/wiki/2026_FIFA_World_Cup_squads",
  " * Regenerate seed: node scripts/generate-players-seed.mjs",
  " */",
  "export const PLAYER_SQUADS = {",
];

let missingTeams = [];
for (const code of TEAM_ORDER) {
  const squad = official[code];
  if (!squad?.length) {
    missingTeams.push(code);
    const fallback = OLD_SQUADS[code] || [];
    lines.push(`  ${code}: [`);
    for (const row of fallback) {
      lines.push(`    ["${esc(row[0])}", "${row[1]}", "${esc(row[2])}", "${row[3]}"],`);
    }
    lines.push("  ],");
    continue;
  }

  const picked = pick18(squad);
  lines.push(`  ${code}: [`);
  for (const p of picked) {
    const cc = inferClubCountry(p.club, code, clubLookup, p.clubnat);
    lines.push(`    ["${esc(p.name)}", "${p.pos}", "${esc(p.club)}", "${cc}"],`);
  }
  lines.push("  ],");
}

lines.push("};");
lines.push("");

const outPath = join(__dirname, "player-squads.mjs");
writeFileSync(outPath, lines.join("\n"), "utf8");

console.log(`Wrote ${outPath}`);
console.log(`Teams synced: ${TEAM_ORDER.length - missingTeams.length}/${TEAM_ORDER.length}`);
if (missingTeams.length) console.log(`Missing Wikipedia data (kept old): ${missingTeams.join(", ")}`);
