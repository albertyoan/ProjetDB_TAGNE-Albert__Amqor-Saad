use football;
insert into stade (id_stade, nom_stade) values
   (1, 'grand stade du rhone'),
   (2, 'stade municipal de gerland');

insert into tribune (id_stade, num_tribune) values
   (1, 1), (1, 2), (1, 3), (1, 4),
   (2, 1), (2, 2);

insert into place (id_stade, num_tribune, num_place) values
   (1, 1, 1), (1, 1, 2), (1, 1, 3), (1, 1, 4), (1, 1, 5), (1, 1, 6), (1, 1, 7), (1, 1, 8), (1, 1, 9), (1, 1, 10),
   (1, 2, 1), (1, 2, 2), (1, 2, 3), (1, 2, 4), (1, 2, 5), (1, 2, 6), (1, 2, 7), (1, 2, 8), (1, 2, 9), (1, 2, 10),
   (1, 3, 1), (1, 3, 2), (1, 3, 3), (1, 3, 4), (1, 3, 5), (1, 3, 6), (1, 3, 7), (1, 3, 8), (1, 3, 9), (1, 3, 10),
   (1, 4, 1), (1, 4, 2), (1, 4, 3), (1, 4, 4), (1, 4, 5), (1, 4, 6), (1, 4, 7), (1, 4, 8), (1, 4, 9), (1, 4, 10),
   (2, 1, 1), (2, 1, 2), (2, 1, 3), (2, 1, 4), (2, 1, 5),
   (2, 2, 1), (2, 2, 2), (2, 2, 3), (2, 2, 4), (2, 2, 5);

insert into equipe (id_equipe, nom_equipe) values
   ('om',   'olympique de marseille'),
   ('psg',  'paris saint-germain'),
   ('asm',  'as monaco'),
   ('losc', 'losc lille'),
   ('srfc', 'stade rennais'),
   ('ogcn', 'ogc nice'),
   ('rcl',  'rc lens'),
   ('fcn',  'fc nantes');

insert into match_ (id_match, date_match, lieu_match, id_equipe, id_stade) values
   (1,  '2025-08-17 21:00:00', 'domicile',  'om',   1),
   (2,  '2025-08-24 17:00:00', 'exterieur', 'psg',  null),
   (3,  '2025-09-14 15:00:00', 'domicile',  'asm',  1),
   (4,  '2025-09-28 20:45:00', 'exterieur', 'losc', null),
   (5,  '2025-10-19 17:15:00', 'domicile',  'srfc', 1),
   (6,  '2025-11-02 21:00:00', 'domicile',  'ogcn', 2),
   (7,  '2025-11-23 15:00:00', 'exterieur', 'rcl',  null),
   (8,  '2026-01-11 17:00:00', 'domicile',  'fcn',  1),
   (9,  '2026-02-08 20:45:00', 'domicile',  'psg',  1),
   (10, '2026-03-15 15:00:00', 'exterieur', 'om',   null);

insert into client (id_client, nom_client, email_client) values
   (1,  'dupont',              'marie.dupont@mail.com'),
   (2,  'martin',              'lucas.martin@mail.com'),
   (3,  'bernard',             'chloe.bernard@mail.com'),
   (4,  'petit',               'hugo.petit@mail.com'),
   (5,  'robert',              'emma.robert@mail.com'),
   (6,  'richard',             'nathan.richard@mail.com'),
   (7,  'durand',              'lea.durand@mail.com'),
   (8,  'moreau',              'louis.moreau@mail.com'),
   (9,  'laurent',             'ines.laurent@mail.com'),
   (10, 'simon',               'jules.simon@mail.com'),
   (11, 'michel',              'camille.michel@mail.com'),
   (12, 'lefebvre',            'adam.lefebvre@mail.com'),
   (13, 'garcia',              'sarah.garcia@mail.com'),
   (14, 'roux',                'theo.roux@mail.com'),
   (15, 'fournier',            'manon.fournier@mail.com'),
   (16, 'rhone assurances sa', 'partenariats@rhone-assurances.fr'),
   (17, 'volcan energie',      'sponsoring@volcan-energie.fr'),
   (18, 'sport plus medias',   'droits@sportplus-medias.fr'),
   (19, 'lumiere telecom',     'evenements@lumiere-telecom.fr'),
   (20, 'soieries lyonnaises', 'contact@soieries-lyonnaises.fr'),
   (21, 'bouchon traiteur',    'commercial@bouchon-traiteur.fr');

insert into supporteurs (id_client, prenom_client) values
   (1, 'marie'), (2, 'lucas'), (3, 'chloe'), (4, 'hugo'), (5, 'emma'),
   (6, 'nathan'), (7, 'lea'), (8, 'louis'), (9, 'ines'), (10, 'jules'),
   (11, 'camille'), (12, 'adam'), (13, 'sarah'), (14, 'theo'), (15, 'manon');

insert into entreprise (id_client, siret_entreprise) values
   (16, '41235678900012'),
   (17, '52346789000023'),
   (18, '63457890100034'),
   (19, '74568901200045'),
   (20, '85679012300056'),
   (21, '96780123400067');

insert into offre (id_offre, type_offre, libelle_offre, prix_offre, saison) values
   (1,  'billetterie',    'billet tribune nord',                 25.00, '2025-2026'),
   (2,  'billetterie',    'billet tribune sud',                  25.00, '2025-2026'),
   (3,  'billetterie',    'billet tribune est',                  45.00, '2025-2026'),
   (4,  'billetterie',    'billet tribune ouest',                55.00, '2025-2026'),
   (5,  'billetterie',    'loge vip 10 personnes (par match)', 3500.00, '2025-2026'),
   (6,  'merchandising',  'maillot domicile 2025-2026',          90.00, '2025-2026'),
   (7,  'merchandising',  'maillot exterieur 2025-2026',         85.00, '2025-2026'),
   (8,  'merchandising',  'echarpe officielle',                  20.00, '2025-2026'),
   (9,  'merchandising',  'ballon officiel',                     30.00, '2025-2026'),
   (10, 'merchandising',  'casquette du club',                   25.00, '2025-2026'),
   (11, 'abonnement',     'abonnement virage 2025-2026',        290.00, '2025-2026'),
   (12, 'abonnement',     'abonnement laterale 2025-2026',      520.00, '2025-2026'),
   (13, 'abonnement',     'abonnement virage 2026-2027',        310.00, '2026-2027'),
   (14, 'droit d''image', 'pack sponsoring maillot (saison)', 2000000.00, '2025-2026'),
   (15, 'droit d''image', 'pack visibilite panneaux led',      250000.00, '2025-2026'),
   (16, 'droit d''image', 'droits de diffusion tv (saison)',  8000000.00, '2025-2026');

insert into achat (id_achat, date_achat, date_paiement, moyen_paiement, id_client) values
   (1,  '2025-07-05', '2025-07-05', 'carte bancaire', 1),
   (2,  '2025-07-06', '2025-07-06', 'carte bancaire', 2),
   (3,  '2025-07-10', '2025-07-10', 'carte bancaire', 3),
   (4,  '2025-08-01', '2025-08-01', 'carte bancaire', 4),
   (5,  '2025-08-02', '2025-08-02', 'especes',        5),
   (6,  '2025-08-10', '2025-08-10', 'carte bancaire', 6),
   (7,  '2025-08-12', '2025-08-12', 'carte bancaire', 7),
   (8,  '2025-08-15', '2025-08-17', 'virement',       8),
   (9,  '2025-09-01', '2025-09-01', 'carte bancaire', 9),
   (10, '2025-09-05', '2025-09-05', 'carte bancaire', 10),
   (11, '2025-09-10', '2025-09-10', 'carte bancaire', 1),
   (12, '2025-09-12', '2025-09-12', 'carte bancaire', 11),
   (13, '2025-10-01', '2025-10-01', 'carte bancaire', 12),
   (14, '2025-10-10', '2025-10-14', 'cheque',         13),
   (15, '2025-10-15', '2025-10-15', 'carte bancaire', 14),
   (16, '2025-10-25', '2025-10-25', 'carte bancaire', 15),
   (17, '2025-10-28', '2025-10-28', 'carte bancaire', 2),
   (18, '2025-12-20', '2025-12-20', 'carte bancaire', 3),
   (19, '2026-01-05', '2026-01-05', 'carte bancaire', 4),
   (20, '2026-02-01', '2026-02-01', 'carte bancaire', 5),
   (21, '2026-02-02', '2026-02-09', 'cheque',         6),
   (22, '2026-05-20', '2026-06-01', 'prelevement',    7),
   (23, '2026-05-22', '2026-05-22', 'carte bancaire', 9),
   (24, '2025-07-01', '2025-07-15', 'virement',       16),
   (25, '2025-07-01', '2025-07-31', 'virement',       18),
   (26, '2025-08-01', '2025-08-20', 'virement',       17),
   (27, '2025-08-10', '2025-08-12', 'virement',       19),
   (28, '2025-11-01', '2025-11-05', 'virement',       20),
   (29, '2026-01-15', '2026-02-20', 'virement',       21),
   (30, '2026-02-01', '2026-02-03', 'virement',       19);

insert into services (id_achat, id_offre, quantite) values
   (1, 11, 1), (1, 6, 1),
   (2, 12, 1),
   (3, 11, 1), (3, 8, 2),
   (4, 1, 2),
   (5, 3, 1), (5, 8, 1),
   (6, 4, 2),
   (7, 2, 3),
   (8, 6, 2), (8, 9, 1),
   (9, 1, 1),
   (10, 3, 2),
   (11, 4, 1), (11, 10, 1),
   (12, 7, 1),
   (13, 2, 2),
   (14, 6, 1), (14, 8, 1), (14, 10, 2),
   (15, 1, 1),
   (16, 3, 1),
   (17, 4, 2),
   (18, 6, 1), (18, 7, 1),
   (19, 1, 2),
   (20, 3, 2),
   (21, 9, 2),
   (22, 13, 1),
   (23, 13, 1),
   (24, 14, 1),
   (25, 16, 1),
   (26, 15, 1),
   (27, 5, 1),
   (28, 5, 2), (28, 15, 1),
   (29, 5, 1),
   (30, 5, 1);

insert into billet (id_achat, id_stade, num_tribune, num_place, id_match) values
   -- match 1 (om, stade 1)
   (4,  1, 1, 1, 1), (4,  1, 1, 2, 1),
   (5,  1, 3, 5, 1),
   (6,  1, 4, 3, 1), (6, 1, 4, 4, 1),
   (7,  1, 2, 1, 1), (7, 1, 2, 2, 1), (7, 1, 2, 3, 1),

   -- match 3 (monaco, stade 1)
   (9,  1, 1, 5, 3),
   (10, 1, 3, 1, 3), (10, 1, 3, 2, 3),
   (11, 1, 4, 1, 3),

   -- match 5 (rennes, stade 1)
   (13, 1, 2, 4, 5), (13, 1, 2, 5, 5),
   (15, 1, 1, 6, 5),

   -- match 6 (nice, stade 2)
   (16, 2, 1, 1, 6),
   (17, 2, 2, 2, 6), (17, 2, 2, 3, 6),

   -- match 8 (nantes, stade 1)
   (19, 1, 1, 1, 8), (19, 1, 1, 2, 8),

   -- match 9 (psg, stade 1)
   (20, 1, 3, 5, 9), (20, 1, 3, 6, 9);

insert into contrat (id_contrat, type_contrat, montant_contrat, date_debut_contrat, date_fin_contrat, id_client) values
   (1, 'sponsoring', 2000000.00, '2025-07-01', '2028-06-30', 16),
   (2, 'droits tv',  8000000.00, '2025-07-01', '2026-06-30', 18),
   (3, 'sponsoring',  250000.00, '2025-08-01', '2026-06-30', 17),
   (4, 'sponsoring',  500000.00, '2024-07-01', '2025-06-30', 20),
   (5, 'sponsoring',  300000.00, '2025-11-01', '2027-06-30', 20),
   (6, 'droits tv',  1500000.00, '2026-07-01', '2029-06-30', 18);

insert into actionnaire (id_actionnaire, nom_actionnaire, type_actionnaire, nombre_d_action) values
   (1, 'rhone sport holding',               'societe',           45000),
   (2, 'fonds lumiere capital',             'societe',           20000),
   (3, 'pierre lambert',                    'personne physique', 12000),
   (4, 'investissements du confluent',      'societe',           10000),
   (5, 'sophie marchand',                   'personne physique',  5000),
   (6, 'union des supporters actionnaires', 'societe',            3000),
   (7, 'karim benali',                      'personne physique',  2000);