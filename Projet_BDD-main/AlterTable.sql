USE [parc_auto]

GO
	ALTER TABLE [dbo].[location]
	ADD CONSTRAINT FK_LOC_VEH FOREIGN KEY([id_vehicule_fk])
	REFERENCES [dbo].[vehicule]([id_vehicule])
GO

GO
	ALTER TABLE [dbo].[location]
	ADD CONSTRAINT FK_LOC_CLT FOREIGN KEY([id_client_fk])
	REFERENCES [dbo].[client]([id_client])
GO