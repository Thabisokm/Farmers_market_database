CREATE PROCEDURE usp_AddListing
    @farmer_id INT,
    @product_name VARCHAR(200),
    @category_id INT,
    @price_per_kg DECIMAL(10,2),
    @quantity_kg DECIMAL(10,2),
    @harvest_date DATE,
    @description VARCHAR(500) = NULL
AS

IF @price_per_kg <= 0
    BEGIN
        RAISERROR('Price per kg must be greater than 0.', 16, 1);
        RETURN;
    END
    IF @quantity_kg <= 0
    BEGIN
        RAISERROR('Quantity must be greater than 0.', 16, 1);
        RETURN;
    END

BEGIN
    INSERT INTO produce_listings 
    (farmer_id, product_name, category_id, price_per_kg, quantity_kg, harvest_date, description)
    VALUES 
    (@farmer_id, @product_name, @category_id, @price_per_kg, @quantity_kg, @harvest_date, @description);
END;

CREATE VIEW vw_AvailableListings 
AS
SELECT 
    f.full_name AS Farmer,
    pl.product_name AS Product,
    c.category_name AS Category,
    pl.price_per_kg AS Price
FROM produce_listings pl
JOIN farmers f ON pl.farmer_id = f.farmer_id
JOIN categories c ON pl.category_id = c.category_id
WHERE pl.is_available = 1;

EXEC usp_AddListing 
    @farmer_id = 299,
    @product_name = 'Fresh Tomatoes',
    @category_id = 1,
    @price_per_kg = 2.50,
    @quantity_kg = 100,
    @harvest_date = '2024-07-01',
    @description = 'Juicy and ripe tomatoes, perfect for salads and sauces.';