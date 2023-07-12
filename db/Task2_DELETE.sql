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
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
IF OBJECT_ID('deleteUser') IS NOT NULL  
BEGIN  
DROP PROC deleteUser  
END
GO 
CREATE PROCEDURE deleteUser
	@UserID INT 
AS  
BEGIN  

    DELETE
	FROM   tbUser
	WHERE  UserID = @UserID 

END  
GO
