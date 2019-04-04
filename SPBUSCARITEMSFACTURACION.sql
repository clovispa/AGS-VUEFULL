go

use Facturador

If Exists (Select 1 from sys.sysobjects
 Where Id = OBJECT_ID(N'[dbo].[SPBUSCARITEMSFACTURACION]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPBUSCARITEMSFACTURACION]
  GO

CREATE PROCEDURE SPBUSCARITEMSFACTURACION

			
		 
		  @Op				 Varchar		(10)	= ''
		 ,@Codigo			 numeric		(20,0)	= 0
	     ,@Nombre		     Varchar		(500)   = ''
		 ,@Tipo			     numeric		(20,0)	= 0
		

		


WITH ENCRYPTION 
AS

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
	IF @Op = 'sCodigo'
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
		IF @Op = 'sNombre'
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
			WHERE Nombre = @Nombre

			RETURN 0

		END
		IF @Op = 'sTipo'
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
			WHERE Tipo	 = @Tipo	

			RETURN 0

		END

	go
	   exec SPBUSCARITEMSFACTURACION @op='sNombre'