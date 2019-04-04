go

use Facturador

If Exists (Select 1 from sys.sysobjects
 Where Id = OBJECT_ID(N'[dbo].[SPCLIENTES]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPCLIENTES]
  GO

CREATE PROCEDURE SPCLIENTES 
			@Op			 Varchar		(10)	= ''
	  ,		@Iden		 numeric		(20,0)	= 0
	  ,		@Nombre		 Varchar		(500)   = ''
	  ,		@Apellido	 Varchar		(500)   = ''
	  ,		@Codigo		 Varchar		(25)	= ''
      ,		@Tip_Documento varchar	    (500)   = ''
	  ,		@Num_docum	 varchar		(500)	= '' 
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
		IF EXISTS(SELECT 1 FROM Clientes WHERE Codigo = @Codigo)
		BEGIN 
			RAISERROR ('Cliente ya existe ', 16, 1)
				RETURN 1 
		 END
		 BEGIN TRANSACTION 
			INSERT INTO Clientes(Nombre, Apellido  , Codigo,  Tip_Documento, Num_docum, Correo, Direccion,Telefono, Imagen,Habilitar) 
			VALUES ( @Nombre, @Apellido  ,@codigo,  @Tip_documento,@Num_docum, @Correo, @Direccion,@Telefono, @Imagen, @Habilitar)
		IF @@ERROR <> 0
		BEGIN 
			RAISERROR('Error creando el cliente.', 16, 1)
				ROLLBACK TRANSACTION
				RETURN 1
		END
		COMMIT TRANSACTION
		RETURN 0
	END
	
	IF @Op = 'U'
		BEGIN
		    UPDATE Clientes
			 SET Nombre  =@Nombre	 
			 ,	Apellido=@Apellido
			 ,	Codigo  =@Codigo
			 ,	Tip_documento =@Tip_Documento
			 ,	Num_docum =@Num_docum
			 ,	Correo	  =@Correo
			 ,	Direccion =@Direccion
			 ,	Telefono  =@Telefono
			 ,	Imagen    =@Imagen
			 ,	Habilitar =@Habilitar
	
			 WHERE   Codigo	=@Codigo
	
			 RETURN 0
	     END
	IF @Op = 'D'
	BEGIN
		DELETE FROM Clientes WHERE Codigo = @Codigo
		RETURN 0
	END
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
			FROM Clientes
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
			FROM  Clientes
	        WHERE Codigo = @Codigo
		RETURN 0
	END
	IF @Op = 'sNum_doc'
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
			FROM  Clientes
	        WHERE Num_docum = @Num_docum
		RETURN 0
	END
		IF @Op = 'Consultar'
	BEGIN 

			SELECT COLUMN_NAME 
			FROM INFORMATION_SCHEMA.COLUMNS 
			WHERE TABLE_NAME = 'CLIENTES'
		
			
		RETURN 0
	END
END
GO

   exec SPCLIENTES @op='consultar'


    