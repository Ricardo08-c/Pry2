-- ---------------------------------------------------------
-- Autor: Leonardo Fariña
-- Fecha: 28/06/2021
-- Descripcion: Se paga al usuario proporcionalmente a lo patrocinado
-- Paramatros: Mes que se quiere pagar a los patrocinadores
-- Ejemplo:
-- DECLARE @Date DATETIME
-- SET @Date = GETDATE()
-- EXEC [changeit_SP_RetornarPlataPatrocinios] @Date
-- ---------------------------------------------------------

GO
IF EXISTS(SELECT 1 FROM sys.procedures WHERE Name = 'changeit_SP_RetornarPlataPatrocinios')
DROP PROCEDURE dbo.[changeit_SP_RetornarPlataPatrocinios]
GO
CREATE PROCEDURE [dbo].[changeit_SP_RetornarPlataPatrocinios]
	@Mes INT
AS 
BEGIN	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	DECLARE @Amount DECIMAL(10,2)
	DECLARE @HabitId BIGINT
	DECLARE @UserId BIGINT
	DECLARE @SubTypeTraId BIGINT
	DECLARE @TypeTraId BIGINT

	DECLARE @CheckSum VARBINARY(300)
	DECLARE @ComputerName VARCHAR(200)
	DECLARE @Description VARCHAR(255)
	DECLARE @IPaddres VARBINARY(16)
	DECLARE @PaymentAtt BIGINT
	DECLARE @Destina BIGINT
	DECLARE @PayADS DECIMAL(10,2)
	DECLARE @PayUS DECIMAL(10,2)
	DECLARE @Random INT
	DECLARE @AuxIdHab2 BIGINT
	DECLARE @AuxIdHab BIGINT
	DECLARE @HabAnt BIGINT
	DECLARE @UserName VARCHAR(128)
	DECLARE @Date DATETIME

	DECLARE @AuxHabits AS TABLE
	(	HabitId BIGINT,
		UserId BIGINT,
		AuxId BIGINT IDENTITY(1,1)
	)

	INSERT INTO @AuxHabits	
	SELECT tra.HabitId, tra.ReferenceId1 FROM Transactions tra
	WHERE MONTH(tra.Date) = @Mes AND tra.TransSubTypeId = 2
	ORDER BY tra.HabitId


	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	BEGIN TRY
		SET @CustomError = 2001
		
		SET @Date = DATEADD(MONTH,1,CAST(CONCAT(YEAR(GETDATE()),'-',@Mes,'-01') AS DATETIME))
		SET @AuxIdHab2 = CAST((SELECT COUNT(AuxId) FROM @AuxHabits) AS BIGINT)
		SET @AuxIdHab = 1
		SET @HabAnt = 0
		SET @Random = RAND()*3
		SET @ComputerName = 'PC-CHANGEIT'
		SET @IPaddres = CAST('0.4.2.0' AS VARBINARY)
		SET @SubTypeTraId = 3
		SET @TypeTraId = 2
		SET @Destina = 0

		WHILE @AuxIdHab <= @AuxIdHab2
			BEGIN
				SET @UserId = (SELECT UserId FROM @AuxHabits WHERE AuxId = @AuxIdHab)
				SET @HabitId = (SELECT HabitId FROM @AuxHabits WHERE AuxId = @AuxIdHab)
	
				IF @HabAnt <> @HabitId
					SET @Random = CAST(RAND()*3 AS INT)

				SET @Amount = (SELECT SUM(tra.Amount) FROM Transactions tra 
				WHERE MONTH(tra.Date) = @Mes AND tra.TransSubTypeId = 2 
				AND tra.HabitId = @HabitId	AND tra.ReferenceId1 = @UserId
				GROUP BY tra.HabitId)

				SET @Amount = @Amount * @Random

				SELECT @UserName = Name FROM Users WHERE UserId = @UserId
				SET @Description = CONCAT('Pago de ',@Amount, ' de changeit para ', @UserName)	

				INSERT INTO PaymentAttempts
				([Amount],[description],[CurrencySymbol],[Posttime],[ReferenceNumber],[UserId],[ErrorNumber],[MerchantTransNumber],[IpAdress],[CheckSum],[MerchantId],[PaymentStatusId])
				VALUES
				(@Amount,@Description,'$',@Date,@Destina,@UserId,0,CAST(RAND()*10 AS INT),@IPaddres,
				CHECKSUM(@Amount,@Description,'$',@Date,@Destina,@UserId,0,@IPaddres),1,1)

				SET @PaymentAtt = SCOPE_IDENTITY()

				INSERT INTO Transactions VALUES
				(CHECKSUM(@ComputerName,@Date,@TypeTraId,@SubTypeTraId,@Destina,@UserId,@Amount,@Description,@IPaddres)
				,@ComputerName,@Date,@TypeTraId,@SubTypeTraId,@UserId,@Destina,@Amount,@Description,@IPaddres,@PaymentAtt,@HabitId)


				SET @HabAnt = @HabitId		
				SET @AuxIdHab = @AuxIdHab + 1
			END

		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	
END
