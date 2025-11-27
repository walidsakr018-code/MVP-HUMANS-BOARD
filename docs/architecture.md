# Architecture – MVP HUMANS BOARD

## 🔧 Stack technique

- **Front (MVP v1)** : WeWeb
- **Backend** : Supabase
  - Base de données Postgres
  - Auth intégrée
  - RLS (Row Level Security) pour séparer les données par entreprise
- **Automatisations / IA** : Make.com
  - Envoi d’emails (invitations, notifications)
  - Appels à OpenAI/Mistral (reformulation, reconnaissance, signaux faibles)
- **Front (v2)** : Next.js + Plasmic (plus tard)
- **CI/CD & Hosting (v2)** : Vercel

## 🏗 Schéma logique (simple)

WeWeb (front)
↕ (API Supabase)
Supabase (DB + Auth)
↕ (webhooks / API)
Make.com
↕ (API IA)
OpenAI / Mistral

## 🔐 Multi-tenants & sécurité

- Chaque utilisateur est associé à **une entreprise** via `company_id`.
- Toutes les tables métiers (posts, projets, tâches, consultations, votes…) sont liées à `company_id`.
- Les règles RLS garantissent qu’un utilisateur ne voit que les données de sa propre entreprise.
