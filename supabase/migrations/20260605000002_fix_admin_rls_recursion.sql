-- Fix infinite recursion on profiles SELECT after pool_payment_admin migration.
-- Policies on profiles must not subquery profiles under RLS; use SECURITY DEFINER helper.

CREATE OR REPLACE FUNCTION public.is_current_user_admin()
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT COALESCE(
    (SELECT p.is_admin FROM public.profiles p WHERE p.id = auth.uid()),
    false
  );
$$;

REVOKE ALL ON FUNCTION public.is_current_user_admin() FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.is_current_user_admin() TO authenticated;

DROP POLICY IF EXISTS "Admins select all profiles" ON public.profiles;
CREATE POLICY "Admins select all profiles" ON public.profiles
  FOR SELECT TO authenticated
  USING (public.is_current_user_admin());

DROP POLICY IF EXISTS "Admins update pools" ON public.pools;
CREATE POLICY "Admins update pools" ON public.pools
  FOR UPDATE TO authenticated
  USING (public.is_current_user_admin())
  WITH CHECK (public.is_current_user_admin());
