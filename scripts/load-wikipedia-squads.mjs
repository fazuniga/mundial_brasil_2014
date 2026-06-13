/**
 * Load and parse Wikipedia wikitext for 2026 FIFA World Cup squads.
 * Uses local cache at scripts/data/wikipedia-squads.txt when present; otherwise fetches live.
 */
import { readFileSync, writeFileSync, mkdirSync, existsSync } from "fs";
import { join, dirname } from "path";
import { fileURLToPath } from "url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const WIKI_PAGE = "2026_FIFA_World_Cup_squads";
const CACHE_PATH = join(__dirname, "data/wikipedia-squads.txt");

export const TEAM_TO_CODE = {
  "Czech Republic": "CZE",
  Mexico: "MEX",
  "South Africa": "RSA",
  "South Korea": "KOR",
  "Bosnia and Herzegovina": "BIH",
  Canada: "CAN",
  Qatar: "QAT",
  Switzerland: "SUI",
  Brazil: "BRA",
  Morocco: "MAR",
  Haiti: "HAI",
  Scotland: "SCO",
  "United States": "USA",
  Paraguay: "PAR",
  Australia: "AUS",
  Türkiye: "TUR",
  Turkey: "TUR",
  Germany: "GER",
  Curaçao: "CUW",
  Curacao: "CUW",
  "Ivory Coast": "CIV",
  "Côte d'Ivoire": "CIV",
  Ecuador: "ECU",
  Netherlands: "NED",
  Japan: "JPN",
  Sweden: "SWE",
  Tunisia: "TUN",
  Belgium: "BEL",
  Egypt: "EGY",
  Iran: "IRN",
  "Islamic Republic of Iran": "IRN",
  "New Zealand": "NZL",
  Spain: "ESP",
  "Cape Verde": "CPV",
  "Cabo Verde": "CPV",
  "Saudi Arabia": "KSA",
  Uruguay: "URU",
  France: "FRA",
  Senegal: "SEN",
  Iraq: "IRQ",
  Norway: "NOR",
  Argentina: "ARG",
  Algeria: "ALG",
  Austria: "AUT",
  Jordan: "JOR",
  Portugal: "POR",
  "DR Congo": "DRC",
  "Democratic Republic of the Congo": "DRC",
  "Congo DR": "DRC",
  Uzbekistan: "UZB",
  Colombia: "COL",
  England: "ENG",
  Croatia: "CRO",
  Ghana: "GHA",
  Panama: "PAN",
};

export function normName(s) {
  return s
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/\(captain\)/gi, "")
    .replace(/\s+/g, " ")
    .trim()
    .toLowerCase();
}

function posFromWiki(pos) {
  if (pos.includes("GK")) return "GK";
  if (pos.includes("DF")) return "DF";
  if (pos.includes("MF")) return "MF";
  if (pos.includes("FW")) return "FW";
  return "MF";
}

function extractWikiField(template, field) {
  const re = new RegExp(`\\|${field}=\\[\\[(?:[^\\]|]+\\|)?([^\\]]+)\\]\\]`);
  const m = template.match(re);
  return m ? m[1].trim() : null;
}

function extractPlainField(template, field) {
  const re = new RegExp(`\\|${field}=([^|{}\\[\\]]+)`);
  const m = template.match(re);
  return m ? m[1].trim() : null;
}

function parsePlayerLine(line) {
  const tpl = line.match(/\{\{nat fs g player\|(.+)\}\}/);
  if (!tpl) return null;

  const template = tpl[0];
  const name = extractWikiField(template, "name");
  const pos = extractPlainField(template, "pos");
  const club = extractWikiField(template, "club");
  const clubnat = extractPlainField(template, "clubnat");
  if (!name || !pos) return null;

  const cleanName = name.replace(/\(captain\)/gi, "").trim();
  return {
    name: cleanName,
    pos: posFromWiki(pos),
    club: club || "",
    clubnat,
    norm: normName(cleanName),
  };
}

function parseWikitextSquads(text) {
  const squads = {};
  const re = /^===([^=]+)===$/gm;
  const sections = [];
  let match;
  while ((match = re.exec(text)) !== null) {
    sections.push({ team: match[1].trim(), start: match.index + match[0].length });
  }

  for (let i = 0; i < sections.length; i++) {
    const code = TEAM_TO_CODE[sections[i].team];
    if (!code) continue;

    const end =
      i + 1 < sections.length
        ? text.lastIndexOf(`===${sections[i + 1].team}===`, sections[i + 1].start)
        : text.length;
    const content = text.slice(sections[i].start, end);
    const players = [];

    for (const line of content.split("\n")) {
      const p = parsePlayerLine(line.trim());
      if (p) players.push(p);
    }

    if (players.length) squads[code] = players;
  }

  return squads;
}

function parseMarkdownSquads(text) {
  const squads = {};
  const sections = text.split(/^### /m).slice(1);
  for (const section of sections) {
    const [headerLine, ...rest] = section.split("\n");
    const code = TEAM_TO_CODE[headerLine.trim()];
    if (!code) continue;
    const players = [];
    for (const line of rest.join("\n").split("\n")) {
      if (!line.startsWith("|") || line.includes("---") || line.includes("No.")) continue;
      const cols = line.split("|").map((c) => c.trim()).filter(Boolean);
      if (cols.length < 7 || !/^\d+$/.test(cols[0])) continue;
      const name = cols[2].replace(/\(captain\)/gi, "").trim();
      players.push({
        name,
        pos: posFromWiki(cols[1]),
        club: cols[6],
        norm: normName(name),
      });
    }
    if (players.length) squads[code] = players;
  }
  return squads;
}

export function parseWikiSquads(text) {
  if (text.includes("{{nat fs g player")) {
    return parseWikitextSquads(text);
  }
  return parseMarkdownSquads(text);
}

export function loadWikiSquadsText(customPath) {
  if (customPath) {
    return readFileSync(customPath, "utf8");
  }
  if (existsSync(CACHE_PATH)) {
    return readFileSync(CACHE_PATH, "utf8");
  }
  throw new Error(
    `Wikipedia squads cache not found at ${CACHE_PATH}. ` +
      `Run: node scripts/load-wikipedia-squads.mjs --fetch`
  );
}

export async function fetchWikiSquadsText() {
  const url = new URL("https://en.wikipedia.org/w/api.php");
  url.searchParams.set("action", "parse");
  url.searchParams.set("page", WIKI_PAGE);
  url.searchParams.set("prop", "wikitext");
  url.searchParams.set("format", "json");
  url.searchParams.set("formatversion", "2");

  const res = await fetch(url);
  if (!res.ok) {
    throw new Error(`Wikipedia fetch failed: ${res.status} ${res.statusText}`);
  }
  const data = await res.json();
  const text = data?.parse?.wikitext;
  if (!text) {
    throw new Error("Wikipedia response missing wikitext");
  }
  return text;
}

export async function ensureWikiSquadsCache(customPath) {
  if (customPath) return readFileSync(customPath, "utf8");
  if (existsSync(CACHE_PATH)) return readFileSync(CACHE_PATH, "utf8");

  const text = await fetchWikiSquadsText();
  mkdirSync(dirname(CACHE_PATH), { recursive: true });
  writeFileSync(CACHE_PATH, text, "utf8");
  console.log(`Cached Wikipedia squads → ${CACHE_PATH}`);
  return text;
}

if (process.argv.includes("--fetch")) {
  const out = process.argv.includes("--stdout");
  fetchWikiSquadsText()
    .then((text) => {
      if (out) {
        process.stdout.write(text);
        return;
      }
      mkdirSync(dirname(CACHE_PATH), { recursive: true });
      writeFileSync(CACHE_PATH, text, "utf8");
      console.log(`Wrote ${CACHE_PATH} (${text.length} bytes)`);
    })
    .catch((err) => {
      console.error(err.message);
      process.exit(1);
    });
}
