
--on se place sur la bonne BDD
USE [Parc_auto]

GO

--On insert les données dans les tables
BEGIN
	IF NOT EXISTS (
		SELECT TOP 1 [Id_modele]
		FROM [dbo].[Modele_MOD]
	)

    INSERT INTO [Parc_auto].[dbo].[Modele_MOD] ([marque_vehicule], [modele_vehicule], [poids_vehicule], [puissance_vehicule], [annee_sortie_usine_vehicule],[type_vehicule],[place_vehicule],[energie_vehicule])
    VALUES  (N'mercedes', N'classe_A', 320, 300, N'2018-10-23', N'sport',4, N'essence'),
            (N'bmw', N'M5', 280, 240, N'2015-02-17', N'break',4, N'gazole'),
			(N'renault', N'clio 4', 240, 190, N'2010-12-23', N'sport',4, N'diesel');
END

GO

BEGIN
	IF NOT EXISTS (
		SELECT TOP 1 [id_vehicule]
		FROM [dbo].[Vehicule_VEH]
	)

    INSERT INTO [Parc_auto].[dbo].[vehicule_VEH] ([id_modeleFk], [couleur_vehicule], [premiere_mise_en_circulation], [kilometres_acquisition], [disponibilite])
    VALUES  (1, N'Rouge', N'2010-09-07', 1200.35, 1),
            (1, N'noire', N'2015-02-25', 1500.3, 1),
			(2, N'Verte', N'2012-03-15', 2400.83, 1);
END

GO

BEGIN
	IF NOT EXISTS (
		SELECT TOP 1 [Id_client]
		FROM [dbo].[Client_CLI]
	)

    INSERT INTO [Parc_auto].[dbo].[client_CLI] ([nom_client], [prenom_client], [adresse_client], [telephone_client], [type_permis_client])
    VALUES  (N'Sarkozy', N'Nicolas', N'10 rue du general foy, Amiens 80000', N' 0607080910',N'B'),
			(N'Holland', N'Francois', N'9 rue du general foy, Amiens 80000', N' 0758962512',N'B');
END

GO

BEGIN
	IF NOT EXISTS (
	SELECT TOP 1 [Id_location]
	FROM [dbo].[Location_LOC]
	)

	INSERT INTO[parc_auto].[dbo].[location_LOC]([id_vehiculeFk],[id_clientFk],[date_debut_location],[date_fin_location],[kilometres_parcourus])
	VALUES (1,1,GETDATE(),GETDATE(),100),
           (2,2,GETDATE(),GETDATE(),50);
END

GO

--On test les fonctions
SELECT [dbo].[KmEffectuer](1,'2010-01-01','2030-01-01') AS 'Km effectué entre 2 périodes'

GO

SELECT [dbo].[KmDepuisAcquisition](1) AS 'Km parcourus depuis l"acquisition du véhicule'

GO

SELECT [dbo].[kilometreId](1) AS 'Km complet du véhicule'

GO

SELECT [dbo].[kilometreAcquisitionId](2) AS 'Km du véhicule par son ID'

GO

--On test les vues
SELECT * FROM [dbo].[VuesDesVehiculeDispo]

GO

--On test la procédure