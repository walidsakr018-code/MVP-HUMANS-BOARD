# MVP HUMANS BOARD – WeWeb + Supabase + Make

Ce repo contient tout ce qui concerne le MVP de **HUMANS BOARD**, une plateforme interne pour les entreprises, basée sur :

- **Front (v1)** : WeWeb
- **Backend** : Supabase (Postgres + Auth + RLS)
- **Logique avancée / automatisations** : Make.com
- **IA** : OpenAI/Mistral appelés depuis Make ou directement depuis le front
- **Front (v2)** : Next.js + Plasmic (plus tard)

---

## 🎯 Objectif du produit

Créer une plateforme simple mais pro qui permet :

- Multi-entreprises (**multi-tenants**)
- Invitations hiérarchiques : **Admin → Managers → Équipes**
- Fil d’actualité interne (posts, commentaires, likes)
- Projets + tâches (simple)
- Concertations internes + votes
- IA pour :
  - reformuler un message (plus apaisé)
  - suggérer un message de reconnaissance
  - détecter des signaux faibles (stress oui/non, conflit potentiel oui/non)

---

## 📦 Modules du MVP

- **Entreprises**
  - Création d’entreprise
  - Rôle Admin

- **Utilisateurs**
  - Auth Supabase
  - Profils liés à une entreprise
  - Rôles : `admin`, `manager`, `member`

- **Invitations**
  - Admin → managers → équipes
  - Lien d’invitation sécurisé (token)
  - Envoi via Make.com (email)

- **Fil d’actualité**
  - Posts
  - Commentaires
  - Likes simples

- **Projets & Tâches**
  - Projets par entreprise
  - Tâches par projet
  - Vue “Mes tâches”

- **Concertations / Votes**
  - Création de consultations internes
  - Votes pour/contre
  - Résultats simples (compteurs / %)

- **IA**
  - Reformulation de message
  - Suggestion de message de reconnaissance
  - Détection de signaux faibles (tag sur un message)

---

## 🗂 Structure du repo

- `docs/`
  - `architecture.md` : architecture (WeWeb ↔ Supabase ↔ Make ↔ IA)
  - `roadmap.md` : étapes (MVP, V1.1…)

- `supabase/`
  - `schema.sql` : définition des tables
  - `policies.sql` : règles de sécurité (RLS)

- `make/`
  - `scenarios.md` : description des scénarios Make (invitation, IA, notifications…)

- `frontend/`
  - `weweb-notes.md` : pages et logique WeWeb
  - `later-next-plasmic.md` : notes pour la future refonte (Next.js + Plasmic)

---

## 🚀 Comment démarrer (MVP v1 avec WeWeb)

1. Créer un projet **Supabase**.
2. Exécuter le contenu de `supabase/schema.sql` dans l’éditeur SQL Supabase.
3. Activer et configurer les règles RLS avec `supabase/policies.sql`.
4. Créer un projet **WeWeb**.
5. Connecter WeWeb à Supabase (URL + anon key).
6. Créer les pages :
   - Auth (login / signup)
   - Espace appli (fil d’actualité, projets/tâches, concertations…)
