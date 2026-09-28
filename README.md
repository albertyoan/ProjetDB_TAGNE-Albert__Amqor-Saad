# Mini-projet Bases de données — Partie 1
## Étape 1 : Analyse des besoins — Gestion des revenus d'un club de football

---

## 1. Sujet

On souhaite concevoir la base de données servant à gérer les **revenus** d'un club de
football professionnel, ainsi que la répartition de son **capital**.

Le principe central, côté commercial, est simple : un **client achète une ou plusieurs
offres / services** proposés par le club. On distingue deux types de clients :

- **Supporter** — un particulier (personne physique) : il achète des billets de match,
  des articles de la boutique et des abonnements.
- **Client entreprise** — une personne morale : elle souscrit à des droits d'image
  (sponsoring, droits TV) et à des prestations comme les loges.

À côté de cette activité commerciale, le club — constitué en société — compte des
**actionnaires** (personnes physiques ou sociétés) qui détiennent une part de son capital.

Les offres / services couvrent quatre grandes familles de revenus :
- **Billetterie** — vente de billets pour un match précis.
- **Merchandising (boutique)** — vente d'articles dérivés (maillots, écharpes…).
- **Abonnement** — accès à tous les matchs à domicile d'une saison.
- **Droit d'image** — contrats de sponsoring et de droits de diffusion TV.

Chaque achat est réglé par un paiement. Les billets et abonnements sont liés aux matchs
et au stade (composé de tribunes et de places) ; les contrats de droit d'image sont liés
aux clients entreprises.

---

## 2. Acteurs

| Acteur | Rôle |
|--------|------|
| Supporter | Particulier qui achète billets, articles de boutique et abonnements |
| Client entreprise | Personne morale qui souscrit aux droits d'image (sponsoring, droits TV) et aux prestations (loges) |
| Actionnaire | Personne physique ou société qui détient une part du capital du club |
| Service commercial du club | Gère les offres, les ventes, les stocks et les contrats |

---

## 3. Règles métier

1. Un client est soit un **supporter** (particulier), soit un **client entreprise** (personne morale).
2. Chaque client est identifié de façon unique et possède une adresse email unique.
3. Un supporter possède un nom et un prénom ; un client entreprise possède une raison sociale.
4. Un client peut réaliser plusieurs achats ; un achat concerne un seul client.
5. Un achat porte sur une ou plusieurs offres, et une même offre peut être achetée par plusieurs clients.
6. Une offre appartient à un seul type : billetterie, merchandising, abonnement ou droit d'image.
7. Chaque offre possède un libellé et un prix.
8. Un supporter achète des billets, des articles de boutique et des abonnements.
9. Un client entreprise souscrit à des contrats de droit d'image (sponsoring, droits TV) et à des prestations (loges).
10. Un billet donne accès à un match précis et à une place précise du stade : l'achat d'un billet associe un client, un match et une place.
11. Un match oppose le club à une équipe adverse, à une date donnée, à domicile ou à l'extérieur.
12. Un match à domicile se déroule dans un stade.
13. Un stade est composé de plusieurs tribunes ; une tribune appartient à un seul stade.
14. Une tribune contient plusieurs places ; une place est identifiée par son numéro **à l'intérieur** de sa tribune (le numéro seul ne suffit pas à l'identifier).
15. Un abonnement donne accès à tous les matchs à domicile d'une même saison, et est rattaché à une saison (ex : 2025-2026).
16. Un article de boutique possède un nom et un prix, et relève du type merchandising.
17. Un contrat de droit d'image possède un type (sponsoring ou droits TV), un montant, une date de début et une date de fin.
18. Un contrat de droit d'image est signé par un seul client entreprise ; un client entreprise peut signer plusieurs contrats.
19. Chaque achat donne lieu à un paiement (date, moyen de paiement) ; un paiement règle un seul achat.
20. Un **actionnaire** détient une ou plusieurs actions du club ; le capital du club est réparti entre plusieurs actionnaires.
21. Un actionnaire peut être une personne physique ou une société, et est caractérisé par le nombre d'actions qu'il détient.

---

## 4. Dictionnaire de données

| Donnée | Signification | Type | Taille | Exemple | Entité concernée |
|--------|---------------|------|--------|---------|------------------|
| id_client | Identifiant unique du client | INT | 6 | 1024 | Client |
| type_client | Particulier ou entreprise | VARCHAR | 12 | particulier | Client |
| nom_client | Nom du supporter ou raison sociale de l'entreprise | VARCHAR | 100 | Dupont | Client |
| prenom_client | Prénom (supporter uniquement) | VARCHAR | 50 | Marie | Supporter |
| email_client | Adresse email (unique) | VARCHAR | 100 | m.dupont@mail.com | Client |
| id_actionnaire | Identifiant de l'actionnaire | INT | 6 | 12 | Actionnaire |
| nom_actionnaire | Nom de l'actionnaire (personne ou société) | VARCHAR | 100 | Holding Sport SA | Actionnaire |
| nombre_actions | Nombre d'actions du club détenues | INT | 8 | 15000 | Actionnaire |
| id_offre | Identifiant de l'offre / service | INT | 6 | 305 | Offre |
| type_offre | billetterie / merchandising / abonnement / droit d'image | VARCHAR | 20 | billetterie | Offre |
| libelle_offre | Intitulé de l'offre | VARCHAR | 100 | Billet tribune Nord | Offre |
| prix_offre | Prix unitaire de l'offre (€) | DECIMAL | 8,2 | 35.00 | Offre |
| id_achat | Identifiant de l'achat | INT | 8 | 55012 | Achat |
| date_achat | Date de l'achat | DATE | — | 2025-09-20 | Achat |
| quantite | Quantité achetée | INT | 3 | 2 | Achat |
| date_paiement | Date du paiement | DATE | — | 2025-09-20 | Paiement |
| moyen_paiement | Moyen de paiement | VARCHAR | 20 | carte bancaire | Paiement |
| id_match | Identifiant du match | INT | 6 | 42 | Match |
| date_match | Date et heure du match | DATETIME | — | 2025-10-05 21:00 | Match |
| lieu_match | Domicile ou extérieur | VARCHAR | 10 | domicile | Match |
| nom_equipe | Nom d'une équipe (club ou adversaire) | VARCHAR | 50 | Olympique de Marseille | Équipe |
| nom_stade | Nom du stade | VARCHAR | 50 | Groupama Stadium | Stade |
| num_tribune | Numéro ou nom de la tribune | VARCHAR | 20 | Tribune Nord | Tribune |
| num_place | Numéro de la place dans sa tribune | INT | 5 | 148 | Place |
| saison | Saison sportive concernée | VARCHAR | 9 | 2025-2026 | Abonnement |
| nom_article | Nom de l'article de boutique | VARCHAR | 50 | Maillot domicile | Article |
| type_contrat | sponsoring ou droits TV | VARCHAR | 20 | sponsoring | Contrat droit d'image |
| montant_contrat | Montant du contrat (€) | DECIMAL | 12,2 | 5000000.00 | Contrat droit d'image |
| date_debut_contrat | Date de début du contrat | DATE | — | 2025-07-01 | Contrat droit d'image |
| date_fin_contrat | Date de fin du contrat | DATE | — | 2028-06-30 | Contrat droit d'image |
