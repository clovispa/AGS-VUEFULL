go

use Facturador

If Exists (Select 1 from sys.sysobjects Where Id = OBJECT_ID(N'[dbo].[SPRESOLUCIONFACTURACION]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPRESOLUCIONFACTURACION]
  GO

CREATE PROCEDURE SPRESOLUCIONFACTURACION         
					@Op				    	Varchar		(20)
                ,   @Iden			        Numeric		(20,0)	= 0
			    ,	@Codigo					Varchar		(25)	= ''
				,	@NoResolucion		    Varchar		(50)	= ''
				,	@FechaResolucion	    SmallDateTime	    = ''
				,	@FechaInicio			SmallDateTime		= ''
				,	@FechaFinal				SmallDateTime	    = ''
				,	@Prefijo				Varchar		(50)	= ''
				,	@RangoInicialLegal		Numeric		(20,0)	= 0
				,	@RangoFinalLegal		Numeric		(20,0)	= 0
				,	@RangoInicialInterno    Numeric		(20,0)	= 0
				,	@RangoFinalInterno		Numeric		(20,0)  = 0
				,	@ResolucionTexto		Varchar		(500)	= ''
				,	@ValidaDiasAlertVigencia Bit				= 0
				,	@DiasAlertVigencia		int				    = 0
				,	@ValidDiasAlertDcto	    Bit					= 0
				,	@DiasAlertDcto			int					= 0





WITH ENCRYPTION 
AS
BEGIN
		SET NOCOUNT ON
	IF @Op = 'I'
	BEGIN
	  IF EXISTS(SELECT 1 FROM ResolucionFacturacion WHERE Codigo = @Codigo)
		BEGIN 
	      RAISERROR ('RESOLUCION DE FACTURACION ya existe ', 16, 1)
		RETURN 1 
		END
		BEGIN TRANSACTION 
				INSERT INTO ResolucionFacturacion(Codigo,  NoResolucion, FechaResolucion, FechaInicio, FechaFinal, Prefijo, RangoInicialLegal, RangoFinalLegal	, RangoInicialInterno, RangoFinalInterno, ResolucionTexto, ValidaDiasAlertVigencia, DiasAlertVigencia, ValidDiasAlertDcto, DiasAlertDcto) 
				VALUES (@Codigo , @NoResolucion, @FechaResolucion, @FechaInicio, @FechaFinal, @Prefijo, @RangoInicialLegal, @RangoFinalLegal , @RangoInicialInterno, @RangoFinalInterno, @ResolucionTexto, @ValidaDiasAlertVigencia, @DiasAlertVigencia, @ValidDiasAlertDcto, @DiasAlertDcto)
			IF @@ERROR <> 0
			BEGIN 
				RAISERROR('Error creando RESOLUCION DE FACTURACION.', 16, 1)
				ROLLBACK TRANSACTION 
				RETURN 1
			END
		COMMIT TRANSACTION
		RETURN 0
	END

	 IF @Op = 'U'
	 BEGIN
	    UPDATE ResolucionFacturacion
		 SET Codigo =@Codigo
			,NoResolucion =@NoResolucion
			, FechaResolucion =@FechaResolucion
			, FechaInicio =@FechaInicio
			, FechaFinal =@FechaFinal
			, Prefijo =@Prefijo
			, RangoInicialLegal =@RangoInicialLegal
			, RangoFinalLegal =@RangoFinalLegal	
			, RangoInicialInterno =@RangoInicialInterno
			, RangoFinalInterno =@RangoFinalInterno
			, ResolucionTexto =@ResolucionTexto
			, ValidaDiasAlertVigencia =@ValidaDiasAlertVigencia
			, DiasAlertVigencia =@DiasAlertVigencia
			, ValidDiasAlertDcto =@ValidDiasAlertDcto
			, DiasAlertDcto =@DiasAlertDcto

		 WHERE Codigo = @Codigo

		 RETURN 0
     END
	
	IF @Op = 'D'
    BEGIN
		DELETE FROM ResolucionFacturacion WHERE Codigo = @Codigo
		RETURN 0
	END
	
	IF @Op = 'S'
	BEGIN 
		 SELECT  
		      Iden
			, Codigo
			, NoResolucion
			, FechaResolucion
			, FechaInicio
			, FechaFinal
			, Prefijo
			, RangoInicialLegal
			, RangoFinalLegal	
			, RangoInicialInterno
			, RangoFinalInterno
			, ResolucionTexto
			, ValidaDiasAlertVigencia
			, DiasAlertVigencia
			, ValidDiasAlertDcto
			, DiasAlertDcto

		FROM ResolucionFacturacion
		RETURN 0
	END
	IF @Op = 'sResolucionFact'
		BEGIN 
			SELECT 
					  Iden
					, Codigo
					, NoResolucion
					, FechaResolucion
					, FechaInicio
					, FechaFinal
					, Prefijo
					, RangoInicialLegal
					, RangoFinalLegal	
					, RangoInicialInterno
					, RangoFinalInterno
					, ResolucionTexto
					, ValidaDiasAlertVigencia
					, DiasAlertVigencia
					, ValidDiasAlertDcto
					, DiasAlertDcto
			FROM  ResolucionFacturacion
			WHERE Codigo = @Codigo

		RETURN 0
		END
   END
   GO


    exec SPRESOLUCIONFACTURACION @op='S'