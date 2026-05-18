-- Trigger
CREATE TRIGGER trg_UpdateFarmerRating
ON farmers
AFTER INSERT
AS
BEGIN
	PRINT 'New farmer has been added, check it out'
END;