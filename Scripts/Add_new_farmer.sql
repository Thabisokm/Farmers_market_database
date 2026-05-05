--SELECT * FROM farmers;
CREATE VIEW VerifiedFarmers
AS
SELECT * from farmers where is_verified = 1;

SELECT * FROM VerifiedFarmers;

-- DROP VIEW TopRated;

CREATE VIEW TopRated
AS
SELECT * FROM dbo.farmers 
WHERE rating >= 4
;

SELECT * FROM TopRated
ORDER BY rating ASC, farm_name ASC;




CREATE PROCEDURE ups_AddFarmer
	@FullName VARCHAR(150),
	@Email VARCHAR(255),
	@PhoneNumber CHAR(10),
	@FarmName VARCHAR(200),
	@Location VARCHAR(200),
	@ProvinceID INT,
	@Rating DECIMAL(3,2),
	@IsVerified BIT
	AS 
	BEGIN
		INSERT INTO farmers (full_name, email, phone_number, farm_name, location, province_id, rating, is_verified)
		VAlUES (@FullName, @Email, @PhoneNumber, @FarmName, @Location, @ProvinceID, @Rating, @IsVerified)
		SELECT SCOPE_IDENTITY() AS NEWFarmerID;
	END;
	

	EXEC ups_AddFarmer
		@FullName = 'Connie Mahaswaran',
		@Email = 'connie@gmail.com',
		@PhoneNumber = '065 058 3636',
		@FarmName = 'Crystal farm',
		@Location = 'Beach city',
		@ProvinceID = 1,
		@Rating = 4.5,
		@IsVerified = 1;