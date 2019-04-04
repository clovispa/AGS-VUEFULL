go

use Facturador

If Exists (Select 1 from sys.sysobjects
 Where Id = OBJECT_ID(N'[dbo].[SPGENERARCONSECUTIVO]') and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
  drop  procedure [dbo].[SPGENERARCONSECUTIVO]
  GO

CREATE PROCEDURE SPGENERARCONSECUTIVO

			
		@CodprefijoConsec   numeric		(20,0) 
		, @consecutivo numeric(20, 0) = 0 OUTPUT


WITH ENCRYPTION 
AS


BEGIN 

		UPDATE 	Consecutivos 
		set Consecutivo = Consecutivo + 1
		, @consecutivo = consecutivo + 1
		where CodPrefijoConse = @CodprefijoConsec
			
		
END

 
