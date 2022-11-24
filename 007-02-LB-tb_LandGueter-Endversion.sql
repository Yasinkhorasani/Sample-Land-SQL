USE [Sample];
GO
/*
SELECT TOP (1000) [LandID]
      ,[Land]
  FROM [Sample].[dbo].[tb_Land];

SELECT TOP (1000) [Land]
      ,[Exportgüter]
  FROM [Sample].[dbo].[tb_Rohdaten];

-- Tabellen tb_Rohdaten und tb_Land verbinden ------------
SELECT [dbo].[tb_Land].[LandID],
	   [dbo].[tb_Rohdaten].[Land],
	   [dbo].[tb_Rohdaten].[Exportgüter]
FROM [dbo].[tb_Land]
	   INNER JOIN [dbo].[tb_Rohdaten]
			ON [tb_Land].[Land] = [tb_Rohdaten].[Land];
*/

-----------------------------------------------------------------------
/*
SELECT TOP (1000) [Land]
      ,[Exportgüter]
  FROM [Sample].[dbo].[tb_Rohdaten];

SELECT TOP (1000) [GueterID]
      ,[Exportgüter]
  FROM [Sample].[dbo].[tb_Gueter];

-- Tabellen tb_Rohdaten und Gueter verbinden ------------
SELECT [dbo].[tb_Rohdaten].[Land], 
	   [dbo].[tb_Rohdaten].[Exportgüter], 
	   [dbo].[tb_Gueter].[GueterID]
FROM [dbo].[tb_Rohdaten]
	   INNER JOIN [dbo].[tb_Gueter]
			ON [dbo].[tb_Rohdaten].[Exportgüter] = [dbo].[tb_Gueter].[Exportgüter];			

--- alle 3 Tabellen --------------------------
SELECT [dbo].[tb_Land].[LandID],
	   [dbo].[tb_Rohdaten].[Land],
	   [dbo].[tb_Rohdaten].[Exportgüter], 
	   [dbo].[tb_Gueter].[GueterID]
FROM [dbo].[tb_Land]
	   INNER JOIN [dbo].[tb_Rohdaten]
			ON [dbo].[tb_Land].[Land] = [dbo].[tb_Rohdaten].[Land]
	   INNER JOIN [dbo].[tb_Gueter]
			ON [dbo].[tb_Rohdaten].[Exportgüter] = [dbo].[tb_Gueter].[Exportgüter];
							
--- alle 3 Tabellen - nur ID --------------------------			
SELECT [dbo].[tb_Land].[LandID],
	   --[dbo].[tb_Rohdaten].[Land],
	   --[dbo].[tb_Rohdaten].[Exportgüter], 
	   [dbo].[tb_Gueter].[GueterID]
FROM [dbo].[tb_Land]
	   INNER JOIN [dbo].[tb_Rohdaten]
			ON [dbo].[tb_Land].[Land] = [dbo].[tb_Rohdaten].[Land]
	   INNER JOIN [dbo].[tb_Gueter]
			ON [dbo].[tb_Rohdaten].[Exportgüter] = [dbo].[tb_Gueter].[Exportgüter];	
			
-- neue m:n Tabelle erstellen [tb_LandGueter] ------------
SELECT [dbo].[tb_Land].[LandID],
	   [dbo].[tb_Gueter].[GueterID]
INTO [tb_LandGueter] -- -- neue m:n Tabelle
FROM [dbo].[tb_Land]
	   INNER JOIN [dbo].[tb_Rohdaten]
			ON [dbo].[tb_Land].[Land] = [dbo].[tb_Rohdaten].[Land]
	   INNER JOIN [dbo].[tb_Gueter]
			ON [dbo].[tb_Rohdaten].[Exportgüter] = [dbo].[tb_Gueter].[Exportgüter];
*/			

-- Kombination LandID, GueterID indizieren (ohne Duplikate)
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_LandGueter] ON [dbo].[tb_LandGueter]
(
	[LandID] ASC,
	[GueterID] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, 
DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, 
ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
GO