go

use Facturador

If Exists (Select 1 from sys.sysobjects
 Where Id = OBJECT_ID(N'[dbo].[SPCOMBOM]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPCOMBOM]
  GO

CREATE PROCEDURE SPCOMBOM
			@Op					 Varchar	    (10)    = ''
      ,		@Codigo				 Varchar		(50)	= ''
	  ,		@Tipo			     Varchar		(50)	= ''
	  ,		@Nombre			     Varchar		(50)	= ''
	  


WITH ENCRYPTION 
AS

	IF @Op = 'S'
	BEGIN 
		SELECT 
			 Codigo
			, Tipo
			, Nombre
			
			
			FROM MENUCOMBO
		RETURN 0
	END
	IF @Op = 'sCodigo'
	BEGIN 
		SELECT 
		    	 
		  
			 Codigo
			, Tipo
			, Nombre

			FROM  menucombo
	        WHERE Codigo = @Codigo
		RETURN 0
	END

	



