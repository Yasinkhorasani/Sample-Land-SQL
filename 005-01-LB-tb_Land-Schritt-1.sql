USE [Sample];
GO

SELECT TOP (1000) [Land]
      ,[Exportgüter]
  FROM [Sample].[dbo].[tb_Rohdaten];

-- alle Länder --
SELECT [Land]
  FROM [Sample].[dbo].[tb_Rohdaten];

-- alle Länder ohne Dublikate --
SELECT DISTINCT [Land]
  FROM [Sample].[dbo].[tb_Rohdaten];

-- als [tb_Land] speichern --
SELECT DISTINCT [Land]
INTO [tb_Land]
  FROM [Sample].[dbo].[tb_Rohdaten];
  
-- Primärschlussel, ID, Index --------------
-- neue Spalte ----
ALTER TABLE [tb_Land]
ADD [LandID] [int] IDENTITY(1,1) NOT NULL;
GO

-- Spaltenreinfolge ändern - zuerst LandID, danach Land (Entwurfmodus)
/*
-- alter table <tabellenname> alter <Fieldname> position <newposition>
ALTER TABLE [tb_Land] ALTER LandID POSITION 1;  -- nicht in MS SQL
ERROR:
Meldung 102, Ebene 15, Status 1, Zeile 29
Falsche Syntax in der Nähe von "LandID".
-----------------------------------
To change the column order
In Object Explorer, right-click the table with columns you want to reorder and click Design.
Select the box to the left of the column name that you want to reorder.
Drag the column to another location within the table.

Using Transact-SQL
To change the column order
This task is not supported using Transact-SQL statements.
*/
