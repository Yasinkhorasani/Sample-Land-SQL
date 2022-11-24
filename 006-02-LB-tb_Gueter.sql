USE [Sample];
GO

SELECT TOP (1000) [Land]
      ,[Exportg�ter]
  FROM [Sample].[dbo].[tb_Rohdaten];
  
SELECT DISTINCT [Exportg�ter]
  FROM [Sample].[dbo].[tb_Rohdaten];

-- als [tb_Gueter] speichern 
SELECT DISTINCT 
	 -- neue Spalte, IDENTITY  
	 -- Die IDENTITY-Funktion kann nur verwendet werden, 
	 -- wenn die SELECT-Anweisung eine INTO-Klausel besitzt.
	 IDENTITY(INT,1,1) AS GueterID,
	 [Exportg�ter]
INTO [tb_Gueter]
FROM [Sample].[dbo].[tb_Rohdaten];

-- Prim�rschlussel, Index --------------
ALTER TABLE [tb_Gueter] 
ADD CONSTRAINT [PK_tb_Gueter] PRIMARY KEY CLUSTERED 
(
	[GueterID] ASC
)
	WITH 
	(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
	IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
GO

-- Spalte [Exportg�ter] - ohne Duplikate
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_Gueter] ON [dbo].[tb_Gueter]
(
	[Exportg�ter] ASC
)
	WITH 
	(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
	SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, 
	DROP_EXISTING = OFF, ONLINE = OFF, 
	ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
GO