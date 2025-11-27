-- =====================================================
-- RLS – Activation et politiques de base
-- HUMANS BOARD
-- =====================================================

-- Activer la RLS sur les tables
alter table public.companies enable row level security;
alter table public.user_profiles enable row level security;
alter table public.invitations enable row level security;

-- -----------------------------------------------------
-- POLICIES companies
-- -----------------------------------------------------

-- Lecture : un utilisateur ne voit que sa propre entreprise
create policy "select_own_company"
on public.companies
for select
using (
  id = (
    select company_id
    from public.user_profiles
    where id = auth.uid()
  )
);

-- -----------------------------------------------------
-- POLICIES user_profiles
-- -----------------------------------------------------

-- Lecture : un utilisateur voit seulement les profils de sa propre entreprise
create policy "select_profiles_same_company"
on public.user_profiles
for select
using (
  company_id = (
    select company_id
    from public.user_profiles
    where id = auth.uid()
  )
);

-- -----------------------------------------------------
-- POLICIES invitations
-- -----------------------------------------------------

-- Lecture : voir seulement les invitations de sa propre entreprise
create policy "select_invitations_same_company"
on public.invitations
for select
using (
  company_id = (
    select company_id
    from public.user_profiles
    where id = auth.uid()
  )
);

-- Insertion : seulement admin ou manager de l’entreprise
create policy "insert_invitations_admin_or_manager"
on public.invitations
for insert
with check (
  exists (
    select 1
    from public.user_profiles up
    where up.id = auth.uid()
      and up.company_id = company_id
      and up.role in ('admin','manager')
  )
);
