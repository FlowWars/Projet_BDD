--En cours d'édition--
USE parc_auto

GO

IF NOT EXISTS (
    SELECT TOP 1 [id_vehicule]
    FROM [dbo].[vehicule]
)
BEGIN
    INSERT INTO [parc_auto].[dbo].[vehicule] ([couleur_vehicule], [premiere_mise_en_circulation], [kilometre_vehicule], [disponibilite_vehicule])
    VALUES  (N'Rouge', GETDATE(), 120000, 1),
            (N'Verte', DATEADD(hh, 1, GETDATE()), 90000, 0)

    DELETE FROM [dbo].[vehicule]
    WHERE       [id_vehicule] = 1;
END
GO

GO

IF NOT EXISTS(
	SELECT TOP 1 [id_modele]
	FROM [dbo].[modele]	
)
BEGIN
	INSERT INTO [parc_auto].[dbo].[modele] ([marque_vehicule], [modele_vehicule], [vitesse_max_vehicule], [poids_vehicule], [puissance_vehicule], [annee_sortie_usine_vehicule],[type_vehicule],[place_vehicule],[energie_vehicule])
    VALUES  (N'mercedes', N'classe_A', 320, 1500,300,N'2018-10-23',N'sport',4,N'essence'),
            (N'bmw', N'M5', 280, 1300,240,N'2015-02-17',N'break',4,N'gazole')

    DELETE FROM [dbo].[modele]
    WHERE       [id_modele] = 1;

END
GO

GO

IF NOT EXISTS(
	SELECT TOP 1 [id_client]
	FROM [dbo].[client]	
)
BEGIN
	INSERT INTO [parc_auto].[dbo].[client] ([nom_client], [prenom_client], [adresse_client], [telephone_client], [type_permis_client])
    VALUES  (N'Sarkozy', N'Nicolas', N'10 rue du general foy, Amiens 80000', N'0607080910',N'B')
           

    DELETE FROM [dbo].[client]
    WHERE       [id_client] = 1;

END
GO
