go

use Facturador

If Exists (Select 1 from sys.sysobjects Where Id = OBJECT_ID(N'[dbo].[SPITEMSFACTURACION]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPITEMSFACTURACION]
  GO

CREATE PROCEDURE SPITEMSFACTURACION        
			
						@Op						Varchar		 (20)
					,	@Iden					Numeric		 (20,0)  =  0
					,   @Codigo					Varchar		 (25)   =  0
					,   @Nombre					Varchar		 (50)	 =  ''
					,	@DiasVencimiento		Int					 =  0
					,	@Tipo					Int					 =  ''
					,	@Cantidad				Int					 =  0
					,	@Valor					Numeric		 (20,0)  =  0
					,	@IndicadorManejaDescuento Bit				 =  0
					,	@PorcentajeDescuento	money			     =  0
					,	@IndicadorManejaIva		Bit		 			 =  0
					,	@PorcentajeIva			Money			     =  0 
					,	@DetalleEnFactura		Varchar		 (500)	 =  ''
					,	@Naturaleza				Bit				 	 =  0
					,   @Habilitar			    Bit					 =  0



WITH ENCRYPTION 
AS
BEGIN
		SET NOCOUNT ON
	IF @Op = 'I'
	BEGIN
	  IF EXISTS(SELECT 1 FROM ItemsFacturacion WHERE Codigo = @Codigo)
	   BEGIN 
	      RAISERROR ('ITEMS DE FACTURACION ya existe ', 16, 1)
		  RETURN 1 
		END

		BEGIN TRANSACTION 
			INSERT INTO ItemsFacturacion(Codigo, Nombre, DiasVencimiento, Tipo, Cantidad, Valor, IndicadorManejaDescuento, PorcentajeDescuento, IndicadorManejaIva, PorcentajeIva, DetalleEnFactura , Naturaleza , Habilitar	) 
			VALUES (@Codigo, @Nombre, @DiasVencimiento, @Tipo, @Cantidad, @Valor, @IndicadorManejaDescuento, @PorcentajeDescuento, @IndicadorManejaIva, @PorcentajeIva, @DetalleEnFactura , @Naturaleza, @Habilitar)
			IF @@ERROR <> 0

			BEGIN 
				RAISERROR('Error creando ITEMS DE FACTURACION .', 16, 1)
				ROLLBACK TRANSACTION 
				RETURN 1
			END
		COMMIT TRANSACTION
		RETURN 0
		END

	IF @Op = 'U'
	BEGIN
	    UPDATE ItemsFacturacion
		 SET  Codigo =@Codigo
		, Nombre =@Nombre
		, DiasVencimiento =@DiasVencimiento
		, Tipo =@Tipo
		, Cantidad =@Cantidad
		, Valor =@Valor
		, IndicadorManejaDescuento =@IndicadorManejaDescuento
		, PorcentajeDescuento =@PorcentajeDescuento
		, IndicadorManejaIva =@IndicadorManejaIva
		, PorcentajeIva =@PorcentajeIva
		, DetalleEnFactura =@DetalleEnFactura
		, Naturaleza =@Naturaleza
		, Habilitar =@Habilitar

		 WHERE Codigo = @Codigo

		 RETURN 0
    END

	IF @Op = 'D'
		BEGIN
			DELETE FROM ItemsFacturacion WHERE Codigo = @Codigo
			RETURN 0
		END

	IF @Op = 'S'
		BEGIN 
			SELECT  

				  Iden
				, Codigo 
				, Nombre 
				, DiasVencimiento 
				, Tipo 
				, Cantidad 
				, Valor 
				, IndicadorManejaDescuento 
				, PorcentajeDescuento 
				, IndicadorManejaIva 
				, PorcentajeIva 
				, DetalleEnFactura 
				, Naturaleza 
				, Habilitar

			FROM ItemsFacturacion
			RETURN 0
		END
	IF @Op = 'sIFacturacion'
		BEGIN 
		  SELECT 
				 Iden
		       ,  Codigo
			    , Nombre 
				, DiasVencimiento 
				, Tipo 
				, Cantidad 
				, Valor 
				, IndicadorManejaDescuento 
				, PorcentajeDescuento 
				, IndicadorManejaIva 
				, PorcentajeIva 
				, DetalleEnFactura 
				, Naturaleza 
				, Habilitar
			FROM  ItemsFacturacion
			WHERE Codigo = @Codigo

			RETURN 0

		END
   END
   GO


    exec SPITEMSFACTURACION @op='S'