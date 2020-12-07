
CREATE TRIGGER [dbo].[trig_debut_location]
    ON [dbo].[location_LOC] 
    AFTER UPDATE 
AS
BEGIN
	UPDATE  [dbo].[location_LOC]
		SET     [disponibilite] = 0
		WHERE   [date_debut_location] = GETDATE()
END

GO