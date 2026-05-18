/*create a trigger to run when a record from the 
produce_listings to be deletw al related price history records*/

CREATE TRIGGER DeletePriceHistory
ON produce_listings
AFTER DELETE
AS
BEGIN
  DELETE FROM price_history
  WHERE listing_id IN (SELECT listing_id FROM deleted);
  /*ph
  FROM price_history ph
  JOIN deleted d ON ph.listing_id = d.listing_id;*/
END;