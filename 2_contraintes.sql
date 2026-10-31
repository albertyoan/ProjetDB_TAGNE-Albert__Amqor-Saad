use football;

alter table client
   add constraint ck_client_email check (email_client like '%_@_%._%'),
   add constraint ck_client_nom check (char_length(trim(nom_client)) > 0);

alter table supporteurs
   add constraint ck_supporteur_prenom check (char_length(trim(prenom_client)) > 0);


alter table entreprise
   add constraint uq_entreprise_siret unique (siret_entreprise),
   add constraint ck_entreprise_siret check (siret_entreprise regexp '^[0-9]{14}$');

alter table offre
   add constraint ck_offre_type check (type_offre in ('billetterie', 'merchandising', 'abonnement', 'droit d''image')),
   add constraint ck_offre_prix check (prix_offre >= 0),
   add constraint uq_offre_libelle unique (libelle_offre),
   add constraint ck_offre_saison_format check (saison regexp '^[0-9]{4}-[0-9]{4}$'),
   add constraint ck_offre_saison_suivie check (cast(right(saison, 4) as unsigned) = cast(left(saison, 4) as unsigned) + 1);

alter table achat
   add constraint ck_achat_moyen check (moyen_paiement in ('carte bancaire', 'especes', 'virement', 'prelevement', 'cheque')),
   add constraint ck_achat_dates check (date_paiement >= date_achat);

alter table services
   alter quantite set default 1,
   add constraint ck_services_quantite check (quantite between 1 and 999);

alter table contrat
   add constraint ck_contrat_type check (type_contrat in ('sponsoring', 'droits tv')),
   add constraint ck_contrat_montant check (montant_contrat > 0),
   add constraint ck_contrat_dates check (date_fin_contrat > date_debut_contrat);

alter table actionnaire
   add constraint ck_actionnaire_type check (type_actionnaire in ('personne physique', 'societe')),
   add constraint ck_actionnaire_nb check (nombre_d_action is not null and nombre_d_action > 0);

alter table stade add constraint uq_stade_nom unique (nom_stade);
alter table equipe add constraint uq_equipe_nom unique (nom_equipe);

alter table tribune add constraint ck_tribune_num check (num_tribune > 0);
alter table place add constraint ck_place_num check (num_place > 0);

alter table match_
   add constraint ck_match_lieu check (lieu_match in ('domicile', 'exterieur')),
   add constraint uq_match_date unique (date_match);

alter table billet add constraint uq_billet_place_match unique (id_match, id_stade, num_tribune, num_place);