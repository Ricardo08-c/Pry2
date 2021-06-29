-- ---------------------------------------------------------
-- Autor: Leonardo Fariña
-- Fecha: 26/06/2021
-- Descripcion: Sp que hace Posts con Jmeter
-- Parametro: Cantidad de Checkins a hacer en changeit
-- Ejemplo de como poner los Posts:
-- DECLARE @RA INT
-- SET @RA =  CAST((RAND()*(12000-2000)+2000) AS INT)
-- EXEC changeit_SP_PostsJmeter @RA
--
-- Ejemplo de como obtener las URLS
--DECLARE @Num INT
--SET @Num = (SELECT TOP 1 ValueId FROM [Values] WHERE [UTMTagId] = 1)
--SELECT CONCAT('www.changeit.com/', (SELECT Value FROM [Values] WHERE [UTMTagId] = 1 AND ValueId = @Num ), '/', (SELECT Value FROM [Values] WHERE [UTMTagId] = 1 AND ValueId = @Num+1) )
--SELECT CONCAT('www.changeit.com/', (SELECT Value FROM [Values] WHERE [UTMTagId] = 1 AND ValueId = @Num ), '/', (SELECT Value FROM [Values] WHERE [UTMTagId] = 1 AND ValueId = @Num+1) ,
--'/', (SELECT Value FROM [Values] WHERE [UTMTagId] = 1 AND ValueId = @Num+2) ,'/', (SELECT Value FROM [Values] WHERE [UTMTagId] = 1 AND ValueId = @Num+3) ,
--'/', (SELECT Value FROM [Values] WHERE [UTMTagId] = 1 AND ValueId = @Num+4) ,'/', (SELECT Value FROM [Values] WHERE [UTMTagId] = 1 AND ValueId = @Num+5) ,
--'/', (SELECT Value FROM [Values] WHERE [UTMTagId] = 1 AND ValueId = @Num+6))

-- ---------------------------------------------------------
GO
IF EXISTS(SELECT 1 FROM sys.procedures WHERE Name = 'changeit_SP_PostsJmeter')
DROP PROCEDURE dbo.changeit_SP_PostsJmeter
GO
CREATE PROCEDURE [dbo].changeit_SP_PostsJmeter
	@CantidadPosts BIGINT
AS 
BEGIN 
	DECLARE @RandMes BIGINT
	DECLARE @PostId BIGINT
	DECLARE @Name VARCHAR(128)
	DECLARE @PostURL VARCHAR(200)
	DECLARE @ActionURL VARCHAR(255)	
	DECLARE @UserID BIGINT
	DECLARE @UserName VARCHAR(100)
	DECLARE @IPaddres VARBINARY(16)
	DECLARE @StartDate DATETIME
	DECLARE @EndDate   DATETIME
	DECLARE @ComputerName VARCHAR(300)	
	DECLARE @PostTypeId BIGINT
	DECLARE @PostTime DATETIME
	DECLARE @AuxNum BIGINT 
	DECLARE @AuxNum2 BIGINT 
	DECLARE @AuxNum3 BIGINT 
	DECLARE @AuxNum4 BIGINT 
	DECLARE @UtmId BIGINT
	DECLARE @ValueId BIGINT
	DECLARE @PostName VARCHAR(100)
	DECLARE @RanEndDat   DATETIME
	DECLARE @Seconds BIGINT
	DECLARE @Random BIGINT
	DECLARE @NumWhi BIGINT
	DECLARE @IdDatos BIGINT
	DECLARE @HabitId BIGINT
	DECLARE @HabitName VARCHAR(128)
	DECLARE @Cantidad BIGINT
	DECLARE @Canti1 BIGINT
	DECLARE	@Quantity BIGINT
	DECLARE	@meassureUnit VARCHAR(20)
	DECLARE	@name2 VARCHAR(128)

	DECLARE @Datos AS TABLE
	(	Cantidad BIGINT,
		HabitId BIGINT,
		Quantity BIGINT,
		meassureUnit VARCHAR(20), 
		name VARCHAR(128),
		AuxId BIGINT IDENTITY(1,1)
	)

	SET @AuxNum = 1
	SET @PostTypeId = 2	
	set @StartDate	= '2021-01-01'
	SET @EndDate = DateAdd(MONTH, CAST(RAND()*(13-1)+1 AS INT) , @StartDate)
	SET @StartDate = DateAdd(MONTH, -1 , @EndDate)


	WHILE @AuxNum <= @CantidadPosts
	BEGIN
		set ansi_nulls off
		SET @UserID = CAST(RAND()*(IDENT_CURRENT('Users')) AS BIGINT)
		WHILE (SELECT Name FROM Users WHERE UserId = @UserID) = NULL OR (SELECT DISTINCT UserId FROM HabitCheck WHERE UserId = @UserID) = NULL
			BEGIN
			SET @UserID = CAST(RAND()*(IDENT_CURRENT('Users')) AS BIGINT)
			END

		DELETE @Datos
		INSERT INTO @Datos	
		SELECT COUNT(Che.UserId),Che.HabitId,Aco.Quantity , Aco.meassureUnit , Achi.name FROM dbo.AcomplishedGoals Aco 
		LEFT MERGE JOIN [dbo].[Achievements] Achi on Achi.AchievementId = Aco.[AchievmentId]
		INNER MERGE JOIN dbo.HabitCheck Che on Che.HabitId = Aco.HabitId		
		WHERE Che.UserId = @UserID
		GROUP BY Che.HabitId,Aco.Quantity , Aco.meassureUnit , Achi.name 
		OPTION (HASH GROUP, FAST 10)

		SET @IdDatos = (SELECT CAST(RAND()*(SELECT COUNT(AuxId) FROM @Datos)+1 AS BIGINT))

		SELECT @Canti1 = Cantidad, @HabitId = HabitId, @Quantity = Quantity, @meassureUnit = meassureUnit, @name2 = name
		FROM @Datos WHERE AuxId = @IdDatos

		
		SET @Cantidad = @Canti1 * @Quantity

		SELECT @HabitName = Tittle FROM Habits WHERE HabitId = @HabitId

		SET @Name = CONCAT( (SELECT Name FROM Users WHERE UserId = @UserID), @UserID, CONVERT(BIGINT , IDENT_CURRENT('Posts')) )
		 
		SET @IPaddres = CAST( CONCAT(CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1)) AS VARBINARY)
		SET @PostName = (SELECT name FROM [dbo].[PostTypes] WHERE PostTypeId = @PostTypeId)



		SET @PostURL = CONCAT('www.changeit.com/', @PostName , '/', @Name)
		SET @ActionURL = CONCAT('www.changeit.com/', @PostName , '/', @Name ,'/', @UserID ,'/',CONCAT(@HabitName,'/',@Cantidad,'/',@meassureUnit,'/',@name2))
		SET @UserName = CONCAT('User-',@Name)
		SET @PostTime = DateAdd(DAY,CAST(RAND()*(365-1)+1 AS INT)*(-1), @StartDate)
		SET @ComputerName = CONCAT('PC-',@Name)


		INSERT INTO Posts
		VALUES(@name,@PostURL,@UserId,@PostTypeId,@PostTime,@ActionURL,@StartDate,@EndDate,@ComputerName,@UserName,@IPaddres, 
		CHECKSUM(@name,@PostURL,@UserId,@PostTypeId,@PostTime,@ActionURL,@StartDate,@EndDate,@ComputerName,@UserName,@IPaddres))

		SET @PostId = SCOPE_IDENTITY()

		INSERT INTO [dbo].[UTMTags] VALUES (CAST( (RAND()*(100000-1)+1) AS BIGINT) +@PostId )

		SET @UtmId = SCOPE_IDENTITY()

		INSERT INTO [dbo].[Values] ([Value],[UTMTagId])VALUES
		(CAST(@PostName AS VARCHAR),@UtmId),
		(CAST(@Name AS VARCHAR),@UtmId),
		(CAST(@UserID AS VARCHAR),@UtmId),
		(CAST(@HabitName AS VARCHAR),@UtmId),
		(CAST(@Cantidad AS VARCHAR),@UtmId),
		(CAST(@meassureUnit AS VARCHAR),@UtmId),
		(CAST(@name2 AS VARCHAR),@UtmId)


		INSERT INTO [dbo].[TagsxPost] VALUES
		(@PostId,@UtmId)


		SET @Seconds = DATEDIFF(SECOND, @StartDate, @EndDate)
		SET @Random = ROUND(((@Seconds-1) * RAND()), 0)
		SET @RanEndDat = DATEADD(SECOND, @Random, @StartDate)
		SET @AuxNum2 = CAST(RAND()*IDENT_CURRENT('Users') AS BIGINT)
		SET @AuxNum3 = CAST(RAND()*(3-1)+1 AS BIGINT)
		SET @AuxNum4 = CAST(RAND()*(100000-100)+100 AS BIGINT)

		INSERT INTO [dbo].[PostInteractions] VALUES
		(@PostId, 
		@AuxNum2, 
		@AuxNum3, 
		@RanEndDat, 
		@AuxNum4,
		CHECKSUM(@PostId,@AuxNum2,@AuxNum3,@RanEndDat,@AuxNum4,@StartDate,@RanEndDat,@ComputerName,@UserName,@IPaddres), 
		@StartDate,
		@RanEndDat,
		@ComputerName,
		@UserName,
		@IPaddres)	

		SET @AuxNum = @AuxNum + 1 
	END	
	COMMIT
END