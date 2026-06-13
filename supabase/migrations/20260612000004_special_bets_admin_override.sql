-- Admin override for Apuestas Especiales lock (default: 60 min before first group match).

ALTER TABLE public.tournament_results
  ADD COLUMN IF NOT EXISTS special_bets_open boolean;

COMMENT ON COLUMN public.tournament_results.special_bets_open IS
  'NULL = auto lock 60 min before first group match; true/false = admin force open/closed.';

CREATE OR REPLACE VIEW public.v_tournament_bet_open
WITH (security_invoker = true) AS
WITH auto_open AS (
  SELECT COALESCE(
    (
      SELECT f.predictions_open
      FROM public.v_fixture f
      WHERE f.id_match = (SELECT MIN(m.id_match) FROM public.matches m WHERE m.id_round = 1)
    ),
    true
  ) AS value
)
SELECT
  COALESCE(tr.special_bets_open, ao.value) AS tournament_bet_open,
  ao.value AS tournament_bet_auto_open,
  tr.special_bets_open AS special_bets_open_override
FROM public.tournament_results tr
CROSS JOIN auto_open ao
WHERE tr.id = 1;

GRANT SELECT ON public.v_tournament_bet_open TO anon, authenticated;

DROP POLICY IF EXISTS "Tournament predictions insert own pool" ON public.tournament_predictions;
CREATE POLICY "Tournament predictions insert own pool"
  ON public.tournament_predictions FOR INSERT TO authenticated
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM public.pools p
      WHERE p.id_pool = tournament_predictions.id_pool AND p.owner_id = auth.uid()
    )
    AND (SELECT tournament_bet_open FROM public.v_tournament_bet_open LIMIT 1)
  );

DROP POLICY IF EXISTS "Tournament predictions update own pool" ON public.tournament_predictions;
CREATE POLICY "Tournament predictions update own pool"
  ON public.tournament_predictions FOR UPDATE TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM public.pools p
      WHERE p.id_pool = tournament_predictions.id_pool AND p.owner_id = auth.uid()
    )
  )
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM public.pools p
      WHERE p.id_pool = tournament_predictions.id_pool AND p.owner_id = auth.uid()
    )
    AND (SELECT tournament_bet_open FROM public.v_tournament_bet_open LIMIT 1)
  );
