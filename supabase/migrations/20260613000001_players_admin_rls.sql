-- Admin CRUD on players (squad management from admin panel)

CREATE POLICY "Admins manage players" ON public.players
  FOR ALL TO authenticated
  USING (public.is_current_user_admin())
  WITH CHECK (public.is_current_user_admin());
