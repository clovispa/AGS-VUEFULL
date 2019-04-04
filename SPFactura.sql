go

use Facturador

If Exists (Select 1 from sys.sysobjects
 Where Id = OBJECT_ID(N'[dbo].[SPFACTURA]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPFACTURA]
  GO
  
SET QUOTED_IDENTIFIER ON

GO

CREATE PROCEDURE SPFACTURA
			@Op				 varchar       (10)   = ''
		,	@Fecha			 Varchar	   (10)   = null
		,	@Iden			 numeric	   (20,0) = 0	
		,	@Iden_Cliente	 numeric	   (20,0) = 0        
		,	@FormaPago		 numeric	   (20,0) = 0
		,	@Observacion	 varchar	   (500)  = ''
		,	@Iden_Usuario	 numeric	   (20,0) = 0
		,	@TasaCambio		 int				  = 1
		,	@Tipo			 int				  = 0		
		,	@NoCuota		 int				  = 0
		,	@Vencimiento	 smalldatetime 	      = null 
		,	@Concepto		 varchar 	   (max) 
		,	@ValorConceptos  numeric	   (20,0) = 0
		,   @ValorDescuentos numeric	   (20,0) = 0
		,   @ValorIva	     numeric	   (20,0) = 0
		,	@MontoLetras	 varchar	   (4000) = ''
		,	@ValorCuota		 numeric	   (20,2) = 0
		,	@Cod_PrefijoConse numeric	   (20,2)
		,	@Iden_Vendedor   numeric	   (20,2) = 0
		
		 

WITH ENCRYPTION 
AS

				
BEGIN
	SET NOCOUNT ON

		DECLARE @TablaIden TABLE(Iden NUMERIC(18, 0))
		DECLARE @Items TABLE(Iden_Cabecera NUMERIC(18,0), Codigo varchar(20), IdenItem NUMERIC(18, 0), 
				Nombre varchar(50), Descripcion varchar(50), ValorUnitario decimal(18,0), PorcentajeIva  decimal (18,0),
				Cantidad Numeric(18,0), SubTotal Numeric (20,2), ValorDescuento Numeric(20,2), ValorIva Numeric (20,2), Total Numeric(20,2))
		DECLARE @ItemsFact xml, @consecutivo numeric(20, 0)

		if @Op = 'I'
		BEGIN
			
			BEGIN TRANSACTION 
					
					BEGIN  TRY 
						SET @ItemsFact = @Concepto
					END TRY 
					BEGIN CATCH 
							RAISERROR('Error en la captura del XML para el procesamiento de las facturas.' , 16 , 1)
							RETURN 1
					END CATCH 

			set @consecutivo = 0
			EXEC SPGENERARCONSECUTIVO  @Cod_PrefijoConse, @consecutivo output

           INSERT INTO @Items
			SELECT 
			      Iden_Cabecera   = 0	
				, Codigo          = I.Items.value('Codigo[1]', 'varchar(20)')
				, IdenItem 		  = (SELECT Iden FROM ItemsFacturacion WHERE Codigo = I.Items.value('Codigo[1]', 'varchar(20)'))	    
				, Nombre          = I.Items.value('Nombre[1]', 'varchar(50)')
				, Descripcion     = I.Items.value('Descripcion[1]', 'varchar(50)')
				, ValorUnitario   = I.Items.value('ValorUnitario[1]', 'decimal(18,0)')
				, PorcentajeIva   = I.Items.value('PorcentajeIva[1]', 'decimal(18,0)')
				, Cantidad        = I.Items.value('Cantidad[1]', 'numeric(18,0)')
				, Subtotal        = I.Items.value('SubTotal[1]', 'numeric(20,2)')
				, ValorDescuentos = I.Items.value('ValorDescuento[1]', 'numeric(20,2)')
				, ValorIva        = I.Items.value('ValorIva[1]', 'numeric(20,2)')
				, Total           = I.Items.value('Total[1]', 'numeric(20,2)')
			   

		FROM   @ItemsFact.nodes('//ItemsFacturacion/Items') AS I(Items)  

		select * from @Items


		INSERT INTO CabeceraFactura(Tipo, Fecha, Iden_Cliente, FormaPago, ValorConceptos,
					ValorDescuento, ValorIva, Observacion, Iden_Usuario, MontoLetras, Iden_Resolu, 
					TasaCambio,Consecutivo_Fac, Cod_PrefijoConse, Iden_Vendedor)
		OUTPUT INSERTED.Iden INTO @TablaIden(Iden)
		SELECT 
				  Tipo            = @Tipo
				, Fecha           = CONVERT(smalldatetime, @Fecha,111)
				, Iden_Cliente    = (SELECT Iden FROM Clientes WHERE Num_docum = @Iden_Cliente ) 
				, FormaPago       = @FormaPago
				, ValorConceptos  = @ValorConceptos
				, ValorDescuentos = @ValorDescuentos
				, ValorIva        = @ValorIva
				, Observacion	  = @Observacion	
				, Iden_Usuario	  = (SELECT Iden FROM Usuarios )
				, MontoLetras	  = @MontoLetras  
				, Iden_Resolu	  = (SELECT Iden FROM ResolucionFacturacion)
				, TasaCambio	  = @TasaCambio
				, Consecutivo_Fac = @consecutivo
				, Cod_PrefijoConse = (SELECT Codigo FROM PrefijoConsecutivo WHERE Codigo = @Cod_PrefijoConse)
				, Iden_Vendedor   =  (SELECT Iden FROM Vendedor WHERE Codigo = @Iden_Vendedor)



		IF @@ERROR <> 0
		BEGIN 
			ROLLBACK TRANSACTION
			RETURN 1
		END

		UPDATE @Items SET Iden_Cabecera = [@TablaIden].Iden
		FROM @TablaIden

		IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION
			RETURN 1
		END
					
		INSERT INTO DetalleFactura(IdCabecera, IdenItemFacturacion, Cantidad, ValorUnitario, SubTotal, ValorDescuento, ValorIva, Total)
		SELECT 
				 IdCabecera		     = [@Items].Iden_Cabecera
				,IdenItemFacturacion = [@Items].IdenItem
				,Cantidad            = [@Items].Cantidad
				,ValorUnitario       = [@Items].ValorUnitario
			    ,SubTotal            = [@Items].SubTotal
				,ValorDescuento      = [@Items].ValorDescuento
				,ValorIva		     = [@Items].ValorIva
				,Total			     = [@Items].Total

			FROM @Items

		IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRANSACTION
			RETURN 1
		END


		INSERT INTO DetallePagoFacturas(IdCabecera, NoCuota, Vencimiento, Valor)
		SELECT 
				  IdCabecera   = (SELECT Iden FROM @TablaIden)
				, NoCuota	   = @NoCuota
				, Vencimiento  = @Vencimiento
				, Valor		   = @ValorCuota

		
		COMMIT TRANSACTION
		END 

		END

GO


 /*exec SPFACTURA @Op='I',@Fecha='2017/10/11',@Iden_Cliente=1,@FormaPago=0,@Tipo=0,@Observacion='HBD',@Iden_Usuario=0,@TasaCambio=0,@NoCuota=0,@Vencimiento='2030-10-31 00:00:00',@Concepto='<ItemsFacturacion>
  <Items>
    <Codigo>1</Codigo>
    <Nombre>computador</Nombre>
    <Descripcion>computador portatil</Descripcion>
    <ValorUnitario>1000000.00</ValorUnitario>
    <PorcentajeIva>0.0000</PorcentajeIva>
    <Cantidad>1</Cantidad>
    <SubTotal>1000000</SubTotal>
    <ValorIva>0</ValorIva>
    <ValorDescuento>0</ValorDescuento>
    <Total>1000000</Total>
  </Items>
</ItemsFacturacion>',@ValorConceptos=1000000,@ValorDescuentos=0,@ValorIva=0,@MontoLetras='UN MILLON',@ValorCuota=0,@Cod_PrefijoConse=1,@Iden_Vendedor=1
*/