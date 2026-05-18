CREATE TRIGGER updatepricehistory
ON produce_listings
AFTER UPDATE
AS
BEGIN
  INSERT INTO price_history (listing_id, old_price, new_price, changed_date, reason)
  SELECT 
	i.listing_id, 
	d.price_per_kg AS old_price, 
	i.price_per_kg AS new_price, 
	GETDATE() AS change_date,
	'Price updated' AS reason
	FROM inserted i
  JOIN deleted d ON i.listing_id = d.listing_id
  --WHERE i.price_per_kg <> d.price_per_kg;

END;