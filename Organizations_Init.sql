USE [HeyCuratorEnterprise];
GO

IF EXISTS (
	SELECT name 
		FROM HeyCuratorEnterprise.sys.tables
		WHERE name = N'Organizations'
	)
DROP TABLE Organizations;
GO

CREATE TABLE Organizations
	(OrgID int IDENTITY(1,1) PRIMARY KEY,
	OrganizationName varchar(200) NOT NULL,
	CreatedBy int NOT NULL DEFAULT 1,
	CreatedOn dateTime2 NOT NULL DEFAULT getDate(),
	UpdatedOn dateTime2 NULL
	);

INSERT INTO [Organizations] (OrganizationName)
	VALUES
		('Hey Curator Admin Team'),
		('Teacher Timy''s Discovery Museum'),
		('Onette Children''s Museum'),
		('Twoson Exploration Museum'),
		('Threed''s Children''s Archealogical Museum'),
		('Fourside City Learning Center');
			