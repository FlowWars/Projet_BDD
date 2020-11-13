IF(DB_ID(N'parc_auto')IS NULL)
    CREATE DATABASE [parc_auto]

GO

USE [parc_auto]

GO

IF NOT EXISTS(
    SELECT [name]
    FROM [sysobjects]
    WHERE [name] = 'vehicule'
            AND [xtype] = 'u'
)

    CREATE TABLE [dbo].[vehicule](
        [id] INT IDENTITY(1,1) PRIMARY KEY,
        [couleur_vehicule] NVARCHAR(20) NOT NULL,
        [premiere_mise_en_circulation] DATETIME2,
        [kilometre_vehicule] FLOAT NOT NULL,
        [disponibilite_vehicule] BIT, 
    )

GO

IF NOT EXISTS(
    SELECT [name]
    FROM [sysobjects]
    WHERE [name] = 'client'
            AND [xtype] = 'u'
)
CREATE TABLE [dbo].[client](
        [nom_client] NVARCHAR(20) NOT NULL,
        [prenom_client] NVARCHAR(20) NOT NULL,
        [adresse] NVARCHAR(50) NOT NULL,
        [telephone_client] INT NOT NULL,
        [type_permis_client] INT NOT NULL, 
    )

GO

IF NOT EXISTS(
    SELECT [name]
    FROM [sysobjects]
    WHERE [name] = 'modele'
            AND [xtype] = 'u'
)

    CREATE TABLE [dbo].[modele](
        [marque_vehicule] NVARCHAR(20) NOT NULL,
        [modele_vehicule] NVARCHAR(20) NOT NULL,
        [vitesse_max_vehicule] INT NOT NULL,
        [poids_vehicule] FLOAT NOT NULL,
        [puissance_vehicule] INT NOT NULL,
        [annee_sortie_usine_vehicule] DATE NOT NULL,
        [type_vehicule] NVARCHAR(15) NOT NULL, 
        [place_vehicule] INT NOT NULL,
        [energie_vehicule] NVARCHAR(10) NOT NULL,
    )

GO

