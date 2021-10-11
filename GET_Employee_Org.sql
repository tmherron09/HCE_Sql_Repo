USE HeyCuratorEnterprise

SELECT Employees.FirstName,
	   Employees.LastName,
	   [Organizations].[OrganizationName]
	FROM Employees
	LEFT JOIN Organizations ON  Employees.OrgId = Organizations.OrgID;
