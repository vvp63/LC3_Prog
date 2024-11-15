USE [master]
GO
/****** Object:  Database [LC3_History]    Script Date: 12.11.2024 13:47:49 ******/
CREATE DATABASE [LC3_History] ON  PRIMARY 
( NAME = N'LC3_History', FILENAME = N'F:\MSSQL\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LC3_History.mdf' , SIZE = 4981632KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LC3_History_log', FILENAME = N'F:\MSSQL\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LC3_History_log.ldf' , SIZE = 5184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LC3_History] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LC3_History].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LC3_History] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LC3_History] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LC3_History] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LC3_History] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LC3_History] SET ARITHABORT OFF 
GO
ALTER DATABASE [LC3_History] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LC3_History] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LC3_History] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LC3_History] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LC3_History] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LC3_History] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LC3_History] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LC3_History] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LC3_History] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LC3_History] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LC3_History] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LC3_History] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LC3_History] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LC3_History] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LC3_History] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LC3_History] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LC3_History] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LC3_History] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LC3_History] SET  MULTI_USER 
GO
ALTER DATABASE [LC3_History] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LC3_History] SET DB_CHAINING OFF 
GO
USE [LC3_History]
GO
/****** Object:  User [LC3PA_User]    Script Date: 12.11.2024 13:47:49 ******/
CREATE USER [LC3PA_User] FOR LOGIN [LC3PA_User] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [LC3_Users]    Script Date: 12.11.2024 13:47:49 ******/
CREATE USER [LC3_Users] FOR LOGIN [CO1-VP-LC1\LC3_Users]
GO
/****** Object:  User [lc_admin]    Script Date: 12.11.2024 13:47:49 ******/
CREATE USER [lc_admin] FOR LOGIN [lc_admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CO1-VP-LC1\LC3PA_Users]    Script Date: 12.11.2024 13:47:49 ******/
CREATE USER [CO1-VP-LC1\LC3PA_Users] FOR LOGIN [CO1-VP-LC1\LC3PA_Users]
GO
/****** Object:  User [CO1-VP-LC1\LC3_Admins]    Script Date: 12.11.2024 13:47:49 ******/
CREATE USER [CO1-VP-LC1\LC3_Admins] FOR LOGIN [CO1-VP-LC1\LC3_Admins]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'LC3PA_User'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'LC3PA_User'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'LC3PA_User'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'LC3_Users'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'LC3_Users'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'LC3_Users'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'lc_admin'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'CO1-VP-LC1\LC3PA_Users'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'CO1-VP-LC1\LC3PA_Users'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'CO1-VP-LC1\LC3PA_Users'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'CO1-VP-LC1\LC3_Admins'
GO
/****** Object:  Table [dbo].[ClientsLimits_History]    Script Date: 12.11.2024 13:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientsLimits_History](
	[Arch_time] [datetime] NULL,
	[Id] [int] NULL,
	[LimitId] [int] NULL,
	[ClientCode] [int] NULL,
	[IsActive] [bit] NULL,
	[MinValue] [decimal](18, 10) NULL,
	[MaxValue] [decimal](18, 10) NULL,
	[LowerWarning] [decimal](18, 10) NULL,
	[UpperWarning] [decimal](18, 10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactTable_History]    Script Date: 12.11.2024 13:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTable_History](
	[Arch_date] [datetime] NULL,
	[ClientCode] [int] NULL,
	[ClientAccount] [varchar](50) NULL,
	[SummAsset] [float] NULL,
	[Instrument] [varchar](255) NULL,
	[Quantity] [bigint] NULL,
	[MarketValue] [float] NULL,
	[Percent] [float] NULL,
	[Issuer] [varchar](250) NULL,
	[InstrumentName] [varchar](255) NULL,
	[InstrumentType] [varchar](9) NULL,
	[InstrumentSubtype] [varchar](255) NULL,
	[SecTypeBr] [nvarchar](50) NULL,
	[Country] [varchar](250) NULL,
	[QuoteSheet] [varchar](255) NOT NULL,
	[OwnType] [varchar](50) NULL,
	[BondsIssueSumm] [numeric](38, 10) NULL,
	[QuoteSDH] [float] NULL,
	[QuoteSDHAgo] [int] NULL,
	[VolCirculation] [numeric](32, 10) NOT NULL,
	[contrid] [uniqueidentifier] NULL,
	[Capitalization] [int] NULL,
	[RedemptionDate] [datetime] NULL,
	[SecurityId] [uniqueidentifier] NOT NULL,
	[IssueNum] [varchar](255) NOT NULL,
	[AnnouncedVol] [numeric](32, 10) NULL,
	[DateStartPlacing] [datetime] NULL,
	[DateEndPlacing] [datetime] NULL,
	[Currency] [int] NULL,
	[CB_Code] [varchar](255) NULL,
	[ID_CB_SDH] [uniqueidentifier] NULL,
	[StateRegNum] [varchar](255) NULL,
	[MonthAvgVol] [numeric](38, 10) NOT NULL,
	[F_Rating] [nvarchar](50) NULL,
	[M_Rating] [nvarchar](50) NULL,
	[SP_Rating] [nvarchar](50) NULL,
	[E_Rating] [nvarchar](50) NULL,
	[A_Rating] [nvarchar](50) NULL,
	[Contr_F_Rating] [nvarchar](50) NULL,
	[Contr_M_Rating] [nvarchar](50) NULL,
	[Contr_SP_Rating] [nvarchar](50) NULL,
	[Contr_E_Rating] [nvarchar](50) NULL,
	[Contr_A_Rating] [nvarchar](50) NULL,
	[enddate] [datetime] NULL,
	[IsInIndex] [bit] NULL,
	[IsVariableCoupon] [bit] NULL,
	[IsQuantityGrows] [bit] NULL,
	[DaysToRedemption] [int] NULL,
	[is_bank] [bit] NULL,
	[for_qual_investors] [bit] NULL,
	[NKR_Rating] [nvarchar](50) NULL,
	[NRA_Rating] [nvarchar](50) NULL,
	[Contr_NKR_Rating] [nvarchar](50) NULL,
	[Contr_NRA_Rating] [nvarchar](50) NULL,
	[IsSubordinated] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MailerCheck_History]    Script Date: 12.11.2024 13:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailerCheck_History](
	[CheckTime] [datetime] NULL,
	[LimitId] [int] NULL,
	[ClientId] [int] NULL,
	[Issuer] [nvarchar](250) NULL,
	[FailLevel] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MailerLast]    Script Date: 12.11.2024 13:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MailerLast] AS
SELECT [CheckTime]
      ,[LimitId]
      ,[ClientId]
      ,[Issuer]
      ,[FailLevel]
  FROM [LC3_History].[dbo].[MailerCheck_History]
  WHERE [CheckTime] = (SELECT MAX([CheckTime]) FROM [LC3_History].[dbo].[MailerCheck_History])
GO
/****** Object:  View [dbo].[MailerPrevDay]    Script Date: 12.11.2024 13:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[MailerPrevDay] AS
SELECT [CheckTime]
      ,[LimitId]
      ,[ClientId]
      ,[Issuer]
      ,[FailLevel]
  FROM [LC3_History].[dbo].[MailerCheck_History]
  WHERE [CheckTime] = (SELECT MAX([CheckTime]) FROM [LC3_History].[dbo].[MailerCheck_History] WHERE [CheckTime] < CAST(DATEADD(d, 0, getdate()) AS date))
GO
/****** Object:  View [dbo].[MailerCompare]    Script Date: 12.11.2024 13:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[MailerCompare] AS
	SELECT t1.[CheckTime] AS Time1
		  ,ISNULL(t1.[LimitId], t2.[LimitId]) AS LimitId
		  ,ISNULL(t1.[ClientId], t2.[ClientId]) AS ClientId
		  ,ISNULL(t1.[Issuer], t2.[Issuer]) AS Issuer
		  ,t1.[FailLevel] AS FL1
		  ,t2.[FailLevel] AS FL2
		  ,t2.[CheckTime] AS Time2
	  FROM [dbo].[MailerLast] AS t1
		FULL OUTER JOIN [dbo].[MailerPrevDay] AS t2 ON (t1.[LimitId] = t2.[LimitId] AND t1.[ClientId] = t2.[ClientId] AND t1.[Issuer] = t2.[Issuer])
	WHERE ISNULL(t1.[FailLevel], 0) <> ISNULL(t2.[FailLevel], 0)





GO
/****** Object:  View [dbo].[My_Model_FT _History]    Script Date: 12.11.2024 13:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[My_Model_FT _History] AS
SELECT * FROM FactTable_History
GO
/****** Object:  StoredProcedure [dbo].[Arch_ClientLimits]    Script Date: 12.11.2024 13:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Arch_ClientLimits]
AS
BEGIN

	INSERT INTO [dbo].[ClientsLimits_History]
			   ([Arch_time]
			   ,[Id]
			   ,[LimitId]
			   ,[ClientCode]
			   ,[IsActive]
			   ,[MinValue]
			   ,[MaxValue]
			   ,[LowerWarning]
			   ,[UpperWarning])
	(
	SELECT getdate() AS [Arch_time]
		  ,[Id]
		  ,[LimitId]
		  ,[ClientCode]
		  ,[IsActive]
		  ,[MinValue]
		  ,[MaxValue]
		  ,[LowerWarning]
		  ,[UpperWarning]
	  FROM [LC3_dev].[dbo].[ClientsLimits]
	  )

END


GO
USE [master]
GO
ALTER DATABASE [LC3_History] SET  READ_WRITE 
GO
