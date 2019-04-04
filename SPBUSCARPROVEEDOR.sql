go

use Facturador

If Exists (Select 1 from sys.sysobjects
 Where Id = OBJECT_ID(N'[dbo].[SPBUSCARPROVEEDOR]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPBUSCARPROVEEDOR]
  GO

CREATE PROCEDURE SPBUSCARPROVEEDOR

			
		 
		  @Op				 Varchar		(10)	= ''
		 ,@Codigo			 numeric		(20,0)	= 0
	     ,@Nombre		     Varchar		(500)   = ''
		 ,@Numero_Doc	     Varchar		(500)   = ''
		

		


WITH ENCRYPTION 
AS

	IF @Op = 'S'
	BEGIN 
		SELECT 
			  Iden
			, Codigo
			, Nombre
			, Tipo_Doc
			, Numero_Doc
			, Correo
			, Direccion
			, Telefono
			, Imagen 
			, Habilitar

			FROM Proveedores

		RETURN 0
	END
	IF @Op = 'sCodigo'
	BEGIN 
		SELECT 
		      Iden	
			, Codigo			
			, Nombre
			, Tipo_Doc
			, Numero_Doc
			, Correo
			, Direccion
			, Telefono
			, Imagen 
			, Habilitar

			FROM  Proveedores
	        WHERE Codigo = @Codigo

		RETURN 0
	END
	IF @Op = 'sNum_docum'
	BEGIN 
		SELECT 
		      Iden	
			, Codigo			
			, Nombre
			, Tipo_Doc
			, Numero_Doc
			, Correo
			, Direccion
			, Telefono
			, Imagen 
			, Habilitar

			FROM  Proveedores
	        WHERE Numero_Doc = @Numero_Doc

		RETURN 0
	END
	IF @Op = 'sNombre'
	BEGIN 
		SELECT 
		      Iden	
			, Codigo			
			, Nombre
			, Tipo_Doc
			, Numero_Doc
			, Correo
			, Direccion
			, Telefono
			, Imagen 
			, Habilitar

			FROM  Proveedores
	        WHERE Nombre = @Nombre

		RETURN 0
	END
	go
	   exec SPBUSCARPROVEEDOR @op='sNombre'