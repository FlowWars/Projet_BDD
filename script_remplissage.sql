--En cours d'édition--
IF NOT EXISTS (
    SELECT TOP 1 [Id]
    FROM [dbo].[Post_PST]
)
BEGIN
    INSERT INTO [parc_auto].[dbo].[Post_PST] ([Titre], [Contenu], [Publication])
    VALUES  (N'Mon titre', N'Mon contenu', GETDATE()),
            (N'Autre titre', N'Autre contenu', DATEADD(hh, 1, GETDATE()))

    DELETE FROM [dbo].[Post_PST]
    WHERE       [Id] = 1;

    UPDATE  [dbo].[Post_PST]
    SET     [Revision] = DATEADD(hh, -1, GETDATE())
    WHERE   [Revision] IS NULL AND [Id] % 2 = 0
END
GO
