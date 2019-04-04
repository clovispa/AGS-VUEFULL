go

use Facturador

If Exists (Select 1 from sys.sysobjects
 Where Id = OBJECT_ID(N'[dbo].[SPTRANSACCIONES]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPTRANSACCIONES]
  GO

CREATE PROCEDURE SPTRANSACCIONES 
			@Op					Varchar		    (30)= ''
-- ,		@Codigo				 numeric		(20,0)	= 0
	  ,		@Nombre				 Varchar		(50)	= ''
	  

WITH ENCRYPTION 
AS
BEGIN
	SET NOCOUNT ON
	IF @Op = 'ConsultarTrans'
	BEGIN 
		SELECT 
		   
			  Codigo			
			, Nombre

			FROM  Transacciones
	  
		RETURN 0
	END

END


   exec SPTRANSACCIONES @op='S'