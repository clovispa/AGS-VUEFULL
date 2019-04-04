go

use Facturador

If Exists (Select 1 from sys.sysobjects
 Where Id = OBJECT_ID(N'[dbo].[SPPREFIJOCONSECUTIVO]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPPREFIJOCONSECUTIVO]
  GO

CREATE PROCEDURE SPPREFIJOCONSECUTIVO 
			@Op					Varchar		    (30)= ''
-- ,		@Codigo				 numeric		(20,0)	= 0
	  ,		@Nombre				 Varchar		(50)	= ''
	  ,		@CodigoTransaccion	 numeric		(20,0)	= 0

WITH ENCRYPTION 
AS
BEGIN
		SET NOCOUNT ON
	IF @Op = 'I'
	BEGIN
		IF EXISTS(SELECT 1 FROM PrefijoConsecutivo WHERE Nombre = @Nombre)
		BEGIN 
			RAISERROR ('Prefijo ya existe ', 16, 1)
				RETURN 1 
		 END
		 BEGIN TRANSACTION 
			INSERT INTO PrefijoConsecutivo (Nombre,  CodigoTransaccion) 
			VALUES (@Nombre,  @CodigoTransaccion)

			INSERT INTO  Consecutivos ( Consecutivo)
			VALUES ( 0 )

		IF @@ERROR <> 0
		BEGIN 
			RAISERROR('Error creando el prefijo.', 16, 1)
				ROLLBACK TRANSACTION
				RETURN 1
		END
		COMMIT TRANSACTION
		RETURN 0
	END
	
	IF @Op = 'U'
		BEGIN
		    UPDATE PrefijoConsecutivo
			 SET 
				--Codigo = @Codigo
				 Nombre      = @Nombre	 
			 ,	 CodigoTransaccion    = @CodigoTransaccion
			 
			 WHERE   Nombre = @Nombre
	
			 RETURN 0
	     END
	IF @Op = 'D'
	BEGIN
		DELETE FROM PrefijoConsecutivo WHERE Nombre = @Nombre
		RETURN 0
	END
	IF @Op = 'S'
	BEGIN 
		SELECT 
			  Codigo
			, Nombre
			, CodigoTransaccion

			FROM PrefijoConsecutivo

		RETURN 0
	END
	IF @Op = 'sCodigo'
	BEGIN 
		SELECT 
		   
			  Codigo			
			, Nombre
			, CodigoTransaccion

			FROM  PrefijoConsecutivo
	        WHERE Nombre = @Nombre

		RETURN 0
	END
	IF @Op = 'ConsultarPrefijos'
	BEGIN 
		SELECT 
		   
			  Codigo			
			, Nombre

			FROM  PrefijoConsecutivo
	  
		RETURN 0
	END
	IF @Op = 'ConsPrefVentas'
	BEGIN 
		SELECT 
		   
			  Codigo			
			, Nombre

			FROM  PrefijoConsecutivo where CodigoTransaccion = 1 
	  
		RETURN 0
	END

	IF @Op = 'ConsPrefDevolucion'
	BEGIN 
		SELECT 
		   
			  Codigo			
			, Nombre

			FROM  PrefijoConsecutivo where CodigoTransaccion = 3 
	  
		RETURN 0
	END

	IF @Op = 'ConsPrefCotizacion'
	BEGIN 
		SELECT 
		   
			  Codigo			
			, Nombre

			FROM  PrefijoConsecutivo where CodigoTransaccion = 5
	  
		RETURN 0
	END
END


   exec SPPREFIJOCONSECUTIVO @op='S'