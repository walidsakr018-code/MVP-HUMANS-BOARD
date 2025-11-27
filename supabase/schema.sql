-- =====================================================
-- SCHEMA SUPABASE – SOCLE MULTI-ENTREPRISES
-- Projet : HUMANS BOARD
-- =====================================================

-- TABLE companies : entreprises
create table if not exists public.companies (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  created_at timestamptz default now()
);

-- TABLE user_profiles : profil utilisateur lié à auth.users
-- Chaque profil est rattaché à une entreprise.
create table if not exists public.user_profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  company_id uuid not null references public.companies (id) on delete cascade,
  role text not null check (role in ('admin', 'manager', 'member')),
  created_at timestamptz default now()
);

-- TABLE invitations : invitations hiérarchiques
-- Un admin/manager invite une personne (email) avec un rôle cible
create table if not exists public.invitations (
  id uuid primary key default gen_random_uuid(),
  company_id uuid not null references public.companies (id) on delete cascade,
  invited_email text not null,
  invited_role text not null check (invited_role in ('admin', 'manager', 'member')),
  token text not null unique,
  status text not null default 'pending' check (status in ('pending','accepted','revoked','expired')),
  created_by uuid not null references auth.users (id),
  created_at timestamptz default now(),
  accepted_at timestamptz
);

/*
Les tables métier (à ajouter plus tard) :
- posts
- comments
- projects
- tasks
- consultations
- votes
*/
