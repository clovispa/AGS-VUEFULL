go

use Facturador

If Exists (Select 1 from sys.sysobjects Where Id = OBJECT_ID(N'[dbo].[SPUSUARIOS]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPUSUARIOS]
  GO

CREATE PROCEDURE SPUSUARIOS
						@Op				Varchar		(10)
				 ,		@Iden           numeric     (20,0)		= 0
				 ,		@Nombre		    Varchar		(50)       = ''
				 ,		@Usuario 	    Varchar		(25)	    = ''
				 ,		@Contraseña	    Varchar		(25)	    = ''
			     ,		@perfil		    varchar		(25)	    = ''	
			     ,		@Habilitar		Bit						= 0
    


WITH ENCRYPTION 
AS
BEGIN
	SET NOCOUNT ON
	IF @Op = 'I'
	BEGIN
	  IF EXISTS(SELECT 1 FROM Usuarios WHERE Usuario = @Usuario)
		BEGIN 
			RAISERROR ('USUARIO ya existe ', 16, 1)
			RETURN 1 
		END
		BEGIN TRANSACTION 
			INSERT INTO Usuarios(Nombre,Usuario,Contraseña, perfil, Habilitar) VALUES (@Nombre,@Usuario,@Contraseña,@perfil, @Habilitar)
			IF @@ERROR <> 0
		BEGIN 
			RAISERROR('Error creando el USUARIO.', 16, 1)
			ROLLBACK TRANSACTION
		RETURN 1
    END
	 COMMIT TRANSACTION
	  RETURN 0
	  END

	IF @Op = 'U'
	 BEGIN
	    UPDATE Usuarios
		 SET Nombre = @Nombre
		 ,	Usuario =@Usuario
		 ,	Contraseña =@Contraseña
		 ,	perfil =@perfil
		 ,	Habilitar =@Habilitar
		 
		 

		 WHERE usuario = @Usuario

		 RETURN 0
     END
  
    IF @Op = 'D'
    BEGIN
		DELETE FROM Usuarios WHERE Usuario = @Usuario
		
		RETURN 0
	END
	
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
END
   GO
exec SPUSUARIOS @Op='S'