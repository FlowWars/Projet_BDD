USE [parc_auto]

GO

CREATE OR ALTER FUNCTION [dbo].[KmDepuisAcquisition](@id_vehicule INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @Resultat FLOAT

    SELECT @Resultat = SUM(kilometres_parcourus)
    FROM [dbo].[location_LOC]
	WHERE [id_vehicule_fk] = @id_vehicule

    RETURN(@Resultat)
END

GO
