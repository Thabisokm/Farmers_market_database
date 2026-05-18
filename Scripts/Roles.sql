/*
CREATE LOGIN FarmerMarketApp 
WITH PASSWORD = 'FarmerMarketDB';
USE farmer_market_db;
CREATE USER FarmerMarketUSER 
FOR LOGIN FarmerMarketApp;	
*/
--grant user permissions
 /*
GRANT SELECT 
ON vw_AvailableListings TO FarmerMarketUSER;

GRANT UPDATE 
ON vw_AvailableListings TO FarmerMarketUSER;

REVOKE SELECT 
ON vw_AvailableListings TO FarmerMarketUSER;

--DROP LOGIN FarmerMarketApp;
*/

GRANT SELECT, UPDATE, INSERT, DELETE 
ON vw_AvailableListings TO FarmerMarketUSER;

