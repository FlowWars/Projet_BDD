-- On créée la database parc auto
IF (DB_ID(N'Parc_auto') IS NULL)
    CREATE DATABASE [Parc_auto]

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
        [Id_vehicule] INT IDENTITY(1,1) PRIMARY KEY,
		[id_modeleFk] INT NOT NULL,
        [couleur_vehicule] NVARCHAR(20) NOT NULL,
        [premiere_mise_en_circulation] DATE NOT NULL,
        [kilometre_vehicule] FLOAT NOT NULL,
		[disponibilite] BIT,
        
    )
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
        [Id_client] INT IDENTITY(1,1) PRIMARY KEY,
        [nom_client] NVARCHAR(30) NOT NULL,
        [prenom_client] NVARCHAR(30) NOT NULL,
        [adresse_client] NVARCHAR(50) NOT NULL,
        [telephone_client] INT NOT NULL,
        [type_permis_client] NVARCHAR(1) NOT NULL, 
    )
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
		[Id_location] INT IDENTITY(1,1) PRIMARY KEY,
		[id_vehiculeFk] INT NOT NULL,
        [id_clientFk] INT NOT NULL,
        [date_debut_location] DATETIME2 NOT NULL,
        [date_fin_location] DATETIME2 NOT NULL,
		)

	ALTER TABLE [dbo].[Location_LOC]
    ADD CONSTRAINT FK_LOC_vehicule FOREIGN KEY ([id_vehiculeFk])
    REFERENCES [dbo].[Vehicule_VEH] ([Id_vehicule])


	ALTER TABLE [dbo].[Location_LOC]
    ADD CONSTRAINT FK_LOC_client FOREIGN KEY ([id_clientFk])
    REFERENCES [dbo].[Client_CLI] ([Id_client])

END
GO

CREATE OR ALTER TRIGGER [dbo].[trig_new_location]
    ON [dbo].[location_LOC] 
    AFTER INSERT 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @VehId INT ;
	DECLARE @Nb INT;
	SET @VehId = 0;
	SET @Nb = (SELECT COUNT(*)
				FROM [dbo].[Location_LOC]
				);

	WHILE(@VehId <= @Nb)
	BEGIN
		SET @VehId = @VehId + 1;
		IF (SELECT [date_debut_location]
			FROM [dbo].[Location_LOC]
			WHERE [id_vehiculeFk] = @VehId
			)<= GETDATE()
		BEGIN
			UPDATE  [dbo].[Vehicule_VEH]
			SET     [disponibilite] = 0
			WHERE [Id_vehicule] = @VehId 
		END
	END
END
GO

ALTER TABLE [dbo].[Location_LOC]
ADD [kilometres_parcourus] FLOAT NOT NULL
CONSTRAINT KmDefaut DEFAULT 0

ALTER TABLE [dbo].[Vehicule_VEH]
DROP COLUMN [kilometre_vehicule]

ALTER TABLE [dbo].[Vehicule_VEH]
ADD [kilometres_acquisition] FLOAT NOT NULL
CONSTRAINT KmAcquisDefault DEFAULT 0


GO

CREATE OR ALTER FUNCTION [dbo].[KmEffectuer](@id_veh int, @DateDebut Datetime2, @DateFin Datetime2)
RETURNS FLOAT
AS
BEGIN
	DECLARE @KmAcquis FLOAT

    SELECT @KmAcquis = SUM([kilometres_parcourus])
    FROM [dbo].[Location_LOC] 
    WHERE [date_debut_location] >= @DateDebut 
    AND [date_debut_location] < @DateFin
    AND  [date_fin_location] <= @DateFin
    AND [date_fin_location] > @DateDebut
    AND [id_vehiculeFk] = @id_veh

	RETURN(@KmAcquis)

END
GO

CREATE OR ALTER FUNCTION [dbo].[kilometreAcquisitionId](@ID INT)
RETURNS FLOAT 
AS
BEGIN
	DECLARE @kilometre_acquisition FLOAT;
	SELECT @kilometre_acquisition = [Vehicule_VEH].[kilometres_acquisition]
	FROM [dbo].[Vehicule_VEH]
	WHERE [Vehicule_VEH].[Id_vehicule] = @ID;

	RETURN(@kilometre_acquisition)
END
GO

CREATE OR ALTER FUNCTION [dbo].[kilometreId](@ID INT)
RETURNS FLOAT 
AS 
BEGIN
    DECLARE @kilometre FLOAT;
    SELECT @kilometre = SUM([kilometres_parcourus]) 
    FROM [dbo].[Location_LOC]
    WHERE [Location_LOC].[id_vehiculeFk] = @ID;
    
	SELECT @kilometre = @kilometre + [Vehicule_VEH].[kilometres_acquisition]
	FROM [dbo].[Vehicule_VEH]
	WHERE [Vehicule_VEH].[id_vehicule] = @ID;
	
	RETURN(@kilometre)
END

GO

CREATE OR ALTER FUNCTION [dbo].[KmDepuisAcquisition](@id_vehicule INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @Resultat FLOAT

    SELECT @Resultat = SUM([kilometres_parcourus])
    FROM [dbo].[location_LOC]
	WHERE [id_vehiculeFK] = @id_vehicule

    RETURN(@Resultat)
END

GO

CREATE OR ALTER VIEW [dbo].[VuesDesVehiculeDispo]
AS
	SELECT *
    FROM [dbo].[Vehicule_VEH] 
    WHERE [disponibilite]=1

GO

CREATE OR ALTER PROCEDURE VehiculeDispoOrNot
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @vehicule_dispo INTEGER
	DECLARE @vehicule_non_dispo INTEGER

	BEGIN TRY
		SELECT @vehicule_dispo = [Vehicule_VEH].[Id_vehicule]
		FROM [dbo].[Vehicule_VEH], [dbo].[Location_LOC]
		WHERE [Vehicule_VEH].[Id_vehicule] = [Location_LOC].[id_vehiculeFk] AND 
		[Location_LOC].[date_fin_location] = GETDATE() - 1 AND [Location_LOC].[date_debut_location] != GETDATE() ;

		UPDATE  [dbo].[Vehicule_VEH]
		SET [disponibilite] = 1
		WHERE [Id_vehicule] = @vehicule_dispo 

		SELECT @vehicule_non_dispo = [Vehicule_VEH].[Id_vehicule]
		FROM [dbo].[Vehicule_VEH], [dbo].[Location_LOC]
		WHERE [Vehicule_VEH].[Id_vehicule] = [Location_LOC].[id_vehiculeFk] AND 
		[Location_LOC].[date_debut_location] = GETDATE();

		UPDATE  [dbo].[Vehicule_VEH]
		SET [disponibilite] = 0
		WHERE [Id_vehicule] = @vehicule_non_dispo

		SELECT 53000 AS [Number], N'ERREUR' AS [Message]
	END TRY

	BEGIN CATCH
		SELECT ERROR_NUMBER() AS [Number], ERROR_MESSAGE() AS [Message]
	END CATCH
END

GO