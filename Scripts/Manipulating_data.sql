-- AVG | COUNT | MAX | SUM

--SELECT MIN(rating) AS MINIMUMragerating FROM farmers;
SELECT *
FROM farmers
WHERE rating = (SELECT MIN(rating) FROM farmers);

SELECT COUNT(*) AS NUmber_Of_Farmers FROM farmers
WHERE rating > 4.0;

SELECT SUM(rating) AS Toatal_rating FROM farmers;

/* 
 SELECT farmer_id, full_name, rating
 FROM dbo.farmers
 WHERE rating < 4.0;
 */

 SELECT UPPER(full_name) AS Name, email, phone_number, farm_name
 from farmers;

  SELECT CONCAT(full_name, ' - ' ,farm_name) AS FarmOwners, email, phone_number, farm_name
 from farmers;

  SELECT Substring(full_name,1,3) as initial, full_name, email, phone_number, farm_name
 from farmers;

  SELECT LEN(phone_number) as phone_number_len, full_name, REPLACE(email, '@','#'), phone_number, farm_name
 from farmers;

   SELECT REPLACE(phone_number,Substring(phone_number,1,2), '07') AS Phone_Number, full_name, email, phone_number, farm_name
 from farmers;

  SELECT full_name, email, STUFF(phone_number,1,2 ,'07') as zarnumber, farm_name
 from farmers;




