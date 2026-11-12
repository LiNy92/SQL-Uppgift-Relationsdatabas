/* INLÄMNINGSUPPGIFT 1 - Det osäkra IT-bolaget "FailSafe IT" */
-- DEL 2 

-- 1.

USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'FailSafe_IT_Uppgift')
BEGIN
	ALTER DATABASE FailSafe_IT_Uppgift SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE FailSafe_IT_Uppgift;
END
GO

CREATE DATABASE FailSafe_IT_Uppgift;
GO

USE FailSafe_IT_Uppgift;
GO


-- ********************

CREATE TABLE [Consultants] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [NationalId] VARCHAR(50) NOT NULL UNIQUE,
  [FirstName] NVARCHAR(50)NOT NULL,
  [LastName] NVARCHAR(50)NOT NULL,
  [HourlyRate] DECIMAL(10, 2),
  [Role] NVARCHAR(50),
);

CREATE TABLE [Clients] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [OrganizationNumber] VARCHAR(50) NOT NULL UNIQUE,
  [Company] NVARCHAR(100)NOT NULL,
  [Email] VARCHAR(100),
  [PhoneNumber] VARCHAR(20),
);

CREATE TABLE [Assignments] (
  [ClientId] INT NOT NULL,
  [ConsultantId] INT NOT NULL,
  [StartDate] DATETIME2 NOT NULL,
  [FinishDate] DATETIME2 NOT NULL,
  [Task] NVARCHAR(100) NOT NULL,
  PRIMARY KEY ([ClientId], [ConsultantId]),
  CONSTRAINT [FK_Assignments_ConsultantId]
    FOREIGN KEY ([ConsultantId])
      REFERENCES [Consultants]([Id]),
  CONSTRAINT [FK_Assignments_ClientId]
    FOREIGN KEY ([ClientId])
      REFERENCES [Clients]([Id])
);

-- ********************
-- 2.

