USE [HeyCuratorEnterprise]
GO

/****** Create View [dbo].[CuratorRole_Employee_Org_View]    Script Date: 10/8/2021 5:46:07 PM ******/


CREATE VIEW [dbo].[CuratorRole_Employee_Org_View]
AS
SELECT TOP (100) PERCENT dbo.CuratorRoles.CuratorRoleName, dbo.Employees.FirstName, dbo.Employees.LastName, dbo.Organizations.OrganizationName
		FROM dbo.CuratorRoles INNER JOIN dbo.Employee_CuratorRole 
			ON dbo.CuratorRoles.CuratorRoleID = dbo.Employee_CuratorRole.CuratorRoleID INNER JOIN
            dbo.Employees ON dbo.Employee_CuratorRole.EmployeeID = dbo.Employees.EmployeeID INNER JOIN
            dbo.Organizations ON dbo.Employees.OrgId = dbo.Organizations.OrgID
ORDER BY dbo.CuratorRoles.CuratorRoleName, dbo.Organizations.OrganizationName
GO