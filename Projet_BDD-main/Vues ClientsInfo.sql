CREATE OR ALTER VIEW [dbo].[ClientsInfo]
AS
    SELECT [id_client], [nom_client], [prenom_client], [adresse_client], [telephone_client], [type_permis_client]
    FROM [dbo].[client_CLI]

GO

SELECT * FROM [dbo].[ClientsInfo];

GO