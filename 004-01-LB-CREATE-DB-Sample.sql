USE [master];
GO

CREATE DATABASE [Sample]
	CONTAINMENT = NONE
ON PRIMARY 
	(NAME = N'Sample', FILENAME = N'C:\SQL-Kurs\DB\Sample\Sample.mdf', SIZE = 8192KB, FILEGROWTH = 65536KB)
LOG ON 
	(NAME = N'Sample_log', FILENAME = N'C:\SQL-Kurs\DB\Sample\Sample_log.ldf', SIZE = 8192KB, FILEGROWTH = 65536KB);
GO
