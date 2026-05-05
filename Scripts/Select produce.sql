-- Basic Select
  SELECT * FROM produce_listings;
 --Select some columns
  --SELECT listing_id, product_name, price_per_kg FROM produce_listings;
  SELECT product_name, is_available, harvest_date, price_per_kg, category_id 
  FROM produce_listings 
  WHERE price_per_kg < 500 --Filter data by criteria
 AND is_available = 1
 AND (product_name LIKE 'Wine%' OR product_name LIKE 'juice%')
 AND price_per_kg BETWEEN 10 AND 400
 AND category_id IN (1,2,4)
 ORDER BY date_listed ASC
 ;