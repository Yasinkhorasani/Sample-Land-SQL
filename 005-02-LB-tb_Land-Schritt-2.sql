USE [Sample];
GO

-- Primärschlussel -----------------------
ALTER TABLE [dbo].[tb_Land] 
ADD CONSTRAINT [PK_tb_Land] PRIMARY KEY CLUSTERED 
(
	[LandID] ASC
)
-- ab da nicht unbedingt notwendig - das sind Standarteinstellungen
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, 
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
ON [PRIMARY];
GO


-- Spalte Land - ohne Duplikate
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_Land] ON [dbo].[tb_Land]
(
	[Land] ASC
)
-- ab da nicht unbedingt notwendig - das sind Standarteinstellungen
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, 
ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];
GO