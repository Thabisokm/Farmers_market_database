SELECT product_name, category_name,harvest_date 
FROM produce_listings p
JOIN categories c ON c.category_id = p.category_id
WHERE description IS NULL
ORDER BY harvest_date ASC;

-- create procedure 
CREATE PROCEDURE GetAllAvailableProduce
AS 
BEGIN
	SELECT * FROM produce_listings
	WHERE is_available = 1;
END;

 --EXEC GetAllAvailableProduce;
 
--DROP  PROCEDURE GetProductsByCategory_id;

CREATE PROCEDURE GetProductsByCategory_id 
@CategoryID INT -- paramiter
AS
BEGIN
	SELECT * FROM produce_listings p
	JOIN categories c ON c.category_id = p.category_id
    WHERE c.category_id = @CategoryID;
END
;

EXEC GetProductsByCategory_id @CategoryID = 5;


--DROP  PROCEDURE GetProductsByFarmerID;

CREATE PROCEDURE GetProductsByFarmerID
    @FarmerID INT 
AS
BEGIN
    SELECT 
        f.farmer_id, 
        product_name, 
        price_per_kg, 
        quantity_kg 
    FROM produce_listings p
    JOIN farmers f ON f.farmer_id  = p.farmer_id
    WHERE f.farmer_id = @FarmerID
    ORDER BY quantity_kg ASC;
END;

EXEC GetProductsByFarmerID @FarmerID = 299;