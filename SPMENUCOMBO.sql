go

use Facturador

If Exists (Select 1 from sys.sysobjects
 Where Id = OBJECT_ID(N'[dbo].[SPMENUCOMBO]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPMENUCOMBO]
  GO

CREATE PROCEDURE SPMENUCOMBO
			@Op					Varchar		    (10)= ''
      ,		@Codigo				 numeric		(20,0)	= 0
	  ,		@Cliente			 Varchar		(50)	= ''
	  ,		@Usuario			 Varchar		(50)	= ''
	  ,		@Vendedor			 Varchar		(50)	= ''
	  ,		@Proveedor			 Varchar		(50)	= ''
	  ,		@Itemsfacturacion	 Varchar		(50)	= ''
	  


WITH ENCRYPTION 
AS
BEGIN
		SET NOCOUNT ON
	IF @Op = 'I'
	BEGIN
		IF EXISTS(SELECT 1 FROM menucombo WHERE Codigo = @Codigo)
		BEGIN 
			RAISERROR ('Menu ya existe ', 16, 1)
				RETURN 1 
		 END
		 BEGIN TRANSACTION 
			INSERT INTO menucombo(Codigo, Cliente  , Usuario,  Vendedor, Proveedor, Itemsfacturacion ) 
			VALUES ( @Codigo, @Cliente  ,@Usuario,  @Vendedor,@Proveedor,@Itemsfacturacion )
		IF @@ERROR <> 0
		BEGIN 
			RAISERROR('Error crear el menu.', 16, 1)
				ROLLBACK TRANSACTION
				RETURN 1
		END
		COMMIT TRANSACTION
		RETURN 0
	END
	
	IF @Op = 'U'
		BEGIN
		    UPDATE menucombo
			 SET Codigo  =@Codigo	 
			 ,	Cliente  =@Cliente
			 ,	Usuario  =@Usuario
			 ,	Vendedor =@Vendedor
			 ,	Proveedor =@Proveedor
			 ,	Itemsfacturacion  =@Itemsfacturacion 
			
	
			 WHERE   Codigo	=@Codigo
	
			 RETURN 0
	     END
	IF @Op = 'D'
	BEGIN
		DELETE FROM Menucombo WHERE Codigo = @Codigo
		RETURN 0
	END
	IF @Op = 'S'
	BEGIN 
		SELECT 
			 Codigo
			, Cliente
			, Usuario
			, Vendedor
			, Proveedor
			, Itemsfacturacion
			
			FROM menucombo
		RETURN 0
	END
	IF @Op = 'sCodigo'
	BEGIN 
		SELECT 
		    	 
		   	Codigo
			, Cliente
			, Usuario
			, Vendedor
			, Proveedor
			, Itemsfacturacion

			FROM  menucombo
	        WHERE Codigo = @Codigo
		RETURN 0
	END

	IF @Op = 'consultarC'
	BEGIN 
		SELECT 
		   
			  Codigo			
			,  Cliente

			FROM  menucombo
	  
		RETURN 0
	END

		IF @Op = 'consultarI'
	BEGIN 
		SELECT 
		   
			  Codigo			
			,  Itemsfacturacion

			FROM  menucombo
	  
		RETURN 0
	END

		IF @Op = 'consultarU'
	BEGIN 
		SELECT 
		   
			  Codigo			
			,  Usuario

			FROM  menucombo
	  
		RETURN 0
	END
	IF @Op = 'consultarV'
	BEGIN 
		SELECT 
		   
			  Codigo			
			,  Vendedor

			FROM  menucombo
	  
		RETURN 0
	END
		IF @Op = 'consultarP'
	BEGIN 
		SELECT 
		   
			  Codigo			
			,  Proveedor

			FROM  menucombo
	  
		RETURN 0
	END


END
go
   exec SPMENUCOMBO @op='consultarV'