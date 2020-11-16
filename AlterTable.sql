USE [parc_auto]

GO
	ALTER TABLE [dbo].[location]
	ADD CONSTRAINT FK_LOC_VEH FOREIGN KEY([idVehicule])
	REFERENCES [dbo].[vehicule]([id])
GO

GO
	ALTER TABLE [dbo].[location]
	ADD CONSTRAINT FK_LOC_VEH FOREIGN KEY([idClient])
	REFERENCES [dbo].[client]([id])
GO