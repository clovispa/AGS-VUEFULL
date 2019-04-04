go

use Facturador

If Exists (Select 1 from sys.sysobjects
 Where Id = OBJECT_ID(N'[dbo].[SPNUMEROFACTURA]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPNUMEROFACTURA]
  GO

CREATE PROCEDURE SPNUMEROFACTURA 
			@Op						Varchar		  (10)    = ''
	    ,	@CodPrefijoConse		Numeric       (20,0)  = 0
        ,	@Base_Num				Varchar       (25)    = ''
        ,	@Separador				Varchar       (10)    = ''
        ,	@HabilitarCeros			bit					  
        ,	@CantidadCeros			Varchar       (50)    = ''
        ,	@HabPrefResolucion		bit					  

WITH ENCRYPTION 
AS
BEGIN

		SET NOCOUNT ON
	IF @Op = 'I'
	BEGIN
		IF EXISTS(SELECT 1 FROM NumeroFactura WHERE CodPrefijoConse = @CodPrefijoConse)
		BEGIN 
			RAISERROR ('CONFIGURACION', 16, 1)
				RETURN 1 
		 END
		 BEGIN TRANSACTION 
			INSERT INTO NumeroFactura (CodPrefijoConse, Base_Num, Separador, HabilitarCeros, CantidadCeros, HabPrefResolucion) 
			VALUES (@CodPrefijoConse,  @Base_Num, @Separador, @HabilitarCeros, @CantidadCeros, @HabPrefResolucion) 

		IF @@ERROR <> 0
		BEGIN 
			RAISERROR('Error Guardando la Configuracion.', 16, 1)
				ROLLBACK TRANSACTION
				RETURN 1
		END
		COMMIT TRANSACTION
		RETURN 0
	END
	
	IF @Op = 'U'
		BEGIN
		    UPDATE NumeroFactura
			 SET 
					--   Codigo				 = @Codigo
			 			 Base_Num			 = @Base_Num
					 ,	 Separador			 = @Separador
					 ,	 HabilitarCeros		 = @HabilitarCeros
					 ,	 CantidadCeros		 = @CantidadCeros
					 ,   HabPrefResolucion	 = @HabPrefResolucion
			 
			 WHERE		CodPrefijoConse = @CodPrefijoConse
	
			 RETURN 0
	     END
	IF @Op = 'D'
	BEGIN
		DELETE FROM NumeroFactura WHERE CodPrefijoConse = @CodPrefijoConse
		RETURN 0
	END
	IF @Op = 'sFactura'
	BEGIN 
		SELECT 
				 CodPrefijoConse
			 ,	 Base_Num				 
			 ,	 Separador			 
			 ,	 HabilitarCeros		 
			 ,	 CantidadCeros		 
			 ,   HabPrefResolucion	 

			FROM  NumeroFactura
	        WHERE CodPrefijoConse = @CodPrefijoConse

		RETURN 0
	END
	IF @Op = 'S'
	BEGIN 
		SELECT 
				 CodPrefijoConse
			 ,	 Base_Num				 
			 ,	 Separador			 
			 ,	 HabilitarCeros		 
			 ,	 CantidadCeros		 
			 ,   HabPrefResolucion	 

			FROM  NumeroFactura
	      

		RETURN 0
	END
	IF @Op = 'sUsuario'
	BEGIN 
		SELECT 
				 CodPrefijoConse
			 ,	 Base_Num				 
			 ,	 Separador			 
			 ,	 HabilitarCeros		 
			 ,	 CantidadCeros		 
			 ,   HabPrefResolucion	 

			FROM  NumeroFactura
        WHERE	CodPrefijoConse = @CodPrefijoConse

		RETURN 0

	END
END


   exec SPNUMEROFACTURA @op='S'