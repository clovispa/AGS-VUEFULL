go

use Facturador

If Exists (Select 1 from sys.sysobjects
 Where Id = OBJECT_ID(N'[dbo].[SPREPORTEFACTURA]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPREPORTEFACTURA]
  GO

CREATE PROCEDURE SPREPORTEFACTURA

		@CodigoPrefijo		numeric (20,0)
	,	@Consecutivo		numeric (20,0)

WITH ENCRYPTION 
AS

BEGIN 
	 SELECT CabeceraFactura.*,DetalleFactura.*,Clientes.*
	 FROM CabeceraFactura
		INNER JOIN DetalleFactura 
			ON CabeceraFactura.Iden=DetalleFactura.IdCabecera
		INNER JOIN DetallePagoFacturas 
			ON CabeceraFactura.Iden= DetallePagoFacturas.IdCabecera
		INNER JOIN Clientes
			ON CabeceraFactura.Iden_Cliente = Clientes.Iden	WHERE Cod_PrefijoConse = @CodigoPrefijo and Consecutivo_Fac = @Consecutivo
		
END

 

SELECT * FROM CabeceraFactura  

--exec dbo.SPREPORTEFACTURA @CodigoPrefijo=1,@Consecutivo=2

--Update CabeceraFactura Set Consecutivo_Fac = 55 where Consecutivo_Fac is null