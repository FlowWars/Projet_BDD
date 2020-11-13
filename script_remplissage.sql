--En cours d'édition--
USE parc_auto

GO

IF NOT EXISTS (
    SELECT TOP 1 [id]
    FROM [dbo].[vehicule]
)
BEGIN
    INSERT INTO [parc_auto].[dbo].[vehicule] ([color], [dateFirstCirculation], [kilometrage], [disponibilite])
    VALUES  (N'Rouge', GETDATE(), 120000, 1),
            (N'Verte', DATEADD(hh, 1, GETDATE()), 90000, 0)

    DELETE FROM [dbo].[vehicule]
    WHERE       [id] = 1;
END
GO

GO

IF NOT EXISTS(
	SELECT TOP 1 [id]
	FROM [dbo].[modele]	
)
BEGIN
	INSERT INTO [parc_auto].[dbo].[modele] ([marque], [modele], [vitesseMax], [poids], [puissance], [anneeSortieUsine],[type],[place],[energie])
    VALUES  (N'mercedes', N'classe_A', 320, 1500,300,2018,N'sport',4,N'essence'),
            (N'bmw', N'M5', 280, 1300,240,2015,N'break',4,N'gazole')

    DELETE FROM [dbo].[modele]
    WHERE       [id] = 1;

END
GO

GO

IF NOT EXISTS(
	SELECT TOP 1 [id]
	FROM [dbo].[client]	
)
BEGIN
	INSERT INTO [parc_auto].[dbo].[client] ([nom], [prenom], [adresse], [telephone], [typePermis])
    VALUES  (N'Sarkozy', N'Nicolas', N'10 rue du general foy, Amiens 80000', N'0607080910',N'B')
           

    DELETE FROM [dbo].[client]
    WHERE       [id] = 1;

END
GO