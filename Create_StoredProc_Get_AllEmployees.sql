-- ================================================
-- Create Stored Proc: Get All Employees By 
-- Organization Id.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Herron
-- Create date: 10/7/2021
-- Description:	GET all Employees of an Organization
-- =============================================

CREATE PROCEDURE Get_AllEmployees_ByOrgID
	@OrgID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

-- Validate the REQUIRED parameters.  
IF @OrgID IS NULL
BEGIN  
   PRINT 'Must Provide an Organization Id'  
   RETURN 
END
    -- Insert statements for procedure here
	SELECT Employees.FirstName, Employees.LastName, Employees.EmployeeID
		From Employees
		WHERE OrgId = @OrgID;
END
GO
