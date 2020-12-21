-- On créée la database parc auto
IF (DB_ID(N'Parc_auto') IS NULL)
    CREATE DATABASE [Parc_auto3]

GO

-- On se positionne sur la base
USE [Parc_auto]

GO

-- On créée la table modèle du vehicule
IF NOT EXISTS(
    SELECT [name]
    FROM [sysobjects]
    WHERE [name] = 'Modele_MOD'
            AND [xtype] = 'U'
)
BEGIN
    CREATE TABLE [dbo].[Modele_MOD](
        [Id_modele] INT IDENTITY(1,1) PRIMARY KEY,
        [marque_vehicule] NVARCHAR(20) NOT NULL,
        [modele_vehicule] NVARCHAR(20) NOT NULL,
        [poids_vehicule] FLOAT NOT NULL,
        [puissance_vehicule] INT NOT NULL,
        [annee_sortie_usine_vehicule] DATE NOT NULL,
        [type_vehicule] NVARCHAR(15) NOT NULL, 
        [place_vehicule] TINYINT NOT NULL,-- j'ai pris cette variable car le nombre de place n'a pas de grande valeur
        [energie_vehicule] NVARCHAR(10) NOT NULL,
    )

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

-- On créée la table de la fiche vehicule
IF NOT EXISTS(
    SELECT [name]
    FROM [sysobjects]
    WHERE [name] = 'Vehicule_VEH'
            AND [xtype] = 'U'
)
BEGIN
    CREATE TABLE [dbo].[Vehicule_VEH](
        [id_vehicule] INT IDENTITY(1,1) PRIMARY KEY,
	[id_modeleFk] INT NOT NULL,
        [couleur_vehicule] NVARCHAR(20) NOT NULL,
        [premiere_mise_en_circulation] DATE NOT NULL,
        [kilometres_vehicule] FLOAT NOT NULL,
	[disponibilite] BIT,
        
    )
IF NOT EXISTS (
    SELECT TOP 1 [id_vehicule]
    FROM [dbo].[Vehicule_VEH]
)
    INSERT INTO [Parc_auto].[dbo].[vehicule_VEH] ([id_modeleFk], [couleur_vehicule], [premiere_mise_en_circulation], [kilometres_vehicule], [disponibilite])
    VALUES  (1, N'Rouge', N'2010-09-07', 1200.35, 1),
            (1, N'noire', N'2015-02-25', 1500.3, 1),
			(2, N'Verte', N'2012-03-15', 2400.83, 1);


	ALTER TABLE [dbo].[Vehicule_VEH]
    ADD CONSTRAINT FK_VEH_Modele FOREIGN KEY ([id_modeleFk])
    REFERENCES [dbo].[Modele_MOD] ([Id_modele])

END
GO

IF NOT EXISTS(
    SELECT [name]
    FROM [sysobjects]
    WHERE [name] = 'client_CLI'
            AND [xtype] = 'U'
)
BEGIN
	CREATE TABLE [dbo].[Client_CLI](
		[id_client] INT IDENTITY(1,1) PRIMARY KEY,
		[nom_client] NVARCHAR(30) NOT NULL,
		[prenom_client] NVARCHAR(30) NOT NULL,
		[adresse_client] NVARCHAR(50) NOT NULL,
		[telephone_client] INT NOT NULL,
		[type_permis_client] NVARCHAR(1) NOT NULL, 
    )

	IF NOT EXISTS (
		SELECT TOP 1 [Id_client]
		FROM [dbo].[Client_CLI]
	)

    INSERT INTO [Parc_auto].[dbo].[client_CLI] ([nom_client], [prenom_client], [adresse_client], [telephone_client], [type_permis_client])
    VALUES  (N'Sarkozy', N'Nicolas', N'10 rue du general foy, Amiens 80000', N' 0607080910',N'B'),
			(N'Holland', N'Francois', N'9 rue du general foy, Amiens 80000', N' 0758962512',N'B');

END
GO

IF NOT EXISTS(
    SELECT [name]
    FROM [sysobjects]
    WHERE [name] = 'Location_LOC'
            AND [xtype] = 'U'
)
BEGIN
	CREATE TABLE [dbo].[Location_LOC](
		[id_location] INT IDENTITY(1,1) PRIMARY KEY,
		[id_vehiculeFk] INT NOT NULL,
		[id_clientFk] INT NOT NULL,
		[date_debut_location] DATETIME2 NOT NULL,
		[date_fin_location] DATETIME2 NOT NULL,
		[kilometres_parcourus] FLOAT NOT NULL,
		)

	ALTER TABLE [dbo].[Location_LOC]
    ADD CONSTRAINT FK_LOC_vehicule FOREIGN KEY ([id_vehiculeFk])
    REFERENCES [dbo].[Vehicule_VEH] ([id_vehicule])


	ALTER TABLE [dbo].[Location_LOC]
    ADD CONSTRAINT FK_LOC_client FOREIGN KEY ([id_clientFk])
    REFERENCES [dbo].[Client_CLI] ([id_client])

END

/*
CREATE OR ALTER TRIGGER [dbo].[trig_new_location]
    ON [dbo].[location_LOC] 
    AFTER INSERT 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @VehId INT
	IF (SELECT [date_debut_location]
		FROM [dbo].[Location_LOC]
		WHERE [id_vehiculeFk] = @VehId
		)<= GETDATE()
	BEGIN
		UPDATE [dbo].[Vehicule_VEH]
		SET [disponibilite] = 0
		WHERE [Id_vehicule] = @VehId
	END
END
*/
GO
	ALTER TABLE [dbo].[vehicule_VEH]
	ADD [kilometres_acquisition] FLOAT
	
GO

	ALTER TABLE [dbo].[vehicule_VEH]
	DROP COLUMN [kilometres_vehicule]
GO


CREATE OR ALTER VIEW [dbo].[VuesDesVehiculeDispo]
AS
	SELECT *
    FROM [dbo].[Vehicule_VEH] 
    WHERE [disponibilite]=1

GO

SELECT * FROM [dbo].[VuesDesVehiculeDispo]

GO


IF NOT EXISTS (
	SELECT TOP 1 [Id_location]
	FROM [dbo].[Location_LOC]
)

INSERT INTO[parc_auto].[dbo].[location_LOC]([id_vehiculeFk],[id_clientFk],[date_debut_location],[date_fin_location])
VALUES    (1,1,GETDATE(),GETDATE()),
           (2,2,GETDATE(),GETDATE());

GO

CREATE OR ALTER VIEW [dbo].[VehiculeInfo]
AS
    SELECT *
    FROM [dbo].[vehicule_VEH]

GO

SELECT * FROM [dbo].[VehiculeInfo]

GO

GO
CREATE FUNCTION [dbo].[kilometreId](@ID int) RETURNS INTEGER AS 
BEGIN
    DECLARE @kilometre int;
    SELECT @kilometre = SUM([kilometres_parcourus]) 
    FROM [dbo].[location_LOC]
    WHERE [location_LOC].[id_vehiculeFk] = @ID;
    
	SELECT @kilometre = @kilometre + [vehicule_VEH].[kilometres_acquisition]
	FROM [dbo].[vehicule_VEH]
	WHERE [vehicule_VEH].[id_vehicule] = @ID;
	
	RETURN(@kilometre)
END;

GO

CREATE FUNCTION [dbo].[KmDepuisAcquisition](@id_vehicule INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @Resultat FLOAT

    SELECT @Resultat = SUM(kilometres_parcourus)
    FROM [dbo].[location_LOC]
	WHERE [id_vehicule_fk] = @id_vehicule

    RETURN(@Resultat)
END

GO
