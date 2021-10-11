USE [HeyCuratorEnterprise];
GO

IF EXISTS (
	SELECT name 
		FROM HeyCuratorEnterprise.sys.tables
		WHERE name = N'Employees'
	)
DROP TABLE Employees;
GO

CREATE TABLE Employees
(EmployeeID int IDENTITY(1,1) PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
CreatedBy int NOT NULL DEFAULT 1,
CreatedOn dateTime2 NOT NULL DEFAULT getDate(),
UpdatedOn dateTime2 NULL,
OrgId int NOT NULL DEFAULT 2,
IsActive bit DEFAULT 1
)
GO

INSERT INTO [Employees] (FirstName,	LastName, OrgId)
	VALUES ('Tim', 'Herron', 1)
GO

INSERT INTO [Employees] (FirstName,	LastName)
	VALUES
		('Timsy', 'Magnus'),
		('Josh', 'Corridor'),
		('Shane', 'Blinking'),
		('Denee', 'Lessoris'),
		('Nancy', 'DaDaisy'),
		('Leda', 'Calmly'),
		('Becca', 'Letterman'),
		('Emily', 'Seaford'),
		('Cooper', 'Phillips'),
		('Mike', 'Special'),
		('Hannah', 'Window'),
		('Rachel', 'Yarn'),
		('Lilly', 'Brown'),
		('Sara', 'Feweray');
GO
