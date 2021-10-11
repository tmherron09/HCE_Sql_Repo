-- =========================================
-- Create table for Hey Curator template
-- =========================================
USE [HeyCuratorEnterprise]
GO

IF OBJECT_ID([HeyCuratorEnterprise].[INSERTNEWTABLENAMEHERE], 'U') IS NOT NULL
  DROP TABLE [HeyCuratorEnterprise].[INSERTNEWTABLENAMEHERE]
GO

CREATE TABLE [HeyCuratorEnterprise].[INSERTNEWTABLENAMEHERE]
(
	CreatedBy int NOT NULL DEFAULT 1, -- Remove DEFAULT in prod
	CreatedOn dateTime2 NOT NULL DEFAULT getDate(),
	UpdatedOn dateTime2 NULL,
	OrgId int NOT NULL DEFAULT 2 -- Remove DEFAULT in prod
)
GO
