go

use Facturador

If Exists (Select 1 from sys.sysobjects
 Where Id = OBJECT_ID(N'[dbo].[SPBUSCARUSUARIO]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPBUSCARUSUARIO]
  GO

CREATE PROCEDURE SPBUSCARUSUARIO

			
		  @Op				 Varchar		(10)	= ''
		 
	     ,@Usuario		     Varchar		(500)   = ''
		 ,@Nombre		     Varchar		(500)   = ''
		 ,@perfil			 Varchar		(500)   = ''
		


WITH ENCRYPTION 
AS

	IF @Op = 'S'
	BEGIN 
		SELECT 
				Iden
			,	Nombre
			,	Usuario
			,	Contraseña	
			,	perfil	
			,	Habilitar
			
		FROM usuarios
		RETURN 0
	END
	IF @Op = 'sUsuario'
	BEGIN 
		SELECT 
		     Iden
			 , Nombre
			 , Usuario
		    ,Contraseña
			, perfil
			, Habilitar	
			
			 
		FROM  Usuarios
        WHERE	Usuario = @Usuario

		RETURN 0

	END
	IF @Op = 'sNombre'
	BEGIN 
		SELECT 
		     Iden
			 , Nombre
			 , Usuario
		    ,Contraseña
			, perfil
			, Habilitar	
			
			 
		FROM  Usuarios
        WHERE	Nombre = @Nombre

		RETURN 0

	END
		IF @Op = 'sperfil'
	BEGIN 
		SELECT 
		     Iden
			 , Nombre
			 , Usuario
		    ,Contraseña
			, perfil
			, Habilitar	
			
			 
		FROM  Usuarios
        WHERE	perfil = @perfil

		RETURN 0

	END
	go
	   exec SPBUSCARUSUARIO @op='sperfil'