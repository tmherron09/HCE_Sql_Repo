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
-- Author:		Tim Herron
-- Create date: 10/7/2021
-- Description:	Insert a new Employee.
-- =============================================

CREATE PROCEDURE Insert_Employee 
	-- Add the parameters for the stored procedure here
	@FirstName varchar(50), 
	@LastName varchar(50),
	@OrgID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

-- Validate the REQUIRED parameters.  
IF @FirstName IS NULL OR @LastName IS NULL OR @OrgID IS NULL
BEGIN  
   PRINT 'ERROR: You must specify the First name, Last name, and Organization Id of the Employee.'  
   RETURN 
END

    -- Insert statements for procedure here
	INSERT INTO Employees (FirstName, LastName, OrgId)
		VALUES (@FirstName, @LastName, @OrgID);
END
GO
