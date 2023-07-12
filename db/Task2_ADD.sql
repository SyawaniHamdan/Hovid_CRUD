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
IF OBJECT_ID('addUser') IS NOT NULL  
BEGIN  
DROP PROC addUser  
END
GO 
CREATE PROCEDURE addUser
	@UserName   VARCHAR(20),
	@UserNo     INT
 
AS  
BEGIN  
INSERT INTO tbUser (UserName, UserNo)  
VALUES (@UserName, @UserNo)  

DECLARE 
	@UserID INT,
	@CreateDate DATETIME

SET @UserID = SCOPE_IDENTITY()
SET @CreateDate = GetDate()
  
SELECT  UserName = @UserName,  UserNo = @UserNo
FROM tbUser  
WHERE UserID = @UserID  
END 
