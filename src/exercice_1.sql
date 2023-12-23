-- Exercice 1 - Creation des tablespaces et des tables.

-- 1 - Créer le tablespace tbs_professeur contenant uniquement le fichier Professeurfile.dbf.
CREATE TABLESPACE tbs_professeur DATAFILE 'Professeurfile.dbf' SIZE 10M AUTOEXTEND ON;

-- 2 - Créer le tablespace tbs_etudiant.
CREATE TABLESPACE tbs_etudiant DATAFILE 'etudiantsnotes.dbf' SIZE 10M AUTOEXTEND ON;

-- 3 - Ajouter le fichier Professeurstatuts.dbf au tablespace tbs_professeur.
ALTER TABLESPACE tbs_professeur ADD DATAFILE 'Professeurstatuts.dbf' SIZE 10M;

-- 4 - Modifier la taille du fichier etudiantsnotes.dbf å 50M.
ALTER DATABASE DATAFILE 'etudiantsnotes.dbf' RESIZE 50M;

-- 5 - Créer la table professeur en l'associant au tablespace tbs_professeur.
CREATE TABLE Professeur (
    CIN NUMBER, 
    NOM VARCHAR2(50), 
    PRENOM VARCHAR2(50), 
    SPECIALITE VARCHAR2(50), 
    GRADE VARCHAR2(50), 
    ANNEE_DE_RECRUTEMENT NUMBER, 
    SALAIRE NUMBER
) TABLESPACE tbs_professeur;

-- 6 - Créer la table etudiant en l'associant au tablespace tbs_etudiant.
CREATE TABLE Etudiant (
    ID NUMBER, 
    NOM VARCHAR2(50), 
    PRENOM VARCHAR2(50), 
    ADRESSE VARCHAR2(100), 
    "OPTION" VARCHAR2(50), 
    MOYENNE NUMBER
) TABLESPACE tbs_etudiant;

-- 7 - Insérer les enregistrements suivants dans la table etudiant.
INSERT INTO Etudiant (ID, NOM, PRENOM, ADRESSE, "OPTION", MOYENNE) VALUES (12568, 'Mohammed', 'Yassine', 'Rue 2 Rabat', 'SMIA', 15);
INSERT INTO Etudiant (ID, NOM, PRENOM, ADRESSE, "OPTION", MOYENNE) VALUES (6598, 'Ahmed', 'Kamal', 'Avenue 10 N 15 Casablanca', 'SMI', 10);
INSERT INTO Etudiant (ID, NOM, PRENOM, ADRESSE, "OPTION", MOYENNE) VALUES (98955, 'Salim', 'Sara', 'Avenue 18 N 2 Tanger', 'SMA', 16);
COMMIT;

-- 8 - Désactiver le tablespace tbs_etudiant.
ALTER TABLESPACE tbs_etudiant OFFLINE;

-- 9 - Insérer l'enregistrement suivant dans la table etudiant, quel message obtiendrez-vous ?
INSERT INTO Etudiant (ID, NOM, PRENOM, ADRESSE, "OPTION", MOYENNE) VALUES (985614, 'Adil', 'Rachid', 'Rue 22 Rabat', 'SMP', 9)
COMMIT;
-- Erreur affiché

-- 10 - Corriger le probléme et réinsérer I'enregistrement en question.
ALTER TABLESPACE tbs_etudiant ONLINE;
INSERT INTO Etudiant (ID, NOM, PRENOM, ADRESSE, "OPTION", MOYENNE) VALUES (985614, 'Adil', 'Rachid', 'Rue 22 Rabat', 'SMP', 9);
COMMIT;

-- 11 - Afficher la liste des tablespaces.
SELECT TABLESPACE_NAME FROM DBA_TABLESPACES;