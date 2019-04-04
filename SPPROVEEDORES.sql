go

use Facturador

If Exists (Select 1 from sys.sysobjects
 Where Id = OBJECT_ID(N'[dbo].[SPPROVEEDORES]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPPROVEEDORES]
  GO

CREATE PROCEDURE SPPROVEEDORES 
			@Op			 Varchar		(10)	= ''
	  ,		@Iden		 numeric		(20,0)	= 0
	  ,		@Nombre		 Varchar		(500)   = ''
	  ,		@Codigo		 Varchar		(25)	= ''
      ,		@Tipo_Doc    varchar	    (500)   = ''
	  ,		@Numero_Doc	 varchar		(500)	= '' 
      ,		@Correo		 Varchar		(25)	= ''
      ,		@Direccion   Varchar	    (500)	= ''
	  ,		@Telefono	 Varchar	    (500)   = ''
      ,		@Imagen		 image					= ''
	  ,		@Habilitar   Bit				    = 0

WITH ENCRYPTION 
AS
BEGIN
		SET NOCOUNT ON
	IF @Op = 'I'
	BEGIN
		IF EXISTS(SELECT 1 FROM Proveedores WHERE Codigo = @Codigo)
		BEGIN 
			RAISERROR ('Proveedor ya existe ', 16, 1)
				RETURN 1 
		 END
		 BEGIN TRANSACTION 
			INSERT INTO Proveedores (  Codigo, Nombre,  Tipo_Doc, Numero_Doc, Correo, Direccion,Telefono, Imagen,Habilitar) 
			VALUES (  @Codigo, @Nombre,  @Tipo_Doc,@Numero_Doc, @Correo, @Direccion,@Telefono, @Imagen, @Habilitar)
		IF @@ERROR <> 0
		BEGIN 
			RAISERROR('Error creando al proveedor.', 16, 1)
				ROLLBACK TRANSACTION
				RETURN 1
		END
		COMMIT TRANSACTION
		RETURN 0
	END
	
	IF @Op = 'U'
		BEGIN
		    UPDATE Proveedores
			 SET Codigo      = @Codigo
			 ,	 Nombre      = @Nombre	 
			 ,	 Tipo_Doc    = @Tipo_Doc
			 ,	 Numero_Doc  = @Numero_Doc
			 ,	 Correo	     = @Correo
			 ,	 Direccion   = @Direccion
			 ,	 Telefono    = @Telefono
			 ,	 Imagen      = @Imagen
			 ,	 Habilitar   = @Habilitar
	
			 WHERE   Codigo	=@Codigo
	
			 RETURN 0
	     END
	IF @Op = 'D'
	BEGIN
		DELETE FROM Proveedores WHERE Codigo = @Codigo
		RETURN 0
	END
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
	
END
GO

   exec SPPROVEEDORES @op='S'