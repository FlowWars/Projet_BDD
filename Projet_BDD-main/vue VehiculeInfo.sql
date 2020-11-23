CREATE OR ALTER VIEW [dbo].[VehiculeInfo]
AS
    SELECT [id_vehicule], [id_modele_fk], [couleur_vehicule], [premiere_mise_en_circulation], [disponibilite_vehicule], [kilometre_acquisition]
    FROM [dbo].[vehicule_VEH]

GO

SELECT * FROM [dbo].[VehiculeInfo];

GO