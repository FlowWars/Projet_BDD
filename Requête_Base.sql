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
        [color] NVARCHAR(20) NOT NULL,
        [dateFirstCirculation] DATETIME2,
        [kilometrage] FLOAT NOT NULL,
        [disponibilite] BIT, 
    )

GO

IF NOT EXISTS(
    SELECT [name]
    FROM [sysobjects]
    WHERE [name] = 'client'
            AND [xtype] = 'u'
)
CREATE TABLE [dbo].[client](
        [nom] NVARCHAR(20) NOT NULL,
        [prenom] NVARCHAR(20) NOT NULL,
        [adresse] NVARCHAR(50) NOT NULL,
        [telephone] INT NOT NULL,
        [typePermis] INT NOT NULL, 
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

