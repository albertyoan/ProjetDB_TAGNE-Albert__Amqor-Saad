use football;

set @date_ref = '2026-02-15';


-- A1. Catalogue boutique : articles de merchandising vendus entre 20 et 50 €,
--     du plus cher au moins cher.                         [between, order by]
select libelle_offre, prix_offre
from offre
where type_offre = 'merchandising'
  and prix_offre between 20 and 50
order by prix_offre desc, libelle_offre;

-- A2. Moyens de paiement réellement utilisés par les clients.     [distinct]
select distinct moyen_paiement
from achat
order by moyen_paiement;

-- A3. Clients dont l'adresse email est un nom de domaine en .fr
--     (adresses professionnelles, à cibler pour les offres entreprises).
--                                                                    [like]
select id_client, nom_client, email_client
from client
where email_client like '%.fr'
order by nom_client;

-- A4. Équipes adverses dont le sigle fait exactement 3 caractères.
--                                                       [masque like '___']
select id_equipe, nom_equipe
from equipe
where id_equipe like '___'
order by id_equipe;

-- A5. Calendrier des matchs contre les trois « grosses affiches »
--     (Marseille, Paris, Monaco), par date.                              [in]
select id_match, date_match, lieu_match, id_equipe
from match_
where id_equipe in ('om', 'psg', 'asm')
order by date_match;

-- A6. Achats de la rentrée (août à octobre 2025) payés par carte bancaire,
--     du plus récent au plus ancien.                      [between, order by]
select id_achat, date_achat, id_client
from achat
where date_achat between '2025-08-01' and '2025-10-31'
  and moyen_paiement = 'carte bancaire'
order by date_achat desc;


-- =====================================================================
-- B. AGRÉGATS (group by, having)
-- =====================================================================

-- B1. Chiffre d'affaires par famille de revenus, de la plus rentable à la
--     moins rentable.                                     [sum, group by]
select o.type_offre,
       sum(s.quantite * o.prix_offre) as chiffre_affaires,
       sum(s.quantite)                as nb_articles
from services s
join offre o on o.id_offre = s.id_offre
group by o.type_offre
order by chiffre_affaires desc;

-- B2. Matchs ayant vendu au moins 3 billets (matchs les plus suivis).
--                                                  [count, group by, having]
select id_match, count(*) as nb_billets
from billet
group by id_match
having count(*) >= 3
order by nb_billets desc;

-- B3. Clients ayant dépensé plus de 300 € au total (clients à fidéliser).
--                                                    [sum, group by, having]
select a.id_client, sum(s.quantite * o.prix_offre) as total_depense
from achat a
join services s on s.id_achat = a.id_achat
join offre o    on o.id_offre = s.id_offre
group by a.id_client
having sum(s.quantite * o.prix_offre) > 300
order by total_depense desc;

-- B4. Nombre d'achats et délai moyen de paiement (en jours) par moyen de
--     paiement.                                     [count, avg, group by]
select moyen_paiement,
       count(*)                                  as nb_achats,
       round(avg(datediff(date_paiement, date_achat)), 1) as delai_moyen_jours
from achat
group by moyen_paiement
order by nb_achats desc;

-- B5. Capacité de chaque tribune (nombre de places), seulement pour les
--     tribunes d'au moins 10 places.                [count, group by, having]
select id_stade, num_tribune, count(*) as nb_places
from place
group by id_stade, num_tribune
having count(*) >= 10
order by id_stade, num_tribune;

-- B6. Répartition du capital par type d'actionnaire, en nombre d'actions et
--     en pourcentage du capital (100 000 actions).        [sum, group by]
select type_actionnaire,
       count(*)                                   as nb_actionnaires,
       sum(nombre_d_action)                       as nb_actions,
       round(sum(nombre_d_action) * 100 / 100000, 1) as pct_capital
from actionnaire
group by type_actionnaire;


-- =====================================================================
-- C. JOINTURES (internes, externes, simples, multiples)
-- =====================================================================

-- C1. Calendrier complet : adversaire et stade de chaque match. Les matchs
--     à l'extérieur n'ont pas de stade : jointure externe pour les garder.
--                                       [jointure interne + left join]
select m.id_match, m.date_match, m.lieu_match, e.nom_equipe,
       coalesce(st.nom_stade, '(chez l''adversaire)') as stade
from match_ m
join equipe e     on e.id_equipe = m.id_equipe
left join stade st on st.id_stade = m.id_stade
order by m.date_match;

-- C2. Jointure simple : achats payés plus de 3 jours après la commande,
--     avec le nom du client (suivi des encaissements).   [jointure simple]
select a.id_achat, c.nom_client, a.date_achat, a.date_paiement,
       datediff(a.date_paiement, a.date_achat) as jours_attente
from achat a
join client c on c.id_client = a.id_client
where datediff(a.date_paiement, a.date_achat) > 3
order by jours_attente desc;

-- C3. Détail de chaque billet vendu : supporteur, adversaire, date,
--     tribune et place.                               [jointure multiple]
select su.prenom_client, c.nom_client, e.nom_equipe, m.date_match,
       b.id_stade, b.num_tribune, b.num_place
from billet b
join achat a        on a.id_achat  = b.id_achat
join client c       on c.id_client = a.id_client
join supporteurs su on su.id_client = c.id_client
join match_ m       on m.id_match  = b.id_match
join equipe e       on e.id_equipe = m.id_equipe
order by m.date_match, b.num_tribune, b.num_place;

-- C4. Toutes les entreprises clientes avec leurs contrats, y compris celles
--     qui n'en ont signé aucun.                    [left join, jointure multiple]
select c.nom_client, en.siret_entreprise, ct.type_contrat,
       ct.montant_contrat, ct.date_debut_contrat, ct.date_fin_contrat
from entreprise en
join client c        on c.id_client  = en.id_client
left join contrat ct on ct.id_client = en.id_client
order by c.nom_client, ct.date_debut_contrat;

-- C5. Places encore libres pour le match contre le PSG (match 9) dans la
--     tribune Est (tribune 3) : la place n'a pas de billet pour ce match.
--                                                [left join ... is null]
select p.id_stade, p.num_tribune, p.num_place
from place p
left join billet b on b.id_stade    = p.id_stade
                  and b.num_tribune = p.num_tribune
                  and b.num_place   = p.num_place
                  and b.id_match    = 9
where p.id_stade = 1
  and p.num_tribune = 3
  and b.id_achat is null
order by p.num_place;

-- C6. [REQUÊTE ÉTUDIÉE DANS LE README - plan d'exécution]
--     Clients et dates d'achat des billets vendus pour les matchs contre le
--     PSG.  Opérateurs : sélection (id_equipe = 'psg'), 2 jointures,
--     projection (id_client, date_achat).             [jointure multiple]
select a.id_client, a.date_achat
from match_ m
join billet b on b.id_match = m.id_match
join achat a  on a.id_achat = b.id_achat
where m.id_equipe = 'psg';


-- =====================================================================
-- D. REQUÊTES IMBRIQUÉES ((not) in, (not) exists, any, all)
-- =====================================================================

-- D1. Supporteurs qui n'ont jamais acheté de billet (à relancer avec une
--     offre billetterie).                                          [not in]
select su.id_client, su.prenom_client, c.nom_client
from supporteurs su
join client c on c.id_client = su.id_client
where su.id_client not in (select a.id_client
                           from achat a
                           join billet b on b.id_achat = a.id_achat)
order by c.nom_client;

-- D2. Clients ayant acheté au moins une offre « droit d'image ».       [in]
select id_client, nom_client
from client
where id_client in (select a.id_client
                    from achat a
                    where a.id_achat in (select s.id_achat
                                         from services s
                                         join offre o on o.id_offre = s.id_offre
                                         where o.type_offre = 'droit d''image'));

-- D3. Entreprises ayant réservé au moins une loge VIP.               [exists]
select c.id_client, c.nom_client
from entreprise en
join client c on c.id_client = en.id_client
where exists (select *
              from achat a
              join services s on s.id_achat = a.id_achat
              join offre o    on o.id_offre = s.id_offre
              where a.id_client = en.id_client
                and o.libelle_offre like 'loge%');

-- D4. Entreprises sans aucun contrat en cours à la date du bilan
--     (partenaires à relancer).                                 [not exists]
select c.id_client, c.nom_client
from entreprise en
join client c on c.id_client = en.id_client
where not exists (select *
                  from contrat ct
                  where ct.id_client = en.id_client
                    and @date_ref between ct.date_debut_contrat and ct.date_fin_contrat);

-- D5. Article(s) le(s) plus cher(s) de la boutique : prix supérieur ou égal
--     à celui de tous les articles de merchandising.                  [all]
select libelle_offre, prix_offre
from offre
where type_offre = 'merchandising'
  and prix_offre >= all (select prix_offre
                         from offre
                         where type_offre = 'merchandising');

-- D6. Partenaires majeurs : contrats dont le montant dépasse celui d'au
--     moins un contrat de droits TV.                                    [any]
select c.nom_client, ct.type_contrat, ct.montant_contrat
from contrat ct
join client c on c.id_client = ct.id_client
where ct.montant_contrat > any (select montant_contrat
                                from contrat
                                where type_contrat = 'droits tv')
order by ct.montant_contrat desc;

-- D7. Supporteurs dont la dépense totale dépasse la dépense moyenne des
--     supporteurs.                          [sous-requête dans le having]
select a.id_client, sum(s.quantite * o.prix_offre) as total_depense
from achat a
join services s on s.id_achat = a.id_achat
join offre o    on o.id_offre = s.id_offre
where a.id_client in (select id_client from supporteurs)
group by a.id_client
having sum(s.quantite * o.prix_offre) >
       (select avg(t.total)
        from (select a2.id_client, sum(s2.quantite * o2.prix_offre) as total
              from achat a2
              join services s2 on s2.id_achat = a2.id_achat
              join offre o2    on o2.id_offre = s2.id_offre
              where a2.id_client in (select id_client from supporteurs)
              group by a2.id_client) t)
order by total_depense desc;
