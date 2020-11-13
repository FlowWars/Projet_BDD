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
        [marque] NVARCHAR(20) NOT NULL,
        [modele] NVARCHAR(20) NOT NULL,
        [vitesseMax] INT NOT NULL,
        [poids] FLOAT NOT NULL,
        [puissance] INT NOT NULL,
        [anneeSortieUsine] DATE NOT NULL,
        [type] NVARCHAR(15) NOT NULL, 
        [place] INT NOT NULL,
        [energie] NVARCHAR(10) NOT NULL,
    )

GO

