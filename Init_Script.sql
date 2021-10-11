-- =============================================
-- Create database template
-- =============================================
USE master
GO

-- Drop the database if it already exists
IF  EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'HeyCuratorEnterprise'
)
DROP DATABASE HeyCuratorEnterprise
GO

CREATE DATABASE HeyCuratorEnterprise
GO


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
IsActive bit DEFAULT 1,
UNIQUE(FirstName, LastName, OrgID)
);
GO

INSERT INTO [Employees] (FirstName,	LastName, OrgId)
	VALUES ('Tim', 'Herron', 1);
GO

INSERT INTO [Employees] (FirstName,	LastName)
	VALUES
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

-- Can Use Stored Proc for Maria Aynd Rand

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
	OrganizationName varchar(200) NOT NULL UNIQUE,
	CreatedBy int NOT NULL DEFAULT 1,
	CreatedOn dateTime2 NOT NULL DEFAULT getDate(),
	UpdatedOn dateTime2 NULL
	);
GO

INSERT INTO [Organizations] (OrganizationName)
	VALUES
		('Hey Curator Admin Team'),
		('Teacher Timy''s Discovery Museum'),
		('Onette Children''s Museum'),
		('Twoson Exploration Museum'),
		('Threed''s Children''s Archealogical Museum'),
		('Fourside City Learning Center');
GO

USE [HeyCuratorEnterprise];
GO

IF EXISTS (
	SELECT name 
		FROM HeyCuratorEnterprise.sys.tables
		WHERE name = N'CuratorRoles'
	)
DROP TABLE CuratorRoles;
GO

CREATE TABLE CuratorRoles
	(CuratorRoleID int IDENTITY(1,1) PRIMARY KEY,
	CuratorRoleName varchar(100) NOT NULL,
	CreatedBy int NOT NULL DEFAULT 1,
	CreatedOn dateTime2 NOT NULL DEFAULT getDate(),
	UpdatedOn dateTime2 NULL,
	OrgID int NOT NULL DEFAULT 2,
	UNIQUE(CuratorRoleName, OrgID)
	);
GO

INSERT INTO [CuratorRoles] (CuratorRoleName)
	VALUES
		('Visitor Relations'),
		('Staff Services'),
		('Mayor Kid''s Town'),
		('Design-ville'),
		('TEC'), -- Traveling Exhibit Curator
		('Play Grove');
GO

USE [HeyCuratorEnterprise];
GO

IF EXISTS (
	SELECT name 
		FROM HeyCuratorEnterprise.sys.tables
		WHERE name = N'Employee_CuratorRole'
	)
DROP TABLE Employee_CuratorRole;
GO

CREATE TABLE Employee_CuratorRole
	(EmployeeID int NOT NULL,
	CuratorRoleID int NOT NULL,
	CreatedBy int NOT NULL DEFAULT 1,
	CreatedOn dateTime2 NOT NULL DEFAULT getDate(),
	OrgID int NOT NULL DEFAULT 2,
	PRIMARY KEY (EmployeeID, CuratorRoleID),
	UNIQUE(EmployeeID, CuratorRoleID)
	);
GO

INSERT INTO [Employee_CuratorRole] (EmployeeID, CuratorRoleID)
	VALUES
		(2,1),
		(3,1),
		(3,2),
		(4,3),
		(5,3),
		(6,6),
		(7,5),
		(9,4);
GO

USE [HeyCuratorEnterprise];
GO

IF EXISTS (
	SELECT name 
		FROM HeyCuratorEnterprise.sys.tables
		WHERE name = N'ExhibitSpaces'
	)
DROP TABLE ExhibitSpaces;
GO

CREATE TABLE ExhibitSpaces
	(ExhibitSpaceID int IDENTITY(1,1) PRIMARY KEY,
	ExhibitSpaceName varchar(100) NOT NULL,
	CreatedBy int NOT NULL DEFAULT 1,
	CreatedOn dateTime2 NOT NULL DEFAULT getDate(),
	OrgID int NOT NULL DEFAULT 2,
	UNIQUE(ExhibitSpaceName, OrgID)
	);
GO

INSERT INTO [ExhibitSpaces] (ExhibitSpaceName)
	VALUES
		('Entry Hall'),
		('Kid''s Food Mart'),
		('Family House'),
		('Speak like a Mayor'),
		('Mayor Kid''s Town Exterior'),
		('Room O'' Clay'),
		('Creation Share Hallway'),
		('Room O'' Art'),
		('Play Grove Space');
GO

USE [HeyCuratorEnterprise];
GO

IF EXISTS (
	SELECT name 
		FROM HeyCuratorEnterprise.sys.tables
		WHERE name = N'Exhibits'
	)
DROP TABLE Exhibits;
GO

CREATE TABLE Exhibits
	(ExhibitID int IDENTITY(1,1) PRIMARY KEY,
	ExhibitName varchar(100) NOT NULL,
	CreatedBy int NOT NULL DEFAULT 1,
	CreatedOn dateTime2 NOT NULL DEFAULT getDate(),
	OrgID int NOT NULL DEFAULT 2,
	UNIQUE(ExhibitName, OrgID)
	);
GO

INSERT INTO [Exhibits] (ExhibitName)
	VALUES
		('Admissions'),
		('Family Space'),
		('Sun Fun'),
		('Family Living Room'),
		('Family Kitchen'),
		('baby''s Room'),
		('Mayor Kid''s Fountain'),
		('Food Mart Shopping'),
		('May Kid''s Podium'),
		('Bubble Falls'),
		('Clay Activities'),
		('3D Arts'),
		('Found Arts'),
		('Art Books'),
		('Color Arts');
GO

USE [HeyCuratorEnterprise];
GO

IF EXISTS (
	SELECT name 
		FROM HeyCuratorEnterprise.sys.tables
		WHERE name = N'ItemTypes'
	)
DROP TABLE ItemTypes;
GO

CREATE TABLE ItemTypes
	(ItemTypeID int IDENTITY(1,1) PRIMARY KEY,
	ItemTypeName varchar(100) NOT NULL,
	ItemTypeModel varchar(100) NULL, -- If there is a specific Model SKU/Number/Etc.
	ItemTypeDescription varchar(500) NULL,
	OrderNotes varchar(500) NULL,
	CreatedBy int NOT NULL DEFAULT 1,
	CreatedOn dateTime2 NOT NULL DEFAULT getDate(),
	OrgID int NOT NULL DEFAULT 2,
	);
GO

INSERT INTO ItemTypes (ItemTypeName, ItemTypeModel, ItemTypeDescription)
	VALUES
		('Golf Pencils', 'Universal''s Golf Pencils 144pk', 'Disposable quick use pencils. No eraser. Easy to restock in mass. Come pre-sharpened. Good when not monitored or no time to resharpen other utensils. Use, Recycle/Pitch, Restock.'),
		('Museum Maps', 'Special Print Shop Ordered Glossy Maps.', 'Museum Maps for distribution to visitors. Glossy print, should not be used for larger events (paper alternative available). Contact Marketing department for ordering.'),
		('Baby Wipes','Generic Baby Wipes','Safe for use in both family spaces and play areas.'),
		('Colored Straws','Generic Colored Bendy Straws- 150pk.','Cheap drinking straws for use in exhibit activities.'),
		('Sun Plushie','M&D Sunshine Stuffed Plushie','Sun shaped plushie. Soft and does not tear easily. Minor seam issues can be repaired. Machine washable, but should not be on a regular schedule, fabric will matte, lose fluff over many washes.'),
		('Basic Clay', 'Art Supply Store Basic Modeling Clay', 'Basic modeling clay. Light mud brown. Graded to be able  to glaze and fire.'),
		('Donated Recycled Carboard','Any donated or recycled clean cardboard.','Should be checked for stains/mold, inappropriate labeling and any staples removed.');
GO

INSERT INTO ItemTypes (ItemTypeName)
	VALUES
	('Clay tools'),
	('Geo Building Shapes'),
	('Construction Paper'),
	('Baby Doll Realistic'),
	('Platic Dishware'),
	('Generic Baby Blanket'),
	('Play broom'),
	('Kid''s Coffee Table Book Series'),
	('Plastic Apples'),
	('Plastic Bananas'),
	('Plastic Pears'),
	('Plastic Potatoes'),
	('Platic Tomatoes'),
	('Fake Ceral'),
	('Fake Dessert Mix'),
	('Fake Soup Can'),
	('Fake Daiy Items'),
	('Food Mart Apron'),
	('Plastic Dry Erase Name Badges Clipon'),
	('Children''s Shopping Cart'),
	('Top hat'),
	('Blue Ribbon Awards'),
	('Play Microphone'),
	('Dawn dishsoap'),
	('Bubble Wand'),
	('Bubble Net'),
	('Art Books'),
	('Generic Paint Brush'),
	('Kid Safe Colored Paint Red'),
	('Kid Safe Colored Paint Blue'),
	('Kid Safe Colored Paint Yellow'),
	('Kid Safe Colored Paint orange'),
	('Kid Safe Colored Paint Green'),
	('Kid Safe Colored Paint Purple'),
	('Kid Safe Colored Paint Pink')
GO

IF EXISTS (
	SELECT name 
		FROM HeyCuratorEnterprise.sys.tables
		WHERE name = N'ItemInstances'
	)
DROP TABLE ItemInstances;
GO

CREATE TABLE ItemInstances
	(ItemInstanceID int IDENTITY(1,1) PRIMARY KEY,
	ItemTypeID int NOT NULL,
	ItemInstanceName varchar(100) NOT NULL,
	CreatedBy int NOT NULL DEFAULT 1,
	CreatedOn dateTime2 NOT NULL DEFAULT getDate(),
	OrgID int NOT NULL DEFAULT 2,
	);
GO

--INSERT INTO ItemInstances (ItemInstanceName, ItemTypeID)
--	VALUES

USE [HeyCuratorEnterprise];
GO

IF EXISTS (
	SELECT name 
		FROM HeyCuratorEnterprise.sys.tables
		WHERE name = N'MuseumSections'
	)
DROP TABLE MuseumSections;
GO

CREATE TABLE MuseumSections
	(MuseumSectionID int IDENTITY(1,1) PRIMARY KEY,
	MuseumSectionName varchar(100) NOT NULL,
	CreatedBy int NOT NULL DEFAULT 1,
	CreatedOn dateTime2 NOT NULL DEFAULT getDate(),
	OrgID int NOT NULL DEFAULT 2,
	UNIQUE(MuseumSectionName, OrgID)
	);
GO

INSERT INTO MuseumSections (MuseumSectionName)
	VALUES
		('Entry Hall'),
		('Design-Ville'),
		('Outdoor Spaces'),
		('Mayor Kid''s Town'),
		('Traveling Exhibit Collection');
GO



-- ====================================
-- Create Views
-- ====================================


-- ===== Create View Employee_Org =====
-- Present's Employees First and Last name, along with the name of their Organizaion
-- ====================================

CREATE VIEW [dbo].[Employee_Org]
AS
SELECT        TOP (100) PERCENT dbo.Employees.FirstName, dbo.Employees.LastName, dbo.Organizations.OrganizationName AS 'Employee''s Organization'
FROM            dbo.Employees INNER JOIN
                         dbo.Organizations ON dbo.Employees.OrgId = dbo.Organizations.OrgID
ORDER BY dbo.Organizations.OrgID, dbo.Employees.FirstName
GO


-- ====================================
-- Archieve Prototype
-- ====================================

USE [HeyCuratorEnterprise];
GO

IF EXISTS (
	SELECT name 
		FROM HeyCuratorEnterprise.sys.tables
		WHERE name = N'ExhibitArchive'
	)
DROP TABLE ExhibitArchive;
GO

CREATE TABLE ExhibitArchive
	(ExhibitArchiveID int IDENTITY(1,1) PRIMARY KEY,
	ExhibitName varchar(100) NOT NULL,
	CreatedBy int NOT NULL DEFAULT 1,
	CreatedOn dateTime2 NOT NULL,
	RemovedOn datetime2 NOT NULL DEFAULT getDate(),
	RemovedBy int NOT NULL DEFAULT 1,
	IsCurrentExhibitLinked bit DEFAULT 0,
	-- CurrentLinkedExhibit int NULL, Move to Join Table
	-- ArchivedExhibitLink int NULL, Move to Join Table
	Explanation varchar(500) NOT NULL, -- Examples include, Removed, Replaced, Remodeled/Named.
	OrgID int NOT NULL DEFAULT 2,
	);
GO