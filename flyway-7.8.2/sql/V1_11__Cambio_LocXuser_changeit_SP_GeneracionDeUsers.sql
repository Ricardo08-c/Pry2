-- ---------------------------------------------------------
-- Autor: Ricardo Soto - Leonardo Fariña
-- Fecha: 25/06/2021
-- Descripcion: Sp que genera una cantidad de usuarios aleatorios
-- Parametro cantidad de usuarios a generar
-- ---------------------------------------------------------
GO
IF EXISTS(SELECT 1 FROM sys.procedures WHERE Name = 'changeit_SP_GeneracionDeUsers')
DROP PROCEDURE dbo.[changeit_SP_GeneracionDeUsers]
GO
CREATE PROCEDURE [dbo].[changeit_SP_GeneracionDeUsers]
	@n BIGINT
AS 
BEGIN	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @i BIGINT
	DECLARE @userNames TABLE (id INT, name VARCHAR(128), apellido VARCHAR(128))
	DECLARE @nombreid SMALLINT
	DECLARE @nombre VARCHAR(128)
	DECLARE @apellido VARCHAR(128)
	DECLARE @mail VARCHAR(200)
	DECLARE @DateStart DATE
	DECLARE @DateEnd  DATE 
	DECLARE @FromDate DATETIME
	DECLARE @ToDate   DATETIME
	DECLARE @RanStarDat   DATETIME
	DECLARE @RanEndDat   DATETIME
	DECLARE @Seconds INT
	DECLARE @Random INT
	DECLARE @UserID BIGINT
	DECLARE @date DATE 
	DECLARE @PointLoc GEOGRAPHY 

	BEGIN TRY
 

		SET @CustomError = 2001
		SET @DateStart = '1990/01/01'
		SET @DateEnd = '2002/01/01'
		SET @i = 0 + IDENT_CURRENT('Users')
		SET @n = @n + IDENT_CURRENT('Users')
		INSERT INTO @userNames VALUES (1,'Roberto','Juarez') ,(2,'Gail','Jordan'), (3,'Marta','Soto'),(4,'Juan','Perez'),(5,'Pedro','Coto'),	(6,'Alicia','Vega'),(7,'Leo','Farinha'),(8,'Ricardo','Araya')

		WHILE (@i < @n)	
		BEGIN
				SET @nombreid= CAST(RAND()*8+1 AS INT)
				SELECT @nombre = name FROM @userNames WHERE id = @nombreid

				SET @nombreid= CAST(RAND()*8+1 AS INT)		
				SELECT @apellido = apellido FROM @userNames WHERE id = @nombreid

				SET @date = DATEADD(DAY, RAND() * DATEDIFF(DAY, @DateStart, @DateEnd), @DateStart)
				SET @mail = CONCAT(@nombre,@apellido,CONVERT(VARCHAR,@i),'@gmail.com')
				SET @nombre =  CONCAT(@nombre,CONVERT(VARCHAR(50),@i))

				INSERT INTO Users VALUES 
				(@nombre, 1, @apellido,@mail, CONVERT(VARBINARY,CHECKSUM(CONCAT(@nombre,@apellido,@i))),@date)
				SET @UserID = IDENT_CURRENT('Users')

				SET @FromDate = '2020-11-01 00:00:00' 
				SET @ToDate = '2020-12-30 00:00:00' 
				SET @Seconds = DATEDIFF(SECOND, @FromDate, @ToDate)
				SET @Random = ROUND(((@Seconds-1) * RAND()), 0)
				SET @RanStarDat = DATEADD(SECOND, @Random, @FromDate)
				SET @FromDate = '2023-01-01 00:00:00' 
				SET @ToDate = '2024-01-30 00:00:00' 
				SET @Seconds = DATEDIFF(SECOND, @FromDate, @ToDate)
				SET @Random = ROUND(((@Seconds-1) * RAND()), 0)
				SET @RanEndDat = DATEADD(SECOND, @Random, @FromDate)
				INSERT INTO MediaAuthentication VALUES 
				(CRYPT_GEN_RANDOM(200),@RanStarDat,@RanEndDat,@UserID,CAST(RAND()*(3-1)+1 AS INT),CRYPT_GEN_RANDOM(200))

				SET @FromDate = '2021-01-01 00:00:00' 
				SET @ToDate = '2021-12-30 00:00:00' 
				SET @Seconds = DATEDIFF(SECOND, @FromDate, @ToDate)
				SET @Random = ROUND(((@Seconds-1) * RAND()), 0)
				SET @RanEndDat = DATEADD(SECOND, @Random, @FromDate)

				SET @Random = RAND()*10

				IF @Random > 9
					SET @PointLoc = geography::Point(RAND()*(40.09755-38.09755 )+38.09755 , RAND()*(-93.58253-(-95.58253))-95.58253, 4326)
				IF @Random > 7 AND @Random <= 9 
					SET @PointLoc = geography::Point(RAND()*(48.60864-46.60864)+46.60864  , RAND()*(-121.34741-(-123.34741))-123.34741, 4326)
				IF @Random <= 7 
					SET @PointLoc = geography::Point(RAND()*(41.71948-39.71948)+39.71948  , RAND()*(-73.01427-(-75.01427))-75.01427, 4326)

				INSERT INTO LocationsxUser VALUES
				(@UserID,@PointLoc,@RanEndDat)

				SET @i = @i + 1
		END	 
			
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	
END