-- ---------------------------------------------------------
-- Autor: Ricardo Soto
-- Fecha: 23/06/2021
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
	DECLARE @date DATE 

	BEGIN TRY
		SET @CustomError = 2001
		SET @DateStart = '1990/01/01'
		SET @DateEnd = '2002/01/01'
		SET @i = 0

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










