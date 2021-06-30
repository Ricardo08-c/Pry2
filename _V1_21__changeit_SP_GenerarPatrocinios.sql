-- ---------------------------------------------------------
-- Autor: Leonardo Fariña
-- Fecha: 28/06/2021
-- Descripcion: Se generan N patrocinios de los usuarios
-- Paramatros: Cantidad que se quiere
-- Ejemplo:
-- EXEC [changeit_SP_GenerarPatrocinios] 1000
-- ---------------------------------------------------------

GO
IF EXISTS(SELECT 1 FROM sys.procedures WHERE Name = 'changeit_SP_GenerarPatrocinios')
DROP PROCEDURE dbo.changeit_SP_GenerarPatrocinios
GO
CREATE PROCEDURE [dbo].changeit_SP_GenerarPatrocinios
	@Cantidad BIGINT
AS 
BEGIN	
	SET NOCOUNT ON
	
	DECLARE @FromDate2 DATETIME
	DECLARE @ToDate2 DATETIME
	DECLARE @Seconds2 BIGINT
	DECLARE @Random2 BIGINT
	DECLARE @RanEndDat2 DATETIME
	DECLARE @randUser BIGINT
	DECLARE @randHabit BIGINT
	DECLARE @habname VARCHAR(128)
	DECLARE @usename VARCHAR(128)
	DECLARE @AuxNum BIGINT

	SET @AuxNum = 1

	WHILE @AuxNum <= @Cantidad
	BEGIN
		SET @FromDate2 = '2021-01-01 00:00:00'
		SET @ToDate2 = '2022-01-01 00:00:00'
		SET @Seconds2= DATEDIFF(SECOND, @FromDate2, @ToDate2)
		SET @Random2= ROUND(((@Seconds2-1) * RAND()), 0)
		SET @RanEndDat2= DATEADD(SECOND, @Random2, @FromDate2)

		set @randUser = cast(rand()*IDENT_CURRENT('Users') as BIGINT)
		IF @randUser = 0
			set @randUser = 1

		set @randHabit = cast(rand()*IDENT_CURRENT('Habits') as BIGINT)
		IF @randHabit = 0
			set @randHabit = 1

		SET @Random2 = CAST(RAND()*(100-1)+1 AS DECIMAL(10,2))
		SELECT @habname = Name FROM Habits WHERE HabitId= @randHabit
		SELECT @usename = Name FROM Users WHERE UserId= @randUser
		EXEC [changeit_SP_PatrocinarUnHabito] @habname,@usename,@Random2,@RanEndDat2
		SET @AuxNum = @AuxNum + 1
	END
END