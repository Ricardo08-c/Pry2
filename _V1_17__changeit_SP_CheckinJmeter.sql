-- ---------------------------------------------------------
-- Autor: Leonardo Fariña
-- Fecha: 26/06/2021
-- Descripcion: Sp que hace Checkins con Jmeter
-- Parametro: Cantidad de Checkins a hacer en changeit
-- Ej:
-- DECLARE @RA INT
-- SET @RA =  CAST((RAND()*(4000-1000)+1000) AS INT)
-- EXEC changeit_SP_CheckinJmeter @RA
-- ---------------------------------------------------------
GO
IF EXISTS(SELECT 1 FROM sys.procedures WHERE Name = 'changeit_SP_CheckinJmeter')
DROP PROCEDURE dbo.changeit_SP_CheckinJmeter
GO
CREATE PROCEDURE [dbo].changeit_SP_CheckinJmeter
	@CantidadCheks BIGINT
AS 
BEGIN 
	DECLARE @Pocos BIGINT 
	DECLARE @Medios BIGINT 
	DECLARE @Muchos BIGINT 
	DECLARE @AuxNum BIGINT 
	DECLARE @i BIGINT = 1
	DECLARE @HabitId BIGINT
	DECLARE @name VARCHAR(60)
	DECLARE @city VARCHAR(255)
	DECLARE @cityId BIGINT
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
	DECLARE @locationidpoint BIGINT


	DECLARE @FromDate2  DATETIME
	DECLARE @ToDate2  DATETIME
	DECLARE @RanEndDat2  DATETIME
	DECLARE @Seconds2 INT
	DECLARE @Random2 INT

	DECLARE @GruposZonas AS TABLE
	(			 GrupoId INT,
				 StartDate DATETIME,
				 EndDate DATETIME,
				 LAT FLOAT,
				 LON FLOAT,
				 HabitId BIGINT,
				 NameCity VARCHAR(255),
				 AuxId BIGINT IDENTITY(1,1)
	)

	INSERT INTO @GruposZonas 
	SELECT DISTINCT Aus.ID Grupo, LocHab.StartDate StartDate,LocHab.EndDate EndDate,Aus.latitude LAT,Aus.longitude LON,LocHab.HabitId HabitId,Aus.City NameCity  FROM Locations Locs
	INNER JOIN dbo.LocationsxHabit LocHab on LocHab.LocationId = Locs.LocationId
	INNER JOIN dbo.Ausar Aus on geography::Point(Aus.latitude, Aus.longitude, 4326).STDistance(Locs.Location) = 0 

	SET @Pocos = CAST (@CantidadCheks * 0.5 AS BIGINT)
	SET @Medios = CAST (@CantidadCheks * 0.15 AS BIGINT)
	SET @Muchos = CAST (@CantidadCheks * 0.80 AS BIGINT) 

	SET @AuxNum =(SELECT CAST(RAND()*(SELECT COUNT(AuxId) FROM @GruposZonas)+1 AS INT))

	SELECT @FromDate2 = StartDate,	@ToDate2 = EndDate	FROM @GruposZonas WHERE AuxId = @AuxNum

	SET @Seconds2= DATEDIFF(DAY, @FromDate2, @ToDate2)
	SET @Random2= ROUND(((@Seconds2-1) * RAND()), 0)
	SET @RanEndDat2= DATEADD(DAY, @Random2, @FromDate2)

		WHILE @i <=  @CantidadCheks
			BEGIN 
			IF @i <=  @Pocos
				SET @AuxNum =(SELECT CAST(RAND()*(SELECT COUNT(AuxId) FROM @GruposZonas WHERE GrupoId = 1)+1 AS INT))
			IF @i > @Pocos AND @i <= (@Medios + @Pocos)
				SET @AuxNum =(SELECT CAST(RAND()*(SELECT COUNT(AuxId) FROM @GruposZonas WHERE GrupoId = 2)+1 AS INT))
			IF @i > (@Medios + @Pocos) AND @i <= @CantidadCheks
				SET @AuxNum =(SELECT CAST(RAND()*(SELECT COUNT(AuxId) FROM @GruposZonas WHERE GrupoId = 3)+1 AS INT))

			SELECT @FromDate = StartDate,	@ToDate = EndDate,	@latitudeReference = LAT,	@longitudeReference = LON,	@HabitId = HabitId,	@city = NameCity
			FROM @GruposZonas WHERE AuxId = @AuxNum
			
			IF @RanEndDat2 >= @FromDate AND @RanEndDat2 <= @ToDate
				BEGIN
					SET @cityId = (SELECT CityId FROM Cities WHERE Name = @city)

					DECLARE @puntoRand FLOAT =  0.0001*(RAND()*100+10)*CAST(RAND()*9 AS INT)
					DECLARE @locationPoint GEOGRAPHY = GEOGRAPHY::Point((@latitudeReference+@puntoRand), (@longitudeReference+@puntoRand), 4326)
					INSERT INTO Locations VALUES (CONCAT('CheckIn',IDENT_CURRENT('Locations'),CAST(RAND()*IDENT_CURRENT('Locations') AS BIGINT)),@cityId,@locationPoint)
		
					SET @locationidpoint =  SCOPE_IDENTITY()

					SET @UserID = CAST(RAND()*(IDENT_CURRENT('Users')) AS BIGINT)

					set ansi_nulls off
					WHILE (SELECT Name FROM Users WHERE UserId = @UserID) = NULL
						BEGIN
						SET @UserID = CAST(RAND()*(IDENT_CURRENT('Users')) AS BIGINT)
						END

					SET @NameUs = CONCAT((SELECT Name FROM Users WHERE UserId = @UserID),' User',@UserID,CAST(RAND()*(IDENT_CURRENT('Users')+1) AS INT))
					SET @IPaddres = CAST( CONCAT(CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1)) AS VARBINARY)
					SET @Seconds = DATEDIFF(SECOND, @FromDate, @ToDate)
					SET @Random = ROUND(((@Seconds-1) * RAND()), 0)
					SET @RanEndDat = DATEADD(SECOND, @Random, @FromDate)

					INSERT INTO HabitCheck VALUES(
					@HabitId,
					@UserID,
					@RanEndDat,
					@locationidpoint,
					CONCAT('PC-',@NameUs),
					@NameUs,
					@IPaddres,
					CHECKSUM(@habitId,@UserID,@RanEndDat,@locationidpoint,CONCAT('PC-',@NameUs),@NameUs,@IPaddres))
					COMMIT
					SET @i = @i +1					
				END
			END 
END