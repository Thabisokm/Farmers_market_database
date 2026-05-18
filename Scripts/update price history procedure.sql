CREATE PROCEDURE usp_UpdateProduceprice 
	@listing_id INT,
	@new_price DECIMAL(8,2)
AS
BEGIN
	UPDATE produce_listings
	SET price_per_kg = price_per_kg
	WHERE listing_id = @listing_id;
END;

