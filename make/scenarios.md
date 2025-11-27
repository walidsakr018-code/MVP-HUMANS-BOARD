# Scénarios Make – HUMANS BOARD (MVP)

## 1. Envoi d’invitation

Déclencheur : nouveau row dans `invitations` (Supabase webhook ou polling).

Étapes :
1. Récupérer l’invitation (email, role, token).
2. Générer le lien d’invitation :  
   `https://ton-domaine.com/invite?token=...`
3. Envoyer un email à `invited_email` avec :
   - nom de l’entreprise
   - rôle prévu
   - lien d’invitation

## 2. IA – Reformulation de message

Déclencheur : appel depuis WeWeb (webhook Make) avec un texte brut.

Étapes :
1. Recevoir le texte original.
2. Appeler OpenAI/Mistral :
   - "Reformule ce message de manière plus apaisée, professionnelle et bienveillante."
3. Retourner le texte reformulé à WeWeb.

## 3. IA – Message de reconnaissance

Déclencheur : appel depuis WeWeb (webhook Make) avec un contexte.

Étapes :
1. Recevoir le contexte (ex : "Pierre a aidé sur le projet X").
2. Appeler OpenAI/Mistral :
   - "Propose un message de reconnaissance court, chaleureux, adapté au contexte suivant : …"
3. Retourner le texte proposé à WeWeb.

## 4. IA – Détection de signaux faibles

Déclencheur : nouveau post ou commentaire.

Étapes :
1. Recevoir le contenu du message.
2. Appeler OpenAI/Mistral :
   - "Analyse ce message et réponds strictement au format JSON : { stress: 'oui/non', conflit: 'oui/non', commentaire: '...'}"
3. Enregistrer le résultat dans Supabase.
4. (Optionnel) Alerter un admin si stress ou conflit = "oui".
