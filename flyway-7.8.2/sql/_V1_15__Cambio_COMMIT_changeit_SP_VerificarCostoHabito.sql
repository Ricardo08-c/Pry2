-- ---------------------------------------------------------
-- Autor: Leonardo Fariña
-- Fecha: 23/06/2021
-- Descripcion: Sp que calcula el costo minimo en un punto geografico
-- Parametro punto geografico y el radio que quiere abarcar
-- Se necesita tener 'set ansi_nulls off'
--
-- Codigo de ejemplo:
--
-- declare @location geography = geography::Point(10.660108958171534, 107.77588345061677, 4326)
-- declare @Ratio float = 3000
-- declare @Amount MONEY
-- EXEC @Amount = dbo.changeit_SP_VerificarCostoHabito @location,@Ratio
-- SELECT @Amount
-- ---------------------------------------------------------

GO
IF EXISTS(SELECT 1 FROM sys.procedures WHERE Name = 'changeit_SP_VerificarCostoHabito')
DROP PROCEDURE dbo.[changeit_SP_VerificarCostoHabito]
GO
CREATE PROCEDURE [dbo].[changeit_SP_VerificarCostoHabito]
	@CenterPoint GEOGRAPHY,
	@Ratio FLOAT
AS 
BEGIN	
	SET NOCOUNT ON
	set ansi_nulls off
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)

	DECLARE @locationId BIGINT
	DECLARE @locationId2 BIGINT
	DECLARE @PriceId BIGINT
	DECLARE @Point GEOGRAPHY
	DECLARE @Enable BIT
	DECLARE @Amount MONEY
	DECLARE @TotalAmount MONEY
	DECLARE @QuantHab BIGINT
	DECLARE @AuxQuantHab BIGINT
	DECLARE @inside INT
	DECLARE @Population FLOAT
	DECLARE @PasValue MONEY
	DECLARE habitxlocaCursor CURSOR FOR SELECT LocationId,Enabled,Amount FROM dbo.LocationsxHabit
    DECLARE habitCheckCursor CURSOR FOR SELECT LocationId FROM dbo.HabitCheck

	SET @QuantHab = 0
	SET @TotalAmount = 1
	OPEN habitxlocaCursor
		FETCH NEXT FROM habitxlocaCursor INTO @locationId,@Enable,@Amount 
		WHILE @@FETCH_STATUS = 0
		BEGIN		
			IF @Enable = 1 
				SET @Point = (SELECT Location FROM Locations WHERE @locationId=LocationId )
				EXEC @inside = dbo.changeit_SP_VerificarPuntoHabito @Point,@Ratio,@CenterPoint
				IF @inside = 1
					SET @QuantHab = @QuantHab + 1
					SET @TotalAmount = @TotalAmount + @Amount
			FETCH NEXT FROM habitxlocaCursor INTO @locationId,@Enable,@Amount
		END
	CLOSE habitxlocaCursor
	DEALLOCATE habitxlocaCursor

	SET @Population = 1

	OPEN habitCheckCursor
		FETCH NEXT FROM habitCheckCursor INTO @locationId
		WHILE @@FETCH_STATUS = 0
		BEGIN		
			SET @Point = (SELECT Location FROM Locations WHERE @locationId=LocationId )
			EXEC @inside = dbo.changeit_SP_VerificarPuntoHabito @Point,@Ratio,@CenterPoint
			IF @inside = 1
				SET @Population = @Population + 1
			FETCH NEXT FROM habitCheckCursor INTO @locationId
		END
	CLOSE habitCheckCursor
	DEALLOCATE habitCheckCursor

	SET @TotalAmount = ((@TotalAmount/(@QuantHab+1))*(@Population/100))+10+(@Ratio/100)

	BEGIN TRY
		SET @CustomError = 2001

		SET @locationId = (SELECT LocationId FROM Locations WHERE Location.STDistance (@CenterPoint) = 0 )

		IF @locationId = NULL
			BEGIN
				IF IDENT_CURRENT('Cities') = NULL
					INSERT INTO [dbo].[Cities] VALUES ('El más alla')
				IF IDENT_CURRENT('Locations') <> NULL
					INSERT INTO Locations VALUES (CONCAT('PuntoPrecio',IDENT_CURRENT('Locations')),1,@CenterPoint)
				IF IDENT_CURRENT('Locations') = NULL
					INSERT INTO Locations VALUES (CONCAT('PuntoPrecio',0),1,@CenterPoint)
				SET @locationId2 = IDENT_CURRENT('Locations')
				INSERT INTO Prices VALUES (@locationId2,@TotalAmount,0, GETDATE()) 
			END
		ELSE
			BEGIN
				SET @PriceId = (SELECT PriceId FROM Prices WHERE LocationId = (@locationId))
				IF @PriceId = NULL
					BEGIN
						INSERT INTO Prices VALUES (@locationId,@TotalAmount,0, GETDATE()) 
					END
				ELSE
					BEGIN
						SET @PasValue = (SELECT ToValue FROM Prices WHERE PriceId = @PriceId)
						UPDATE Prices SET ToValue = @TotalAmount, FromValue = @PasValue , PostTime = GETDATE() WHERE PriceId = @PriceId
					END
			END	
		
		RETURN @TotalAmount

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