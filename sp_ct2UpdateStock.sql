-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Erica Bowen
-- Create date: 12/12/2016
-- Description:	Update Stock
-- =============================================
CREATE PROCEDURE sp_updatect2Stock
	-- Add the parameters for the stored procedure here
	@stockID int,
	@categoryIDFK int,
	@stockQuantity int,
	@locationCode int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SET NOCOUNT ON;
		DECLARE @v_error VARCHAR(255),
		@v_errorNo INT
	BEGIN TRY

		UPDATE ct2Stock
		SET
			categoryIDFK= @categoryIDFK,
			stockQuantity= @stockQuantity,
			locationCode= @locationCode
		

		WHERE
			stockID = @stockID;
	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO
