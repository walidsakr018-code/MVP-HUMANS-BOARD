# WeWeb – Notes & structure (HUMANS BOARD)

## Pages prévues (MVP)

- `/login`
- `/signup` ou page d’activation via invitation
- `/app`
  - `/app/feed` : fil d’actualité
  - `/app/projects` : projets
  - `/app/tasks` : mes tâches
  - `/app/consultations` : concertations + votes
  - `/app/dashboard` : tableau de bord

## Connexions Supabase

- Auth :
  - login, signup (via invitation), logout
- Tables utilisées :
  - companies
  - user_profiles
  - invitations
  - (plus tard) posts, comments, projects, tasks, consultations, votes

## Intégrations IA (via Make)

- Bouton “Reformuler” sur le formulaire de post
- Bouton “Message de reconnaissance”
- Analyse automatique des posts (signaux faibles)
