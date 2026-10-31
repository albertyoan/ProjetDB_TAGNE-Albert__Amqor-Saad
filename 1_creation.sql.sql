DROP DATABASE IF EXISTS football;
CREATE DATABASE football;
USE football;

CREATE TABLE Client(
   Id_client INT,
   nom_client VARCHAR(50) NOT NULL,
   email_client VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_client),
   UNIQUE(email_client)
);

CREATE TABLE Achat(
   Id_achat INT,
   date_achat DATE NOT NULL,
   date_paiement DATE NOT NULL,
   moyen_paiement VARCHAR(50) NOT NULL,
   Id_client INT NOT NULL,
   PRIMARY KEY(Id_achat),
   FOREIGN KEY(Id_client) REFERENCES Client(Id_client)
      ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Offre(
   Id_offre INT,
   type_offre VARCHAR(50) NOT NULL,
   libelle_offre VARCHAR(50) NOT NULL,
   prix_offre DECIMAL(15,2) NOT NULL,
   saison VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_offre)
);

CREATE TABLE Supporteurs(
   Id_client INT,
   unique(Id_client),
   prenom_client VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_client),
   FOREIGN KEY(Id_client) REFERENCES Client(Id_client)
      ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Entreprise(
   Id_client INT,
   unique(Id_client),
   siret_entreprise VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_client),
   FOREIGN KEY(Id_client) REFERENCES Client(Id_client)
      ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Equipe(
   id_equipe VARCHAR(50),
   nom_equipe VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_equipe)
);

CREATE TABLE Stade(
   Id_stade INT,
   nom_stade VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_stade)
);

CREATE TABLE Contrat(
   Id_contrat INT,
   type_contrat VARCHAR(50) NOT NULL,
   montant_contrat DECIMAL(15,2) NOT NULL,
   date_debut_contrat DATE NOT NULL,
   date_fin_contrat DATE NOT NULL,
   Id_client INT NOT NULL,
   PRIMARY KEY(Id_contrat),
   FOREIGN KEY(Id_client) REFERENCES Entreprise(Id_client)
      ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Actionnaire(
   Id_actionnaire INT,
   nom_actionnaire VARCHAR(50) NOT NULL,
   type_actionnaire VARCHAR(50) NOT NULL,
   nombre_d_action INT,
   PRIMARY KEY(Id_actionnaire)
);

CREATE TABLE Tribune(
   Id_stade INT,
   num_tribune INT,
   PRIMARY KEY(Id_stade, num_tribune),
   FOREIGN KEY(Id_stade) REFERENCES Stade(Id_stade)
      ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Place(
   Id_stade INT,
   num_tribune INT,
   num_place INT,
   PRIMARY KEY(Id_stade, num_tribune, num_place),
   FOREIGN KEY(Id_stade, num_tribune) REFERENCES Tribune(Id_stade, num_tribune)
      ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Match_(
   Id_match INT,
   date_match DATETIME NOT NULL,
   lieu_match VARCHAR(50) NOT NULL,
   id_equipe VARCHAR(50) NOT NULL,
   Id_stade INT,
   PRIMARY KEY(Id_match),
   FOREIGN KEY(id_equipe) REFERENCES Equipe(id_equipe)
      ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(Id_stade) REFERENCES Stade(Id_stade)
      ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Billet(
   Id_achat INT,
   Id_stade INT,
   num_tribune INT,
   num_place INT,
   Id_match INT,
   PRIMARY KEY(Id_achat, Id_stade, num_tribune, num_place, Id_match),
   FOREIGN KEY(Id_achat) REFERENCES Achat(Id_achat)
      ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(Id_stade, num_tribune, num_place) REFERENCES Place(Id_stade, num_tribune, num_place)
      ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(Id_match) REFERENCES Match_(Id_match)
      ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Services(
   Id_achat INT,
   Id_offre INT,
   quantite INT NOT NULL,
   PRIMARY KEY(Id_achat, Id_offre),
   FOREIGN KEY(Id_achat) REFERENCES Achat(Id_achat)
      ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(Id_offre) REFERENCES Offre(Id_offre)
      ON DELETE CASCADE ON UPDATE CASCADE
);
