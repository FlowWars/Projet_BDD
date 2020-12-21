USE [parc_auto]

GO

ALTER TABLE [dbo].[vehicule_VEH]
ADD [kilometre_acquisition] FLOAT

GO

CREATE OR ALTER FUNCTION [dbo].[KmDepuisAcquisition]()
RETURNS FLOAT
AS
BEGIN
    DECLARE @Resultat FLOAT

    SELECT @Resultat = [kilometre_vehicule] - [kilometre_acquisition]
    FROM [dbo].[vehicule_VEH]

    RETURN(@Resultat)
END

GO
