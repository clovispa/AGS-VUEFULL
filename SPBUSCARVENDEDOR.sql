go

use Facturador

If Exists (Select 1 from sys.sysobjects
 Where Id = OBJECT_ID(N'[dbo].[SPBUSCARVENDEDOR]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPBUSCARVENDEDOR]
  GO

CREATE PROCEDURE SPBUSCARVENDEDOR

			
		 
		  @Op				 Varchar		(10)	= ''
		 ,@Codigo			 numeric		(20,0)	= 0
	     ,@Nombre		     Varchar		(500)   = ''
		 ,@Num_docum	     Varchar		(500)   = ''
		

		


WITH ENCRYPTION 
AS

	IF @Op = 'S'
	BEGIN 
		SELECT 
			  Iden
			, Nombre
			, Apellido
			, Codigo
			, Tip_Documento
			, Num_docum
			, Correo
			, Direccion
			, Telefono
			, Imagen 
			, Habilitar
			FROM Vendedor
		RETURN 0
	END
	IF @Op = 'sCodigo'
	BEGIN 
		SELECT 
		     Iden	 
		   , Nombre
			, Apellido
			,Codigo
			, Tip_Documento
			,Num_docum
			, Correo
			, Direccion
			, Telefono
			, Imagen 
			, Habilitar
			FROM  Vendedor
	        WHERE Codigo = @Codigo
		RETURN 0
	END
		IF @Op = 'sNombre'
	BEGIN 
		SELECT 
		     Iden	 
		   , Nombre
			, Apellido
			,Codigo
			, Tip_Documento
			,Num_docum
			, Correo
			, Direccion
			, Telefono
			, Imagen 
			, Habilitar
			FROM  Vendedor
	        WHERE Nombre = @Nombre
		RETURN 0
	END
		IF @Op = 'sNum_docum'
	BEGIN 
		SELECT 
		     Iden	 
		   , Nombre
			, Apellido
			,Codigo
			, Tip_Documento
			,Num_docum
			, Correo
			, Direccion
			, Telefono
			, Imagen 
			, Habilitar
			FROM  Vendedor
	        WHERE Num_docum = @Num_docum
		RETURN 0
	END
	go
	   exec SPBUSCARVENDEDOR @op='sNombre'