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
        [kilometrage] FLOAT ,
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
        [nom] NVARCHAR(20),
        [prenom] NVARCHAR(20),
        [adresse] NVARCHAR(50),
        [telephone] INT,
        [typePermis] INT, 
    )

GO

IF NOT EXISTS(
    SELECT [name]
    FROM [sysobjects]
    WHERE [name] = 'modele'
            AND [xtype] = 'u'
)

    CREATE TABLE [dbo].[modele](
        [marque] NVARCHAR,
        [modele] NVARCHAR,
        [vitesseMax] INT,
        [poids] FLOAT,
        [puissance] INT,
        [anneeSortieUsine] DATE,
        [type] NVARCHAR, 
        [place] INT,
        [energie] NVARCHAR,
    )

GO

