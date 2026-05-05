SELECT * FROM farmers;

SELECT full_name, farm_name, rating 
  FROM farmers 
  WHERE rating >= 3.5 --Filter data by criteria
 ORDER BY rating ASC ;

 UPDATE farmers 
 SET rating = 5
 WHERE farmer_id = 1;