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


/* ******************************** */

CREATE TABLE [Consultants] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [NationalId] VARCHAR(50) NOT NULL UNIQUE,
  [FirstName] NVARCHAR(50)NOT NULL,
  [LastName] NVARCHAR(50)NOT NULL,
  [HourlyRate] DECIMAL(10, 2),
  [Role] NVARCHAR(50)
);

CREATE TABLE [Clients] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [OrganizationNumber] VARCHAR(50) NOT NULL UNIQUE,
  [Company] NVARCHAR(100)NOT NULL,
  [Email] VARCHAR(100),
  [PhoneNumber] VARCHAR(50)
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

/* ******************************** */

-- 2.


-- INSERT CONSULTANTS - Testdata via Mockaroo

insert into Consultants (NationalId, FirstName, LastName, HourlyRate, Role) values ('19670724-9644', 'Werner', 'Wines', 1393.33, 'DevOps');
insert into Consultants (NationalId, FirstName, LastName, HourlyRate, Role) values ('19700228-1622', 'Malinda', 'Canlin', 913.1, 'DevOps');
insert into Consultants (NationalId, FirstName, LastName, HourlyRate, Role) values ('19881122-0638', 'Laurie', 'Dunning', 1009.25, 'Cybersecurity');
insert into Consultants (NationalId, FirstName, LastName, HourlyRate, Role) values ('19660303-1531', 'Myrtia', 'Gyver', 1214.6, 'C#Developer');
insert into Consultants (NationalId, FirstName, LastName, HourlyRate, Role) values ('20070230-8644', 'Tricia', 'Gerardin', 1220.87, 'Cybersecurity');
insert into Consultants (NationalId, FirstName, LastName, HourlyRate, Role) values ('19730225-2012', 'Darlleen', 'Peach', 774.63, 'C#Developer');
insert into Consultants (NationalId, FirstName, LastName, HourlyRate, Role) values ('19800608-8131', 'Lorenzo', 'Acock', 821.14, 'DevOps');
insert into Consultants (NationalId, FirstName, LastName, HourlyRate, Role) values ('19651116-5716', 'Karissa', 'Spacy', 1418.64, 'C#Developer');
insert into Consultants (NationalId, FirstName, LastName, HourlyRate, Role) values ('20010901-8373', 'Jenn', 'Ambrosetti', 750.8, 'Cybersecurity');
insert into Consultants (NationalId, FirstName, LastName, HourlyRate, Role) values ('19830128-4354', 'Veronica', 'Dreye', 1329.6, 'DevOps');


-- INSERT CLIENTS - Testdata via Mockaroo
insert into Clients (OrganizationNumber, Company, Email, PhoneNumber) values ('511889-5553', 'Leexo', 'mlarrett0@github.io', '+46 71-555 86 08');
insert into Clients (OrganizationNumber, Company, Email, PhoneNumber) values ('572938-9734', 'Bubblemix', 'jisley1@last.fm', '+46 73-099 51 90');
insert into Clients (OrganizationNumber, Company, Email, PhoneNumber) values ('526479-2281', 'Linkbuzz', 'wcovey2@soup.io', '+46 73-202 87 48');
insert into Clients (OrganizationNumber, Company, Email, PhoneNumber) values ('537737-8531', 'Eabox', 'acapelle3@gov.uk', '+46 76-386 90 76');
insert into Clients (OrganizationNumber, Company, Email, PhoneNumber) values ('503373-2715', 'Browsecat', 'bcowthart4@cloudflare.com', '+46 73-406 96 24');
insert into Clients (OrganizationNumber, Company, Email, PhoneNumber) values ('544645-7147', 'Quimm', 'lcolliar5@xrea.com', '+46 70-725 95 84');
insert into Clients (OrganizationNumber, Company, Email, PhoneNumber) values ('526600-2358', 'Twiyo', 'mfranies6@usa.gov', '+46 72-530 85 58');
insert into Clients (OrganizationNumber, Company, Email, PhoneNumber) values ('559751-8958', 'Kayveo', 'kpenhalurick7@globo.com', '+46 78-706 79 42');
insert into Clients (OrganizationNumber, Company, Email, PhoneNumber) values ('544711-4051', 'Photospace', 'vworrill8@scientificamerican.com', '+46 71-696 72 73');
insert into Clients (OrganizationNumber, Company, Email, PhoneNumber) values ('528904-3811', 'Edgeblab', 'mlumby9@exblog.jp', '+46 72-388 48 32');

-- INSERT ASSIGNMENTS - Testdata via Mockaroo

insert into Assignments (ClientId, ConsultantId, StartDate, FinishDate, Task) values (5, 7, '2025-12-30', '2026-02-20', 'Automation of CI/CD pipelines');
insert into Assignments (ClientId, ConsultantId, StartDate, FinishDate, Task) values (3, 5, '2025-11-17', '2026-10-28', 'Vulnerability assessment and penetration testing');
insert into Assignments (ClientId, ConsultantId, StartDate, FinishDate, Task) values (4, 3, '2025-12-13', '2026-06-07', 'Vulnerability assessment and penetration testing');
insert into Assignments (ClientId, ConsultantId, StartDate, FinishDate, Task) values (7, 4, '2026-01-27', '2026-06-21', 'Development of secure backend architecture in .NET');
insert into Assignments (ClientId, ConsultantId, StartDate, FinishDate, Task) values (1, 9, '2026-10-02', '2027-09-12', 'Vulnerability assessment and penetration testing');
insert into Assignments (ClientId, ConsultantId, StartDate, FinishDate, Task) values (8, 6, '2026-09-15', '2028-10-09', 'API integration and secure authentication');
insert into Assignments (ClientId, ConsultantId, StartDate, FinishDate, Task) values (2, 2, '2026-02-23', '2026-12-16', 'Infrastructure migration to the cloud');
insert into Assignments (ClientId, ConsultantId, StartDate, FinishDate, Task) values (8, 8, '2026-05-01', '2026-11-13', 'API integration and secure authentication');


/* ******************************** */

-- 3.

-- A.

SELECT FirstName, HourlyRate FROM Consultants
WHERE HourlyRate > 1200
ORDER BY HourlyRate DESC;

-- B.

SELECT  c. Company, 
        co.FirstName + ' ' + co.LastName AS ConsultantName,
        a.Task, a.StartDate, a.FinishDate 
FROM Assignments a
INNER JOIN Clients c ON a.ClientId = c.id
INNER JOIN Consultants co ON a.ConsultantId = co.Id

-- C.

SELECT c.Company, COUNT(a.ClientId) AS NumbersOfAssignments
FROM Clients c
LEFT JOIN Assignments a ON c.Id = a.ClientId
GROUP BY c.Company;

-- D.

BEGIN TRANSACTION
UPDATE Consultants
SET HourlyRate = 1500
WHERE Id = 5

SELECT * From Consultants   -- Gör en BEGIN TRANSACTION följt av SELECT (med möjlighet till ROLLBACK) för att kontrollera 
                            -- att rätt konsult fått uppdaterat timpris innan jag gör en Commit
COMMIT  -- Låser in nya timpriset på Consolut med id = 5 .


-- E.
-- Startar även här med en BEGIN TRANSACTION för kontroll att rätt tas bort innan jag gör en COMMIT


--BEGIN TRANSACTION              -- Gjorde ett test här på en kund som hade pågående uppdrag för att kontrollera att 
--DELETE FROM Clients             -- det inte gick att ta bort en sådan kund. Körde sen en ROLLBACK och tog bort en utan uppdrag.
--WHERE Id = 1;

--SELECT * FROM Clients

--ROLLBACK 

--SELECT * FROM Clients

BEGIN TRANSACTION
DELETE FROM Clients
WHERE Id = 9;

SELECT * FROM Clients

COMMIT
