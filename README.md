# Mini-projet Bases de données — Gestion des revenus d'un club de football

**Module :** TI503N – Bases de données 1 : Concepts de base
**Binôme :** TAGNE Albert — AMQOR Saad

## Sommaire

- [Présentation du projet](#présentation-du-projet)
- [Partie 1 — Étape 1 : Analyse des besoins](#partie-1--étape-1--analyse-des-besoins)
  - [1. Domaine choisi](#1-domaine-choisi)
  - [2. Démarche](#2-démarche)
  - [3. Prompt final](#3-prompt-final)
  - [4. Règles de gestion obtenues](#4-règles-de-gestion-obtenues)
  - [5. Dictionnaire de données obtenu](#5-dictionnaire-de-données-obtenu)
  - [6. Analyse du résultat](#6-analyse-du-résultat)
- [Partie 1 — Étape 2 : MCD](#partie-1--étape-2--mcd)

## Présentation du projet

Ce projet applique la méthode MERISE pour concevoir et développer la base de données d'un
**club de football professionnel**. La base doit permettre de gérer les **revenus commerciaux**
du club (billetterie, abonnements, boutique, loges, sponsoring, droits TV) ainsi que la
**répartition de son capital** entre ses actionnaires.

Organisation du dépôt :

| Fichier / dossier | Contenu |
|---|---|
| `README.md` | Documentation du projet |
| `prompts/` | Les prompts successifs envoyés à l'IA et ses réponses |
| `mcd/` | Fichier source et image du MCD *(étape 2)* |

---

## Partie 1 — Étape 1 : Analyse des besoins

### 1. Domaine choisi

Nous travaillons pour une **entreprise** : un club de football professionnel de Ligue 1 constitué
en société anonyme sportive, sur le modèle de l'Olympique Lyonnais, du Paris Saint-Germain ou de
l'Olympique de Marseille.

Le club tire ses revenus de deux types de clients :
- les **particuliers** (supporters), qui achètent des billets, des abonnements et des articles de la boutique ;
- les **entreprises**, qui achètent des loges et signent des contrats de sponsoring ou de droits TV.

Le capital du club est réparti entre plusieurs **actionnaires**.

### 2. Démarche

Nous avons utilisé le prompt de base fourni, construit selon le framework **RICARDO**, en
complétant les parties « Contexte » et « Références ».

| Version | Fichier | Résultat |
|---|---|---|
| v0 | [`prompts/prompt_v0_binome.txt`](prompts/prompt_v0_binome.txt) | Premier essai rédigé librement, sans suivre la structure du prompt de base imposée → abandonné |
| v1 | [`prompts/prompt_v1.txt`](prompts/prompt_v1.txt) | Réponse non conforme (voir ci-dessous) → prompt corrigé |
| v2 | [`prompts/prompt_v2.txt`](prompts/prompt_v2.txt) | Réponse retenue |

**Problèmes relevés dans la réponse au prompt v1 :**
- Les règles décrivaient les actionnaires, les contrats de sponsoring et les droits TV, mais le
  dictionnaire ne contenait **aucune donnée** sur ces notions.
- Certaines règles citaient les sources (« Deloitte classe… », « les offres de l'OL montrent… »)
  au lieu de décrire le fonctionnement du club.
- Plusieurs règles relevaient de l'analyse financière (catégories de revenus Deloitte
  *matchday / broadcasting / commercial*) et non de données à stocker.
- L'IA a ajouté des paragraphes de commentaire qui n'étaient pas demandés.

**Modifications apportées pour le prompt v2 :**
1. Liste précise des domaines sur lesquels portent les données (offres, contrats de sponsoring
   et de droits TV, actionnaires et nombre d'actions).
2. Retrait de la référence au rapport Deloitte, qui orientait l'IA vers l'analyse financière.
3. Ajout de la consigne : « Ne cite pas tes sources dans les règles de gestion. »
4. Ajout de la consigne : « Chaque information évoquée dans les règles de gestion doit avoir au
   moins une donnée correspondante dans le dictionnaire. »
5. Ajout de la consigne : « sans aucun commentaire supplémentaire ».

### 3. Prompt final

> Tu travailles dans le domaine du football professionnel. Ton entreprise a comme activité de gérer un club de football professionnel de Ligue 1, constitué en société anonyme sportive, et en particulier l'ensemble de ses revenus commerciaux ainsi que la répartition de son capital. C'est une entreprise comme l'Olympique Lyonnais, le Paris Saint-Germain ou l'Olympique de Marseille. Les données ont été collectées sur : les clients du club (supporters particuliers et entreprises), les offres vendues (billets de match, abonnements de saison, articles de la boutique, loges), les achats et leurs paiements, les matchs à domicile et le stade (tribunes et places), les contrats de sponsoring et de droits TV signés avec des entreprises, ainsi que les actionnaires du club et le nombre d'actions qu'ils détiennent. Inspire-toi des sites web suivants : https://www.ol.fr (pages billetterie, abonnements, boutique et hospitalités) ; le site investisseurs d'OL Groupe (répartition du capital).
>
> Ton entreprise veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c'est-à-dire de collecter les besoins auprès de l'entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu'il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données.
>
> D'abord, établis les règles de gestion des données de ton entreprise, sous la forme d'une liste à puces. Elle doit correspondre aux informations que fournit quelqu'un qui connaît le fonctionnement de l'entreprise, mais pas comment se construit un système d'information. Ne cite pas tes sources dans les règles de gestion.
>
> Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite. Chaque information évoquée dans les règles de gestion doit avoir au moins une donnée correspondante dans le dictionnaire.
>
> Fournis donc les règles de gestion et le dictionnaire de données, sans aucun commentaire supplémentaire.

### 4. Règles de gestion obtenues

*Réponse de l'IA au prompt v2, reproduite sans modification.*

- Le club commercialise ses offres auprès de clients particuliers et de clients entreprises.
- Un client particulier est identifié par son nom, son prénom, sa date de naissance et ses coordonnées.
- Un client entreprise est identifié par sa raison sociale, son numéro SIREN, son adresse et ses coordonnées.
- Un client peut effectuer plusieurs achats auprès du club.
- Un achat est effectué à une date donnée et possède un montant total.
- Un achat peut contenir plusieurs offres ou plusieurs exemplaires d'une même offre.
- Le club commercialise plusieurs types d'offres : billets de match, abonnements de saison, articles de boutique et prestations d'hospitalité ou de loge.
- Chaque offre possède un nom, une catégorie, une description et un prix.
- Une offre peut être commercialisée pendant une période déterminée.
- Un billet permet à un client d'assister à un match à domicile déterminé.
- Un abonnement de saison permet à un client d'accéder à plusieurs matchs à domicile pendant une saison.
- Un article de boutique possède un prix de vente et une quantité disponible.
- Une prestation de loge ou d'hospitalité correspond à un espace ou à un service proposé dans le stade.
- Les matchs à domicile sont disputés dans le stade du club.
- Chaque match possède une date, une heure, une compétition et une équipe adverse.
- Le stade est composé de plusieurs tribunes.
- Chaque tribune possède plusieurs places.
- Chaque place possède un numéro et appartient à une tribune.
- Une place peut être commercialisée pour un match donné à un tarif déterminé.
- Pour un même match, une même place ne peut être attribuée qu'à un seul client.
- Un paiement correspond au règlement total ou partiel d'un achat.
- Chaque paiement possède une date, un montant et un moyen de paiement.
- Un client entreprise peut signer un ou plusieurs contrats de sponsoring avec le club.
- Un contrat de sponsoring possède une date de début, une date de fin et un montant.
- Un contrat de sponsoring peut prévoir différentes prestations ou contreparties commerciales.
- Le club peut signer avec des entreprises des contrats portant sur les droits de diffusion télévisuelle de ses matchs ou compétitions.
- Un contrat de droits TV possède une période de validité et un montant contractuel.
- Les revenus commerciaux du club comprennent notamment les revenus de billetterie, d'abonnements, de boutique, d'hospitalité et de sponsoring.
- Les revenus liés aux droits TV constituent des revenus provenant de la diffusion des matchs ou des compétitions.
- Le capital de la société sportive est réparti entre plusieurs actionnaires.
- Un actionnaire peut être une personne physique ou une personne morale.
- Un actionnaire détient un nombre déterminé d'actions du club.
- La participation d'un actionnaire dans le capital est déterminée à partir du nombre d'actions qu'il détient.
- La répartition du capital doit pouvoir être connue pour une période ou une date donnée.

### 5. Dictionnaire de données obtenu

*Réponse de l'IA au prompt v2, reproduite sans modification.*

| N° | Signification de la donnée | Type | Taille |
|---|---|---|---|
| 1 | Identifiant du client | Numérique entier | 10 chiffres |
| 2 | Type de client | Alphanumérique | 15 caractères |
| 3 | Nom du client particulier | Alphabétique | 50 caractères |
| 4 | Prénom du client particulier | Alphabétique | 50 caractères |
| 5 | Date de naissance du client | Date | 10 caractères |
| 6 | Raison sociale de l'entreprise | Alphanumérique | 100 caractères |
| 7 | Numéro SIREN de l'entreprise | Numérique | 9 chiffres |
| 8 | Adresse du client ou de l'entreprise | Alphanumérique | 150 caractères |
| 9 | Adresse e-mail | Alphanumérique | 100 caractères |
| 10 | Numéro de téléphone | Alphanumérique | 20 caractères |
| 11 | Identifiant de l'offre | Numérique entier | 10 chiffres |
| 12 | Nom de l'offre | Alphanumérique | 100 caractères |
| 13 | Catégorie de l'offre | Alphanumérique | 30 caractères |
| 14 | Description de l'offre | Alphanumérique | 255 caractères |
| 15 | Prix de l'offre | Numérique décimal | 10 chiffres |
| 16 | Date de début de commercialisation de l'offre | Date | 10 caractères |
| 17 | Date de fin de commercialisation de l'offre | Date | 10 caractères |
| 18 | Identifiant de l'achat | Numérique entier | 10 chiffres |
| 19 | Date de l'achat | Date | 10 caractères |
| 20 | Quantité achetée | Numérique entier | 5 chiffres |
| 21 | Montant total de l'achat | Numérique décimal | 12 chiffres |
| 22 | Identifiant du paiement | Numérique entier | 10 chiffres |
| 23 | Date du paiement | Date | 10 caractères |
| 24 | Montant du paiement | Numérique décimal | 12 chiffres |
| 25 | Moyen de paiement | Alphanumérique | 30 caractères |
| 26 | Identifiant du match | Numérique entier | 10 chiffres |
| 27 | Date et heure du match | Date/heure | 16 caractères |
| 28 | Nom de l'équipe adverse | Alphabétique | 100 caractères |
| 29 | Nom de la compétition | Alphanumérique | 50 caractères |
| 30 | Nom du stade | Alphanumérique | 100 caractères |
| 31 | Nom de la tribune | Alphanumérique | 50 caractères |
| 32 | Numéro de la place | Alphanumérique | 10 caractères |
| 33 | Tarif de la place pour le match | Numérique décimal | 10 chiffres |
| 34 | Type de contrat commercial | Alphanumérique | 20 caractères |
| 35 | Nombre d'actions détenues par l'actionnaire | Numérique entier | 15 chiffres |

### 6. Analyse du résultat

#### Conformité au prompt

| Exigence du prompt | Respectée ? | Remarque |
|---|---|---|
| Règles de gestion sous forme de liste à puces | Oui | |
| Règles formulées par quelqu'un du métier | Oui | Plus aucune source citée |
| Dictionnaire avec signification, type et taille | Oui | Une colonne N° a été ajoutée, sans gravité |
| Entre 25 et 35 données | Oui | 35 données (maximum) |
| Dictionnaire sans a priori de modélisation | Oui | Aucune table ni clé mentionnée |
| Aucun commentaire supplémentaire | Oui | |
| Chaque information des règles présente dans le dictionnaire | **Non** | Voir ci-dessous |

#### Données manquantes

Certaines informations décrites dans les règles de gestion n'ont pas de donnée correspondante
dans le dictionnaire :

| Règle concernée | Donnée manquante |
|---|---|
| « Un contrat de sponsoring possède une date de début, une date de fin et un montant » | Date de début, date de fin et montant du contrat |
| « Un actionnaire peut être une personne physique ou une personne morale » | Nom de l'actionnaire, type d'actionnaire |
| « Un article de boutique possède un prix de vente et une quantité disponible » | Quantité disponible en stock |
| « Un abonnement de saison permet […] pendant une saison » | Saison |

L'IA ayant atteint le maximum de 35 données, une nouvelle soumission du prompt n'aurait pas
permis de les ajouter. Nous avons donc **conservé cette réponse** et nous **ajouterons ces
données lors de la conception du MCD** (étape 2), comme l'énoncé l'autorise.

#### Autres remarques

- Le **montant total de l'achat** (n°21) peut être calculé à partir des quantités et des prix :
  c'est une donnée calculée, à justifier lors de la modélisation.
- L'**adresse** (n°8) n'est pas atomique (rue, code postal, ville).
- Le **type de client** (n°2) fait doublon avec la distinction particulier / entreprise.
- La **taille des dates** est exprimée en caractères, alors qu'une date a un format fixe.

---

## Partie 1 — Étape 2 : MCD

*À venir.*
