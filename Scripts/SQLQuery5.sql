SELECT order_id, total_price, order_date, quantity_ordered
FROM orders;

-- rounding of
SELECT order_id, ROUND(total_price,0) AS price, order_date, quantity_ordered
FROM orders;

--celling -> rounds up
SELECT order_id,CEILING(total_price) AS price_rounded_up, order_date, FLOOR(quantity_ordered) AS quantity_rounded_down
FROM orders;

SELECT order_id,CEILING(total_price) AS price, order_date, quantity_ordered
FROM orders;

-- POWER -> raises a number to the power of another number
SELECT POWER (2,8);
-- SQRT -> returns the square root of a number
SELECT SQRT(POWER (2,9)) AS SquareRootOf64;

-- DateTime
Select order_id, order_date, GETDATE() AS Today 
from orders;

Select order_id, order_date, CURRENT_DATE AS Today 
from orders;

SELECT DAY(CURRENT_DATE) AS DAY;
SELECT MONTH(CURRENT_DATE) AS MONTH;
SELECT YEAR(CURRENT_DATE) AS YEAR;

Select order_id, order_date,  year(order_date) AS 'YEAR' 
from orders
--ORDER BY year,
where year(order_date)= 2023
ORDER BY order_date ASC;


SELECT  order_id, order_date, YEAR(order_date) as 'Year',
b.full_name as 'Buyer', p.product_name as 'Product',
f.farm_name as 'Farm'
FROM orders o
JOIN buyers b on b.buyer_id = o.buyer_id
JOIN product_listings p on p.listing_id = o.listing_id
JOIN farmers f on f.farmer_id = p.farmer_id
WHERE YEAR(order_date) = 2023
ORDER BY order_date ASC;