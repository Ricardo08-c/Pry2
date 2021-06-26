-- ---------------------------------------------------------
-- Autor: Leonardo Fariña
-- Fecha: 23/06/2021
-- Descripcion: Sp que verifica si un punto esta dentro de un radio de otro punto
-- Parametro punto geografico y referencia a un Habito
-- ---------------------------------------------------------
GO
IF EXISTS(SELECT 1 FROM sys.procedures WHERE Name = 'changeit_SP_VerificarPuntoHabito')
DROP PROCEDURE dbo.[changeit_SP_VerificarPuntoHabito]
GO
CREATE PROCEDURE [dbo].[changeit_SP_VerificarPuntoHabito]
	@Point GEOGRAPHY,
	@Ratio FLOAT,
	@CenterPoint GEOGRAPHY
AS 
BEGIN	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	   	
	BEGIN TRY
		SET @CustomError = 2001

		return @CenterPoint.BufferWithTolerance ( @Ratio, 0.1, 1 ).STContains(@Point)
			
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