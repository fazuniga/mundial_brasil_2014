-- Fix kickoff times for matches from 2026-06-13 onwards (89 of 100 post-cutoff fixtures).
-- Replaces uniform +2h offset with per-venue IANA → America/New_York conversion
-- (equivalent to CLT wall time during Jun–Jul 2026 tournament window).
-- Matches 1–4 and Mexico-hosted fixtures on/after 2026-06-13 are unchanged.
-- Source: scripts/generate-seed.mjs venue-local FIFA schedule.
BEGIN;
UPDATE public.matches SET match_date = '2026-06-13'::date, match_time = '21:00'::time WHERE id_match = 5; -- was 2026-06-13 23:00 @ Boston
UPDATE public.matches SET match_date = '2026-06-14'::date, match_time = '00:00'::time WHERE id_match = 6; -- was 2026-06-13 23:00 @ Vancouver
UPDATE public.matches SET match_date = '2026-06-13'::date, match_time = '18:00'::time WHERE id_match = 7; -- was 2026-06-13 20:00 @ New York/New Jersey
UPDATE public.matches SET match_date = '2026-06-13'::date, match_time = '15:00'::time WHERE id_match = 8; -- was 2026-06-13 14:00 @ San Francisco Bay Area
UPDATE public.matches SET match_date = '2026-06-14'::date, match_time = '19:00'::time WHERE id_match = 9; -- was 2026-06-14 21:00 @ Philadelphia
UPDATE public.matches SET match_date = '2026-06-14'::date, match_time = '13:00'::time WHERE id_match = 10; -- was 2026-06-14 14:00 @ Houston
UPDATE public.matches SET match_date = '2026-06-14'::date, match_time = '16:00'::time WHERE id_match = 11; -- was 2026-06-14 17:00 @ Dallas
UPDATE public.matches SET match_date = '2026-06-15'::date, match_time = '18:00'::time WHERE id_match = 13; -- was 2026-06-15 20:00 @ Miami
UPDATE public.matches SET match_date = '2026-06-15'::date, match_time = '12:00'::time WHERE id_match = 14; -- was 2026-06-15 14:00 @ Atlanta
UPDATE public.matches SET match_date = '2026-06-15'::date, match_time = '21:00'::time WHERE id_match = 15; -- was 2026-06-15 20:00 @ Los Angeles
UPDATE public.matches SET match_date = '2026-06-15'::date, match_time = '15:00'::time WHERE id_match = 16; -- was 2026-06-15 14:00 @ Seattle
UPDATE public.matches SET match_date = '2026-06-16'::date, match_time = '15:00'::time WHERE id_match = 17; -- was 2026-06-16 17:00 @ New York/New Jersey
UPDATE public.matches SET match_date = '2026-06-16'::date, match_time = '18:00'::time WHERE id_match = 18; -- was 2026-06-16 20:00 @ Boston
UPDATE public.matches SET match_date = '2026-06-16'::date, match_time = '21:00'::time WHERE id_match = 19; -- was 2026-06-16 22:00 @ Kansas City
UPDATE public.matches SET match_date = '2026-06-17'::date, match_time = '00:00'::time WHERE id_match = 20; -- was 2026-06-16 23:00 @ San Francisco Bay Area
UPDATE public.matches SET match_date = '2026-06-17'::date, match_time = '19:00'::time WHERE id_match = 21; -- was 2026-06-17 21:00 @ Toronto
UPDATE public.matches SET match_date = '2026-06-17'::date, match_time = '16:00'::time WHERE id_match = 22; -- was 2026-06-17 17:00 @ Dallas
UPDATE public.matches SET match_date = '2026-06-17'::date, match_time = '13:00'::time WHERE id_match = 23; -- was 2026-06-17 14:00 @ Houston
UPDATE public.matches SET match_date = '2026-06-18'::date, match_time = '12:00'::time WHERE id_match = 25; -- was 2026-06-18 14:00 @ Atlanta
UPDATE public.matches SET match_date = '2026-06-18'::date, match_time = '15:00'::time WHERE id_match = 26; -- was 2026-06-18 14:00 @ Los Angeles
UPDATE public.matches SET match_date = '2026-06-18'::date, match_time = '18:00'::time WHERE id_match = 27; -- was 2026-06-18 17:00 @ Vancouver
UPDATE public.matches SET match_date = '2026-06-19'::date, match_time = '21:00'::time WHERE id_match = 29; -- was 2026-06-19 23:00 @ Philadelphia
UPDATE public.matches SET match_date = '2026-06-19'::date, match_time = '18:00'::time WHERE id_match = 30; -- was 2026-06-19 20:00 @ Boston
UPDATE public.matches SET match_date = '2026-06-19'::date, match_time = '23:00'::time WHERE id_match = 31; -- was 2026-06-19 22:00 @ San Francisco Bay Area
UPDATE public.matches SET match_date = '2026-06-19'::date, match_time = '15:00'::time WHERE id_match = 32; -- was 2026-06-19 14:00 @ Seattle
UPDATE public.matches SET match_date = '2026-06-20'::date, match_time = '16:00'::time WHERE id_match = 33; -- was 2026-06-20 18:00 @ Toronto
UPDATE public.matches SET match_date = '2026-06-20'::date, match_time = '20:00'::time WHERE id_match = 34; -- was 2026-06-20 21:00 @ Kansas City
UPDATE public.matches SET match_date = '2026-06-20'::date, match_time = '13:00'::time WHERE id_match = 35; -- was 2026-06-20 14:00 @ Houston
UPDATE public.matches SET match_date = '2026-06-21'::date, match_time = '18:00'::time WHERE id_match = 37; -- was 2026-06-21 20:00 @ Miami
UPDATE public.matches SET match_date = '2026-06-21'::date, match_time = '12:00'::time WHERE id_match = 38; -- was 2026-06-21 14:00 @ Atlanta
UPDATE public.matches SET match_date = '2026-06-21'::date, match_time = '15:00'::time WHERE id_match = 39; -- was 2026-06-21 14:00 @ Los Angeles
UPDATE public.matches SET match_date = '2026-06-21'::date, match_time = '21:00'::time WHERE id_match = 40; -- was 2026-06-21 20:00 @ Vancouver
UPDATE public.matches SET match_date = '2026-06-22'::date, match_time = '20:00'::time WHERE id_match = 41; -- was 2026-06-22 22:00 @ New York/New Jersey
UPDATE public.matches SET match_date = '2026-06-22'::date, match_time = '17:00'::time WHERE id_match = 42; -- was 2026-06-22 19:00 @ Philadelphia
UPDATE public.matches SET match_date = '2026-06-22'::date, match_time = '13:00'::time WHERE id_match = 43; -- was 2026-06-22 14:00 @ Dallas
UPDATE public.matches SET match_date = '2026-06-22'::date, match_time = '23:00'::time WHERE id_match = 44; -- was 2026-06-22 22:00 @ San Francisco Bay Area
UPDATE public.matches SET match_date = '2026-06-23'::date, match_time = '16:00'::time WHERE id_match = 45; -- was 2026-06-23 18:00 @ Boston
UPDATE public.matches SET match_date = '2026-06-23'::date, match_time = '19:00'::time WHERE id_match = 46; -- was 2026-06-23 21:00 @ Toronto
UPDATE public.matches SET match_date = '2026-06-23'::date, match_time = '13:00'::time WHERE id_match = 47; -- was 2026-06-23 14:00 @ Houston
UPDATE public.matches SET match_date = '2026-06-24'::date, match_time = '18:00'::time WHERE id_match = 49; -- was 2026-06-24 20:00 @ Miami
UPDATE public.matches SET match_date = '2026-06-24'::date, match_time = '18:00'::time WHERE id_match = 50; -- was 2026-06-24 20:00 @ Atlanta
UPDATE public.matches SET match_date = '2026-06-24'::date, match_time = '15:00'::time WHERE id_match = 51; -- was 2026-06-24 14:00 @ Vancouver
UPDATE public.matches SET match_date = '2026-06-24'::date, match_time = '15:00'::time WHERE id_match = 52; -- was 2026-06-24 14:00 @ Seattle
UPDATE public.matches SET match_date = '2026-06-25'::date, match_time = '16:00'::time WHERE id_match = 55; -- was 2026-06-25 18:00 @ Philadelphia
UPDATE public.matches SET match_date = '2026-06-25'::date, match_time = '16:00'::time WHERE id_match = 56; -- was 2026-06-25 18:00 @ New York/New Jersey
UPDATE public.matches SET match_date = '2026-06-25'::date, match_time = '19:00'::time WHERE id_match = 57; -- was 2026-06-25 20:00 @ Dallas
UPDATE public.matches SET match_date = '2026-06-25'::date, match_time = '19:00'::time WHERE id_match = 58; -- was 2026-06-25 20:00 @ Kansas City
UPDATE public.matches SET match_date = '2026-06-25'::date, match_time = '22:00'::time WHERE id_match = 59; -- was 2026-06-25 21:00 @ Los Angeles
UPDATE public.matches SET match_date = '2026-06-25'::date, match_time = '22:00'::time WHERE id_match = 60; -- was 2026-06-25 21:00 @ San Francisco Bay Area
UPDATE public.matches SET match_date = '2026-06-26'::date, match_time = '15:00'::time WHERE id_match = 61; -- was 2026-06-26 17:00 @ Boston
UPDATE public.matches SET match_date = '2026-06-26'::date, match_time = '15:00'::time WHERE id_match = 62; -- was 2026-06-26 17:00 @ Toronto
UPDATE public.matches SET match_date = '2026-06-26'::date, match_time = '23:00'::time WHERE id_match = 63; -- was 2026-06-26 22:00 @ Seattle
UPDATE public.matches SET match_date = '2026-06-26'::date, match_time = '23:00'::time WHERE id_match = 64; -- was 2026-06-26 22:00 @ Vancouver
UPDATE public.matches SET match_date = '2026-06-26'::date, match_time = '20:00'::time WHERE id_match = 65; -- was 2026-06-26 21:00 @ Houston
UPDATE public.matches SET match_date = '2026-06-27'::date, match_time = '17:00'::time WHERE id_match = 67; -- was 2026-06-27 19:00 @ New York/New Jersey
UPDATE public.matches SET match_date = '2026-06-27'::date, match_time = '17:00'::time WHERE id_match = 68; -- was 2026-06-27 19:00 @ Philadelphia
UPDATE public.matches SET match_date = '2026-06-27'::date, match_time = '22:00'::time WHERE id_match = 69; -- was 2026-06-27 23:00 @ Kansas City
UPDATE public.matches SET match_date = '2026-06-27'::date, match_time = '22:00'::time WHERE id_match = 70; -- was 2026-06-27 23:00 @ Dallas
UPDATE public.matches SET match_date = '2026-06-27'::date, match_time = '19:30'::time WHERE id_match = 71; -- was 2026-06-27 21:30 @ Miami
UPDATE public.matches SET match_date = '2026-06-27'::date, match_time = '19:30'::time WHERE id_match = 72; -- was 2026-06-27 21:30 @ Atlanta
UPDATE public.matches SET match_date = '2026-06-28'::date, match_time = '15:00'::time WHERE id_match = 73; -- was 2026-06-28 14:00 @ Los Angeles
UPDATE public.matches SET match_date = '2026-06-29'::date, match_time = '16:30'::time WHERE id_match = 74; -- was 2026-06-29 18:30 @ Boston
UPDATE public.matches SET match_date = '2026-06-29'::date, match_time = '13:00'::time WHERE id_match = 76; -- was 2026-06-29 14:00 @ Houston
UPDATE public.matches SET match_date = '2026-06-30'::date, match_time = '17:00'::time WHERE id_match = 77; -- was 2026-06-30 19:00 @ New York/New Jersey
UPDATE public.matches SET match_date = '2026-06-30'::date, match_time = '13:00'::time WHERE id_match = 78; -- was 2026-06-30 14:00 @ Dallas
UPDATE public.matches SET match_date = '2026-07-01'::date, match_time = '12:00'::time WHERE id_match = 80; -- was 2026-07-01 14:00 @ Atlanta
UPDATE public.matches SET match_date = '2026-07-01'::date, match_time = '20:00'::time WHERE id_match = 81; -- was 2026-07-01 19:00 @ San Francisco Bay Area
UPDATE public.matches SET match_date = '2026-07-01'::date, match_time = '16:00'::time WHERE id_match = 82; -- was 2026-07-01 15:00 @ Seattle
UPDATE public.matches SET match_date = '2026-07-02'::date, match_time = '19:00'::time WHERE id_match = 83; -- was 2026-07-02 21:00 @ Toronto
UPDATE public.matches SET match_date = '2026-07-02'::date, match_time = '15:00'::time WHERE id_match = 84; -- was 2026-07-02 14:00 @ Los Angeles
UPDATE public.matches SET match_date = '2026-07-02'::date, match_time = '23:00'::time WHERE id_match = 85; -- was 2026-07-02 22:00 @ Vancouver
UPDATE public.matches SET match_date = '2026-07-03'::date, match_time = '18:00'::time WHERE id_match = 86; -- was 2026-07-03 20:00 @ Miami
UPDATE public.matches SET match_date = '2026-07-03'::date, match_time = '21:30'::time WHERE id_match = 87; -- was 2026-07-03 22:30 @ Kansas City
UPDATE public.matches SET match_date = '2026-07-03'::date, match_time = '14:00'::time WHERE id_match = 88; -- was 2026-07-03 15:00 @ Dallas
UPDATE public.matches SET match_date = '2026-07-04'::date, match_time = '17:00'::time WHERE id_match = 89; -- was 2026-07-04 19:00 @ Philadelphia
UPDATE public.matches SET match_date = '2026-07-04'::date, match_time = '13:00'::time WHERE id_match = 90; -- was 2026-07-04 14:00 @ Houston
UPDATE public.matches SET match_date = '2026-07-05'::date, match_time = '16:00'::time WHERE id_match = 91; -- was 2026-07-05 18:00 @ New York/New Jersey
UPDATE public.matches SET match_date = '2026-07-06'::date, match_time = '15:00'::time WHERE id_match = 93; -- was 2026-07-06 16:00 @ Dallas
UPDATE public.matches SET match_date = '2026-07-06'::date, match_time = '20:00'::time WHERE id_match = 94; -- was 2026-07-06 19:00 @ Seattle
UPDATE public.matches SET match_date = '2026-07-07'::date, match_time = '12:00'::time WHERE id_match = 95; -- was 2026-07-07 14:00 @ Atlanta
UPDATE public.matches SET match_date = '2026-07-07'::date, match_time = '16:00'::time WHERE id_match = 96; -- was 2026-07-07 15:00 @ Vancouver
UPDATE public.matches SET match_date = '2026-07-09'::date, match_time = '16:00'::time WHERE id_match = 97; -- was 2026-07-09 18:00 @ Boston
UPDATE public.matches SET match_date = '2026-07-10'::date, match_time = '15:00'::time WHERE id_match = 98; -- was 2026-07-10 14:00 @ Los Angeles
UPDATE public.matches SET match_date = '2026-07-11'::date, match_time = '17:00'::time WHERE id_match = 99; -- was 2026-07-11 19:00 @ Miami
UPDATE public.matches SET match_date = '2026-07-11'::date, match_time = '21:00'::time WHERE id_match = 100; -- was 2026-07-11 22:00 @ Kansas City
UPDATE public.matches SET match_date = '2026-07-14'::date, match_time = '15:00'::time WHERE id_match = 101; -- was 2026-07-14 16:00 @ Dallas
UPDATE public.matches SET match_date = '2026-07-15'::date, match_time = '15:00'::time WHERE id_match = 102; -- was 2026-07-15 17:00 @ Atlanta
UPDATE public.matches SET match_date = '2026-07-18'::date, match_time = '17:00'::time WHERE id_match = 103; -- was 2026-07-18 19:00 @ Miami
UPDATE public.matches SET match_date = '2026-07-19'::date, match_time = '15:00'::time WHERE id_match = 104; -- was 2026-07-19 17:00 @ New York/New Jersey
COMMIT;
