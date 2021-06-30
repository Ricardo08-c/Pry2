-- Descripcion: Sp que INSERTa Checkins las veces y en el habito recibido en el parametro
-- 
--
GO
IF EXISTS(SELECT 1 FROM sys.procedures WHERE Name = 'checkinReference')
DROP PROCEDURE dbo.checkinReference
GO
CREATE PROCEDURE [dbo].checkinReference
	@habitId BIGINT,
	@n BIGINT,
	@locationid BIGINT
AS 
BEGIN 
	DECLARE @i BIGINT = 0 
	DECLARE @name VARCHAR(60)
	DECLARE @city BIGINT
	DECLARE @latitudeReference FLOAT
	DECLARE @longitudeReference FLOAT
	DECLARE @NameUs VARCHAR(128)
	DECLARE @UserID BIGINT
	DECLARE @IPaddres VARBINARY(16)
	DECLARE @FromDate DATETIME
	DECLARE @ToDate   DATETIME
	DECLARE @RanEndDat   DATETIME
	DECLARE @Seconds INT
	DECLARE @Random INT

	SELECT @name = name, @city = CityId,@latitudeReference = Locations.Location.Lat, @longitudeReference=Locations.Location.Long FROM Locations WHERE LocationId = @locationid
	SET @name = SUBSTRING(@name ,0,CHARINDEX(left(right(@name , 8),1),@name ))
	WHILE @i < @n 
		BEGIN
		DECLARE @puntoRand FLOAT =  0.0001*(RAND()*100+10)*CAST(RAND()*9 AS INT)
		DECLARE @locationPoint GEOGRAPHY = GEOGRAPHY::Point((@latitudeReference+@puntoRand), (@longitudeReference+@puntoRand), 4326)
		DECLARE @lati FLOAT = @latitudeReference+@puntoRand
		DECLARE @longi FLOAT = @longitudeReference+@puntoRand
		DECLARE @locationidpoint BIGINT 
		SELECT @locationidpoint = Locations.LocationId FROM Locations WHERE Locations.Location.Lat = @lati AND Locations.Location.Long = @longi
		IF not exists(SELECT Locations.Location.Lat,Locations.Location.Long FROM Locations WHERE Locations.Location.Lat = @lati AND Locations.Location.Long = @longi)
		BEGIN 
			INSERT INTO Locations VALUES (CONCAT(@name,CAST(RAND()*(99999999-10000000)+10000000 AS BIGINT)),@city,@locationPoint)
			SET @locationidpoint =  IDENT_CURRENT('Locations')
		END

		SET @UserID = CAST(RAND()*IDENT_CURRENT('Users')+1 AS INT)
		SET @NameUs = (SELECT Name FROM Users WHERE UserId = @UserID)
		SET @IPaddres = CAST( CONCAT(CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1)) AS VARBINARY)

		SET @FromDate = '2021-01-01 00:00:00' 
		SET @ToDate = '2021-12-30 00:00:00' 
		SET @Seconds = DATEDIFF(SECOND, @FromDate, @ToDate)
		SET @Random = ROUND(((@Seconds-1) * RAND()), 0)
		SET @RanEndDat = DATEADD(SECOND, @Random, @FromDate)

		INSERT INTO HabitCheck VALUES(@habitId,@UserID,@RanEndDat,@locationidpoint,CONCAT('PC-',@NameUs),@NameUs,@IPaddres,CHECKSUM(@habitId,@UserID,@RanEndDat,@locationidpoint,CONCAT('PC-',@NameUs),@NameUs,@IPaddres))
		SET @i = @i +1
		END 
END


