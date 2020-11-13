--En cours d'édition--
USE parc_auto

GO

IF NOT EXISTS (
    SELECT TOP 1 [id]
    FROM [dbo].[vehicule]
)
BEGIN
    INSERT INTO [parc_auto].[dbo].[vehicule] ([couleur_vehicule], [date_premiere_circulation], [kilometre_vehicule], [disponibilite_vehicule])
    VALUES  (N'Rouge', GETDATE(), 120000, 1),
            (N'Verte', DATEADD(hh, 1, GETDATE()), 90000, 0)

    DELETE FROM [dbo].[vehicule]
    WHERE       [id] = 1;
END
GO
