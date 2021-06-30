-- ---------------------------------------------------------
-- Autor: Leonardo Fariña
-- Fecha: 25/06/2021
-- Descripcion: Se paga el patrocinio a un Habito por un Usuario (nos dejamos el 10%)
-- Paramatros: Nombre de usuario , Nombre del Habito y el Monto
-- Ejemplo:
-- DECLARE @Date DATETIME
-- SET @Date = GETDATE()
-- EXEC [changeit_SP_PatrocinarUnHabito] 'NAME1','Juan3',1302,@Date
-- ---------------------------------------------------------

GO
IF EXISTS(SELECT 1 FROM sys.procedures WHERE Name = 'changeit_SP_PatrocinarUnHabito')
DROP PROCEDURE dbo.[changeit_SP_PatrocinarUnHabito]
GO
CREATE PROCEDURE [dbo].[changeit_SP_PatrocinarUnHabito]
	@HabitName VARCHAR(128),
	@UserName VARCHAR(128),
	@Amount DECIMAL(10,2),
	@Date DATETIME
AS 
BEGIN	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

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


	SET @ComputerName = CONCAT('PC-',@UserName)
	SET @IPaddres = CAST( CONCAT(CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1)) AS VARBINARY)

	
	SET @UserId = (SELECT UserId FROM Users WHERE Name = @UserName)
	SET @TypeTraId = 1
	SET @Destina = 0

	SET @PayADS = @Amount*0.9
	SET @PayUS = @Amount*0.1

	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	BEGIN TRY
		SET @CustomError = 2001
		SET @HabitId = (SELECT HabitId FROM Habits WHERE Name = @HabitName)

		SET @SubTypeTraId = 4
		SET @Description = CONCAT('Pago de ',@PayUS, ' de ', @UserName, ' para changeit')	
		INSERT INTO PaymentAttempts
		([Amount],[description],[CurrencySymbol],[Posttime],[ReferenceNumber],[UserId],[ErrorNumber],[MerchantTransNumber],[IpAdress],[CheckSum],[MerchantId],[PaymentStatusId])
		VALUES
		(@PayUS,@Description,'$',@Date,@Destina,@UserId,0,CAST(RAND()*10 AS INT),@IPaddres,
		CHECKSUM(@PayUS,@Description,'$',@Date,@Destina,@UserId,0,@IPaddres),1,1)
		SET @PaymentAtt = SCOPE_IDENTITY()
		INSERT INTO Transactions VALUES
		(CHECKSUM(@ComputerName,@Date,@TypeTraId,@SubTypeTraId,@UserId,@Destina,@Amount,@Description,@IPaddres)
		,@ComputerName,@Date,@TypeTraId,@SubTypeTraId,@UserId,@Destina,@PayUS,@Description,@IPaddres,@PaymentAtt,@HabitId)

		SET @SubTypeTraId = 2
		SET @Description = CONCAT('Pago de ',@PayADS, ' de ', @UserName, ' para patrocinar ', @HabitName)	
		INSERT INTO PaymentAttempts 
		([Amount],[description],[CurrencySymbol],[Posttime],[ReferenceNumber],[UserId],[ErrorNumber],[MerchantTransNumber],[IpAdress],[CheckSum],[MerchantId],[PaymentStatusId])
		VALUES
		(@PayADS,@Description,'$',@Date,@Destina,@UserId,0,CAST(RAND()*10 AS INT),@IPaddres,
		CHECKSUM(@PayADS,@Description,'$',@Date,@Destina,@UserId,0,@IPaddres),1,1)
		SET @PaymentAtt = SCOPE_IDENTITY()
		INSERT INTO Transactions VALUES
		(CHECKSUM(@ComputerName,@Date,@TypeTraId,@SubTypeTraId,@UserId,@Destina,@Amount,@Description,@IPaddres)
		,@ComputerName,@Date,@TypeTraId,@SubTypeTraId,@UserId,@Destina,@PayADS,@Description,@IPaddres,@PaymentAtt,@HabitId)

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