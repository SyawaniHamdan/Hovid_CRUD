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
IF OBJECT_ID('selectUser') IS NOT NULL  
BEGIN  
DROP PROC selectUser  
END
GO 
CREATE PROCEDURE selectUser
	@UserID INT 
AS  
BEGIN  

    SELECT UserID, UserName, UserNo, CreateDate
    FROM   tbUser  

END  
GO
