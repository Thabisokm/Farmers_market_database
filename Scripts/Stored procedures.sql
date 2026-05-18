/*select 
c.category_id,
c.category_name,
COUNT(p.listing_id) AS Total_Products,
MIN(p.price_per_kg) AS Min_Price,
MAX(p.price_per_kg) AS Max_Price
FROM categories c 
JOIN produce_listings p
ON c.category_id = p.category_id
WHERE p.is_available = 1
GROUP BY c.category_id, c.category_name
--HAVING COUNT(p.listing_id) > 340
;
*/
/*
SELECT
  COUNT(*) AS pending_orders_count,
  SUM(o.total_price) AS total_pending_price
FROM orders o
JOIN order_statuses s
  ON o.status_id = s.status_id
WHERE LOWER(s.status_name) = 'pending';
*/
-- Buyer Order Summery
drop procedure if exists GetBuyerOrderSummery;

CREATE PROCEDURE GetBuyerOrderSummery
@buyer_id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        s.status_name,
        COUNT(o.order_id) AS total_orders,
        ISNULL(SUM(o.total_price), 0) AS total_revenue
    FROM order_statuses s
   LEFT JOIN orders o 
        ON s.status_id = o.status_id 
        WHERE o.buyer_id = @buyer_id
    GROUP BY s.status_id, s.status_name;
END;

EXEC GetBuyerOrderSummery @buyer_id = 14;

--Update Produce price 
CREATE PROCEDURE usp_UpdateProduceprice 
	@listing_id INT,
	@new_price DECIMAL(8,2)
AS
BEGIN
	UPDATE produce_listings
	SET price_per_kg = price_per_kg
	WHERE listing_id = @listing_id;
END;
