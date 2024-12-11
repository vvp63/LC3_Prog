USE [master]
GO
/****** Object:  Database [LC3_dev]    Script Date: 11.12.2024 13:33:34 ******/
CREATE DATABASE [LC3_dev] ON  PRIMARY 
( NAME = N'LC3_dev', FILENAME = N'F:\MSSQL\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LC3_dev.mdf' , SIZE = 206720KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LC3_dev_log', FILENAME = N'F:\MSSQL\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LC3_dev_log.ldf' , SIZE = 31744KB , MAXSIZE = 5120000KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [LC3_dev] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LC3_dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LC3_dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LC3_dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LC3_dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LC3_dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LC3_dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [LC3_dev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LC3_dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LC3_dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LC3_dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LC3_dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LC3_dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LC3_dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LC3_dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LC3_dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LC3_dev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LC3_dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LC3_dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LC3_dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LC3_dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LC3_dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LC3_dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LC3_dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LC3_dev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LC3_dev] SET  MULTI_USER 
GO
ALTER DATABASE [LC3_dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LC3_dev] SET DB_CHAINING OFF 
GO
USE [LC3_dev]
GO
/****** Object:  User [PreControl]    Script Date: 11.12.2024 13:33:34 ******/
CREATE USER [PreControl] FOR LOGIN [PreControl] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [LEADERINVEST\sql-adm_co1-vp-lc1_Def]    Script Date: 11.12.2024 13:33:34 ******/
CREATE USER [LEADERINVEST\sql-adm_co1-vp-lc1_Def] FOR LOGIN [LEADERINVEST\sql-adm_co1-vp-lc1_Def]
GO
/****** Object:  User [LC3_reader]    Script Date: 11.12.2024 13:33:34 ******/
CREATE USER [LC3_reader] FOR LOGIN [LC3_reader] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [lc_web]    Script Date: 11.12.2024 13:33:34 ******/
CREATE USER [lc_web] FOR LOGIN [lc_web] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CO1-VP-LC1\LC3_Viewers]    Script Date: 11.12.2024 13:33:34 ******/
CREATE USER [CO1-VP-LC1\LC3_Viewers] FOR LOGIN [CO1-VP-LC1\LC3_Viewers]
GO
/****** Object:  User [CO1-VP-LC1\LC3_Users]    Script Date: 11.12.2024 13:33:34 ******/
CREATE USER [CO1-VP-LC1\LC3_Users] FOR LOGIN [CO1-VP-LC1\LC3_Users]
GO
/****** Object:  User [CO1-VP-LC1\LC3_Admins]    Script Date: 11.12.2024 13:33:34 ******/
CREATE USER [CO1-VP-LC1\LC3_Admins] FOR LOGIN [CO1-VP-LC1\LC3_Admins]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'PreControl'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'LEADERINVEST\sql-adm_co1-vp-lc1_Def'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'LEADERINVEST\sql-adm_co1-vp-lc1_Def'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'LEADERINVEST\sql-adm_co1-vp-lc1_Def'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'LC3_reader'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'lc_web'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'CO1-VP-LC1\LC3_Viewers'
GO
sys.sp_addrolemember @rolename = N'db_denydatawriter', @membername = N'CO1-VP-LC1\LC3_Viewers'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'CO1-VP-LC1\LC3_Users'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'CO1-VP-LC1\LC3_Users'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'CO1-VP-LC1\LC3_Users'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'CO1-VP-LC1\LC3_Admins'
GO
/****** Object:  UserDefinedFunction [dbo].[CL_Limit_Conditions]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[CL_Limit_Conditions]
(
	@CLId	int
)
RETURNS nvarchar(MAX)
AS
BEGIN

	DECLARE @ResultVar nvarchar(MAX)	=	''
	DECLARE @ObjectCondition nvarchar(MAX)	=	''
	DECLARE @ObjectId int

	DECLARE	ObjCursor CURSOR FOR
	SELECT	Id FROM	CL_Objects WHERE CLId = @CLId

	OPEN ObjCursor
	FETCH NEXT FROM ObjCursor INTO @ObjectId
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @ObjectCondition = dbo.CL_Object_Conditions(@ObjectId)
		IF LEN(@ObjectCondition) > 0 SET @ResultVar = @ResultVar + '(' + @ObjectCondition + ') OR '
		FETCH NEXT FROM ObjCursor INTO @ObjectId
	END

	CLOSE ObjCursor
	DEALLOCATE ObjCursor

	IF (LEN(@ResultVar) > 3)
		SET @ResultVar = SUBSTRING(@ResultVar, 0, LEN(@ResultVar) - 2)
	RETURN @ResultVar

END





GO
/****** Object:  UserDefinedFunction [dbo].[CL_Object_Conditions]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[CL_Object_Conditions]
(
	@ObjectId	int
)
RETURNS nvarchar(MAX)
AS
BEGIN

	DECLARE @ResultVar nvarchar(MAX)	=	''

	DECLARE @ColumnName nvarchar(255), @Relation nvarchar(255), @ValuesList nvarchar(255), @IncludeNull	bit

	DECLARE	ObjCursor CURSOR FOR
	SELECT     P.ColumnName, C.Relation, C.ValuesList, C.IncludeNull
	FROM	CL_Conditions AS C LEFT JOIN CL_Params AS P ON C.ParamId = P.Id
	WHERE C.ObjectId = @ObjectId

	OPEN ObjCursor
	FETCH NEXT FROM ObjCursor INTO @ColumnName, @Relation, @ValuesList, @IncludeNull
	WHILE @@FETCH_STATUS = 0
	BEGIN

		IF LEN(@ValuesList) > 0 BEGIN
			IF (@ColumnName = 'contrid') SET @ValuesList = 'SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN (' + @ValuesList +')' 
			SET @ResultVar = @ResultVar + '([' + @ColumnName + '] ' + @Relation + ' (' + @ValuesList +')'
			IF (@IncludeNull <> 0) SET @ResultVar =  @ResultVar + ' OR [' + @ColumnName +'] IS NULL'
			SET @ResultVar =  @ResultVar + ') AND '
		END ELSE BEGIN
			IF (@IncludeNull <> 0) SET @ResultVar =  @ResultVar + '([' + @ColumnName +'] IS NULL) AND'
		END
		FETCH NEXT FROM ObjCursor INTO @ColumnName, @Relation, @ValuesList, @IncludeNull
	END

	CLOSE ObjCursor
	DEALLOCATE ObjCursor

	IF (LEN(@ResultVar) > 4)
		SET @ResultVar = SUBSTRING(@ResultVar, 0, LEN(@ResultVar) - 3)
	RETURN @ResultVar

END


GO
/****** Object:  UserDefinedFunction [dbo].[mathmax]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[mathmax]
(
	@p1	float, @p2 float
)
RETURNS float
AS
BEGIN

	-- Return the result of the function
	RETURN CASE WHEN @p1 > @p2 THEN @p1 ELSE @p2 END

END
GO
/****** Object:  Table [dbo].[_tmp_AU_Bonds]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_tmp_AU_Bonds](
	[comment] [nvarchar](250) NULL,
	[Type] [nvarchar](50) NULL,
	[Remark] [nvarchar](250) NULL,
	[EmmName] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_tmp_AU_Stocks]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_tmp_AU_Stocks](
	[Comment] [nvarchar](250) NULL,
	[Name] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_tmp_pif]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_tmp_pif](
	[grn] [varchar](255) NULL,
	[emitent] [varchar](255) NULL,
	[type] [varchar](255) NULL,
	[quantity] [numeric](18, 4) NULL,
	[summ] [numeric](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_tmp_Scales]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_tmp_Scales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParamNo] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Ok] [nvarchar](250) NULL,
	[NotOk] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_tmp_todel]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_tmp_todel](
	[Id] [int] IDENTITY(10000,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionLog]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionLog](
	[Time] [datetime] NULL,
	[UserName] [nvarchar](50) NULL,
	[TableName] [nvarchar](50) NULL,
	[Action] [nvarchar](5) NULL,
	[Comments] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AU_List]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AU_List](
	[contrid] [uniqueidentifier] NULL,
	[Type] [nvarchar](255) NULL,
	[Remark] [nvarchar](255) NULL,
	[InnerName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AU_SubtypeOrder]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AU_SubtypeOrder](
	[subtype] [nvarchar](50) NULL,
	[order] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACK_Fond_Content]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BACK_Fond_Content](
	[FondId] [int] NOT NULL,
	[ClientId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BACK_Fonds]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BACK_Fonds](
	[FondId] [int] NULL,
	[Name] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cache_Contragents]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cache_Contragents](
	[rid] [uniqueidentifier] NOT NULL,
	[name] [varchar](250) NOT NULL,
	[own_type] [int] NULL,
	[own_type_name] [varchar](50) NULL,
	[country] [int] NULL,
	[country_name] [varchar](250) NULL,
	[bonds_issue_sum] [numeric](38, 10) NULL,
	[is_bank] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cache_CurrentPortfolio]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cache_CurrentPortfolio](
	[ForTime] [datetime] NULL,
	[CB_Name] [varchar](255) NULL,
	[CB] [varchar](255) NULL,
	[Group] [varchar](255) NULL,
	[ClientName] [varchar](255) NULL,
	[ClientCode] [int] NULL,
	[CB_Code] [varchar](255) NULL,
	[ID_CB] [int] NULL,
	[Board] [varchar](255) NULL,
	[Type] [varchar](255) NULL,
	[Quantity] [bigint] NULL,
	[MarketValue] [float] NULL,
	[RegCode] [varchar](50) NULL,
	[ID_CB_SDH] [uniqueidentifier] NULL,
	[ID_Emit_SDH] [uniqueidentifier] NULL,
	[Nominal] [real] NULL,
	[CurrencyID] [int] NULL,
	[IsSubordinated] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cache_Full_Ratings]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cache_Full_Ratings](
	[for_obj] [int] NOT NULL,
	[ObjectId] [uniqueidentifier] NOT NULL,
	[SP_Rating] [nvarchar](50) NULL,
	[F_Rating] [nvarchar](50) NULL,
	[M_Rating] [nvarchar](50) NULL,
	[E_Rating] [nvarchar](50) NULL,
	[A_Rating] [nvarchar](50) NULL,
	[Own_Rating] [nvarchar](50) NULL,
	[Own_Comment] [nvarchar](50) NULL,
	[NKR_Rating] [nvarchar](50) NULL,
	[NRA_Rating] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cache_MonthTurnovers]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cache_MonthTurnovers](
	[ObjectId] [uniqueidentifier] NULL,
	[ticker] [nvarchar](20) NULL,
	[turn1] [numeric](32, 10) NULL,
	[turn2] [numeric](32, 10) NULL,
	[turn3] [numeric](32, 10) NULL,
	[IsBig] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cache_TodayDeals]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cache_TodayDeals](
	[НомерСделки] [bigint] NOT NULL,
	[ВремяСделки] [varchar](8) NULL,
	[Инструмент] [varchar](50) NULL,
	[РежимТоргов] [varchar](50) NULL,
	[НаименованиеИнструмента] [varchar](50) NULL,
	[Операция] [varchar](50) NULL,
	[Цена] [float] NULL,
	[Количество] [float] NULL,
	[Объем] [float] NULL,
	[КодКлиента] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cache_Tools]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cache_Tools](
	[rid] [uniqueidentifier] NOT NULL,
	[emitents_id] [uniqueidentifier] NOT NULL,
	[number_of_emission] [varchar](255) NULL,
	[state_reg_number] [varchar](255) NULL,
	[redemptiondate] [datetime] NULL,
	[announced_volume] [numeric](32, 10) NULL,
	[vol_circulations] [numeric](32, 10) NULL,
	[type] [varchar](9) NOT NULL,
	[subtype] [varchar](255) NULL,
	[date_of_end_placing] [datetime] NULL,
	[date_of_start_placing] [datetime] NULL,
	[ticker] [varchar](255) NULL,
	[tickerid] [uniqueidentifier] NULL,
	[begdate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[tender_days_ago] [int] NULL,
	[admittedquote] [numeric](32, 10) NULL,
	[volume_avg] [numeric](38, 10) NULL,
	[qsheet_code] [int] NULL,
	[qsheet] [varchar](255) NULL,
	[SecTypeBr] [varchar](50) NULL,
	[for_qual_investors] [bit] NULL,
	[organizerid] [uniqueidentifier] NULL,
	[is_subordinated] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cache_Tools_2]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cache_Tools_2](
	[rid] [uniqueidentifier] NOT NULL,
	[emitents_id] [uniqueidentifier] NOT NULL,
	[number_of_emission] [varchar](255) NULL,
	[state_reg_number] [varchar](255) NULL,
	[redemptiondate] [datetime] NULL,
	[announced_volume] [numeric](32, 10) NULL,
	[vol_circulations] [numeric](32, 10) NULL,
	[type] [varchar](9) NOT NULL,
	[subtype] [varchar](255) NULL,
	[date_of_end_placing] [datetime] NULL,
	[date_of_start_placing] [datetime] NULL,
	[ticker] [varchar](255) NULL,
	[tickerid] [uniqueidentifier] NULL,
	[begdate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[tender_days_ago] [int] NULL,
	[admittedquote] [numeric](32, 10) NULL,
	[volume_avg] [numeric](38, 10) NULL,
	[qsheet_code] [int] NULL,
	[qsheet] [varchar](255) NULL,
	[SecTypeBr] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CL]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CL](
	[Id] [int] IDENTITY(10000,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[GroupByEmit] [bit] NOT NULL,
	[GroupByInstr] [bit] NOT NULL,
	[Condition] [nvarchar](max) NULL,
	[IsComplex] [bit] NOT NULL,
	[LimitQuery] [nvarchar](max) NULL,
	[OwnerName] [nvarchar](50) NULL,
	[FTId] [int] NULL,
	[UseInPC] [bit] NULL,
	[LimitType] [int] NULL,
 CONSTRAINT [PK_CL] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CL_Conditions]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CL_Conditions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ObjectId] [int] NOT NULL,
	[ParamId] [int] NOT NULL,
	[Relation] [nvarchar](50) NOT NULL,
	[ValuesList] [nvarchar](max) NULL,
	[IncludeNull] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CL_Groups]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CL_Groups](
	[Id] [int] IDENTITY(54,1) NOT NULL,
	[Rid] [uniqueidentifier] NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CL_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CL_GroupsContent]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CL_GroupsContent](
	[GroupId] [int] NOT NULL,
	[contrid] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CL_IssueGroups]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CL_IssueGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rid] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CL_IssueGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CL_IssueGroupsContent]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CL_IssueGroupsContent](
	[GroupId] [int] NOT NULL,
	[issueid] [uniqueidentifier] NOT NULL,
	[Echelon] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CL_Objects]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CL_Objects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CLId] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_CL_Objects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CL_Params]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CL_Params](
	[Id] [int] NOT NULL,
	[ColumnName] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[ListTable] [nvarchar](255) NULL,
 CONSTRAINT [PK_CL_Params] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CL_SubGroup]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CL_SubGroup](
	[ParentId] [int] NOT NULL,
	[ChildId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientsFilter]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientsFilter](
	[ClientId] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ShowInCL] [int] NULL,
	[UseInSL] [int] NULL,
	[HideInList] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientsInvestorList]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientsInvestorList](
	[ClientId] [int] NOT NULL,
	[InvestorListId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientsLimits]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientsLimits](
	[Id] [int] IDENTITY(10000,1) NOT NULL,
	[LimitId] [int] NOT NULL,
	[ClientCode] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[MinValue] [decimal](18, 10) NOT NULL,
	[MaxValue] [decimal](18, 10) NOT NULL,
	[LowerWarning] [decimal](18, 10) NULL,
	[UpperWarning] [decimal](18, 10) NULL,
	[Identifier] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_Bool]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_Bool](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_Countries]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_Currencies]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_Currencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_OwnTypes]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_OwnTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_QuoteSheets]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_QuoteSheets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_RatingsARKA]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_RatingsARKA](
	[Id] [int] NULL,
	[Value] [varchar](100) NULL,
	[Name] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_RatingsExpert]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_RatingsExpert](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_RatingsFitch]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_RatingsFitch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_RatingsMoodys]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_RatingsMoodys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_RatingsNKR]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_RatingsNKR](
	[Id] [int] NOT NULL,
	[Value] [varchar](100) NULL,
	[Name] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_RatingsNRA]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_RatingsNRA](
	[Id] [int] NOT NULL,
	[Value] [varchar](100) NULL,
	[Name] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_RatingsSP]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_RatingsSP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_SecTypeBr]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_SecTypeBr](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_Subtypes]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_Subtypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_Types]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLlst_UniversalRatings]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLlst_UniversalRatings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactTable]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTable](
	[ClientCode] [int] NULL,
	[ClientAccount] [varchar](50) NULL,
	[SummAsset] [float] NULL,
	[Instrument] [varchar](255) NULL,
	[Quantity] [bigint] NULL,
	[MarketValue] [float] NULL,
	[Percent] [decimal](18, 10) NULL,
	[Issuer] [varchar](250) NULL,
	[InstrumentName] [varchar](255) NULL,
	[InstrumentType] [varchar](9) NULL,
	[InstrumentSubtype] [varchar](255) NOT NULL,
	[SecTypeBr] [varchar](50) NULL,
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
/****** Object:  Table [dbo].[FactTablesList]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTablesList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](100) NULL,
	[Comment] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[List_ByEmitents]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[List_ByEmitents](
	[Arch_date] [datetime] NULL,
	[ClientCode] [int] NULL,
	[ClientAccount] [varchar](50) NULL,
	[Instrument] [varchar](255) NULL,
	[Quantity] [bigint] NULL,
	[MarketValue] [float] NULL,
	[Issuer] [varchar](250) NULL,
	[InstrumentName] [varchar](255) NULL,
	[InstrumentType] [varchar](9) NULL,
	[InstrumentSubtype] [varchar](255) NULL,
	[CB_Code] [varchar](255) NULL,
	[StateRegNum] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[List_ByOrganizers]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[List_ByOrganizers](
	[Arch_date] [datetime] NULL,
	[ClientCode] [int] NULL,
	[ClientAccount] [varchar](50) NULL,
	[Instrument] [varchar](255) NULL,
	[Quantity] [bigint] NULL,
	[MarketValue] [float] NULL,
	[Issuer] [varchar](250) NULL,
	[InstrumentName] [varchar](255) NULL,
	[InstrumentType] [varchar](9) NULL,
	[InstrumentSubtype] [varchar](255) NULL,
	[CB_Code] [varchar](255) NULL,
	[StateRegNum] [varchar](255) NULL,
	[Organizer] [varchar](255) NULL,
	[Role] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MailerParams]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailerParams](
	[Name] [nvarchar](50) NULL,
	[Value] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model_FT]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model_FT](
	[UId] [int] NULL,
	[ClientCode] [int] NULL,
	[ClientAccount] [varchar](50) NULL,
	[SummAsset] [float] NULL,
	[Instrument] [varchar](255) NULL,
	[Quantity] [bigint] NULL,
	[MarketValue] [float] NULL,
	[Percent] [decimal](18, 10) NULL,
	[Issuer] [varchar](250) NULL,
	[InstrumentName] [varchar](255) NULL,
	[InstrumentType] [varchar](9) NULL,
	[InstrumentSubtype] [varchar](255) NULL,
	[SecTypeBr] [varchar](50) NULL,
	[Country] [varchar](250) NULL,
	[QuoteSheet] [varchar](255) NULL,
	[OwnType] [varchar](50) NULL,
	[BondsIssueSumm] [numeric](38, 10) NULL,
	[QuoteSDH] [float] NULL,
	[QuoteSDHAgo] [int] NULL,
	[VolCirculation] [numeric](32, 10) NULL,
	[contrid] [uniqueidentifier] NULL,
	[Capitalization] [int] NULL,
	[RedemptionDate] [datetime] NULL,
	[SecurityId] [uniqueidentifier] NOT NULL,
	[IssueNum] [varchar](255) NULL,
	[AnnouncedVol] [numeric](32, 10) NULL,
	[DateStartPlacing] [datetime] NULL,
	[DateEndPlacing] [datetime] NULL,
	[Currency] [int] NULL,
	[CB_Code] [varchar](255) NULL,
	[ID_CB_SDH] [uniqueidentifier] NULL,
	[StateRegNum] [varchar](255) NULL,
	[MonthAvgVol] [numeric](38, 10) NULL,
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
/****** Object:  Table [dbo].[OUR_CreditRiskLimits]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OUR_CreditRiskLimits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IssuerId] [uniqueidentifier] NOT NULL,
	[SecuritySubTypeId] [int] NULL,
	[IsAllowedDeposit] [bit] NOT NULL,
	[IsAllowedBuy] [bit] NOT NULL,
	[AbsoluteLimit] [float] NOT NULL,
	[ConcentrationLimit] [float] NOT NULL,
	[Note] [varchar](2048) NULL,
 CONSTRAINT [PK_OUR_CreditRiskLimits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OUR_CreditRiskLimits_Import]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OUR_CreditRiskLimits_Import](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Эмитент] [nvarchar](255) NULL,
	[Рейтинг] [nvarchar](255) NULL,
	[Вид] [varchar](50) NULL,
	[Кредитный рейтинг УК Лидер] [float] NULL,
	[Кредитный риск] [nvarchar](255) NULL,
	[Разрешено размешать в депозиты] [nvarchar](255) NULL,
	[Разрешено покупать облигаци] [nvarchar](255) NULL,
	[Абсолютный лимит] [float] NULL,
	[Лимит концентрации] [float] NULL,
	[Примечание] [nvarchar](255) NULL,
	[IssuerId] [uniqueidentifier] NULL,
	[SecSubTypeId] [int] NULL,
 CONSTRAINT [PK_OUR_CreditRiskLimits_Import_2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OUR_StockIssuerLimits]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OUR_StockIssuerLimits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContragentId] [uniqueidentifier] NOT NULL,
	[ConcentrationLimit] [float] NOT NULL,
 CONSTRAINT [PK_OUR_StockIssuerLimits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OUR_StockLimits]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OUR_StockLimits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ToolId] [uniqueidentifier] NOT NULL,
	[ConcentrationLimit] [float] NOT NULL,
	[LiquidityGroup] [int] NOT NULL,
 CONSTRAINT [PK_OUR_StockLimits_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OUR_StockLimits_Import]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OUR_StockLimits_Import](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Тикер на ММВБ] [nvarchar](255) NOT NULL,
	[ISIN] [nvarchar](255) NOT NULL,
	[Лимит концентрации] [float] NOT NULL,
	[Группа ликвидности] [int] NOT NULL,
	[ToolId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OUR_StockPortfolioLimits]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OUR_StockPortfolioLimits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Модель] [varchar](255) NULL,
	[ЦелеваяДоляАкций2018] [float] NOT NULL,
	[ЦелеваяДоляАкций2018ВПроцентахГодовых] [float] NOT NULL,
	[ЛимитНаМаксимальнуюДолюАкцийВПортфелеВПроцентахОтСтоимостиПортфеляНегативный] [float] NOT NULL,
	[ЛимитНаМаксимальнуюДолюАкцийВПортфелеВПроцентахОтСтоимостиПортфеляНейтральный] [float] NOT NULL,
	[ЛимитНаМаксимальнуюДолюАкцийВПортфелеВПроцентахОтСтоимостиПортфеляАгрессивный] [float] NOT NULL,
	[ЛимитНаМаксимальнуюДолюАкцийВПортфелеВПроцентахОтСтоимостиПортфеля] [float] NOT NULL,
	[ЛимитНаМаксимальнуюДолюВложенийВДолларСШАВПроцентахОтСтоимостиПортфеля] [float] NOT NULL,
	[ОбщийЛимитНаДолюРискованныхИнструментовВПроцентахОтСтоимостиПортфеля] [float] NOT NULL,
 CONSTRAINT [PK_OUR_StockPortfolioLimits_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OUR_StockPortfolioLimits_Iimport]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OUR_StockPortfolioLimits_Iimport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Портфель] [nvarchar](255) NULL,
	[Модель] [nvarchar](255) NULL,
	[Целевая доля акций в 2018 году] [float] NULL,
	[Целевая доходность на 2018 г#, % годовых] [float] NULL,
	[Негативный] [float] NULL,
	[Нейтральный] [float] NULL,
	[Агрессивный] [float] NULL,
	[Лимит на максимальную долю акций в портфеле, в % от стоимости по] [float] NULL,
	[Лимит на максимальную долю вложений в доллар США, % от стоимости] [float] NULL,
	[Общий лимит на долю рискованных инструментов, % от стоимости пор] [float] NULL,
	[ClientId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PC_Check]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PC_Check](
	[Id] [int] IDENTITY(10000,1) NOT NULL,
	[Time] [datetime] NOT NULL,
	[ClientId] [int] NULL,
	[Instrument] [nvarchar](255) NULL,
	[Amount] [bigint] NULL,
	[MarkToMarket] [float] NULL,
	[IDCBSDH] [uniqueidentifier] NULL,
	[IDIssuerSDH] [uniqueidentifier] NULL,
	[CacheControlId] [int] NULL,
	[Result] [int] NULL,
	[Text] [varchar](max) NULL,
	[ResultByOrder] [int] NULL,
	[TextByOrder] [varchar](max) NULL,
	[TimeLog] [varchar](max) NULL,
 CONSTRAINT [PK_PC_Results] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PC_Results]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PC_Results](
	[CheckId] [int] NULL,
	[ClientId] [int] NULL,
	[LimitId] [int] NULL,
	[SummAsset] [float] NULL,
	[Max] [float] NULL,
	[Min] [float] NOT NULL,
	[SumMarketVaule] [float] NULL,
	[SumPercent] [float] NULL,
	[FailsNum] [int] NULL,
	[WarningNum] [int] NULL,
	[SumMarketVaule2] [float] NULL,
	[SumPercent2] [float] NULL,
	[FailsNum2] [int] NULL,
	[WarningNum2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pif_structure]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pif_structure](
	[pifid] [int] NULL,
	[rid] [uniqueidentifier] NULL,
	[emitents_id] [uniqueidentifier] NULL,
	[quantity] [bigint] NULL,
	[summ] [real] NULL,
	[Type] [varchar](255) NULL,
	[ID_CB] [int] NULL,
	[CB_Code] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pifs]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pifs](
	[id] [int] NULL,
	[pif_rid] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RatingScales]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RatingScales](
	[ScaleId] [int] NOT NULL,
	[ScaleName] [nvarchar](50) NULL,
	[MaxScaleValue] [int] NOT NULL,
	[RisklessValue] [int] NOT NULL,
	[UniversalShift] [int] NULL,
	[UniversalMultiply] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPODeals]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPODeals](
	[КодКлиента] [int] NOT NULL,
	[Инструмент] [varchar](50) NULL,
	[НаименованиеИнструмента] [varchar](50) NULL,
	[Дата первой части сделки] [datetime] NULL,
	[СрокРепо] [int] NULL,
	[Направление первой части] [varchar](50) NULL,
	[Количество] [float] NULL,
	[Цена первой части] [float] NULL,
	[Цена второй части] [float] NULL,
	[ID_CB_CXPI] [varchar](max) NULL,
	[ID_Emit_CXPI] [varchar](max) NULL,
	[nominal] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestrictList]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestrictList](
	[ClientId] [int] NOT NULL,
	[Type] [nvarchar](5) NULL,
	[rid] [uniqueidentifier] NULL,
	[LimitType] [nvarchar](1) NULL,
	[LimitValue] [float] NULL,
	[Echelon] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RL_Types]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RL_Types](
	[Code] [nvarchar](5) NOT NULL,
	[TypeName] [nvarchar](100) NULL,
	[ShowCode] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RL_Universal]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RL_Universal](
	[id] [uniqueidentifier] NULL,
	[ClientId] [int] NULL,
	[CORG] [nvarchar](5) NULL,
	[CORGid] [uniqueidentifier] NULL,
	[RestrictType] [nvarchar](5) NULL,
	[IssueRid] [uniqueidentifier] NULL,
	[TypesList] [nvarchar](250) NULL,
	[LimitType] [nvarchar](5) NULL,
	[Min] [real] NULL,
	[Max] [real] NULL,
	[NoBuy] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SintClient]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SintClient](
	[Id] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Account] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SintClient_Content]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SintClient_Content](
	[SintId] [int] NOT NULL,
	[ClientId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Data]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Data](
	[SLDate] [datetime] NOT NULL,
	[CB_Name] [varchar](255) NULL,
	[CB] [varchar](255) NULL,
	[ID_CB_SDH] [uniqueidentifier] NULL,
	[RegCode] [varchar](50) NULL,
	[SummQty] [bigint] NULL,
	[announced_volume] [numeric](32, 10) NULL,
	[Percent] [numeric](38, 6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SL_Events]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SL_Events](
	[Date] [datetime] NULL,
	[CB_Name] [varchar](255) NULL,
	[CB] [varchar](255) NULL,
	[ID_CB_SDH] [uniqueidentifier] NULL,
	[PCurr] [numeric](38, 6) NULL,
	[PPrev] [numeric](38, 6) NULL,
	[Readed] [int] NOT NULL,
	[Reader] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccess]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccess](
	[UserName] [nvarchar](100) NULL,
	[AccessMode] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccess_Web]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccess_Web](
	[UserName] [nvarchar](250) NULL,
	[AccessMode] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Лист1$]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Лист1$](
	[Тикер на ММВБ] [nvarchar](255) NULL,
	[ISIN] [nvarchar](255) NULL,
	[Лимит концентрации] [float] NULL,
	[Группа ликвидности] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CL_Query_10034]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[CL_Query_10034] AS
	SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [Issuer], [IssueNum], MarketValue AS SumMarketValue, [Percent] AS SumPercent,
				CASE WHEN EXISTS(
						SELECT * 
						FROM [SDH].SDH.dbo.issue_bond_payoffs_defaults 
						WHERE bondid=SecurityId AND dstatus IN (1, 2) )  THEN 1 
					ELSE 0 
				END AS LimitValue
	FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND ([InstrumentType] IN ('облигация'))


GO
/****** Object:  View [dbo].[CL_Limit_10034]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10034] AS SELECT * FROM CL_Query_10034
GO
/****** Object:  View [dbo].[SL_Dates]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/

CREATE VIEW [dbo].[SL_Dates]
AS

	SELECT t.SLDate, ROW_NUMBER() OVER (ORDER BY t.[SLDate] desc) AS DateNum FROM (SELECT distinct [SLDate] FROM [SL_Data]) AS t

	--	SELECT distinct [SLDate], ROW_NUMBER() OVER (PARTITION BY [CB] ORDER BY [SLDate] desc) AS DateNum FROM [SL_Data]

GO
/****** Object:  View [dbo].[SL_LastChanging]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[SL_LastChanging]
AS
	SELECT ISNULL(t1.[CB_Name],t2.[CB_Name]) AS CB_Name, ISNULL(t1.[CB],t2.[CB]) AS CB, ISNULL(t1.[ID_CB_SDH],t2.[ID_CB_SDH]) AS [ID_CB_SDH]
	, t1.SLDate AS Date1, t1.[Percent] AS P1, t2.SLDate AS Date2, t2.[Percent] AS P2
	, CASE WHEN  t1.[Percent] = t2.[Percent] THEN 0 ELSE 1 END AS Changed
--	, convert(int, t1.[Percent] / 5) AS P51
--	, convert(int, t2.[Percent] / 5) AS P52
	, CASE WHEN  convert(int, t1.[Percent] / 5) = convert(int, t2.[Percent] / 5) THEN 0 ELSE 1 END AS P5Changed
	FROM
		(SELECT [SLDate],[CB_Name],[CB],[ID_CB_SDH],[RegCode],[SummQty],[announced_volume],[Percent]
		FROM [SL_Data] WHERE [SLDate] = (SELECT [SLDate] FROM [SL_Dates] WHERE [DateNum] = 1) ) AS t1
	FULL JOIN
		(SELECT [SLDate],[CB_Name],[CB],[ID_CB_SDH],[RegCode],[SummQty],[announced_volume],[Percent]
		FROM [SL_Data] WHERE [SLDate] = (SELECT [SLDate] FROM [SL_Dates] WHERE [DateNum] = 2) ) AS t2
	ON (t1.[ID_CB_SDH] = t2.[ID_CB_SDH])


GO
/****** Object:  View [dbo].[_CL_UsedClients]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[_CL_UsedClients] AS
SELECT [ClientId] FROM [dbo].[ClientsFilter] WHERE [ShowInCL] <> 0 OR [UseInSL] <> 0



GO
/****** Object:  View [dbo].[_CL_ExchCodes]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[_CL_ExchCodes]
AS
	SELECT ec.rid, ec.issueid, ec.ticker, ec.shortname, ec.contrid, iss.gosreg_corrected, iss.isin_corrected,
			ec.shortname + ', (' + CASE WHEN ec.[ticker] IS NOT NULL THEN ec.[ticker] ELSE '' END
								 + CASE WHEN iss.[gosreg_corrected] IS NOT NULL THEN ', ' + iss.[gosreg_corrected] ELSE '' END
								 + CASE WHEN iss.[isin_corrected] IS NOT NULL THEN ', ' + iss.[isin_corrected] ELSE '' END
								 + ')' AS FullName 
	FROM
	(
		SELECT ec.rid, case for_obj when 1 then ec.bondid when 2 then ec.stockid when 3 then ec.fundid end as issueid, ec.ticker, ec.shortname, ec.contrid 
		FROM [SDH].SDH.dbo.exchange_codes AS ec 
			INNER JOIN (SELECT [tickerid] FROM [SDH].SDH.dbo.[exchange_issues] WHERE [enddate] IS NULL OR [enddate] > getdate()) AS ei ON (ei.[tickerid] = ec.rid)
	) AS ec
	LEFT JOIN
	(
		SELECT rid, full_name, isin_corrected, gosreg_corrected FROM [SDH].SDH.dbo.issue_stocks
		UNION
		SELECT rid, full_name, isin_corrected, gosreg_corrected FROM [SDH].SDH.dbo.issue_bonds
	) AS iss ON (ec.issueid=iss.rid)
GO
/****** Object:  View [dbo].[_CL_Clients]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[_CL_Clients]
AS
	select * from (
		SELECT CAST(КодКлиента as int) as КодКлиента, НаименованиеКлиента, '(' + CAST(КодКлиента as varchar) + ') ' + НаименованиеКлиента AS ПолноеНаименование
		FROM         [CO1-VT-FO1].Informer.dbo.Clients
		WHERE КодКлиента > 0 AND КодКлиента IS NOT NULL AND НаименованиеКлиента NOT LIKE 'LID%'
		UNION
		SELECT 1000000 + [FondId] AS КодКлиента, '[ФОНД] ' + [Name] AS НаименованиеКлиента, 
					'(' + CAST(1000000 + [FondId] as varchar) + ') [ФОНД] ' + [Name] AS ПолноеНаименование FROM [BACK_Fonds]
		UNION
		SELECT Id AS КодКлиента, '[Синтетический] ' + [Name] AS НаименованиеКлиента, '[Синтетический] ' + [Name] AS ПолноеНаименование FROM [SintClient]
		UNION
		SELECT 0 as КодКлиента, '...Все...' AS НаименованиеКлиента, '...Все...' AS ПолноеНаименование
	) t
	where t.[КодКлиента] in ( SELECT [ClientId] FROM [ClientsFilter] WHERE [ShowInCL] = 1 AND HideInList <> 1)
	


GO
/****** Object:  View [dbo].[_CL_Contragents]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[_CL_Contragents]
AS
	SELECT rid, [name] from [Cache_Contragents]
	--SELECT ca.rid, ca.name from   [SDH].SDH.dbo.Contragents as ca
GO
/****** Object:  View [dbo].[_CL_Restrictions]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[_CL_Restrictions]
AS

	SELECT rl.[ClientId]
		  ,cl.[НаименованиеКлиента] AS ClientName	
		  ,rl.[Type]
		  ,rlt.[TypeName] AS RestrictType
		  ,rl.[rid]
		  ,case rlt.[ShowCode]	WHEN 'I' THEN ec.FullName					
								WHEN 'C' THEN c.name
								WHEN 'G' THEN g.GroupName
						    END AS RestrictName
		  ,rl.Echelon
		  ,rl.[LimitType]
		  ,rl.[LimitValue]
		  ,case rl.[LimitType] WHEN 'P' THEN '%' WHEN 'A' THEN 'руб.' END As Units
	  FROM [RestrictList] AS rl	LEFT JOIN [_CL_Clients] AS cl ON rl.[ClientId] = cl.[КодКлиента]
								LEFT JOIN [_CL_Contragents] AS c ON (rl.[rid] = c.rid)
								LEFT JOIN [_CL_ExchCodes] AS ec ON (rl.[rid] = ec.issueid)
								LEFT JOIN [CL_Groups] AS g ON (rl.[rid] = g.Rid)
								LEFT JOIN [RL_Types] AS rlt ON (rl.[Type] = rlt.[Code])
	WHERE rl.[ClientId] IN (SELECT * FROM _CL_UsedClients)




GO
/****** Object:  View [dbo].[_CL_GroupContent]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[_CL_GroupContent]
AS
	SELECT gc.GroupId, ca.rid, ca.name 
		FROM CL_GroupsContent AS gc LEFT JOIN _CL_Contragents AS ca
		ON (gc.contrid = ca.rid)

GO
/****** Object:  View [dbo].[CL_Query_10039]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[CL_Query_10039] AS
	SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [Issuer], [IssueNum], [QuoteSheet], MarketValue AS SumMarketValue, [Percent] AS SumPercent,
       case 
            when [QuoteSheet] in ('Третий уровень листинга', '3') then 1
            else 0
       end           as LimitValue
	FROM dbo.FactTable WHERE contrid IN (SELECT [rid] FROM [_CL_GroupContent] WHERE [GroupId] = 31)


GO
/****** Object:  View [dbo].[CL_Limit_10039]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10039] AS SELECT * FROM CL_Query_10039
GO
/****** Object:  View [dbo].[RepoTotalPos]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[RepoTotalPos]
AS
  SELECT [КодКлиента] AS [ClientCode]
      ,[Инструмент] AS [Instrument]
      ,[НаименованиеИнструмента] AS [InstrumentName]
      ,SUM([Количество] * (CASE WHEN [Направление первой части] = 'Покупка' THEN 1 WHEN [Направление первой части] = 'Продажа' THEN -1 ELSE 0 END)) AS [QtyInRepo]
      ,[ID_CB_CXPI]
  FROM [REPODeals] GROUP BY [КодКлиента],[Инструмент],[НаименованиеИнструмента],[ID_CB_CXPI],[ID_Emit_CXPI]
GO
/****** Object:  View [dbo].[FT_NoRepo]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[FT_NoRepo]
AS

	SELECT ft.[ClientCode]
		  ,[ClientAccount]
		  ,[SummAsset]
		  ,ft.[Instrument]
		  ,[Quantity] AS [QuantityWithRepo]
		  ,[MarketValue] AS [MarketValueWithRepo]
		  ,[Percent] AS [PercentWithRepo]
		  ,rp.[QtyInRepo]
		  ,([Quantity] - ISNULL(rp.[QtyInRepo], 0)) AS [Quantity]
		  , CASE WHEN [Quantity] <> 0 THEN [MarketValue] / [Quantity] * ([Quantity] - ISNULL(rp.[QtyInRepo], 0)) ELSE [MarketValue] END AS [MarketValue] 
		  , CASE WHEN [Quantity] <> 0 THEN [Percent] / [Quantity] * ([Quantity] - ISNULL(rp.[QtyInRepo], 0)) ELSE [Percent] END AS [Percent] 
		  ,[Issuer]
		  ,ft.[InstrumentName]
		  ,[InstrumentType]
		  ,[InstrumentSubtype]
		  ,[SecTypeBr]
		  ,[Country]
		  ,[QuoteSheet]
		  ,[OwnType]
		  ,[BondsIssueSumm]
		  ,[QuoteSDH]
		  ,[QuoteSDHAgo]
		  ,[VolCirculation]
		  ,[contrid]
		  ,[Capitalization]
		  ,[RedemptionDate]
		  ,[SecurityId]
		  ,[IssueNum]
		  ,[AnnouncedVol]
		  ,[DateStartPlacing]
		  ,[DateEndPlacing]
		  ,[Currency]
		  ,[CB_Code]
		  ,[ID_CB_SDH]
		  ,[StateRegNum]
		  ,[MonthAvgVol]
		  ,[F_Rating]
		  ,[M_Rating]
		  ,[SP_Rating]
		  ,[E_Rating]
		  ,[A_Rating]
		  ,[Contr_F_Rating]
		  ,[Contr_M_Rating]
		  ,[Contr_SP_Rating]
		  ,[Contr_E_Rating]
		  ,[Contr_A_Rating]
		  ,[enddate]
		  ,[IsInIndex]
		  ,[IsVariableCoupon]
		  ,[IsQuantityGrows]
		  ,[DaysToRedemption]
		  ,[is_bank]
		  ,[for_qual_investors]
		  ,[NKR_Rating]
		  ,[NRA_Rating]
		  ,[Contr_NKR_Rating]
		  ,[Contr_NRA_Rating]
		  ,[IsSubordinated]
	  FROM [FactTable] AS ft LEFT JOIN [RepoTotalPos] AS rp ON (ft.ClientCode = rp.ClientCode AND ft.ID_CB_SDH = rp.[ID_CB_CXPI])

GO
/****** Object:  View [dbo].[CL_Query_10198]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Query_10198] AS

	SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [Issuer], [MarketValue] AS [SumMarketValue], [Percent] AS [SumPercent] 
		, CONVERT(varchar, CONVERT(decimal, rl.LimitValue)) + CASE [LimitType] WHEN 'P' THEN ' %' ELSE '' END AS [Limit], 
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, convert(decimal(18,0), convert(float, ft.[SummAsset]) * (CONVERT(decimal(18, 6), rl.LimitValue) - convert(decimal(18, 6), ft.[Percent]))) )
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), rl.LimitValue) - convert(decimal(18, 0), ft.[MarketValue])) 
						END AS [FreeToBuy],
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), rl.LimitValue) - convert(decimal(18, 4), ft.[Percent]) ) + ' %'
						ELSE '' 
						END AS [FreeToBuyPerc]
		  , convert(decimal(18, 8), 
						  CASE rl.[LimitType]
								WHEN 'P' THEN 
									CASE WHEN rl.LimitValue > 0 THEN 
										100 * ft.[Percent] / rl.LimitValue ELSE 101 END
								WHEN 'A' THEN 
									CASE WHEN rl.LimitValue > 0  THEN 
										100 * ft.[MarketValue] / rl.LimitValue  ELSE 101 END  
								ELSE 101
						  END 
					  ) AS LimitValue
	FROM [FT_NoRepo] as ft LEFT JOIN [RestrictList] as rl on (ft.[ClientCode] = rl.[ClientId] AND ((rl.[Type] = 'I' AND ft.ID_CB_SDH = rl.rid) OR (rl.[Type] = 'C' AND ft.[contrid] = rl.rid)))
	WHERE ft.InstrumentType IN ('акция', 'облигация')
GO
/****** Object:  View [dbo].[CL_Limit_10192]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10192] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FT_NoRepo
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentSubtype] IN ('ГЦБ'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Query_10063]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[CL_Query_10063] AS


	SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [Issuer], [MarketValue] AS [SumMarketValue], [Percent] AS [SumPercent] 
		, CONVERT(varchar, CONVERT(decimal, rl.LimitValue)) + CASE [LimitType] WHEN 'P' THEN ' %' ELSE '' END AS [Limit], 
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, convert(decimal(18,0), convert(float, ft.[SummAsset]) * (CONVERT(decimal(18, 6), rl.LimitValue) - convert(decimal(18, 6), ft.[Percent]))) )
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), rl.LimitValue) - convert(decimal(18, 0), ft.[MarketValue])) 
						END AS [FreeToBuy],
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), rl.LimitValue) - convert(decimal(18, 4), ft.[Percent]) ) + ' %'
						ELSE '' 
						END AS [FreeToBuyPerc]
		  , convert(decimal(18, 8), 
						  CASE rl.[LimitType]
								WHEN 'P' THEN 
									CASE WHEN rl.LimitValue > 0 THEN 
										100 * ft.[Percent] / rl.LimitValue ELSE 101 END
								WHEN 'A' THEN 
									CASE WHEN rl.LimitValue > 0  THEN 
										100 * ft.[MarketValue] / rl.LimitValue  ELSE 101 END  
								ELSE 101
						  END 
					  ) AS LimitValue
	FROM [FT_NoRepo] as ft INNER JOIN [RestrictList] as rl on (ft.[ClientCode] = rl.[ClientId] AND ((rl.[Type] = 'I' AND ft.ID_CB_SDH = rl.rid) OR (rl.[Type] = 'C' AND ft.[contrid] = rl.rid)))
	WHERE ft.InstrumentType IN ('акция', 'облигация')




GO
/****** Object:  View [dbo].[CL_Query_10148]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[CL_Query_10148] AS

	SELECT [ClientCode], [ClientAccount], [SummAsset], 'ОФЗ < 1 (151 млн)' AS [Duration], SUM(MarketValue) AS [MarketValue], 
		100 * ISNULL(SUM(MarketValue) / 151000000, 0) AS LimitValue
		FROM dbo.FT_NoRepo WHERE (MarketValue IS NOT NULL)
		AND InstrumentSubtype = 'ГЦБ' AND DaysToRedemption > 0 AND DaysToRedemption < 366
		GROUP BY [ClientCode], [ClientAccount], [SummAsset]
	UNION
	SELECT [ClientCode], [ClientAccount], [SummAsset], '1 < ОФЗ < 3 (154 млн)' AS [Duration], SUM(MarketValue) AS [MarketValue],  
		100 * ISNULL(SUM(MarketValue) / 154000000, 0) AS LimitValue
		FROM dbo.FT_NoRepo WHERE (MarketValue IS NOT NULL)
		AND InstrumentSubtype = 'ГЦБ' AND DaysToRedemption > 365 AND DaysToRedemption < 1096
		GROUP BY [ClientCode], [ClientAccount], [SummAsset]
	UNION
	SELECT [ClientCode], [ClientAccount], [SummAsset], 'ОФЗ > 3 (54 млн)' AS [Duration], SUM(MarketValue) AS [MarketValue],  
		100 * ISNULL(SUM(MarketValue) / 54000000, 0) AS LimitValue
		FROM dbo.FT_NoRepo WHERE (MarketValue IS NOT NULL)
		AND InstrumentSubtype = 'ГЦБ' AND DaysToRedemption > 1095
		GROUP BY [ClientCode], [ClientAccount], [SummAsset]

GO
/****** Object:  View [dbo].[SDH_Bonds]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[SDH_Bonds]
AS
	SELECT
		ib.rid,								--	Id выпуска 
		ib.emitents_id,						--	Id эмитента
		ib.number_of_emission,				--	Номер выпуска
		ib.state_reg_number,				--	ГРН
		ib.redemptiondate,					--	Дата погашения выпуска
		ib.amount,							--	Объем выпуска по номиналу
		ibc.amount AS vol_circulations,		--	Объем выпуска в обращении (в валюте номинала)
		ldk.shortname AS subtype,			--	Подвид облигации
		ISNULL(ib.date_of_end_placing, ib.date_of_start_placing) AS date_of_end_placing,		--	Дата окончания размещения
		ib.date_of_start_placing,			--	Дата начала размещения
		ec.ticker,							--	Тикер на бирже
		ei.tickerid,						--	Id тикера на бирже
		ei.begdate,							--	Дата начала обращения на бирже
		ei.enddate,							--	Дата завершения обращения на бирже
		ttb.tender_days_ago,				--	Возраст последней признаваемой котировки
		ttb.admittedquote,					--	Последняя признаваемая котировка
		sstb.[shortname]	AS sec_type_br,	--	Классификация бумаги по мнению ЦБ РФ
		ib.[for_qual_investors],			--	Для квал инвесторов
		ib.[is_subordinated],				--	Субординированная
		ibc.[nominal_price]					--	Текущий номинал
	--	ibo.[contrid_dmart] AS organizerid	--	id организатора выпуска
	FROM [SDH].[SDH].[dbo].[issue_bonds] AS ib
		LEFT JOIN [SDH].[SDH].[dbo].[spr_bond_kinds] AS sbk ON (ib.kind_id = sbk.code)
		LEFT JOIN [SDH].[SDH].[dbo].[spr_sec_types_br] AS sstb ON (ib.sec_type_br = sstb.code)
		LEFT JOIN [SDH].[SDH].[dbo].[lstDebentureKinds] AS ldk ON (sbk.kind = ldk.code) 
		LEFT JOIN (
						SELECT	bondid,
								tickerid,
								begdate,
								enddate,
								ROW_NUMBER() over(partition by bondid order by begdate desc) AS rn
						FROM   [SDH].[SDH].[dbo].[exchange_issues] WHERE contrid = '6CCF6D58-7F71-4650-8693-925B17B09462'
																AND (begdate <> enddate or enddate is null)
					
					) ei ON (ib.rid = ei.bondid AND ei.rn = 1)
		LEFT JOIN (
						SELECT admittedquote,
							   tickerid,
							   datediff(d, tenderdate, getdate()) as tender_days_ago,
							   row_number() over(partition by tickerid order by tenderdate desc, agreement_number desc) as rn
						FROM   [SDH].[SDH].[dbo].[tender_total_bonds]
						WHERE  admittedquote IS NOT NULL AND datediff(d, tenderdate, getdate()) <= 90
					) AS ttb ON ttb.tickerid = ei.tickerid AND ttb.rn = 1
		LEFT JOIN [SDH].[SDH].[dbo].[exchange_codes] AS ec ON (ei.tickerid = ec.rid)
		LEFT JOIN (
			SELECT *, ROW_NUMBER() over (partition by bondid order by changedate desc) AS rn FROM [SDH].[SDH].[dbo].[issue_bond_circulations] WHERE amount IS NOT NULL AND amount <> 0	
		) AS ibc ON (ib.rid = ibc.bondid AND ibc.rn = 1) 
	--	LEFT JOIN [SDH].[SDH].[dbo].[issue_bond_organizers] AS ibo ON (ib.rid = ibo.bondid)
		--	[SDH].[SDH].[dbo].[issue_bond_circulations] AS ibc ON (ib.rid = ibc.bondid)









GO
/****** Object:  View [dbo].[SDH_Stocks]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[SDH_Stocks]
AS
	SELECT
		iss.rid,							--	Id выпуска 
		iss.emitents_id,					--	Id эмитента
		iss.number_of_emission,			--	Номер выпуска
		iss.state_reg_number,			--	ГРН
		NULL AS redemptiondate,			--	Дата погашения выпуска
		iss.announced_volume,			--	Количество бумаг в выпуске, шт.
		0 AS vol_circulations,	--	Объем выпуска в обращении (в валюте номинала)
		lsk.shortname AS subtype,		--	Подвид акции
		NULL AS date_of_end_placing,	--	Дата окончания размещения
		NULL AS date_of_start_placing,	--	Дата начала размещения
		ec.ticker,						--	Тикер на бирже
		ei.tickerid,					--	Id тикера на бирже
		ei.begdate,						--	Дата начала обращения на бирже
		ei.enddate,						--	Дата завершения обращения на бирже
		tts.tender_days_ago,			--	Возраст последней признаваемой котировки
		tts.admittedquote,				--	Последняя признаваемая котировка
		sstb.[shortname]	AS sec_type_br,	--	Классификация бумаги по мнению ЦБ РФ
		iss.[for_qual_investors]			--	Для квал инвесторов
	--	iso.[contrid_dmart] AS organizerid	--	id организатора выпуска
	FROM [SDH].[SDH].[dbo].[issue_stocks] AS iss
		LEFT JOIN [SDH].[SDH].[dbo].[spr_stock_kinds] AS ssk ON (iss.kind_id = ssk.code)
		LEFT JOIN [SDH].[SDH].[dbo].[spr_sec_types_br] AS sstb ON (iss.sec_type_br = sstb.code)
		LEFT JOIN [SDH].[SDH].[dbo].[lstStockKinds] AS lsk ON (ssk.kind = lsk.code) 
		LEFT JOIN (
						SELECT	stockid,
								tickerid,
								begdate,
								enddate,
								ROW_NUMBER() over(partition by stockid order by begdate desc) AS rn
						FROM   [SDH].[SDH].[dbo].[exchange_issues] WHERE contrid = '6CCF6D58-7F71-4650-8693-925B17B09462'
																AND (begdate <> enddate or enddate is null)
					) ei ON (iss.rid = ei.stockid AND ei.rn = 1)
		LEFT JOIN (
						SELECT admittedquote,
							   tickerid,
							   datediff(d, tenderdate, getdate()) as tender_days_ago,
							   row_number() over(partition by tickerid order by tenderdate desc, agreement_number desc) as rn
						FROM   [SDH].[SDH].[dbo].[tender_total_stocks]
						WHERE  admittedquote IS NOT NULL AND datediff(d, tenderdate, getdate()) <= 90
					) AS tts ON tts.tickerid = ei.tickerid AND tts.rn = 1
		LEFT JOIN [SDH].[SDH].[dbo].[exchange_codes] AS ec ON (ei.tickerid = ec.rid)
		--LEFT JOIN [SDH].[SDH].[dbo].[issue_stock_organizers] AS iso ON (iss.rid = iso.stockid)
/*		LEFT JOIN (
			SELECT *, ROW_NUMBER() over (partition by stockid order by changedate) AS rn FROM [SDH].[SDH].[dbo].[issue_stock_circulations]	
		) AS isc ON (iss.rid = isc.stockid AND isc.rn = 1) */












GO
/****** Object:  View [dbo].[SDH_Month_Avg]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SDH_Month_Avg]
AS

	SELECT     tt_avg.tickerid, tt_avg.volume_avg, ec.ticker, CASE WHEN ec.for_obj = 2 THEN ec.stockid ELSE ec.bondid END AS objectid
	FROM         (SELECT     tickerid, SUM(volume_currency) / 3 AS volume_avg
						   FROM          [SDH].SDH.dbo.tender_total_stocks AS tender_total_stocks_1
						   WHERE      (tenderdate < GETDATE()) AND (tenderdate >= DATEADD(m, - 3, GETDATE())) AND (contrid = '6CCF6D58-7F71-4650-8693-925B17B09462')
						   GROUP BY tickerid) AS tt_avg LEFT OUTER JOIN
						  [SDH].SDH.dbo.exchange_codes AS ec ON tt_avg.tickerid = ec.rid
	UNION
	SELECT     tt_avg.tickerid, tt_avg.volume_avg, ec.ticker, CASE WHEN ec.for_obj = 2 THEN ec.stockid ELSE ec.bondid END AS objectid
	FROM         (SELECT     tickerid, SUM(volume_currency) / 3 AS volume_avg
						   FROM          [SDH].SDH.dbo.tender_total_bonds AS tender_total_stocks_1
						   WHERE      (tenderdate < GETDATE()) AND (tenderdate >= DATEADD(m, - 3, GETDATE())) AND (contrid = '6CCF6D58-7F71-4650-8693-925B17B09462')
						   GROUP BY tickerid) AS tt_avg LEFT OUTER JOIN
						  [SDH].SDH.dbo.exchange_codes AS ec ON tt_avg.tickerid = ec.rid



GO
/****** Object:  View [dbo].[SDH_Funds]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[SDH_Funds]
AS

	SELECT  uf.rid,
		    uf.ukid AS emitents_id,
		    '0' AS number_of_emission,
		    uf.reg_number AS state_reg_number,
			NULL AS redemptiondate,			--	Дата погашения выпуска
			0 AS announced_volume,			--	Количество бумаг в выпуске, шт.
			0 AS vol_circulations,			--	Объем в обращении
			uft.name as subtype,			--	Подвид ПИФ
			NULL AS date_of_end_placing,	--	Дата окончания размещения
			NULL AS date_of_start_placing,	--	Дата начала размещения
			uf.isin AS ticker,				--	Тикер на бирже
			uf.rid AS	tickerid,				--	Id тикера на бирже
			uf.regdate AS begdate,			--  Дата начала обращения на бирже
			NULL AS enddate,				--	Дата завершения обращения на бирже
			0 AS tender_days_ago,			--	Возраст последней признаваемой котировки
			0 AS admittedquote,				--	Последняя признаваемая котировка
			sstb.[shortname]	AS sec_type_br, 	--	Классификация бумаги по мнению ЦБ РФ
			uf.[for_qual_investors]			--	Для квал инвесторов
		--	ufo.[contrid_dmart] AS organizerid	--	id организатора выпуска
	FROM [SDH].[SDH].dbo.unit_funds  AS uf
		   INNER JOIN [SDH].[SDH].dbo.lstUnitFundTypes AS uft ON  uf.ftype = uft.code
		   LEFT JOIN [SDH].[SDH].[dbo].[spr_sec_types_br] AS sstb ON (uf.sec_type_br = sstb.code)
		--   LEFT JOIN [SDH].[SDH].[dbo].[unit_fund_organizers] AS ufo ON (uf.rid = ufo.fundid)






GO
/****** Object:  View [dbo].[SDH_Tools]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[SDH_Tools]
AS

	SELECT t.*, ma.volume_avg 
	FROM
	(
		SELECT [rid]
			  ,[emitents_id]
			  ,[number_of_emission]
			  ,[state_reg_number]
			  ,[redemptiondate]
			  ,[amount] AS [announced_volume]
			  ,[vol_circulations]
			  ,'облигация' AS [type]
			  ,[subtype]
			  ,[date_of_end_placing]
			  ,[date_of_start_placing]
			  ,[ticker]
			  ,[tickerid]
			  ,[begdate]
			  ,[enddate]
			  ,[tender_days_ago]
			  ,[admittedquote]
			  ,[sec_type_br]
			  ,[for_qual_investors]
			  ,[is_subordinated]
		  FROM [SDH_Bonds]
		UNION ALL
		SELECT [rid]
			  ,[emitents_id]
			  ,[number_of_emission]
			  ,[state_reg_number]
			  ,[redemptiondate]
			  ,[announced_volume]
			  ,[vol_circulations]
			  ,'акция' AS [type]
			  ,[subtype]
			  ,[date_of_end_placing]
			  ,[date_of_start_placing]
			  ,[ticker]
			  ,[tickerid]
			  ,[begdate]
			  ,[enddate]
			  ,[tender_days_ago]
			  ,[admittedquote]
			  ,[sec_type_br]
			  ,[for_qual_investors]
			  ,0 AS is_subordinated
		  FROM [SDH_Stocks]
		  UNION ALL
		  SELECT [rid]
			  ,[emitents_id]
			  ,[number_of_emission]
			  ,[state_reg_number]
			  ,[redemptiondate]
			  ,[announced_volume]
			  ,[vol_circulations]
			  ,'пиф' AS [type]
			  ,[subtype]
			  ,[date_of_end_placing]
			  ,[date_of_start_placing]
			  ,[ticker]
			  ,[tickerid]
			  ,[begdate]
			  ,[enddate]
			  ,[tender_days_ago]
			  ,[admittedquote]
			  ,[sec_type_br]
			  ,[for_qual_investors]
			  ,0 AS is_subordinated
		  FROM [SDH_Funds]
	  ) AS t
	  LEFT JOIN [SDH_Month_Avg] AS ma ON (t.tickerid = ma.tickerid)



GO
/****** Object:  View [dbo].[SDH_Capitalization]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[SDH_Capitalization]
AS
	SELECT s.[rid]
		  ,s.[emitents_id]
		  ,s.[announced_volume]
		  ,isc.[amount_units]
		--  ,isp.[percents]
		  ,s.[ticker]
		  ,s.[tickerid]
		  ,tts.marketprice3		  
		  , ISNULL(isc.[amount_units], 0) * ISNULL(tts.marketprice3, 0) AS capitalization
	  FROM [dbo].[SDH_Stocks] AS s 
		LEFT JOIN
			(
				SELECT stockid, amount_units, ROW_NUMBER() OVER(PARTITION BY [stockid] ORDER BY [changedate] desc) AS rn 
				FROM  [SDH].[SDH].[dbo].[issue_stock_circulations]
			) AS isc ON isc.rn = 1 AND isc.stockid = s.[rid]
	/*	LEFT JOIN 
			(
				SELECT [stockid], [percents], ROW_NUMBER() OVER(PARTITION BY [stockid] ORDER BY [changedate] desc) AS rn
				  FROM [SDH].[SDH].[dbo].[issue_stock_percents]
			) AS isp ON isp.rn = 1 AND isp.stockid = s.[rid]	*/
		LEFT JOIN 
			(
				SELECT marketprice3, tickerid, row_number() over(partition by tickerid order by tenderdate desc, agreement_number desc) as rn
							FROM   [SDH].[SDH].[dbo].[tender_total_stocks]
							WHERE  marketprice3 IS NOT NULL AND marketprice3 > 0 
			) AS tts ON tts.rn = 1 AND tts.tickerid = s.tickerid
	  WHERE s.[subtype] = 'АО' AND s.[ticker] IS NOT NULL


GO
/****** Object:  View [dbo].[CL_Query_10125]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[CL_Query_10125] AS

	SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], MarketValue AS SumMarketValue, [Percent] AS SumPercent
		, '100 %' AS [Limit]
		, CASE WHEN (ft.[Percent] < ISNULL(rl1.LimitValue, 0)) OR (ft.[Percent] < ISNULL(rl2.LimitValue, 0) OR (ft.[Percent] < ISNULL(rl3.LimitValue, 0)) OR (ft.[Percent] < ISNULL(rl4.LimitValue, 0))) THEN 0 ELSE 101 END
			 AS LimitValue
		--, rl1.LimitValue as l1, rl2.LimitValue as l2, rl3.LimitValue as l3
	FROM [FactTable] as ft LEFT JOIN [RestrictList] AS rl1 
		ON (ft.[ClientCode] = rl1.[ClientId] AND (rl1.[Type] = 'I' AND ft.ID_CB_SDH = rl1.rid) AND (rl1.LimitValue >= 100))
							LEFT JOIN  [RestrictList] AS rl2 
		ON (ft.[ClientCode] = rl2.[ClientId] AND (rl2.[Type] = 'D' AND ft.[contrid] = rl2.rid) AND (rl2.LimitValue >= 100) AND (ft.InstrumentType IN ('облигация', 'депозит', 'дс', 'МНО')))
							LEFT JOIN  [RestrictList] AS rl3 
		ON (ft.[ClientCode] = rl3.[ClientId] AND (rl3.[Type] = 'B' AND ft.[contrid] = rl3.rid) AND (rl3.LimitValue >= 100) AND (ft.InstrumentType IN ('облигация')))
							LEFT JOIN  [RestrictList] AS rl4 
		ON (ft.[ClientCode] = rl4.[ClientId] AND (rl4.[Type] = 'C' AND ft.[contrid] = rl4.rid) AND (rl4.LimitValue >= 100))

	WHERE ft.InstrumentType NOT IN ('бс') AND ft.MarketValue > 0


GO
/****** Object:  View [dbo].[CL_Limit_10125]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10125] AS SELECT * FROM CL_Query_10125
GO
/****** Object:  View [dbo].[CL_Query_10126]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[CL_Query_10126] AS

SELECT r.[КодКлиента] AS [ClientCode]
     -- ,[Инструмент]
      ,r.[НаименованиеИнструмента] AS [Instrument]
      ,r.[Дата первой части сделки] AS [DateRepo1]
      ,r.[СрокРепо] AS [RepoPeriod]
      ,r.[Направление первой части] AS [BuySell]
      ,r.[Количество] AS [Quantity]
      ,r.[Цена первой части] AS [Price1]
      ,r.[Цена второй части] AS [Price2]
	  ,0 AS SumMarketValue, 0 AS SumPercent
    --  ,[ID_CB_CXPI]
    --  ,[ID_Emit_CXPI]
	  , CASE WHEN ( ([СрокРепо] > 30) OR 
					([Направление первой части] = 'Покупка' AND 
								(t.[type] = 'акция' AND [Цена первой части] > [Цена второй части]) OR
								(t.[type] = 'облигация' AND [Цена второй части] > [Цена первой части] * 1.008)					
					)
					OR
					([Направление первой части] = 'Продажа' AND [Цена первой части] < [Цена второй части]) 
					--([Направление первой части] = 'Покупка' AND [Цена первой части] > [Цена второй части]) OR 
					--([Направление первой части] = 'Продажа' AND [Цена первой части] < [Цена второй части]) 					
				) THEN 101 
			ELSE 0 END AS LimitValue
  FROM [REPODeals] AS r LEFT JOIN Cache_Tools AS t ON (r.[ID_CB_CXPI] = t.rid)


GO
/****** Object:  View [dbo].[CL_Limit_10126]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10126] AS SELECT * FROM CL_Query_10126
GO
/****** Object:  View [dbo].[SDH_RTSICompose]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SDH_RTSICompose]
AS

	SELECT [num]
		  ,[name]
		  ,[ticker]
	FROM [SDH].[SDH].[dbo].[CalcBasisData]
	WHERE [calcbasisid] = (
								SELECT t.rid FROM
								(
									SELECT [rid], ROW_NUMBER() OVER (PARTITION BY [basisid] ORDER BY [setdate] desc) AS rn
									FROM [SDH].[SDH].[dbo].[CalcBases]
									WHERE [readyState] = 1 AND [basisid] = (SELECT [rid] FROM [SDH].[SDH].[dbo].[IndexBases] WHERE name = 'RTSI')
								) AS t WHERE t.rn = 1
							)
GO
/****** Object:  View [dbo].[AU_ListWithParams]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[AU_ListWithParams]
AS

SELECT aul.[contrid]
      ,aul.[Type]
	  ,c.[name]
	  ,aul.InnerName AS InnerName
	  ,ISNULL(fr.M_Rating, ' - ') + ' / ' + ISNULL(fr.SP_Rating, ' - ') + ' / ' + ISNULL(fr.F_Rating, ' - ') + ' / ' + 
		ISNULL(fr.E_Rating, ' - ') + ' / ' + ISNULL(fr.A_Rating, ' - ') AS [Rating]
      ,[Own_Rating]
      ,[Own_Comment]
	  ,t.qsheet
	  , CASE WHEN ind.num IS NOT NULL THEN '+' ELSE '-' END AS [InIndex]
	  ,aul.[Remark]
  FROM [AU_List] AS aul LEFT JOIN Cache_Contragents AS c ON (c.rid = aul.contrid)
						LEFT JOIN [Cache_Full_Ratings] AS fr ON (c.rid = fr.ObjectId AND fr.for_obj = 1)
						LEFT JOIN [Cache_Tools] AS t ON (c.rid = t.[emitents_id] AND aul.[Type] IN ('АП', 'АО') AND aul.[Type] = t.subtype AND t.ticker IS NOT NULL and t.enddate IS NULL)
						LEFT JOIN [SDH_RTSICompose] AS ind ON (t.ticker = ind.ticker)

GO
/****** Object:  View [dbo].[AU_ListBonds]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[AU_ListBonds]
AS

	SELECT --[contrid]
		  --
		  [InnerName] AS [name]
		  ,[Rating]
		  ,[Type]
		  ,[Own_Rating]
		  ,[Own_Comment]
		--  ,[qsheet]
		--  ,[InIndex]
		  ,[Remark]
		  ,SO.[order]
	FROM [AU_ListWithParams] AS LWP LEFT JOIN [AU_SubtypeOrder] AS SO ON (LWP.[Type] = SO.[subtype])
	WHERE [Type] NOT IN ('АО', 'АП')

GO
/****** Object:  View [dbo].[AU_ListStocks]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[AU_ListStocks]
AS

	SELECT --[contrid]
		  --
		  [InnerName] AS [name]
		  ,[Rating]
		  ,'Акция' AS [Type]
		--  ,[Own_Rating]
		--  ,[Own_Comment]
		  ,ISNULL(REPLACE(REPLACE(REPLACE([qsheet],'1','I'),'2','II'),'3','III'),'') AS [qsheet]
		  ,[InIndex]
		--  ,[Remark]
	FROM [AU_ListWithParams]
	WHERE [Type] IN ('АО', 'АП')

GO
/****** Object:  View [dbo].[INF_ClientsInfo_Simple]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[INF_ClientsInfo_Simple]
AS

	SELECT a.КодКлиента, a.СчетКлиента, a.Группа, a.НаДату, a.СуммаАктива FROM
		(SELECT		c.КодКлиента, c.СчетКлиента, c.Группа, ca.НаДату, ca.СуммаАктива  --tmp_1.[ПоследняяДата], t1.СуммаАктива
					, ROW_NUMBER() OVER (partition by c.КодКлиента order by ca.НаДату desc) as rownum
		FROM		[CO1-VT-FO1].Informer.dbo.Clients AS c 
					LEFT JOIN [CO1-VT-FO1].Informer.dbo.ClientsActiv AS ca WITH (nolock) ON c.КодКлиента = ca.КодКлиента
		) as a
	WHERE a.rownum = 1


GO
/****** Object:  View [dbo].[INF_ClientsInfo]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[INF_ClientsInfo]
AS
	SELECT КодКлиента, СчетКлиента, Группа, НаДату, СуммаАктива FROM [INF_ClientsInfo_Simple] 
	UNION
	SELECT t.SintId AS КодКлиента, c.Account AS СчетКлиента, 'Синтетический' AS Группа, t.НаДату, t.СуммаАктива FROM
	(	SELECT sc.[SintId]
		  ,MIN(ci.НаДату) AS [НаДату]
		  ,SUM(ci.СуммаАктива) AS [СуммаАктива]
		FROM [SintClient_Content] AS sc LEFT JOIN [INF_ClientsInfo_Simple] AS ci ON (sc.[ClientId] = ci.КодКлиента)
		GROUP BY sc.[SintId]
	) AS t LEFT JOIN SintClient AS c ON (t.SintId = c.Id)
/*
	SELECT a.КодКлиента, a.СчетКлиента, a.Группа, a.НаДату, a.СуммаАктива FROM
		(SELECT		c.КодКлиента, c.СчетКлиента, c.Группа, ca.НаДату, ca.СуммаАктива  --tmp_1.[ПоследняяДата], t1.СуммаАктива
					, ROW_NUMBER() OVER (partition by c.КодКлиента order by ca.НаДату desc) as rownum
		FROM		[V-P-INF1].Informer.dbo.Clients AS c 
					LEFT JOIN [V-P-INF1].Informer.dbo.ClientsActiv AS ca WITH (nolock) ON c.КодКлиента = ca.КодКлиента
		) as a
	WHERE a.rownum = 1
*/
GO
/****** Object:  View [dbo].[FT_tmp]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[FT_tmp]
AS

	SELECT	cp.ClientCode AS ClientCode,
			ci.[СчетКлиента] AS ClientAccount,
			ci.[СуммаАктива] AS SummAsset,
			cp.CB AS Instrument,
			cp.Quantity AS Quantity,
			cp.MarketValue AS MarketValue,
			CASE WHEN ci.[СуммаАктива] > 0 AND ci.[СуммаАктива] IS NOT NULL THEN cp.MarketValue / ci.[СуммаАктива] * 100 ELSE 0 END AS [Percent],
			cc.name AS Issuer,
			cp.CB_Name AS InstrumentName,
			ISNULL(ct.[type], cp.[Type]) AS InstrumentType,
			ISNULL(ct.[subtype], '') AS InstrumentSubtype,
			ISNULL(ct.SecTypeBr, '') AS SecTypeBr,
			cc.country_name AS Country,
			ISNULL(ct.qsheet, '') AS QuoteSheet,
			cc.own_type_name AS OwnType,
			cc.bonds_issue_sum AS BondsIssueSumm,
			CASE WHEN cp.ID_CB_SDH IS NULL THEN 0 /*cp.MarketValue*/ ELSE ct.admittedquote END AS QuoteSDH,
			CASE WHEN cp.ID_CB_SDH IS NULL THEN 0 ELSE ct.tender_days_ago END AS QuoteSDHAgo,
			ISNULL(ct.vol_circulations, 0) AS VolCirculation,
			cp.ID_Emit_SDH AS contrid,
			NULL AS Capitalization,
			ct.redemptiondate AS RedemptionDate,
			ISNULL(ct.rid, convert(uniqueidentifier, N'00000000-0000-0000-0000-000000000000')) AS SecurityId,
			ISNULL(ct.number_of_emission, 0) AS IssueNum,
			CASE WHEN ct.[type] = 'облигация' THEN ct.announced_volume ELSE NULL END AS AnnouncedVol,
			ct.date_of_start_placing AS DateStartPlacing,
			ct.date_of_end_placing AS DateEndPlacing,
			cp.CurrencyID AS Currency,
			cp.CB_Code,
			cp.ID_CB_SDH,
			ISNULL(ct.state_reg_number, cp.RegCode) AS StateRegNum,
			ISNULL(ct.volume_avg, 0) AS MonthAvgVol,
			cfri.F_Rating,
			cfri.M_Rating,
			cfri.SP_Rating,
			cfri.E_Rating,
			cfri.A_Rating,
			cfrc.F_Rating AS Contr_F_Rating,
			cfrc.M_Rating AS Contr_M_Rating,
			cfrc.SP_Rating AS Contr_SP_Rating,
			cfrc.E_Rating AS Contr_E_Rating,
			cfrc.A_Rating AS Contr_A_Rating,
			ct.enddate AS enddate,
			cc.is_bank AS is_bank,	
			ct.[for_qual_investors]	AS for_qual_investors,
			cfri.NKR_Rating,
			cfri.NRA_Rating,
			cfrc.NKR_Rating AS Contr_NKR_Rating,
			cfrc.NRA_Rating AS Contr_NRA_Rating,
			CASE WHEN ct.[type] = 'облигация' THEN ct.is_subordinated ELSE cp.IsSubordinated END AS IsSubordinated
	FROM [Cache_CurrentPortfolio] AS cp LEFT JOIN [INF_ClientsInfo] AS ci ON (cp.ClientCode = ci.[КодКлиента])
			LEFT JOIN [Cache_Contragents] AS cc ON (cp.ID_Emit_SDH = cc.rid) LEFT JOIN [Cache_Tools] AS ct ON (cp.ID_CB_SDH = ct.rid)
			LEFT JOIN [Cache_Full_Ratings] AS cfrc ON (cfrc.for_obj = 1 AND cfrc.ObjectId = cp.ID_Emit_SDH)
			LEFT JOIN [Cache_Full_Ratings] AS cfri ON (cfri.for_obj = 2 AND cfri.ObjectId = cp.ID_CB_SDH)



GO
/****** Object:  View [dbo].[CL_Query_10174]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[CL_Query_10174]
AS
	SELECT rl.КодКлиента AS ClientCode, rl.СуммаАктива AS SummAsset, rl.SumREPO AS SummREPO,
			CASE WHEN ISNULL(rl.СуммаАктива, 0) > 0 THEN 100 * rl.SumREPO / ISNULL(rl.СуммаАктива, 0) ELSE 101 END AS PercentREPO,
			CASE WHEN ISNULL(rl.СуммаАктива, 0) > 0 THEN 100 * rl.SumREPO / ISNULL(rl.СуммаАктива, 0) ELSE 101 END AS LimitValue
	FROM
	(
		SELECT t.[КодКлиента], ci.СуммаАктива, SUM(t.[Value]) AS SumREPO FROM
		(
			SELECT rd.[КодКлиента]
				  , rd.[Количество] * rd.[Цена первой части] *  CASE ct.[type] WHEN 'облигация' THEN ISNULL([nominal], 1000) / 100 ELSE 1 END AS [Value]
			  FROM [REPODeals] AS rd LEFT JOIN [Cache_Tools] as ct ON (rd.[ID_CB_CXPI] = ct.[rid])
			  WHERE rd.[Направление первой части] = 'Покупка'
		  ) AS t LEFT JOIN [INF_ClientsInfo] AS ci ON (t.КодКлиента = ci.КодКлиента)
		  GROUP BY t.КодКлиента, ci.СуммаАктива
	) AS rl
GO
/****** Object:  View [dbo].[CL_Limit_10174]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10174] AS SELECT * FROM CL_Query_10174
GO
/****** Object:  View [dbo].[_CL_Clients_2]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[_CL_Clients_2]
AS
	select * from (
		SELECT CAST(КодКлиента as int) as КодКлиента, НаименованиеКлиента, '(' + CAST(КодКлиента as varchar) + ') ' + НаименованиеКлиента AS ПолноеНаименование
		FROM         [CO1-VT-FO1].Informer.dbo.Clients
		WHERE КодКлиента > 0 AND КодКлиента IS NOT NULL AND НаименованиеКлиента NOT LIKE 'LID%'
		UNION
		SELECT 1000000 + [FondId] AS КодКлиента, '[ФОНД] ' + [Name] AS НаименованиеКлиента, 
			'(' + CAST(1000000 + [FondId] as varchar) + ') [ФОНД] ' + [Name] AS ПолноеНаименование FROM [BACK_Fonds]
		UNION
		SELECT Id AS КодКлиента, '[Синтетический] ' + [Name] AS НаименованиеКлиента, '[Синтетический] ' + [Name] AS ПолноеНаименование FROM [SintClient]
	) t
	where t.[КодКлиента] in ( SELECT [ClientId] FROM [ClientsFilter] WHERE [ShowInCL] = 1)


GO
/****** Object:  View [dbo].[Group_Ierarchy]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Group_Ierarchy]
AS
	SELECT  cl.НаименованиеКлиента
		 ,rl.ClientId
		 ,rl.rid
		 ,g.GroupName
		 ,rl.LimitValue
		 ,gc.contrid
		 ,ft.Issuer
		 ,ft.InstrumentType
		 ,ft.InstrumentName
		 ,ft.[Percent]
	  FROM RestrictList AS rl INNER JOIN  _CL_Clients_2 AS cl ON (rl.ClientId = cl.КодКлиента)
			LEFT JOIN CL_Groups AS g ON (rl.rid = g.Rid AND rl.Type = 'X') LEFT JOIN CL_GroupsContent AS gc ON (gc.GroupId = g.Id)
			INNER JOIN FactTable AS ft ON (rl.ClientId = ft.ClientCode AND gc.contrid = ft.contrid)
	WHERE ft.InstrumentType IN ('акция','облигация')
GO
/****** Object:  View [dbo].[CL_Query_10185]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[CL_Query_10185]
AS
	SELECT ft.[ClientCode], ft.[ClientAccount], ft.SummAsset, ft.Issuer, ft.SumValue, cc.cap AS Capitalization, 100 * ft.SumValue / cc.cap AS CapPercent, 100 * ft.SumValue / cc.cap AS LimitValue FROM
	(
		SELECT [ClientCode]
			  ,[ClientAccount]
			  ,[SummAsset]
			  ,[Issuer]
			  ,[contrid]
			  ,SUM([MarketValue]) AS SumValue
		FROM [dbo].[FactTable]
		WHERE InstrumentType = 'акция' AND IsInIndex <> 0
		GROUP BY [ClientCode],[ClientAccount],[SummAsset],[Issuer],[contrid]
	) AS ft
	LEFT JOIN
	  (SELECT [emitents_id], SUM([capitalization]) as cap FROM [SDH_Capitalization] GROUP BY [emitents_id]) AS cc
	  ON (ft.[contrid] = cc.emitents_id)
	WHERE cc.cap IS NOT NULL AND cc.cap > 0 

GO
/****** Object:  View [dbo].[CL_Query_10086]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[CL_Query_10086] AS

	SELECT f.[ClientCode], f.[ClientAccount], f.[SummAsset], f.[InstrumentName], f.[Issuer], f.[InstrumentType]
		  ,f.[Quantity], f.MarketValue AS SumMarketValue, f.[Percent] AS SumPercent
		  ,ISNULL(h.[Quantity], 0) AS [3DaysAgo]
		,f.[QuoteSheet]
		,CASE WHEN f.[Quantity] > ISNULL(h.[Quantity], 0) THEN 1 ELSE 0 END AS LimitValue
	FROM dbo.FactTable AS f
		LEFT JOIN
		(SELECT * FROM [LC3_History].[dbo].[FactTable_History]
			WHERE [Arch_date] = (SELECT MAX([Arch_date]) FROM [LC3_History].[dbo].[FactTable_History] WHERE [Arch_date] < DATEADD(d, -3, GETDATE()))
		) AS h ON (f.[ClientCode] = h.[ClientCode] AND f.[CB_Code] = h.[CB_Code])
	WHERE f.[QuoteSheet] in ('Третий уровень листинга', '3')



GO
/****** Object:  View [dbo].[CL_Limit_10086]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10086] AS SELECT * FROM CL_Query_10086
GO
/****** Object:  View [dbo].[CL_Limit_10185]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10185] AS SELECT * FROM CL_Query_10185
GO
/****** Object:  View [dbo].[CL_Query_10194]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CL_Query_10194]
AS
SELECT t.ClientCode, t.ClientAccount, t.SummAsset, t.SumMarketValue AS MarketValue, t.SumPercent AS [Percent], t.SumPercent AS [LimitValue]
FROM
(
	SELECT [ClientCode], [ClientAccount], [SummAsset], 
		SUM(MarketValue * CASE WHEN InstrumentType = 'МНО' THEN -1 ELSE 1 END) As SumMarketValue, SUM([Percent] * CASE WHEN InstrumentType = 'МНО' THEN -1 ELSE 1 END) As SumPercent
	FROM [FactTable] as ft
	WHERE InstrumentType IN ('дс', 'бс', 'МНО')
	GROUP BY [ClientCode], [ClientAccount], [SummAsset]
) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10194]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10194] AS SELECT * FROM CL_Query_10194
GO
/****** Object:  View [dbo].[CL_Query_10195]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[CL_Query_10195]
AS

	SELECT [КодКлиента] AS ClientCode, [НомерСделки] AS DealNum, [ВремяСделки] AS DealTime, [Инструмент] AS Instrument, [НаименованиеИнструмента] AS InstrumentName, 101 AS LimitValue
	FROM Cache_TodayDeals
		WHERE [Операция] = 'Продажа'

GO
/****** Object:  View [dbo].[CL_Limit_10195]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10195] AS SELECT * FROM CL_Query_10195
GO
/****** Object:  View [dbo].[CL_Limit_10198]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10198] AS SELECT * FROM CL_Query_10198
GO
/****** Object:  View [dbo].[CL_Query_10084]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[CL_Query_10084] AS
	SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [Issuer], [IssueNum],  MarketValue AS SumMarketValue, [Percent] AS SumPercent,
       case 
            when [QuoteSheet] in ('Третий уровень листинга', '3') then 1
            else 0
       end           as LimitValue
	FROM dbo.FactTable WHERE contrid IN (SELECT [rid] FROM [_CL_GroupContent] WHERE [GroupId] = 30)




GO
/****** Object:  View [dbo].[CL_Query_10085]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[CL_Query_10085] AS
	SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [Issuer], [IssueNum],  MarketValue AS SumMarketValue, [Percent] AS SumPercent,
       case 
            when [QuoteSheet] in ('Третий уровень листинга', '3') then 1
            else 0
       end           as LimitValue
	FROM dbo.FactTable WHERE contrid IN (SELECT [rid] FROM [_CL_GroupContent] WHERE [GroupId] = 39)


GO
/****** Object:  View [dbo].[_CL_GroupsWithSub]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[_CL_GroupsWithSub]	
AS
	SELECT g.Rid, gc.contrid, g.GroupName, CONVERT(nvarchar, g.Id) AS Id
	FROM
	(
		SELECT t.GroupId, t.contrid, ROW_NUMBER() OVER (PARTITION BY t.GroupId, t.contrid ORDER BY t.GroupId) AS rn
		FROM
		(
			SELECT [GroupId],[contrid] FROM [CL_GroupsContent]
			UNION
			SELECT sg.ParentId AS GroupId,gc.contrid 
				FROM [CL_SubGroup] AS sg LEFT JOIN [CL_GroupsContent] AS gc ON (sg.ChildId = gc.GroupId)
		) AS t
	) AS gc
	INNER JOIN CL_Groups AS g ON (gc.GroupId = g.Id)
	WHERE gc.rn = 1
GO
/****** Object:  View [dbo].[CL_Limit_10159]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10159] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'бс')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('85')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10160]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10160] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф')) AND ([QuoteSheet] IN ('3')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('86')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10161]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10161] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'индекс' ,'бс')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('87')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10162]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10162] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'индекс' ,'бс')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('88')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10163]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10163] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'индекс' ,'бс')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('89')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10164]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10164] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'индекс' ,'бс')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('90')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Query_10101]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[CL_Query_10101] AS

	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], fts.GroupName, fts.[SumMarketValue], fts.[SumPercent]
		  , CONVERT(varchar, CONVERT(decimal, rl.LimitValue)) + CASE rl.[LimitType] WHEN 'P' THEN ' %' ELSE '' END AS [Limit]
		  , CASE rl.[LimitType]
				WHEN 'P' THEN CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 100 * fts.[SumPercent] / ISNULL(rl.LimitValue, 0) ELSE 101 END
				WHEN 'A' THEN CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 100 * fts.[SumMarketValue] / ISNULL(rl.LimitValue, 0) ELSE 101 END  
				ELSE 101
		  END  AS LimitValue
	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], cg.Rid, cg.GroupName,-- ft.[Issuer], ft.[contrid], 
					SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft INNER JOIN [_CL_GroupsWithSub] AS cg ON (ft.contrid = cg.[contrid])
			WHERE ft.InstrumentType IN ('акция', 'облигация', 'пиф')
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], /*ft.[Issuer], ft.[contrid], */ cg.Rid, cg.GroupName
	) AS fts
	INNER JOIN [RestrictList] AS rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] IN ('X')) AND (rl.rid = fts.Rid)





GO
/****** Object:  View [dbo].[CL_Query_10075]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[CL_Query_10075] AS

	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], fts.GroupName, fts.[SumMarketValue], fts.[SumPercent]
		  , CONVERT(varchar, CONVERT(decimal, rl.LimitValue)) + CASE rl.[LimitType] WHEN 'P' THEN ' %' ELSE '' END AS [Limit]
		  , CASE rl.[LimitType]
				WHEN 'P' THEN CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 100 * fts.[SumPercent] / ISNULL(rl.LimitValue, 0) ELSE 101 END
				WHEN 'A' THEN CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 100 * fts.[SumMarketValue] / ISNULL(rl.LimitValue, 0) ELSE 101 END  
				ELSE 101
		  END  AS LimitValue
	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], cg.Rid, cg.GroupName,-- ft.[Issuer], ft.[contrid], 
					SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft INNER JOIN [_CL_GroupsWithSub] AS cg ON (ft.contrid = cg.[contrid])
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], /*ft.[Issuer], ft.[contrid], */ cg.Rid, cg.GroupName
	) AS fts
	INNER JOIN [RestrictList] AS rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] IN ('A')) AND (rl.rid = fts.Rid)





GO
/****** Object:  View [dbo].[CL_Query_10074]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[CL_Query_10074] AS

	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], fts.GroupName, fts.[SumMarketValue], fts.[SumPercent]
		  , CONVERT(varchar, CONVERT(decimal, rl.LimitValue)) + CASE rl.[LimitType] WHEN 'P' THEN ' %' ELSE '' END AS [Limit]
		  , CASE rl.[LimitType]
				WHEN 'P' THEN CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 100 * fts.[SumPercent] / ISNULL(rl.LimitValue, 0) ELSE 101 END
				WHEN 'A' THEN CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 100 * fts.[SumMarketValue] / ISNULL(rl.LimitValue, 0) ELSE 101 END  
				ELSE 101
		  END  AS LimitValue
	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], cg.Rid, cg.GroupName, ft.[Issuer], ft.[contrid], 
					SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft INNER JOIN [_CL_GroupsWithSub] AS cg ON (ft.contrid = cg.[contrid])
			WHERE ft.[InstrumentType] IN ('облигация', 'Депозит') OR (ft.[InstrumentType] = 'дс' AND ft.[Instrument] = 'RUB')
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid], cg.Rid, cg.GroupName
	) AS fts
	INNER JOIN [RestrictList] AS rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] = 'H') AND (rl.rid = fts.Rid)




GO
/****** Object:  View [dbo].[CL_Limit_10154]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10154] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'бс')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('80')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10157]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10157] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'бс')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('81')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10189]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10189] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'бс')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('103')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10190]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10190] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('пиф')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('104')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10199]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10199] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'индекс' ,'бс' ,'МНО') OR [InstrumentType] IS NULL) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('109')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10191]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10191] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'индекс' ,'бс')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('105')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10193]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10193] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'индекс' ,'бс')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('106')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Query_10070]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[CL_Query_10070] AS

	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], fts.GroupName, fts.[SumMarketValue], fts.[SumPercent]
		  , CONVERT(varchar, CONVERT(decimal(18,2), rl.LimitValue)) + CASE rl.[LimitType] WHEN 'P' THEN ' %' ELSE '' END AS [Limit]
		  , CASE rl.[LimitType]
				WHEN 'P' THEN CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 100 * fts.[SumPercent] / ISNULL(rl.LimitValue, 0) ELSE 101 END
				WHEN 'A' THEN CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 100 * fts.[SumMarketValue] / ISNULL(rl.LimitValue, 0) ELSE 101 END  
				ELSE 101
		  END  AS LimitValue
	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], cg.Rid, cg.GroupName, /* ft.[Issuer], ft.[contrid], */
					SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft INNER JOIN [_CL_GroupsWithSub] AS cg ON (ft.contrid = cg.[contrid])
			WHERE ft.[InstrumentType] = 'облигация'
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset],/* ft.[Issuer], ft.[contrid],*/ cg.Rid, cg.GroupName
	) AS fts
	INNER JOIN [RestrictList] AS rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] IN ('G', 'H')) AND (rl.rid = fts.Rid)




GO
/****** Object:  View [dbo].[CL_Limit_10178]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10178] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentSubtype] NOT IN ('ГЦБ')) AND ([Contr_E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-') OR [Contr_E_Rating] IS NULL) AND ([Contr_A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)') OR [Contr_A_Rating] IS NULL) AND ([InstrumentType] IN ('облигация')) AND ([E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-') OR [E_Rating] IS NULL) AND ([A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)') OR [A_Rating] IS NULL) AND ([is_bank] IN ('1'))) OR (([contrid] NOT IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('108'))) AND ([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('ИО')) AND ([E_Rating] NOT IN ('ruAAA') OR [E_Rating] IS NULL) AND ([A_Rating] NOT IN ('AAA(RU)') OR [A_Rating] IS NULL) AND ([Contr_E_Rating] NOT IN ('ruAAA') OR [Contr_E_Rating] IS NULL) AND ([Contr_A_Rating] NOT IN ('AAA(RU)') OR [Contr_A_Rating] IS NULL)) OR (([Contr_NKR_Rating] NOT IN ('AA-.ru' ,'AAA.ru' ,'AA+.ru' ,'AA.ru' ,'A+.ru' ,'A.ru' ,'A-.ru' ,'BBB+.ru') OR [Contr_NKR_Rating] IS NULL) AND ([Contr_NRA_Rating] NOT IN ('AAA|ru|' ,'AA+|ru|' ,'AA|ru|' ,'AA-|ru|' ,'A+|ru|' ,'A|ru|' ,'A-|ru|' ,'BBB+|ru|') OR [Contr_NRA_Rating] IS NULL) AND ([IsSubordinated] NOT IN ('1')) AND ([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] NOT IN ('ГЦБ' ,'ИО')) AND ([E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-' ,'ruBBB+') OR [E_Rating] IS NULL) AND ([A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)' ,'BBB+(RU)') OR [A_Rating] IS NULL) AND ([Contr_E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-' ,'ruBBB+') OR [Contr_E_Rating] IS NULL) AND ([Contr_A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)' ,'BBB+(RU)') OR [Contr_A_Rating] IS NULL) AND ([is_bank] NOT IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10179]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10179] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([contrid] NOT IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('100'))) AND ([InstrumentType] IN ('акция')) AND ([IsInIndex] NOT IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10181]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10181] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('31'))) AND ([InstrumentType] IN ('акция' ,'облигация' ,'пиф'))) OR (([InstrumentType] IN ('акция' ,'облигация' ,'пиф')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('101')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10184]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10184] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция')) AND ([contrid] NOT IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('100')))) OR (([InstrumentType] IN ('облигация')) AND ([RedemptionDate] IS NULL)) OR (([InstrumentType] IN ('облигация')) AND ([IsSubordinated] IN ('1'))) OR (([InstrumentType] IN ('Депозит')) AND ([IsSubordinated] IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10186]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10186] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('102')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10188]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10188] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('31')))) OR (([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('32')))) OR (([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('101')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10165]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10165] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'индекс' ,'бс')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('91')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10166]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10166] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'индекс' ,'бс')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('92')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10169]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10169] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('95')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10173]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10173] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация' ,'Депозит' ,'дс' ,'бс')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('97')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10175]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10175] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('15')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10176]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10176] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'индекс' ,'бс')) AND ([contrid] IN (SELECT [contrid] FROM [_CL_GroupsWithSub] WHERE [Id] IN ('99')))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[_CL_URL_issues]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[_CL_URL_issues]
AS

	SELECT ct.[rid]
		  ,ct.[emitents_id]
		  ,ct.[ticker]
		  ,ct.[tickerid]
			,ec.shortname + ', (' + CASE WHEN ct.[ticker] IS NOT NULL THEN ct.[ticker] ELSE '' END
									 + CASE WHEN iss.[gosreg_corrected] IS NOT NULL THEN ', ' + iss.[gosreg_corrected] ELSE '' END
									 + CASE WHEN iss.[isin_corrected] IS NOT NULL THEN ', ' + iss.[isin_corrected] ELSE '' END
									 + ')' AS FullName 	  
	  FROM [Cache_Tools] AS ct
	  LEFT JOIN
  		(
			SELECT ec.rid, case for_obj when 1 then ec.bondid when 2 then ec.stockid when 3 then ec.fundid end as issueid, ec.ticker, ec.shortname, ec.contrid 
			FROM [SDH].SDH.dbo.exchange_codes AS ec 
			WHERE ec.contrid = '6CCF6D58-7F71-4650-8693-925B17B09462'
		) AS ec ON (ct.[rid] = ec.issueid)
		LEFT JOIN
		(
			SELECT rid, full_name, isin_corrected, gosreg_corrected FROM [SDH].SDH.dbo.issue_stocks
			UNION
			SELECT rid, full_name, isin_corrected, gosreg_corrected FROM [SDH].SDH.dbo.issue_bonds
		) AS iss ON (ec.issueid=iss.rid)
		WHERE ct.redemptiondate IS NULL OR ct.redemptiondate >= getdate()
	 

GO
/****** Object:  View [dbo].[RL_U_PortfWithRL]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[RL_U_PortfWithRL] AS
SELECT ft.[ClientCode]
      ,ft.[Instrument]
      ,ft.[Quantity]
      ,ft.[MarketValue]
      ,ft.[Percent]
      ,ft.[Issuer]
      ,ft.[InstrumentName]
	  ,iss.FullName
      ,ft.[InstrumentType]
      ,ft.[contrid]
      ,ft.[SecurityId]
  FROM [dbo].[FactTable] AS ft
  LEFT JOIN [_CL_URL_issues] AS iss ON (ft.SecurityId = iss.rid)

GO
/****** Object:  View [dbo].[_CL_RL_issues]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[_CL_RL_issues]
AS
	SELECT [issueid] AS rid, [FullName] AS [name] FROM [_CL_ExchCodes]
GO
/****** Object:  View [dbo].[_CL_ClientLimits]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[_CL_ClientLimits] AS

	SELECT cl.[Id]
		  ,t.LimitId
		  ,t.Name
		  ,t.КодКлиента AS [ClientCode]
		  ,t.ПолноеНаименование AS ClientName
		  ,ISNULL(cl.[IsActive], 0) AS [IsActive]
		  ,CONVERT(float, cl.[MinValue]) AS [MinValue]
		  ,CONVERT(float, cl.[MaxValue]) AS [MaxValue]
		  ,CONVERT(float,cl.[LowerWarning]) AS [LowerWarning]
		  ,CONVERT(float,cl.[UpperWarning]) AS [UpperWarning]

	FROM [ClientsLimits] AS cl RIGHT JOIN 
	(SELECT l.Id as LimitId, l.Name, c.КодКлиента, c.ПолноеНаименование FROM CL AS l LEFT JOIN [_CL_Clients] AS c ON (1=1) WHERE c.КодКлиента <> 0) AS t
	ON (cl.ClientCode = t.КодКлиента AND cl.LimitId = t.LimitId)


	  /*
FROM CL AS l LEFT JOIN [_CL_Clients] AS c ON (1=1) LEFT JOIN [ClientsLimits] AS cl ON (cl.ClientCode = c.КодКлиента AND cl.LimitId = l.Id)
WHERE c.КодКлиента <> 0
*/

/*
  FROM [ClientsLimits] AS cl LEFT JOIN [_CL_Clients] AS c ON (cl.ClientCode = c.КодКлиента)
		LEFT JOIN CL AS l ON (cl.LimitId = l.Id)
*/





GO
/****** Object:  View [dbo].[CL_Query_10203]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[CL_Query_10203] AS

	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], fts.[Issuer], fts.[SumMarketValue], fts.[SumPercent]
			, CASE ISNULL(rl.[LimitType], 0) WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)))+ ' %' 
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0))) 
						END AS [Limit] 
			, 
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, convert(decimal(18,0), convert(float, fts.[SummAsset]) * (CONVERT(decimal(18, 6), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 6), fts.[SumPercent]))) )
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 0), fts.[SumMarketValue])) 
						END AS [FreeToBuy],
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 4), fts.[SumPercent]) ) + ' %'
						ELSE '' 
						END AS [FreeToBuyPerc]
		  , convert(decimal(18, 8), 
						  CASE rl.[LimitType]
								WHEN 'P' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumPercent] / rl.LimitValue  ELSE 101 END
								WHEN 'A' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumMarketValue] / rl.LimitValue ELSE 101 END  
								ELSE 101
						  END 
					  ) AS LimitValue

	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid], SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft WHERE ft.[MarketValue] > 0
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid]
	) AS fts
	LEFT JOIN [RestrictList] as rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] = 'S' AND fts.[contrid] = rl.rid)



GO
/****** Object:  View [dbo].[CL_Limit_10203]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10203] AS SELECT * FROM CL_Query_10203
GO
/****** Object:  View [dbo].[CL_Query_10204]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[CL_Query_10204] AS


	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], fts.[Issuer], fts.[SumMarketValue], convert(decimal(18, 6), fts.[SumPercent]) AS [SumPercent]
			, CASE rl.[LimitType]WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), rl.LimitValue))+ ' %' 
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), rl.LimitValue)) 
						END AS [Limit] 
			, 
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, convert(decimal(18,0), convert(float, fts.[SummAsset]) * (CONVERT(decimal(18, 6), rl.LimitValue) - convert(decimal(18, 6), fts.[SumPercent]))) )
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), rl.LimitValue) - convert(decimal(18, 0), fts.[SumMarketValue])) 
						END AS [FreeToBuy],
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), rl.LimitValue) - convert(decimal(18, 4), fts.[SumPercent]) ) + ' %'
						ELSE '' 
						END AS [FreeToBuyPerc]

		  , convert(decimal(18, 8), 
						  CASE rl.[LimitType]
								WHEN 'P' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumPercent] / ISNULL(rl.LimitValue, 0) ELSE 101 END
								WHEN 'A' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumMarketValue] / ISNULL(rl.LimitValue, 0) ELSE 101 END  
								ELSE 101
						  END 
					  ) AS LimitValue

	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid], SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft
			WHERE ft.[InstrumentType] = 'акция'
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid]
	) AS fts
	LEFT JOIN [RestrictList] as rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] = 'AS' AND fts.[contrid] = rl.rid)




GO
/****** Object:  View [dbo].[CL_Limit_10204]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10204] AS SELECT * FROM CL_Query_10204
GO
/****** Object:  View [dbo].[CL_Limit_10085]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10085] AS SELECT * FROM CL_Query_10085
GO
/****** Object:  View [dbo].[CL_Limit_10063]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10063] AS SELECT * FROM CL_Query_10063
GO
/****** Object:  View [dbo].[CL_Query_10208]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[CL_Query_10208] AS

	SELECT t.[ClientCode], t.[ClientAccount], t.[SummAsset], t.[Issuer], t.[InstrumentName], t.[InstrumentType], t.[LimitTo], t.[MarketValue], t.[Percent]
	, CONVERT(varchar, CONVERT(decimal(18,2), t.[Min])) + ' - ' + CONVERT(varchar, CONVERT(decimal(18,2), t.[Max])) + CASE t.[LimitType] WHEN 'P' THEN ' %' ELSE ' руб' END AS [Limit], 
		CASE t.[LimitType] WHEN 'P' 
					THEN CONVERT(varchar, convert(decimal(18,0), convert(float, t.[SummAsset]) * (CONVERT(decimal(18, 6), t.[Max]) - convert(decimal(18, 6), t.[Percent]))) )
					ELSE CONVERT(varchar, CONVERT(decimal(18, 0), t.[Max]) - convert(decimal(18, 0), t.[MarketValue])) 
					END AS [FreeToBuy],
		CASE t.[LimitType] WHEN 'P' 
					THEN CONVERT(varchar, CONVERT(decimal(18, 4), t.[Max]) - convert(decimal(18, 4), t.[Percent]) ) + ' %'
					ELSE 'руб' 
					END AS [FreeToBuyPerc]
		, convert(decimal(18, 8), 
						CASE t.[LimitType]
							WHEN 'P' THEN 
								CASE WHEN t.[Percent] >= t.[Min] THEN
									CASE WHEN t.[Max] > 0 THEN 100 * t.[Percent] / t.[Max] ELSE 101 END
								ELSE
									-101
								END
							WHEN 'R' THEN
								CASE WHEN t.[MarketValue] >= t.[Min] THEN
									CASE WHEN t.[Max] > 0 THEN 100 * t.[MarketValue] / t.[Max] ELSE 101 END
								ELSE
									-101
								END							
							ELSE 101
						END 
					) AS LimitValue	
	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[InstrumentName], ft.[InstrumentType], ft.[MarketValue], ft.[Percent], 'Конкретный выпуск' AS [LimitTo], rlu.[Min], rlu.[Max], rlu.[LimitType]
			FROM [FactTable] AS ft 
			INNER JOIN [RL_Universal] AS rlu ON (rlu.[ClientId] = ft.[ClientCode] AND rlu.[IssueRid] = ft.[SecurityId] AND rlu.[RestrictType] = 'I')			
			WHERE ft.[MarketValue] > 0 
		UNION
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[InstrumentName], ft.[InstrumentType], ft.[MarketValue], ft.[Percent], ('<' + dtl.[TypesList] + '> эмитента') AS [LimitTo], rlu.[Min], rlu.[Max], rlu.[LimitType]
			FROM [FactTable] AS ft 
			INNER JOIN
			(
				SELECT DISTINCT [TypesList], [ClientId]	FROM [RL_Universal] WHERE [RestrictType] = 'A' AND [CORG] = 'C'
			) AS dtl
			ON (dtl.ClientId = ft.[ClientCode] AND dtl.[TypesList] LIKE '%' + ft.InstrumentType + '%')
			LEFT JOIN [RL_Universal] AS rlu ON (rlu.[ClientId] = ft.[ClientCode] AND ft.[contrid] = rlu.[CORGid] AND rlu.[RestrictType] = 'A' AND rlu.[CORG] = 'C' and rlu.[TypesList] LIKE '%' + ft.InstrumentType + '%')			
			WHERE ft.[MarketValue] > 0
		UNION
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[InstrumentName], ft.[InstrumentType], ft.[MarketValue], ft.[Percent], ('<' + rlu.[TypesList] + '> группы ' + rlu.GroupName) AS [LimitTo], rlu.[Min], rlu.[Max], rlu.[LimitType]
			FROM [FactTable] AS ft 
			INNER JOIN 
			(
				SELECT rlu.*, g.GroupName, gc.contrid FROM [RL_Universal] AS rlu
					LEFT JOIN [CL_Groups] AS g ON (g.Rid = rlu.CORGid)
					LEFT JOIN [CL_GroupsContent] AS gc ON (gc.GroupId = g.Id)
					WHERE rlu.CORG = 'G' AND rlu.[RestrictType] = 'A'
			)
			AS rlu ON (rlu.[ClientId] = ft.[ClientCode] AND ft.[contrid] = rlu.[contrid] and rlu.[TypesList] LIKE '%' + ft.InstrumentType + '%')			
			WHERE ft.[MarketValue] > 0
	) AS t


GO
/****** Object:  View [dbo].[CL_Limit_10208]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10208] AS SELECT * FROM CL_Query_10208
GO
/****** Object:  View [dbo].[CL_Query_10209]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CL_Query_10209] AS

	SELECT t.[ClientCode], t.[ClientAccount], t.[SummAsset], t.[GroupName], t.[Issuer], t.[smarketvalue], t.[spercent], t.[TypesList] AS [LimitTo]
	, CONVERT(varchar, CONVERT(decimal(18,2), t.[Min])) + ' - ' + CONVERT(varchar, CONVERT(decimal(18,2), t.[Max])) + CASE t.[LimitType] WHEN 'P' THEN ' %' WHEN 'R' THEN ' руб' ELSE '' END AS [Limit], 
		CASE t.[NoBuy] WHEN 1 THEN 'Forbidden!'
			ELSE
				CASE t.[LimitType] WHEN 'P' 
					THEN CONVERT(varchar, convert(decimal(18,0), convert(float, t.[SummAsset]) * (CONVERT(decimal(18, 6), t.[Max]) - convert(decimal(18, 6), t.[spercent]))) )
					ELSE CONVERT(varchar, CONVERT(decimal(18, 0), t.[Max]) - convert(decimal(18, 0), t.[smarketvalue])) END 
				END AS [FreeToBuy],
		CASE t.[NoBuy] WHEN 1 THEN 'Forbidden!'
			ELSE
				CASE t.[LimitType] WHEN 'P' 
					THEN CONVERT(varchar, CONVERT(decimal(18, 4), t.[Max]) - convert(decimal(18, 4), t.[spercent]) ) + ' %'
					ELSE '' END 
			END AS [FreeToBuyPerc]
		, convert(decimal(18, 8), 
						CASE t.[LimitType]
							WHEN 'P' THEN 
								CASE WHEN t.[spercent] >= t.[Min] THEN
									CASE WHEN t.[Max] > 0 THEN 100 * t.[spercent] / t.[Max] ELSE 101 END
								ELSE
									-101
								END
							WHEN 'R' THEN
								CASE WHEN t.[smarketvalue] >= t.[Min] THEN
									CASE WHEN t.[Max] > 0 THEN 100 * t.[smarketvalue] / t.[Max] ELSE 101 END
								ELSE
									-101
								END							
							ELSE 101
						END 
					) AS LimitValue	
	FROM
	(

		SELECT pf.*, rlu.[Min], rlu.[Max], rlu.[LimitType], rlu.[NoBuy] FROM
		(
			SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[contrid], rlug.GroupName, ft.[Issuer], SUM(ft.MarketValue) AS smarketvalue, SUM(ft.[Percent]) AS spercent, rlug.[rlid], rlug.[TypesList] FROM [FactTable] AS ft
			LEFT JOIN 
			(
				SELECT rlu.ClientId, rlu.[id] AS [rlid], rlu.TypesList, g.GroupName, gc.contrid FROM
					(SELECT [id], [ClientId], [CORGid], [TypesList] FROM [RL_Universal] WHERE [CORG] = 'G' AND [RestrictType] = 'S') AS rlu
					INNER JOIN [CL_Groups] AS g ON (g.Rid= rlu.CORGid)
					INNER JOIN [CL_GroupsContent] AS gc ON (gc.GroupId = g.Id)
				UNION
					SELECT [ClientId], [id] AS [rlid], [TypesList], 'эмитент' AS [GroupName], [CORGid] AS contrid FROM [RL_Universal] WHERE [CORG] = 'C' AND [RestrictType] = 'S'
			) AS rlug
			ON (rlug.ClientId = ft.[ClientCode] AND rlug.contrid = ft.contrid AND rlug.[TypesList] LIKE '%' + ft.InstrumentType + '%')
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[contrid], ft.[Issuer], rlug.GroupName, rlug.[rlid], rlug.[TypesList]
		) AS pf
		LEFT JOIN [RL_Universal] AS rlu ON (pf.rlid = rlu.id)
	) AS t

	/*
		SELECT pf.*, rlu.[Min], rlu.[Max], rlu.[LimitType], rlu.[NoBuy]  FROM
		(
			SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[contrid], ft.[Issuer], SUM(ft.MarketValue) AS smarketvalue, SUM(ft.[Percent]) AS spercent, rlu.[TypesList] FROM [FactTable] AS ft
			LEFT JOIN 
			(
				SELECT [ClientId], [CORGid], [TypesList] FROM [RL_Universal] WHERE [CORG] = 'C' AND [RestrictType] = 'S' 
			) AS rlu ON (rlu.[ClientId] = ft.[ClientCode] AND rlu.[CORGid] = ft.contrid) AND rlu.[TypesList] LIKE '%' + ft.InstrumentType + '%'
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[contrid], ft.[Issuer], rlu.[TypesList]
		) AS pf
		LEFT JOIN
		(
			SELECT [ClientId], [CORGid], [TypesList], [Min], [Max], [LimitType], [NoBuy] FROM [RL_Universal] WHERE [CORG] = 'C' AND [RestrictType] = 'S' 
		) AS rlu
		ON (rlu.[ClientId] = pf.[ClientCode] AND rlu.[CORGid] = pf.contrid AND rlu.[TypesList] = pf.[TypesList])
		*/




GO
/****** Object:  View [dbo].[CL_Limit_10209]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10209] AS SELECT * FROM CL_Query_10209
GO
/****** Object:  View [dbo].[CL_Query_10066]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[CL_Query_10066] AS

	SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[InstrumentName], ft.[QuoteSheet], ft.[QuoteSDHAgo],  ft.MarketValue AS SumMarketValue, ft.[Percent] AS SumPercent,
		convert(bigint, turn1) AS [Turnover1], convert(bigint, turn2) AS [Turnover2], convert(bigint, turn3) AS [Turnover3], 1 AS LimitValue
		FROM	dbo.FactTable AS ft LEFT JOIN Cache_MonthTurnovers AS mt ON (ft.ID_CB_SDH = mt.ObjectId)
		WHERE     (ft.[Issuer] IS NOT NULL) AND
			( (ft.[QuoteSDH] IS NULL OR ft.[QuoteSDHAgo] > (1 + (case when DATEPART(dw, getdate()) < 3 then DATEPART(dw, getdate()) else 0 end)) )
				AND NOT (ft.[QuoteSheet] IN ('Первый уровень листинга', '1') AND IsBig = 1)
			)

GO
/****** Object:  View [dbo].[CL_Limit_10066]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10066] AS SELECT * FROM CL_Query_10066
GO
/****** Object:  View [dbo].[CL_Query_10067]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[CL_Query_10067] AS

	SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent], SUM(ft.[Percent]) AS LimitValue
		FROM	dbo.FactTable AS ft LEFT JOIN Cache_MonthTurnovers AS mt ON (ft.ID_CB_SDH = mt.ObjectId)
		WHERE     (ft.[Issuer] IS NOT NULL) AND
			( (ft.[QuoteSDH] IS NULL OR ft.[QuoteSDHAgo] > (1 + (case when DATEPART(dw, getdate()) < 3 then DATEPART(dw, getdate()) else 0 end)) )
				AND NOT (ft.[QuoteSheet] IN ('Первый уровень листинга', '1') AND IsBig = 1)
			)
		GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset]

GO
/****** Object:  View [dbo].[CL_Limit_10067]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10067] AS SELECT * FROM CL_Query_10067
GO
/****** Object:  View [dbo].[CL_Query_10069]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[CL_Query_10069] AS


	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], fts.[Issuer], fts.[SumMarketValue], convert(decimal(18, 6), fts.[SumPercent]) AS [SumPercent]
			, CASE ISNULL(rl.[LimitType], rl1.[LimitType]) WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, rl1.LimitValue)))+ ' %' 
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, rl1.LimitValue))) 
						END AS [Limit] 
			, 
			CASE ISNULL(rl.[LimitType], rl1.[LimitType]) WHEN 'P' 
						THEN CONVERT(varchar, convert(decimal(18,0), convert(float, fts.[SummAsset]) * (CONVERT(decimal(18, 6), ISNULL(rl.LimitValue, rl1.LimitValue)) - convert(decimal(18, 6), fts.[SumPercent]))) )
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, rl1.LimitValue)) - convert(decimal(18, 0), fts.[SumMarketValue])) 
						END AS [FreeToBuy],
			CASE ISNULL(rl.[LimitType], rl1.[LimitType]) WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, rl1.LimitValue)) - convert(decimal(18, 4), fts.[SumPercent]) ) + ' %'
						ELSE '' 
						END AS [FreeToBuyPerc]
		  , convert(decimal(18, 8), 
						  CASE ISNULL(rl.[LimitType], rl1.[LimitType])
								WHEN 'P' THEN 
									CASE WHEN [dbo].[mathmax](ISNULL(rl.LimitValue, 0), ISNULL(rl1.LimitValue, 0)) > 0 THEN 
										100 * fts.[SumPercent] / [dbo].[mathmax](ISNULL(rl.LimitValue, 0), ISNULL(rl1.LimitValue, 0)) ELSE 101 END
								WHEN 'A' THEN 
									CASE WHEN [dbo].[mathmax](ISNULL(rl.LimitValue, 0), ISNULL(rl1.LimitValue, 0)) > 0 THEN 
										100 * fts.[SumMarketValue] / [dbo].[mathmax](ISNULL(rl.LimitValue, 0), ISNULL(rl1.LimitValue, 0)) ELSE 101 END  
								ELSE 101
						  END 
					  ) AS LimitValue

	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid], SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft
			WHERE ft.[InstrumentType] = 'облигация'
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid]
	) AS fts
	LEFT JOIN [RestrictList] as rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] = 'B' AND fts.[contrid] = rl.rid)
	LEFT JOIN [RestrictList] as rl1 on (fts.[ClientCode] = rl1.[ClientId]) AND (rl1.[Type] = 'D' AND fts.[contrid] = rl1.rid)



GO
/****** Object:  View [dbo].[CL_Limit_10069]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10069] AS SELECT * FROM CL_Query_10069
GO
/****** Object:  View [dbo].[CL_Limit_10070]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10070] AS SELECT * FROM CL_Query_10070
GO
/****** Object:  View [dbo].[CL_Query_10071]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[CL_Query_10071] AS

	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], fts.[Issuer], fts.[SumMarketValue], fts.[SumPercent]
			, CASE ISNULL(rl.[LimitType], 0) WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)))+ ' %' 
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0))) 
						END AS [Limit] 
			, 
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, convert(decimal(18,0), convert(float, fts.[SummAsset]) * (CONVERT(decimal(18, 6), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 6), fts.[SumPercent]))) )
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 0), fts.[SumMarketValue])) 
						END AS [FreeToBuy],
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 4), fts.[SumPercent]) ) + ' %'
						ELSE '' 
						END AS [FreeToBuyPerc]
		  , convert(decimal(18, 8), 
						  CASE rl.[LimitType]
								WHEN 'P' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumPercent] / rl.LimitValue  ELSE 101 END
								WHEN 'A' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumMarketValue] / rl.LimitValue ELSE 101 END  
								ELSE 101
						  END 
					  ) AS LimitValue

/*
		  , CONVERT(varchar, CONVERT(decimal, rl.LimitValue)) + CASE rl.[LimitType] WHEN 'P' THEN ' %' ELSE '' END AS [Limit]
		  , CASE rl.[LimitType]
				WHEN 'P' THEN CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 100 * fts.[SumPercent] / ISNULL(rl.LimitValue, 0) ELSE 101 END
				WHEN 'A' THEN CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 100 * fts.[SumMarketValue] / ISNULL(rl.LimitValue, 0) ELSE 101 END  
				ELSE 101
		  END  AS LimitValue
*/
	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid], SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM 
			(
				SELECT t.[ClientCode], t.[ClientAccount], t.[SummAsset], t.[InstrumentType]
						, CASE t.[InstrumentType] WHEN 'дс' THEN 'Банк ГПБ (АО)' ELSE t.[Issuer] END AS [Issuer], 
						CASE t.[InstrumentType] WHEN 'дс' THEN 'FBCE6509-54DB-45C9-AC8A-8A452869B46F' ELSE t.[contrid] END AS [contrid], t.[MarketValue], t.[Percent]
				FROM [FactTable] AS t
				WHERE t.[InstrumentType] IN ('облигация', 'Депозит') OR (t.[InstrumentType] = 'дс' AND t.[Instrument] = '810')
			) AS ft
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid]
	) AS fts
	INNER JOIN [RestrictList] as rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] = 'D' AND fts.[contrid] = rl.rid)



GO
/****** Object:  View [dbo].[CL_Limit_10071]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10071] AS SELECT * FROM CL_Query_10071
GO
/****** Object:  View [dbo].[CL_Query_10072]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[CL_Query_10072] AS

	SELECT t.*,
			CASE	WHEN (t.[Эшелон] = 'I+II') OR (t.[Эшелон] = 'I') OR (t.[Эшелон] = 'II') THEN 100
					WHEN (t.[Эшелон] = 'III') THEN 20
					WHEN (t.[Эшелон] = 'IV') THEN 0
					ELSE 0
					END AS [Limit],
			CASE	WHEN t.[Эшелон] = 'I' AND [SumPercent] <= 100 THEN 0
					WHEN t.[Эшелон] = 'II' AND [SumPercent] <= 100 THEN 0
					WHEN t.[Эшелон] = 'I+II' AND [SumPercent] <= 100 THEN 0
					WHEN t.[Эшелон] = 'III' AND [SumPercent] <= 20 THEN 0
					WHEN t.[Эшелон] = 'IV' AND [SumPercent] <= 0 THEN 0
					ELSE 1
			END AS LimitValue
/*			CASE	WHEN (t.[Эшелон] = 'I') OR (t.[Эшелон] = 'II') THEN 100
					--WHEN t.[Эшелон] = 'II' THEN 70
					WHEN (t.[Эшелон] = 'III' OR t.[Эшелон] = 'III+IV') THEN 50
					WHEN t.[Эшелон] = 'IV' THEN 5
					ELSE 0
			END AS [Limit],
			CASE	WHEN t.[Эшелон] = 'I' AND [SumPercent] <= 100 THEN 0
					WHEN t.[Эшелон] = 'II' AND [SumPercent] <= 100 THEN 0
					WHEN t.[Эшелон] = 'III' AND [SumPercent] <= 50 THEN 0
					WHEN t.[Эшелон] = 'IV' AND [SumPercent] <= 5 THEN 0
					WHEN t.[Эшелон] = 'III+IV' AND [SumPercent] <= 50 THEN 0
					ELSE 1
			END AS LimitValue
*/
	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], rl.Echelon AS [Эшелон], SUM(MarketValue) AS SumMarketValue, SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft INNER JOIN [RestrictList] AS rl ON (ft.[contrid] = rl.rid AND ft.[ClientCode] = rl.ClientId)
			WHERE rl.Echelon IS NOT NULL AND rl.Echelon <> '' 
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], rl.Echelon
		UNION
			SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], 'I+II' AS [Эшелон], SUM(MarketValue) AS SumMarketValue, SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft INNER JOIN [RestrictList] AS rl ON (ft.[contrid] = rl.rid AND ft.[ClientCode] = rl.ClientId)
			WHERE rl.Echelon IN ('II', 'I') 
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset]
	) AS t


GO
/****** Object:  View [dbo].[CL_Limit_10072]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10072] AS SELECT * FROM CL_Query_10072
GO
/****** Object:  View [dbo].[CL_Limit_10074]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10074] AS SELECT * FROM CL_Query_10074
GO
/****** Object:  View [dbo].[BACK_ClentGrp]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BACK_ClentGrp] AS 
SELECT     cg.Name, cg.[Description], ct.*
FROM         [CO1-VP-BO1].[BackOffice].dbo.Sp_ClientGroups as cg INNER JOIN
                      [CO1-VP-BO1].[BackOffice].dbo.Sp_ClientToGroups as ct ON cg.Id = ct.GroupId
GO
/****** Object:  View [dbo].[BACK_ClentTurn]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[BACK_ClentTurn] AS 
SELECT [id_client]
      ,[oborot] + [oborotRPS] AS [oborot]
      ,[RSA]
FROM [CO1-VP-BO1].[BackOffice].[dbo].[vw_InfoForLimit]

GO
/****** Object:  View [dbo].[INFORMER_Clients]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[INFORMER_Clients]
AS
	SELECT     НаименованиеКлиента, СчетКлиента, Группа, CAST(КодКлиента as int) as КодКлиента
	FROM         [CO1-VT-FO1].Informer.dbo.Clients
	WHERE КодКлиента > 0 AND КодКлиента IS NOT NULL AND НаименованиеКлиента NOT LIKE 'LID%'
	UNION
	SELECT 'НПФ Газфонд 6 (СТАРЫЙ)' AS НаименованиеКлиента, 'LIDGF7' AS СчетКлиента, '---' AS Группа, 337 as КодКлиента
	UNION
	SELECT '[ФОНД] ' + [Name] AS НаименованиеКлиента, '' AS СчетКлиента, 'Резервы' AS Группа, 1000000 + [FondId] AS КодКлиента FROM [BACK_Fonds]
	UNION
	SELECT '[Синтетический] ' + [Name] AS НаименованиеКлиента, [Account] AS СчетКлиента, 'Резервы' AS Группа, Id AS КодКлиента FROM [SintClient]


GO
/****** Object:  View [dbo].[CL_Query_10076]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[CL_Query_10076] AS

SELECT (1000000 + bg.[GroupId]) AS [ClientCode], ic.НаименованиеКлиента AS [Fond], SUM(bc.[oborot]) AS [Turnover], SUM(bc.[RSA]) AS [RSA], 
				100 * CASE WHEN SUM(bc.[RSA]) > 0 THEN SUM(bc.[oborot]) / SUM(bc.[RSA]) ELSE 1 END  AS [Percent],
				100 * CASE WHEN SUM(bc.[RSA]) > 0 THEN SUM(bc.[oborot]) / SUM(bc.[RSA]) ELSE 1 END  AS LimitValue

	FROM [BACK_ClentTurn] AS bc INNER JOIN [BACK_ClentGrp] AS bg ON (bc.[id_client] = bg.[ClientId]) INNER JOIN [INFORMER_Clients] AS ic ON (1000000 + bg.[GroupId] = ic.КодКлиента)
  GROUP BY bg.[GroupId], ic.НаименованиеКлиента


GO
/****** Object:  View [dbo].[CL_Query_10144]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[CL_Query_10144] AS


	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], fts.[Issuer], fts.[SumMarketValue], convert(decimal(18, 8), fts.[SumPercent]) AS [SumPercent]
				, CASE ISNULL(rl.[LimitType], 0) WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)))+ ' %' 
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0))) 
						END AS [Limit] 
			, 
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, convert(decimal(18,0), convert(float, fts.[SummAsset]) * (CONVERT(decimal(18, 6), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 6), fts.[SumPercent]))) )
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 0), fts.[SumMarketValue])) 
						END AS [FreeToBuy],
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 4), fts.[SumPercent]) ) + ' %'
						ELSE '' 
						END AS [FreeToBuyPerc]
		  , convert(decimal(18, 8), 
						  CASE rl.[LimitType]
								WHEN 'P' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumPercent] / rl.LimitValue  ELSE 101 END
								WHEN 'A' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumMarketValue] / rl.LimitValue ELSE 101 END  
								ELSE 101
						  END 
					  ) AS LimitValue
	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid], SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft
			WHERE ft.[InstrumentType] = 'Депозит'
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid]
	) AS fts
	LEFT JOIN [RestrictList] as rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] = 'DP' AND fts.[contrid] = rl.rid)





GO
/****** Object:  View [dbo].[CL_Limit_10144]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10144] AS SELECT * FROM CL_Query_10144
GO
/****** Object:  View [dbo].[CL_Query_10145]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[CL_Query_10145] AS

	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], ISNULL(fts.[Issuer], 'АЛОР+ (бс)') AS Issuer, fts.[SumMarketValue], convert(decimal(18, 8), fts.[SumPercent]) AS [SumPercent]
				, CASE ISNULL(rl.[LimitType], 0) WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)))+ ' %' 
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0))) 
						END AS [Limit] 
			, 
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, convert(decimal(18,0), convert(float, fts.[SummAsset]) * (CONVERT(decimal(18, 6), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 6), fts.[SumPercent]))) )
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 0), fts.[SumMarketValue])) 
						END AS [FreeToBuy],
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 4), fts.[SumPercent]) ) + ' %'
						ELSE '' 
						END AS [FreeToBuyPerc]
		  , convert(decimal(18, 8), 
						  CASE rl.[LimitType]
								WHEN 'P' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumPercent] / rl.LimitValue  ELSE 101 END
								WHEN 'A' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumMarketValue] / rl.LimitValue ELSE 101 END  
								ELSE 101
						  END 
					  ) AS LimitValue

	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid], SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft
			WHERE ft.[InstrumentType] IN ('дс', 'бс')
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid]
	) AS fts
	LEFT JOIN [RestrictList] as rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] = 'RS' AND 
				(fts.[contrid] = rl.rid OR (fts.[contrid] IS NULL AND rl.rid = '20c21fb4-adb4-43f6-8282-4fd10e494a46') ) )



GO
/****** Object:  View [dbo].[CL_Limit_10145]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10145] AS SELECT * FROM CL_Query_10145
GO
/****** Object:  View [dbo].[CL_Query_10023]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[CL_Query_10023] AS
	SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], [VolCirculation], SUM(Quantity) AS [SumQuantity], MarketValue AS SumMarketValue, [Percent] AS SumPercent,
	CASE WHEN ([VolCirculation] <> 0) THEN 100 * SUM(Quantity) / [VolCirculation] ELSE 101 END AS LimitValue
	FROM dbo.FactTable WHERE (MarketValue IS NOT NULL)
	AND InstrumentType = 'облигация'
	GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer], [VolCirculation], MarketValue, [Percent]



GO
/****** Object:  View [dbo].[CL_Limit_10023]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10023] AS SELECT * FROM CL_Query_10023
GO
/****** Object:  View [dbo].[CL_Query_10146]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[CL_Query_10146] AS

	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], fts.GroupName, fts.[SumMarketValue], fts.[SumPercent]
		  , CONVERT(varchar, CONVERT(decimal, rl.LimitValue)) + CASE rl.[LimitType] WHEN 'P' THEN ' %' ELSE '' END AS [Limit]
		  , CASE rl.[LimitType]
				WHEN 'P' THEN CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 100 * fts.[SumPercent] / ISNULL(rl.LimitValue, 0) ELSE 101 END
				WHEN 'A' THEN CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 100 * fts.[SumMarketValue] / ISNULL(rl.LimitValue, 0) ELSE 101 END  
				ELSE 101
		  END  AS LimitValue
	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ig.Rid, ig.[Name] AS GroupName,
					SUM(ft.[MarketValue]) AS SumMarketValue, SUM(ft.[Percent]) AS SumPercent
			FROM [FactTable] AS ft INNER JOIN [CL_IssueGroupsContent] AS igc ON (ft.SecurityId = igc.[issueid])
			LEFT JOIN [CL_IssueGroups] AS ig ON (igc.GroupId = ig.Id)
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset],  ig.Rid, ig.[Name]
	) AS fts
	INNER JOIN [RestrictList] AS rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] IN ('IG')) AND (rl.rid = fts.Rid)





GO
/****** Object:  View [dbo].[CL_Limit_10146]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10146] AS SELECT * FROM CL_Query_10146
GO
/****** Object:  View [dbo].[CL_Query_10155]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[CL_Query_10155] AS


	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], fts.[Issuer], fts.[SumMarketValue], fts.[SumPercent]
				, CASE ISNULL(rl.[LimitType], 0) WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)))+ ' %' 
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0))) 
						END AS [Limit] 
			, 
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, convert(decimal(18,0), convert(float, fts.[SummAsset]) * (CONVERT(decimal(18, 6), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 6), fts.[SumPercent]))) )
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 0), fts.[SumMarketValue])) 
						END AS [FreeToBuy],
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 4), fts.[SumPercent]) ) + ' %'
						ELSE '' 
						END AS [FreeToBuyPerc]
		  , convert(decimal(18, 8), 
						  CASE rl.[LimitType]
								WHEN 'P' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumPercent] / rl.LimitValue  ELSE 101 END
								WHEN 'A' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumMarketValue] / rl.LimitValue ELSE 101 END  
								ELSE 101
						  END 
					  ) AS LimitValue

	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid], SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft WHERE ft.[MarketValue] > 0 AND ft.InstrumentType IN ('акция', 'облигация', 'пиф') AND ft.QuoteSheet NOT IN ('1')
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid], ft.QuoteSheet
	) AS fts
	INNER JOIN [RestrictList] as rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] = 'Q' AND fts.[contrid] = rl.rid)



GO
/****** Object:  View [dbo].[CL_Limit_10155]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10155] AS SELECT * FROM CL_Query_10155
GO
/****** Object:  View [dbo].[CL_Query_10031]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[CL_Query_10031] AS
	SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [Issuer], MarketValue AS SumMarketValue, [Percent] AS SumPercent,
	 CASE WHEN [enddate] < getdate() THEN 1 ELSE 0 END AS LimitValue
	FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND ([InstrumentType] IN ('акция', 'облигация'))

GO
/****** Object:  View [dbo].[CL_Limit_10031]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10031] AS SELECT * FROM CL_Query_10031
GO
/****** Object:  View [dbo].[CL_Query_10032]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[CL_Query_10032] AS
	SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [Issuer],  MarketValue AS SumMarketValue, [Percent] AS SumPercent,
	 CASE WHEN [RedemptionDate] < getdate() THEN 1 ELSE 0 END AS LimitValue
	FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND ([InstrumentType] IN ('облигация'))


GO
/****** Object:  View [dbo].[CL_Limit_10032]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10032] AS SELECT * FROM CL_Query_10032
GO
/****** Object:  View [dbo].[_CL_CL]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[_CL_CL]
AS
SELECT 0 AS [Id], '...Все...' AS [Name]
UNION
SELECT [Id],[Name] FROM [dbo].[CL]



GO
/****** Object:  View [dbo].[_CL_RL_groups]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[_CL_RL_groups]
AS
	SELECT [Rid] AS rid, [GroupName] AS [name] FROM [CL_Groups]
GO
/****** Object:  View [dbo].[_CL_SubGroup]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[_CL_SubGroup]
AS
	SELECT s.[ParentId],s.[ChildId], g.GroupName
	FROM [CL_SubGroup] AS s LEFT JOIN CL_Groups AS g ON (s.[ChildId] = g.Id)
GO
/****** Object:  View [dbo].[_tmp_AU_Bonds_Find]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[_tmp_AU_Bonds_Find]
AS

		SELECT t.*, ct.rid, ISNULL(c.rid, ct.emitents_id) AS crid FROM
		(
		SELECT UPPER(SUBSTRING([comment], 1, PATINDEX('% %', [comment]))) AS Tick
			  ,RTRIM(LTRIM([Type])) AS [Type]
			  ,[Remark]
			  ,[EmmName]
		 FROM [LC3_dev].[dbo].[_tmp_AU_Bonds]
		 ) AS t LEFT JOIN Cache_Tools AS ct ON (t.Tick LIKE '%' + ct.ticker + '%' and ct.enddate IS NULL)
				LEFT JOIN Cache_Contragents AS c on (t.EmmName LIKE '%' + c.[name] + '%')
GO
/****** Object:  View [dbo].[_tmp_AU_Stocks_Find]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[_tmp_AU_Stocks_Find]	
AS
	SELECT t.Tick, t.[Name], ct.rid, ct.emitents_id, RTRIM(LTRIM(ct.subtype)) AS subtype FROM	
		(SELECT UPPER(SUBSTRING([comment], 1, PATINDEX('% %', [comment]))) AS Tick, [Name] FROM [LC3_dev].[dbo].[_tmp_AU_Stocks]) 
	AS t LEFT JOIN Cache_Tools AS ct ON (t.Tick = ct.ticker and ct.enddate IS NULL)
GO
/****** Object:  View [dbo].[BACK_Deals]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[BACK_Deals]
AS
SELECT 
      s.[Data],
      s.[ID_Client],
      s.[ID_Oper],
      s.[Count],
      s.[Cena],
      s.[Summa],
      s.[isRPS],
  --    s.[Ext_rid_Contra],
  --    s.[Ext_rid_CB],
	  t.[ticker],
	  t.state_reg_number,
	  c.name AS issuer,
	  co.name AS organizer,
	  cc.name AS RPSContragent
  FROM [CO1-VP-BO1].[BackOffice].[dbo].[vw_SdelkiForCl] AS s
	LEFT JOIN [Cache_Tools] AS t ON (s.[Ext_rid_CB] = t.[rid])
	LEFT JOIN [Cache_Contragents] AS c ON (t.emitents_id = c.rid)
	LEFT JOIN [Cache_Contragents] AS co ON (t.organizerid = co.rid)
	LEFT JOIN [Cache_Contragents] AS cc ON (s.[Ext_rid_Contra] = cc.rid)


GO
/****** Object:  View [dbo].[CL_Limit_10012]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10012] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит' ,'дс' ,'бс')) AND ([InstrumentSubtype] NOT IN ('ГЦБ'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10013]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10013] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция')) AND ([OwnType] IN ('ОАО' ,'ПАО' ,'АО')) AND ([Country] IN ('РОССИЯ'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10014]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10014] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('пиф')) AND ([InstrumentSubtype] IN ('открытый'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10015]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10015] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([Country] IN ('РОССИЯ')) AND ([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('СФО'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10016]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10016] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10017]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10017] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО')) AND ([OwnType] NOT IN ('ГК'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10018]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10018] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentSubtype] IN ('ГЦБ'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10019]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10019] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('СФО'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10020]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10020] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('пиф')) AND ([InstrumentSubtype] IN ('закрытый'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10022]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10022] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция')) AND ([QuoteSheet] NOT IN ('1') OR [QuoteSheet] IS NULL)) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10024]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10024] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([QuoteSheet] NOT IN ('1') OR [QuoteSheet] IS NULL) AND ([F_Rating] NOT IN ('AAA' ,'AA+' ,'AA' ,'AA-' ,'A+' ,'A' ,'A-' ,'BBB+' ,'BBB' ,'BBB-' ,'BB+' ,'BB' ,'BB-') OR [F_Rating] IS NULL) AND ([M_Rating] NOT IN ('Aaa' ,'Aa1' ,'Aa2' ,'Aa3' ,'A1' ,'A2' ,'A3' ,'Baa1' ,'Baa2' ,'Baa3' ,'Ba1' ,'Ba2' ,'Ba3') OR [M_Rating] IS NULL) AND ([Contr_F_Rating] NOT IN ('AAA' ,'AA+' ,'AA' ,'AA-' ,'A+' ,'A' ,'A-' ,'BBB+' ,'BBB' ,'BBB-' ,'BB+' ,'BB' ,'BB-') OR [Contr_F_Rating] IS NULL) AND ([Contr_M_Rating] NOT IN ('Aaa' ,'Aa1' ,'Aa2' ,'Aa3' ,'A1' ,'A2' ,'A3' ,'Baa1' ,'Baa2' ,'Baa3' ,'Ba1' ,'Ba2' ,'Ba3') OR [Contr_M_Rating] IS NULL) AND ([Contr_SP_Rating] NOT IN ('AAA' ,'AA+' ,'AA' ,'AA-' ,'A+' ,'A' ,'A-' ,'BBB+' ,'BBB' ,'BBB-' ,'BB+' ,'BB' ,'BB-') OR [Contr_SP_Rating] IS NULL) AND ([SP_Rating] NOT IN ('AAA' ,'AA+' ,'AA' ,'AA-' ,'A+' ,'A' ,'A-' ,'BBB+' ,'BBB' ,'BBB-' ,'BB+' ,'BB' ,'BB-') OR [SP_Rating] IS NULL)) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10025]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10025] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10026]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10026] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([QuoteSheet] NOT IN ('1') OR [QuoteSheet] IS NULL) AND ([QuoteSDH] < (1e-12) OR [QuoteSDH] IS NULL)) OR (([QuoteSheet] NOT IN ('1') OR [QuoteSheet] IS NULL) AND ([QuoteSDHAgo] > ((1 + (case when DATEPART(dw, getdate()) < 3 then DATEPART(dw, getdate()) else 0 end))))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10028]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10028] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL)  GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10033]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10033] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('пиф')) AND ([InstrumentSubtype] IN ('закрытый' ,'открытый'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10035]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10035] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10036]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10036] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция')) AND ([QuoteSheet] IN ('1'))) OR (([InstrumentType] IN ('акция')) AND ([Contr_F_Rating] IN ('AAA' ,'AA+' ,'AA' ,'AA-' ,'A+' ,'A' ,'A-' ,'BBB+' ,'BBB' ,'BBB-' ,'BB+' ,'BB' ,'BB-')) AND ([Contr_M_Rating] IN ('Aaa' ,'Aa1' ,'Aa2' ,'Aa3' ,'A1' ,'A2' ,'A3' ,'Baa1' ,'Baa2' ,'Baa3' ,'Ba1' ,'Ba2' ,'Ba3')) AND ([Contr_SP_Rating] IN ('AAA' ,'AA+' ,'AA' ,'AA-' ,'A+' ,'A' ,'A-' ,'BBB+' ,'BBB' ,'BBB-' ,'BB+' ,'BB' ,'BB-'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10037]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10037] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([F_Rating] NOT IN ('AAA' ,'AA+' ,'AA' ,'AA-' ,'A+' ,'A' ,'A-' ,'BBB+' ,'BBB' ,'BBB-' ,'BB+' ,'BB' ,'BB-') OR [F_Rating] IS NULL) AND ([M_Rating] NOT IN ('Aaa' ,'Aa1' ,'Aa2' ,'Aa3' ,'A1' ,'A2' ,'A3' ,'Baa1' ,'Baa2' ,'Baa3' ,'Ba1' ,'Ba2' ,'Ba3') OR [M_Rating] IS NULL) AND ([SP_Rating] NOT IN ('AAA' ,'AA+' ,'AA' ,'AA-' ,'A+' ,'A' ,'A-' ,'BBB+' ,'BBB' ,'BBB-' ,'BB+' ,'BB' ,'BB-') OR [SP_Rating] IS NULL) AND ([Contr_F_Rating] NOT IN ('AAA' ,'AA+' ,'AA' ,'AA-' ,'A+' ,'A' ,'A-' ,'BBB+' ,'BBB' ,'BBB-' ,'BB+' ,'BB' ,'BB-') OR [Contr_F_Rating] IS NULL) AND ([Contr_M_Rating] NOT IN ('Aaa' ,'Aa1' ,'Aa2' ,'Aa3' ,'A1' ,'A2' ,'A3' ,'Baa1' ,'Baa2' ,'Baa3' ,'Ba1' ,'Ba2' ,'Ba3') OR [Contr_M_Rating] IS NULL) AND ([Contr_SP_Rating] NOT IN ('AAA' ,'AA+' ,'AA' ,'AA-' ,'A+' ,'A' ,'A-' ,'BBB+' ,'BBB' ,'BBB-' ,'BB+' ,'BB' ,'BB-') OR [Contr_SP_Rating] IS NULL) AND ([QuoteSheet] NOT IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10040]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10040] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('Депозит')) AND ([Currency] IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10041]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10041] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('Депозит')) AND ([Currency] IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10042]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10042] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф' ,'Депозит')) AND ([is_bank] IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10043]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10043] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('дс')) AND ([Currency] IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10045]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10045] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('ИО'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10046]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10046] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([DateEndPlacing] > (DATEADD(d, 45, getdate()))) AND ([InstrumentType] IN ('акция' ,'облигация'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10047]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10047] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('ЕО')) AND ([Country] NOT IN ('РОССИЯ'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10048]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10048] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([OwnType] IN ('МФО'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10051]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10051] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция')) AND ([Country] NOT IN ('РОССИЯ'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10052]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10052] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('пиф')) AND ([Country] NOT IN ('РОССИЯ'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10053]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10053] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф')) AND ([Country] NOT IN ('РОССИЯ'))) OR (([OwnType] IN ('МФО'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10054]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10054] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'пиф')) AND ([QuoteSheet] NOT IN ('1')) AND ([MonthAvgVol] < (100000000))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10055]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10055] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО')) AND ([Contr_F_Rating] IN ('BBB+' ,'BBB' ,'BBB-'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО')) AND ([Contr_M_Rating] IN ('Baa1' ,'Baa2' ,'Baa3'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО')) AND ([Contr_SP_Rating] IN ('BBB+' ,'BBB' ,'BBB-'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10056]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10056] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО')) AND ([Contr_F_Rating] IN ('BBB+' ,'BBB' ,'BBB-'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО')) AND ([Contr_M_Rating] IN ('Baa1' ,'Baa2' ,'Baa3'))) OR (([Contr_SP_Rating] IN ('BBB+' ,'BBB' ,'BBB-'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10057]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10057] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО')) AND ([Contr_F_Rating] IN ('BB+' ,'BB' ,'BB-'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО')) AND ([Contr_M_Rating] IN ('Ba1' ,'Ba2' ,'Ba3'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО')) AND ([Contr_SP_Rating] IN ('BB+' ,'BB' ,'BB-'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10059]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10059] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО' ,'СФО')) AND ([Contr_F_Rating] IN ('BBB+' ,'BBB' ,'BBB-'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО' ,'СФО')) AND ([Contr_M_Rating] IN ('Baa1' ,'Baa2' ,'Baa3'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО' ,'СФО')) AND ([Contr_SP_Rating] IN ('BBB+' ,'BBB' ,'BBB-'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10060]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10060] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО' ,'СФО')) AND ([Contr_F_Rating] IN ('BBB+' ,'BBB' ,'BBB-'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО' ,'СФО')) AND ([Contr_M_Rating] IN ('Baa1' ,'Baa2' ,'Baa3'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО' ,'СФО')) AND ([Contr_SP_Rating] IN ('BBB+' ,'BBB' ,'BBB-'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10061]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10061] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО' ,'СФО')) AND ([Contr_F_Rating] IN ('BB+' ,'BB' ,'BB-'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО' ,'СФО')) AND ([Contr_M_Rating] IN ('Ba1' ,'Ba2' ,'Ba3'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО' ,'СФО')) AND ([Contr_SP_Rating] IN ('BB+' ,'BB' ,'BB-'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10062]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10062] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО' ,'СФО')) AND ([Contr_F_Rating] IN ('BB+' ,'BB' ,'BB-'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО' ,'СФО')) AND ([Contr_M_Rating] IN ('Ba1' ,'Ba2' ,'Ba3'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО' ,'СФО')) AND ([Contr_SP_Rating] IN ('BB+' ,'BB' ,'BB-'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10068]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10068] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('бс')) AND ([Instrument] = ('Российский рубль'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10089]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10089] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL)  GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10093]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10093] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([QuoteSheet] NOT IN ('1')) AND ([IsInIndex] NOT IN ('1')) AND ([InstrumentType] IN ('акция')) AND ([OwnType] IN ('ОАО' ,'ПАО')) AND ([Country] IN ('РОССИЯ'))) OR (([InstrumentType] IN ('облигация')) AND ([E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-') OR [E_Rating] IS NULL) AND ([A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)') OR [A_Rating] IS NULL) AND ([Contr_E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-') OR [Contr_E_Rating] IS NULL) AND ([Contr_A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)') OR [Contr_A_Rating] IS NULL) AND ([is_bank] IN ('1'))) OR (([InstrumentType] IN ('облигация')) AND ([SecTypeBr] IN ('BON4')) AND ([E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-') OR [E_Rating] IS NULL) AND ([A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)') OR [A_Rating] IS NULL) AND ([Contr_E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-') OR [Contr_E_Rating] IS NULL) AND ([Contr_A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)') OR [Contr_A_Rating] IS NULL) AND ([QuoteSheet] IN ('1')) AND ([InstrumentSubtype] NOT IN ('ИО')) AND ([is_bank] IN ('0'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО')) AND ([RedemptionDate] = (0) OR [RedemptionDate] IS NULL) AND ([IsVariableCoupon] IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10094]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10094] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('ГЦБ')) AND ([IsQuantityGrows] IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10095]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10095] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция')) AND ([Country] IN ('РОССИЯ'))) OR (([InstrumentType] IN ('облигация')) AND ([is_bank] IN ('1')) AND ([IsSubordinated] IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10097]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10097] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('дс')) AND ([Currency] NOT IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10098]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10098] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('Депозит')) AND ([Currency] NOT IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10099]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10099] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([SecTypeBr] IN ('BON3' ,'BON6' ,'BON61')) AND ([is_bank] IN ('1'))) OR (([InstrumentType] IN ('акция')) AND ([is_bank] IN ('1'))) OR (([InstrumentType] IN ('Депозит'))) OR (([InstrumentType] IN ('дс'))) OR (([InstrumentType] IN ('бс')) AND ([is_bank] IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10100]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10100] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('Депозит' ,'дс')) AND ([RedemptionDate] < (dateadd(d,90,getdate())))) OR (([RedemptionDate] < (dateadd(d,90,getdate()))) AND ([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('ГЦБ'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('ГЦБ')) AND ([RedemptionDate] > (dateadd(d,90,getdate()))) AND ([IsVariableCoupon] IN ('0'))) OR (([InstrumentSubtype] NOT IN ('ГЦБ')) AND ([IsVariableCoupon] IN ('0')) AND ([InstrumentType] IN ('облигация')) AND ([A_Rating] IN ('AAA(RU)' ,'AA+(RU)'))) OR (([InstrumentType] IN ('акция')) AND ([IsInIndex] IN ('1')) AND ([Country] IN ('РОССИЯ'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] NOT IN ('ГЦБ')) AND ([Contr_A_Rating] IN ('AAA(RU)' ,'AA+(RU)')) AND ([IsVariableCoupon] IN ('0'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] NOT IN ('ГЦБ')) AND ([E_Rating] IN ('ruAAA' ,'ruAA+')) AND ([IsVariableCoupon] IN ('0'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] NOT IN ('ГЦБ')) AND ([Contr_E_Rating] IN ('ruAAA' ,'ruAA+')) AND ([IsVariableCoupon] IN ('0'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10104]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10104] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL)  GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10106]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10106] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([IsQuantityGrows] IN ('1')) AND ([InstrumentType] NOT IN ('дс' ,'бс'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer], [InstrumentName], [StateRegNum]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10115]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10115] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([SecTypeBr] IN ('BON5'))) OR (([OwnType] IN ('МФО'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10120]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10120] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([Contr_NKR_Rating] NOT IN ('AA-.ru' ,'AAA.ru' ,'AA+.ru' ,'AA.ru' ,'A+.ru' ,'A.ru' ,'A-.ru' ,'BBB+.ru') OR [Contr_NKR_Rating] IS NULL) AND ([is_bank] NOT IN ('1')) AND ([Country] IN ('РОССИЯ')) AND ([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] NOT IN ('ГЦБ' ,'ИО')) AND ([E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-' ,'ruBBB+') OR [E_Rating] IS NULL) AND ([A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)' ,'BBB+(RU)') OR [A_Rating] IS NULL) AND ([Contr_E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-' ,'ruBBB+') OR [Contr_E_Rating] IS NULL) AND ([Contr_A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)' ,'BBB+(RU)') OR [Contr_A_Rating] IS NULL)) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО' ,'ИО' ,'ЕО' ,'Ноты 
')) AND ([E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-') OR [E_Rating] IS NULL) AND ([A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)') OR [A_Rating] IS NULL) AND ([Contr_E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-') OR [Contr_E_Rating] IS NULL) AND ([Contr_A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)') OR [Contr_A_Rating] IS NULL) AND ([Contr_NKR_Rating] NOT IN ('AA-.ru' ,'AAA.ru' ,'AA+.ru' ,'AA.ru' ,'A+.ru' ,'A.ru' ,'A-.ru') OR [Contr_NKR_Rating] IS NULL) AND ([Contr_NRA_Rating] NOT IN ('AAA|ru|' ,'AA+|ru|' ,'AA|ru|' ,'AA-|ru|' ,'A+|ru|' ,'A|ru|' ,'A-|ru|') OR [Contr_NRA_Rating] IS NULL) AND ([is_bank] IN ('1')) AND ([Country] IN ('РОССИЯ'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('ИО')) AND ([E_Rating] NOT IN ('ruAAA') OR [E_Rating] IS NULL) AND ([A_Rating] NOT IN ('AAA(RU)') OR [A_Rating] IS NULL) AND ([Contr_E_Rating] NOT IN ('ruAAA') OR [Contr_E_Rating] IS NULL) AND ([Contr_A_Rating] NOT IN ('AAA(RU)') OR [Contr_A_Rating] IS NULL) AND ([is_bank] NOT IN ('1')) AND ([Country] IN ('РОССИЯ'))) OR (([InstrumentType] IN ('облигация')) AND ([Country] NOT IN ('РОССИЯ')) AND ([is_bank] NOT IN ('1')) AND ([Contr_F_Rating] NOT IN ('AAA' ,'AA+' ,'AA' ,'AA-' ,'A+' ,'A' ,'A-' ,'BBB+' ,'BBB' ,'BBB-') OR [Contr_F_Rating] IS NULL) AND ([Contr_M_Rating] NOT IN ('Aaa' ,'Aa1' ,'Aa2' ,'Aa3' ,'A1' ,'A2' ,'A3' ,'Baa1' ,'Baa2' ,'Baa3') OR [Contr_M_Rating] IS NULL) AND ([Contr_SP_Rating] NOT IN ('AAA' ,'AA+' ,'AA' ,'AA-' ,'A+' ,'A' ,'A-' ,'BBB+' ,'BBB' ,'BBB-') OR [Contr_SP_Rating] IS NULL) AND ([Contr_E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-' ,'ruBBB+') OR [Contr_E_Rating] IS NULL) AND ([Contr_A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)' ,'BBB+(RU)') OR [Contr_A_Rating] IS NULL) AND ([Contr_NKR_Rating] NOT IN ('AA-.ru' ,'AAA.ru' ,'AA+.ru' ,'AA.ru' ,'A+.ru' ,'A.ru' ,'A-.ru' ,'BBB+.ru') OR [Contr_NKR_Rating] IS NULL) AND ([Contr_NRA_Rating] NOT IN ('AAA|ru|' ,'AA+|ru|' ,'AA|ru|' ,'AA-|ru|' ,'A+|ru|' ,'A|ru|' ,'A-|ru|' ,'BBB+|ru|') OR [Contr_NRA_Rating] IS NULL)) OR (([InstrumentType] IN ('облигация')) AND ([Country] NOT IN ('РОССИЯ')) AND ([is_bank] IN ('1'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МФО')) AND ([Contr_F_Rating] NOT IN ('AAA' ,'AA+' ,'AA' ,'AA-' ,'A+' ,'A' ,'A-' ,'BBB+' ,'BBB' ,'BBB-') OR [Contr_F_Rating] IS NULL) AND ([Contr_M_Rating] NOT IN ('Aaa' ,'Aa1' ,'Aa2' ,'Aa3' ,'A1' ,'A2' ,'A3' ,'Baa1' ,'Baa2' ,'Baa3') OR [Contr_M_Rating] IS NULL) AND ([Contr_SP_Rating] NOT IN ('AAA' ,'AA+' ,'AA' ,'AA-' ,'A+' ,'A' ,'A-' ,'BBB+' ,'BBB' ,'BBB-') OR [Contr_SP_Rating] IS NULL)) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10122]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10122] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([Currency] NOT IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10123]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10123] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] NOT IN ('ГЦБ')) AND ([QuoteSheet] NOT IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10136]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10136] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10138]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10138] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentSubtype] IN ('МО' ,'СФО')) AND ([InstrumentType] IN ('облигация'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10139]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10139] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция')) AND ([OwnType] IN ('ОАО' ,'ПАО' ,'АО')) AND ([Country] IN ('РОССИЯ'))) OR (([InstrumentType] IN ('пиф')) AND ([Country] NOT IN ('РОССИЯ'))) OR (([InstrumentType] IN ('акция')) AND ([Country] NOT IN ('РОССИЯ'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10140]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10140] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('дс')) AND ([Currency] NOT IN ('1'))) OR (([SecTypeBr] IN ('BON5')) AND ([Country] NOT IN ('РОССИЯ'))) OR (([OwnType] IN ('МФО'))) OR (([InstrumentType] IN ('акция')) AND ([Country] NOT IN ('РОССИЯ'))) OR (([InstrumentType] IN ('облигация')) AND ([Country] NOT IN ('РОССИЯ'))) OR (([InstrumentType] IN ('пиф')) AND ([Country] NOT IN ('РОССИЯ')) AND ([SecTypeBr] IN ('SHS7' ,'SHS71'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10141]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10141] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('дс')) AND ([Currency] NOT IN ('1'))) OR (([InstrumentType] IN ('акция')) AND ([OwnType] IN ('ОАО' ,'ПАО' ,'АО')) AND ([Country] IN ('РОССИЯ'))) OR (([OwnType] IN ('МФО'))) OR (([InstrumentType] IN ('акция')) AND ([Country] NOT IN ('РОССИЯ'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('ЕО')) AND ([Country] NOT IN ('РОССИЯ'))) OR (([InstrumentType] IN ('пиф')) AND ([Country] NOT IN ('РОССИЯ'))) OR (([InstrumentType] IN ('пиф')) AND ([InstrumentSubtype] IN ('закрытый' ,'открытый'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10142]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10142] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([SecTypeBr] IN ('BON3' ,'BON4')) AND ([QuoteSheet] IN ('1')) AND ([E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-')) AND ([A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)')) AND ([Contr_E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-')) AND ([Contr_A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)')) AND ([IsQuantityGrows] IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer], [InstrumentName], [StateRegNum]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10147]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10147] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentSubtype] IN ('ЕО'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10150]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10150] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'пиф'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10151]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10151] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([is_bank] IN ('1')) AND ([InstrumentType] IN ('акция' ,'облигация' ,'Депозит' ,'дс' ,'бс')) AND ([SecTypeBr] NOT IN ('BON4' ,'BON7'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10152]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10152] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM (SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent] FROM dbo.FactTable WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция')) AND ([IsInIndex] NOT IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10158]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10158] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО' ,'СФО')) AND ([Country] IN ('РОССИЯ'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10167]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10167] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] NOT IN ('ГЦБ' ,'ИО' ,'МФО')) AND ([E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-' ,'ruBBB+' ,'ruBBB' ,'ruBBB-') OR [E_Rating] IS NULL) AND ([A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)' ,'BBB+(RU)' ,'BBB(RU)' ,'BBB-(RU)') OR [A_Rating] IS NULL)) OR (([InstrumentSubtype] IN ('ИО')) AND ([E_Rating] NOT IN ('ruAAA') OR [E_Rating] IS NULL) AND ([A_Rating] NOT IN ('AAA(RU)') OR [A_Rating] IS NULL)) OR (([InstrumentSubtype] IN ('МФО')) AND ([E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-' ,'ruBBB+' ,'ruBBB' ,'ruBBB-') OR [E_Rating] IS NULL) AND ([A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)' ,'BBB+(RU)' ,'BBB(RU)' ,'BBB-(RU)') OR [A_Rating] IS NULL) AND ([InstrumentType] IN ('облигация'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10168]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10168] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('ИО'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО')) AND ([OwnType] NOT IN ('ГК')) AND ([Country] IN ('РОССИЯ'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10170]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10170] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация' ,'Депозит' ,'дс' ,'бс'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10171]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10171] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([Country] NOT IN ('РОССИЯ'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10172]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10172] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([Currency] NOT IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer], [InstrumentName], [StateRegNum]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10177]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10177] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([is_bank] IN ('1')) AND ([InstrumentType] IN ('Депозит' ,'дс'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10180]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10180] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('пиф')) AND ([for_qual_investors] IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10183]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10183] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([is_bank] IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [InstrumentName], [StateRegNum]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10187]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10187] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция')) AND ([QuoteSheet] NOT IN ('1')) AND ([IsInIndex] NOT IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10196]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10196] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-') OR [E_Rating] IS NULL) AND ([A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)') OR [A_Rating] IS NULL) AND ([InstrumentSubtype] NOT IN ('ГЦБ')) AND ([NKR_Rating] NOT IN ('AA-.ru' ,'AAA.ru' ,'AA+.ru' ,'AA.ru') OR [NKR_Rating] IS NULL) AND ([NRA_Rating] NOT IN ('AAA|ru|' ,'AA+|ru|' ,'AA|ru|' ,'AA-|ru|') OR [NRA_Rating] IS NULL) AND ([Contr_E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-') OR [Contr_E_Rating] IS NULL) AND ([Contr_A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)') OR [Contr_A_Rating] IS NULL) AND ([Contr_NKR_Rating] NOT IN ('AA-.ru' ,'AAA.ru' ,'AA+.ru' ,'AA.ru') OR [Contr_NKR_Rating] IS NULL) AND ([InstrumentType] IN ('облигация')) AND ([Contr_NRA_Rating] NOT IN ('AAA|ru|' ,'AA+|ru|' ,'AA|ru|' ,'AA-|ru|') OR [Contr_NRA_Rating] IS NULL)) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10197]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10197] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([RedemptionDate] IS NULL) AND([IsVariableCoupon] IN ('1')) AND ([IsSubordinated] IN ('1'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('ИО'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10200]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10200] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция' ,'облигация')) AND ([E_Rating] IN ('ruAA-' ,'ruA+' ,'ruA' ,'ruA-' ,'ruBBB+' ,'ruBBB' ,'ruBBB-' ,'ruBB+' ,'ruBB' ,'ruBB-' ,'ruB+' ,'ruB' ,'ruB-' ,'ruCCC' ,'ruCC' ,'ruC' ,'ruRD' ,'ruD') OR [E_Rating] IS NULL) AND ([A_Rating] IN ('AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)' ,'BBB+(RU)' ,'BBB(RU)' ,'BBB-(RU)' ,'BB+(RU)' ,'BB(RU)' ,'BB-(RU)' ,'B+(RU)' ,'B(RU)' ,'B-(RU)' ,'CCC(RU)' ,'CC(RU)' ,'C(RU)' ,'RD(RU)' ,'SD(RU)' ,'D(RU)' ,'Withdrawn') OR [A_Rating] IS NULL) AND ([NKR_Rating] IN ('AA-.ru' ,'A+.ru' ,'A.ru' ,'A-.ru' ,'BBB+.ru' ,'BBB.ru' ,'BBB-.ru' ,'BB+.ru' ,'BB.ru' ,'BB-.ru' ,'B+.ru' ,'B.ru' ,'B-.ru' ,'CCC.ru' ,'CC.ru' ,'C.ru' ,'D' ,'Withdrawn') OR [NKR_Rating] IS NULL) AND ([NRA_Rating] IN ('AA-|ru|' ,'A+|ru|' ,'A|ru|' ,'A-|ru|' ,'BBB+|ru|' ,'BBB|ru|' ,'BBB-|ru|' ,'BB+|ru|' ,'BB|ru|' ,'BB-|ru|' ,'B+|ru|' ,'B|ru|' ,'B-|ru|' ,'CCC|ru|' ,'CC|ru|' ,'C|ru|' ,'RD|ru|' ,'SD|ru|' ,'D|ru|' ,'Withdrawn') OR [NRA_Rating] IS NULL) AND ([InstrumentSubtype] NOT IN ('ГЦБ')) AND ([QuoteSheet] NOT IN ('1')) AND ([Contr_E_Rating] IN ('ruAA-' ,'ruA+' ,'ruA' ,'ruA-' ,'ruBBB+' ,'ruBBB' ,'ruBBB-' ,'ruBB+' ,'ruBB' ,'ruBB-' ,'ruB+' ,'ruB' ,'ruB-' ,'ruCCC' ,'ruCC' ,'ruC' ,'ruRD' ,'ruD') OR [Contr_E_Rating] IS NULL) AND ([Contr_A_Rating] IN ('AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)' ,'BBB+(RU)' ,'BBB(RU)' ,'BBB-(RU)' ,'BB+(RU)' ,'BB(RU)' ,'BB-(RU)' ,'B+(RU)' ,'B(RU)' ,'B-(RU)' ,'CCC(RU)' ,'CC(RU)' ,'C(RU)' ,'RD(RU)') OR [Contr_A_Rating] IS NULL) AND ([Contr_NKR_Rating] IN ('AA.ru' ,'A+.ru' ,'A.ru' ,'A-.ru' ,'BBB+.ru' ,'BBB.ru' ,'BBB-.ru' ,'BB+.ru' ,'BB.ru' ,'BB-.ru' ,'B+.ru' ,'B.ru' ,'B-.ru' ,'CCC.ru' ,'CC.ru' ,'C.ru' ,'D' ,'Withdrawn') OR [Contr_NKR_Rating] IS NULL) AND ([Contr_NRA_Rating] IN ('AA-|ru|' ,'A+|ru|' ,'A|ru|' ,'A-|ru|' ,'BBB+|ru|' ,'BBB|ru|' ,'BBB-|ru|' ,'BB+|ru|' ,'BB|ru|' ,'BB-|ru|' ,'B+|ru|' ,'B|ru|' ,'B-|ru|' ,'CCC|ru|' ,'CC|ru|' ,'C|ru|' ,'RD|ru|' ,'SD|ru|' ,'D|ru|' ,'Withdrawn') OR [Contr_NRA_Rating] IS NULL)) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10201]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10201] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('дс' ,'бс'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('ГЦБ'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('КО' ,'МО' ,'СФО' ,'ИО')) AND ([E_Rating] IN ('ruAAA' ,'ruAA+' ,'ruAA')) AND ([A_Rating] IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)')) AND ([Contr_E_Rating] IN ('ruAAA' ,'ruAA+' ,'ruAA')) AND ([Contr_A_Rating] IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)'))) OR (([InstrumentType] IN ('акция')) AND ([QuoteSheet] IN ('1'))) OR (([InstrumentType] IN ('акция')) AND ([IsInIndex] IN ('1'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10202]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10202] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация' ,'Депозит' ,'дс' ,'бс' ,'МНО')) AND ([E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-') OR [E_Rating] IS NULL) AND ([A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)') OR [A_Rating] IS NULL) AND ([Contr_E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-') OR [Contr_E_Rating] IS NULL) AND ([Contr_A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)') OR [Contr_A_Rating] IS NULL) AND ([Contr_NKR_Rating] NOT IN ('AA-.ru' ,'AAA.ru' ,'AA+.ru' ,'AA.ru' ,'A+.ru' ,'A.ru' ,'A-.ru') OR [Contr_NKR_Rating] IS NULL) AND ([Contr_NRA_Rating] NOT IN ('AAA|ru|' ,'AA+|ru|' ,'AA|ru|' ,'AA-|ru|' ,'A+|ru|' ,'A|ru|' ,'A-|ru|') OR [Contr_NRA_Rating] IS NULL) AND ([is_bank] IN ('1'))) OR (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] NOT IN ('ГЦБ' ,'ИО' ,'ЕО' ,'Ноты 
' ,'МФО')) AND ([E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-' ,'ruBBB+' ,'ruBBB' ,'ruBBB-' ,'ruBB+') OR [E_Rating] IS NULL) AND ([A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)' ,'BBB+(RU)' ,'BBB(RU)' ,'BBB-(RU)' ,'BB+(RU)') OR [A_Rating] IS NULL) AND ([NKR_Rating] NOT IN ('AA-.ru' ,'AAA.ru' ,'AA+.ru' ,'AA.ru' ,'A+.ru' ,'A.ru' ,'A-.ru' ,'BBB+.ru' ,'BBB.ru' ,'BBB-.ru' ,'BB+.ru') OR [NKR_Rating] IS NULL) AND ([NRA_Rating] NOT IN ('AAA|ru|' ,'AA+|ru|' ,'AA|ru|' ,'AA-|ru|' ,'A+|ru|' ,'A|ru|' ,'A-|ru|' ,'BBB+|ru|' ,'BBB|ru|' ,'BBB-|ru|' ,'BB+|ru|') OR [NRA_Rating] IS NULL) AND ([Contr_E_Rating] NOT IN ('ruAAA' ,'ruAA+' ,'ruAA' ,'ruAA-' ,'ruA+' ,'ruA' ,'ruA-' ,'ruBBB+' ,'ruBBB' ,'ruBBB-' ,'ruBB+') OR [Contr_E_Rating] IS NULL) AND ([Contr_A_Rating] NOT IN ('AAA(RU)' ,'AA+(RU)' ,'AA(RU)' ,'AA-(RU)' ,'A+(RU)' ,'A(RU)' ,'A-(RU)' ,'BBB+(RU)' ,'BBB(RU)' ,'BBB-(RU)' ,'BB+(RU)') OR [Contr_A_Rating] IS NULL) AND ([Contr_NKR_Rating] NOT IN ('AA-.ru' ,'AAA.ru' ,'AA+.ru' ,'AA.ru' ,'A+.ru' ,'A.ru' ,'A-.ru' ,'BBB+.ru' ,'BBB.ru' ,'BBB-.ru' ,'BB+.ru') OR [Contr_NKR_Rating] IS NULL) AND ([Contr_NRA_Rating] NOT IN ('AAA|ru|' ,'AA+|ru|' ,'AA|ru|' ,'AA-|ru|' ,'A+|ru|' ,'A|ru|' ,'A-|ru|' ,'BBB+|ru|' ,'BBB|ru|' ,'BBB-|ru|' ,'BB+|ru|') OR [Contr_NRA_Rating] IS NULL)) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10205]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10205] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('Депозит' ,'дс' ,'бс' ,'МНО'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10206]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10206] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('облигация')) AND ([InstrumentSubtype] IN ('МО' ,'СФО'))) GROUP BY [ClientCode], [ClientAccount], [SummAsset], [Issuer]
			) AS t
GO
/****** Object:  View [dbo].[CL_Limit_10207]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Limit_10207] AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				SELECT [ClientCode], [ClientAccount], [SummAsset], SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM dbo.FactTable
				 WHERE (MarketValue IS NOT NULL) AND (([InstrumentType] IN ('акция'))) OR (([InstrumentType] IN ('Депозит')) AND ([IsSubordinated] IN ('1'))) OR (([InstrumentType] IN ('облигация')) AND ([IsSubordinated] IN ('1'))) OR (([InstrumentType] IN ('облигация')) AND ([RedemptionDate] IS NULL)) GROUP BY [ClientCode], [ClientAccount], [SummAsset]
			) AS t
GO
/****** Object:  View [dbo].[CL_queries_list]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CL_queries_list]
AS

	SELECT name FROM sys.views WHERE name LIKE '%CL_Query%'

GO
/****** Object:  View [dbo].[CL_Query__Blank]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[CL_Query__Blank] AS
	SELECT [ClientCode], [ClientAccount], [SummAsset], [Issuer], [Percent] AS LimitValue
	FROM dbo.FactTable WHERE (MarketValue IS NOT NULL)
GO
/****** Object:  View [dbo].[CL_Query_10050]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[CL_Query_10050] AS


	SELECT tmp.*, tmp.[SumPercent] AS LimitValue
		FROM
		(SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft
			LEFT JOIN ClientsInvestorList AS CIL ON (ft.[ClientCode] = CIL.Clientid)
			INNER JOIN [CL_GroupsContent] AS il ON (CIL.InvestorListId = il.[GroupId] AND ft.contrid = il.[contrid])
			WHERE	(ft.[MarketValue] IS NOT NULL) AND (ft.[Issuer] IS NOT NULL) AND (ft.[QuoteSheet] NOT IN ('Первый уровень листинга', '1'))
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer]
		) as tmp


GO
/****** Object:  View [dbo].[CL_Query_10064]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[CL_Query_10064] AS


	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], fts.[Issuer], fts.[SumMarketValue], fts.[SumPercent]
			, CASE ISNULL(rl.[LimitType], 0) WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)))+ ' %' 
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0))) 
						END AS [Limit] 
			, 
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, convert(decimal(18,0), convert(float, fts.[SummAsset]) * (CONVERT(decimal(18, 6), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 6), fts.[SumPercent]))) )
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 0), fts.[SumMarketValue])) 
						END AS [FreeToBuy],
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 4), fts.[SumPercent]) ) + ' %'
						ELSE '' 
						END AS [FreeToBuyPerc]
		  , convert(decimal(18, 8), 
						  CASE rl.[LimitType]
								WHEN 'P' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumPercent] / rl.LimitValue  ELSE 101 END
								WHEN 'A' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumMarketValue] / rl.LimitValue ELSE 101 END  
								ELSE 101
						  END 
					  ) AS LimitValue

	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid], SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft WHERE ft.[MarketValue] > 0
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid]
	) AS fts
	LEFT JOIN [RestrictList] as rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] = 'S' AND fts.[contrid] = rl.rid)



GO
/****** Object:  View [dbo].[CL_Query_10102]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[CL_Query_10102] AS


	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], fts.[Issuer], fts.[SumMarketValue], fts.[SumPercent]
			, CASE ISNULL(rl.[LimitType], 0) WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)))+ ' %' 
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0))) 
						END AS [Limit] 
			, 
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, convert(decimal(18,0), convert(float, fts.[SummAsset]) * (CONVERT(decimal(18, 6), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 6), fts.[SumPercent]))) )
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 0), fts.[SumMarketValue])) 
						END AS [FreeToBuy],
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 4), fts.[SumPercent]) ) + ' %'
						ELSE '' 
						END AS [FreeToBuyPerc]
		  , convert(decimal(18, 8), 
						  CASE rl.[LimitType]
								WHEN 'P' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumPercent] / rl.LimitValue  ELSE 101 END
								WHEN 'A' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumMarketValue] / rl.LimitValue ELSE 101 END  
								ELSE 101
						  END 
					  ) AS LimitValue


		 /* , CONVERT(varchar, CONVERT(decimal, rl.LimitValue)) + CASE rl.[LimitType] WHEN 'P' THEN ' %' ELSE '' END AS [Limit]
		  , CASE rl.[LimitType]
				WHEN 'P' THEN CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 100 * fts.[SumPercent] / ISNULL(rl.LimitValue, 0) ELSE 101 END
				WHEN 'A' THEN CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 100 * fts.[SumMarketValue] / ISNULL(rl.LimitValue, 0) ELSE 101 END  
				ELSE 101
		  END  AS LimitValue*/
	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid], SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft WHERE ft.[MarketValue] > 0 AND ft.InstrumentType IN ('акция', 'облигация', 'пиф')
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid]
	) AS fts
	INNER JOIN [RestrictList] as rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] = 'Y' AND fts.[contrid] = rl.rid)



GO
/****** Object:  View [dbo].[CL_Query_10156]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[CL_Query_10156] AS

	SELECT fts.[ClientCode], fts.[ClientAccount], fts.[SummAsset], fts.[Issuer], fts.[SumMarketValue], convert(decimal(18, 8), fts.[SumPercent]) AS [SumPercent]
				, CASE ISNULL(rl.[LimitType], 0) WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)))+ ' %' 
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0))) 
						END AS [Limit] 
			, 
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, convert(decimal(18,0), convert(float, fts.[SummAsset]) * (CONVERT(decimal(18, 6), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 6), fts.[SumPercent]))) )
						ELSE CONVERT(varchar, CONVERT(decimal(18, 0), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 0), fts.[SumMarketValue])) 
						END AS [FreeToBuy],
			CASE rl.[LimitType] WHEN 'P' 
						THEN CONVERT(varchar, CONVERT(decimal(18, 4), ISNULL(rl.LimitValue, 0)) - convert(decimal(18, 4), fts.[SumPercent]) ) + ' %'
						ELSE '' 
						END AS [FreeToBuyPerc]
		  , convert(decimal(18, 8), 
						  CASE rl.[LimitType]
								WHEN 'P' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumPercent] / rl.LimitValue  ELSE 101 END
								WHEN 'A' THEN 
									CASE WHEN ISNULL(rl.LimitValue, 0) > 0 THEN 
										100 * fts.[SumMarketValue] / rl.LimitValue ELSE 101 END  
								ELSE 101
						  END 
					  ) AS LimitValue

	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid], SUM(ft.[MarketValue]) AS [SumMarketValue], SUM(ft.[Percent]) AS [SumPercent]
			FROM [FactTable] AS ft
			WHERE ft.[InstrumentType]  IN ('дс', 'Депозит')
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[contrid]
	) AS fts
	LEFT JOIN [RestrictList] as rl on (fts.[ClientCode] = rl.[ClientId]) AND (rl.[Type] = 'DR' AND fts.[contrid] = rl.rid)


GO
/****** Object:  View [dbo].[CL_Warning]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[CL_Warning] AS

	SELECT [ClientCode]
      ,[ClientAccount]
      ,[Instrument]
      ,[Quantity]
      ,[MarketValue]
      ,[Issuer]
      ,[InstrumentType]
		  ,[CB_Code]
		  , 101 AS LimitValue
	  FROM [dbo].[FactTable]
	WHERE ([SecurityId] IS NULL AND  [InstrumentType] <> 'фъючерс')
			 OR ([Quantity] < 0 AND [InstrumentType] <> 'фъючерс') 
			 OR ([InstrumentType] = 'Депозит' and [contrid] IS NULL) 
			 OR ([InstrumentType] = 'дс' and [Instrument] IS NULL)




GO
/****** Object:  View [dbo].[CLlst_Groups]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CLlst_Groups]
AS

	SELECT [Id] AS [Id]
		  ,[Id] AS [Value]
		  ,[GroupName] AS [Name]
	FROM [CL_Groups]

GO
/****** Object:  View [dbo].[FondPortfolio]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE VIEW [dbo].[FondPortfolio]
AS
SELECT 10048 AS [ClientCode]
      ,10048 AS [ClientAccount]
      ,0 AS [SummAsset]
      ,[Instrument]
      ,SUM([Quantity]) AS SumQuantity
      ,SUM([MarketValue]) AS SumMarketValue
      ,0 AS [Percent]
      ,[Issuer]
      ,[InstrumentName]
      ,[InstrumentType]
      ,[InstrumentSubtype]
      ,[SecTypeBr]
      ,[Country]
      ,[QuoteSheet]
      ,[OwnType]
      ,[BondsIssueSumm]
      ,[QuoteSDH]
      ,[QuoteSDHAgo]
      ,[VolCirculation]
      ,[contrid]
      ,[Capitalization]
      ,[RedemptionDate]
      ,[SecurityId]
      ,[IssueNum]
      ,[AnnouncedVol]
      ,[DateStartPlacing]
      ,[DateEndPlacing]
      ,[Currency]
      ,[CB_Code]
      ,[ID_CB_SDH]
      ,[StateRegNum]
      ,[MonthAvgVol]
      ,[F_Rating]
      ,[M_Rating]
      ,[SP_Rating]
      ,[E_Rating]
      ,[A_Rating]
      ,[Contr_F_Rating]
      ,[Contr_M_Rating]
      ,[Contr_SP_Rating]
      ,[Contr_E_Rating]
      ,[Contr_A_Rating]
      ,[enddate]
      ,[IsInIndex]
      ,[IsVariableCoupon]
      ,[IsQuantityGrows]
  FROM [FactTable]
  WHERE [ClientCode] IN (SELECT [ClientId] FROM [BACK_Fond_Content] WHERE [FondId] = 10048)
  GROUP BY
	[Instrument]
       ,[Issuer]
      ,[InstrumentName]
      ,[InstrumentType]
      ,[InstrumentSubtype]
      ,[SecTypeBr]
      ,[Country]
      ,[QuoteSheet]
      ,[OwnType]
      ,[BondsIssueSumm]
      ,[QuoteSDH]
      ,[QuoteSDHAgo]
      ,[VolCirculation]
      ,[contrid]
      ,[Capitalization]
      ,[RedemptionDate]
      ,[SecurityId]
      ,[IssueNum]
      ,[AnnouncedVol]
      ,[DateStartPlacing]
      ,[DateEndPlacing]
      ,[Currency]
      ,[CB_Code]
      ,[ID_CB_SDH]
      ,[StateRegNum]
      ,[MonthAvgVol]
      ,[F_Rating]
      ,[M_Rating]
      ,[SP_Rating]
      ,[E_Rating]
      ,[A_Rating]
      ,[Contr_F_Rating]
      ,[Contr_M_Rating]
      ,[Contr_SP_Rating]
      ,[Contr_E_Rating]
      ,[Contr_A_Rating]
      ,[enddate]
      ,[IsInIndex]
      ,[IsVariableCoupon]
      ,[IsQuantityGrows]
GO
/****** Object:  View [dbo].[FT_View]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FT_View] AS

SELECT [ClientCode]
      ,[ClientAccount]
      ,[SummAsset]
      ,[Instrument]
      ,[Quantity]
      ,[MarketValue]
      ,[Percent]
      ,[Issuer]
      ,[InstrumentName]
      ,[InstrumentType]
      ,[InstrumentSubtype]
      ,[SecTypeBr]
      ,[Country]
      ,[QuoteSheet]
      ,[OwnType]
      ,[BondsIssueSumm]
      ,[QuoteSDH]
      ,[QuoteSDHAgo]
      ,[VolCirculation]
      ,[contrid]
      ,[Capitalization]
      ,[RedemptionDate]
      ,[SecurityId]
      ,[IssueNum]
      ,[AnnouncedVol]
      ,[DateStartPlacing]
      ,[DateEndPlacing]
      ,[Currency]
      ,[CB_Code]
      ,[ID_CB_SDH]
      ,[StateRegNum]
      ,[MonthAvgVol]
      ,[F_Rating]
      ,[M_Rating]
      ,[SP_Rating]
      ,[E_Rating]
      ,[A_Rating]
      ,[Contr_F_Rating]
      ,[Contr_M_Rating]
      ,[Contr_SP_Rating]
      ,[Contr_E_Rating]
      ,[Contr_A_Rating]
      ,[enddate]
      ,[IsInIndex]
      ,[IsVariableCoupon]
      ,[IsQuantityGrows]
      ,[DaysToRedemption]
      ,[is_bank]
      ,[for_qual_investors]
      ,[NKR_Rating]
      ,[NRA_Rating]
      ,[Contr_NKR_Rating]
      ,[Contr_NRA_Rating]
      ,[IsSubordinated]
  FROM [dbo].[FactTable]

GO
/****** Object:  View [dbo].[Model_Tools]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Model_Tools]
AS
SELECT t.[rid]
	,c.name + ' ' + t.subtype + '-' + ISNULL(t.number_of_emission, '') + ' (' + ISNULL(t.ticker,'') + ', ' + ISNULL(t.state_reg_number,'') +')' AS Fullname
  FROM [Cache_Tools] AS t LEFT JOIN [Cache_Contragents] AS c ON (t.emitents_id	=	c.rid)
GO
/****** Object:  View [dbo].[My_Model_FT]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[My_Model_FT] AS
SELECT [ClientCode]
      ,[ClientAccount]
      ,[SummAsset]
      ,[Instrument]
      ,[Quantity]
      ,[MarketValue]
      ,[Percent]
      ,[Issuer]
      ,[InstrumentName]
      ,[InstrumentType]
      ,[InstrumentSubtype]
      ,[SecTypeBr]
      ,[Country]
      ,[QuoteSheet]
      ,[OwnType]
      ,[BondsIssueSumm]
      ,[QuoteSDH]
      ,[QuoteSDHAgo]
      ,[VolCirculation]
      ,[contrid]
      ,[Capitalization]
      ,[RedemptionDate]
      ,[SecurityId]
      ,[IssueNum]
      ,[AnnouncedVol]
      ,[DateStartPlacing]
      ,[DateEndPlacing]
      ,[Currency]
      ,[CB_Code]
      ,[ID_CB_SDH]
      ,[StateRegNum]
      ,[MonthAvgVol]
      ,[F_Rating]
      ,[M_Rating]
      ,[SP_Rating]
      ,[E_Rating]
      ,[A_Rating]
      ,[Contr_F_Rating]
      ,[Contr_M_Rating]
      ,[Contr_SP_Rating]
      ,[Contr_E_Rating]
      ,[Contr_A_Rating]
      ,[enddate]
      ,[IsInIndex]
      ,[IsVariableCoupon]
      ,[IsQuantityGrows]
	  ,[DaysToRedemption]
	  ,[is_bank]
	  ,[for_qual_investors]
      ,[NKR_Rating]
      ,[NRA_Rating]
      ,[Contr_NKR_Rating]
      ,[Contr_NRA_Rating]
      ,[IsSubordinated]
  FROM [Model_FT] WHERE [UId] = SUSER_ID()
GO
/****** Object:  View [dbo].[RL_U_CurrPos]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RL_U_CurrPos] AS
	SELECT rlu.id, rlu.ClientId, ft.[Percent]
		FROM 
			(SELECT * FROM [RL_Universal] WHERE RestrictType = 'I') AS rlu
			LEFT JOIN [FactTable] AS ft ON (ft.ClientCode = rlu.ClientId AND ft.SecurityId = rlu.IssueRid)
	UNION
	SELECT rlu.id, rlu.ClientId, SUM(ft.[Percent]) AS [Percent]
		FROM 
			(SELECT * FROM [RL_Universal] WHERE CORG = 'C' AND RestrictType <> 'I') AS rlu
			LEFT JOIN [FactTable] AS ft ON (ft.ClientCode = rlu.ClientId AND ft.contrid = rlu.CORGid AND rlu.[TypesList] LIKE '%' + ft.InstrumentType + '%')
	GROUP BY rlu.id, rlu.ClientId
	UNION
	SELECT rlu.id, rlu.ClientId, SUM(ft.[Percent]) AS [Percent]
		FROM 
			(SELECT * FROM [RL_Universal] WHERE CORG = 'G' AND RestrictType <> 'I') AS rlu
			INNER JOIN [CL_Groups] AS g ON (g.Rid= rlu.CORGid)
			INNER JOIN [CL_GroupsContent] AS gc ON (gc.GroupId = g.Id)
			LEFT JOIN [FactTable] AS ft ON (ft.ClientCode = rlu.ClientId AND ft.contrid = gc.contrid AND rlu.[TypesList] LIKE '%' + ft.InstrumentType + '%')
	GROUP BY rlu.id, rlu.ClientId




GO
/****** Object:  View [dbo].[RL_U_Restrictions]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RL_U_Restrictions] AS
	SELECT ft.[ClientCode]
		  ,ft.[contrid]
		  ,ft.[SecurityId]
		  ,rl.id AS rlid
	  FROM [dbo].[FactTable] AS ft
	  INNER JOIN (SELECT id, ClientId, IssueRid FROM [RL_Universal] WHERE RestrictType = 'I') AS rl ON (rl.ClientId = ft.ClientCode AND rl.IssueRid = ft.SecurityId)
	UNION
	SELECT ft.[ClientCode]
		  ,ft.[contrid]
		  ,ft.[SecurityId]
		  ,rl.id AS rlid
	  FROM [dbo].[FactTable] AS ft
	  INNER JOIN (SELECT id, ClientId, CORGid, [TypesList] FROM [RL_Universal] WHERE RestrictType <> 'I' AND CORG = 'C') AS rl ON (rl.ClientId = ft.ClientCode AND rl.CORGid = ft.contrid AND rl.[TypesList] LIKE '%' + ft.InstrumentType + '%')
	UNION
	SELECT ft.[ClientCode]
		  ,ft.[contrid]
		  ,ft.[SecurityId]
		  ,rl.id AS rlid
	  FROM [dbo].[FactTable] AS ft
	  INNER JOIN (SELECT rlu.id, rlu.ClientId,gc.contrid,  rlu.[TypesList] FROM [RL_Universal] as rlu 
					INNER JOIN [CL_Groups] AS g ON (g.Rid= rlu.CORGid) INNER JOIN [CL_GroupsContent] AS gc ON (gc.GroupId = g.Id)
					WHERE rlu.RestrictType <> 'I' AND rlu.CORG = 'G'
					) AS rl 
	  ON (rl.ClientId = ft.ClientCode AND rl.contrid = ft.contrid AND rl.[TypesList] LIKE '%' + ft.InstrumentType + '%')
GO
/****** Object:  View [dbo].[SDH_Active_Sheets]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[SDH_Active_Sheets]
AS

	sELECT qs.for_obj,
		   CASE 
				WHEN qs.for_obj = 1 THEN qs.[bondid]
				WHEN qs.for_obj = 2 THEN qs.[stockid]
				WHEN qs.for_obj = 3 THEN qs.[fundid]
		   END AS rid,
		   qs.qsheet,
		   lqs.name,
		   qs.includedate,
		   qs.excludedate
	--	   ca.name  AS exchange
	FROM   [SDH].SDH.dbo.Quotation_Sheets_view AS qs INNER JOIN [SDH].SDH.dbo.Contragents AS ca ON  qs.contrid = ca.rid
			LEFT JOIN [SDH].SDH.dbo.spr_quotation_sheets AS sqs ON (qs.qsheet = sqs.code)
			LEFT JOIN [SDH].SDH.dbo.lstQuotationSheets AS lqs ON (sqs.shcode = lqs.code)    
	WHERE (qs.excludedate is null or qs.excludedate > getdate())
		   and (ca.rid = '6CCF6D58-7F71-4650-8693-925B17B09462')




GO
/****** Object:  View [dbo].[SDH_Contragents]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[SDH_Contragents]	
AS
	SELECT ca.[rid], ca.[name], ca.[own_type], lot.name as own_type_name, ca.[country], lc.name as country_name, ibs.bonds_issue_sum, ca.is_bank
	FROM [SDH].[SDH].[dbo].[Contragents] AS ca
		LEFT JOIN [SDH].[SDH].[dbo].[lstCountries] AS lc ON (ca.country = lc.code)
		LEFT JOIN [SDH].[SDH].[dbo].[lstContragentOwnTypes] AS lot ON (ca.own_type = lot.code)
		LEFT JOIN
			(
				SELECT	emitents_id, SUM(ISNULL(amount_units, CASE WHEN nominal_price <> 0 THEN amount/nominal_price ELSE 0 END )) AS bonds_issue_sum
				FROM	[SDH].[SDH].[dbo].[issue_bonds] WHERE (redemptiondate > GETDATE()) AND (estatus = 8) GROUP BY emitents_id
			) AS ibs ON (ca.rid = ibs.emitents_id)	



GO
/****** Object:  View [dbo].[SDH_CurrencyRate]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SDH_CurrencyRate]
AS
	SELECT t.* FROM
	(	SELECT DISTINCT	roe.NumCode
						,roe.CharCode
						,roe.Name
						,roe.Nominal
						,roe.Value
						,roe.rid  
						,roe.setdate
						, ROW_NUMBER() OVER (PARTITION BY roe.NumCode ORDER BY roe.setdate DESC) AS rn
		FROM sdh.sdh.dbo.RateOfExchange  roe (nolock) WHERE roe.NumCode IN (978, 840)
	) AS t
	WHERE t.rn = 1
GO
/****** Object:  View [dbo].[SDH_Current_Ratings]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[SDH_Current_Ratings]
AS
	SELECT crl.[rid], rs.[contrid] as agencyid, crl.[for_obj], crl.[contrid], crl.[bondid], 
			crl.[assigndate], crl.[scale], crl.[scale_val], grs.ScaleName, rsv.minval, rsv.ord, SUBSTRING(rsv.maxval, 0, PATINDEX('% %', rsv.maxval)) AS comment

	FROM
	(
		SELECT [rid]
			  ,[for_obj]
			  ,[contrid]
			  ,[bondid]
			  ,[assigndate]
			  ,[scale]
			  ,[scale_val]
			  , row_number() over (partition by [for_obj], [contrid], [bondid], [scale] order by [assigndate] desc) AS rnum
		  FROM [SDH].[SDH].[dbo].[credit_ratings_view]
	) AS crl
	INNER JOIN RatingScales AS grs ON (crl.[scale] = grs.ScaleId)
	LEFT JOIN [SDH].[SDH].[dbo].[spr_rating_scales] AS rs ON (crl.[scale] = rs.[code])
	LEFT JOIN [SDH].[SDH].[dbo].[spr_rating_scale_values] AS rsv ON (crl.[scale_val] = rsv.code)	
	WHERE crl.rnum = 1



GO
/****** Object:  View [dbo].[SDH_LeaderAffilled]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SDH_LeaderAffilled]
AS
	SELECT DISTINCT 
		CASE WHEN contrid = '37FF67AB-DAFD-4CCF-93FB-FB80A403298A' THEN [affilid] 
			 WHEN [affilid] = '37FF67AB-DAFD-4CCF-93FB-FB80A403298A' THEN contrid
        END AS affid
	FROM         [SDH].SDH.dbo.AffilPersons
	WHERE     (contrid = '37FF67AB-DAFD-4CCF-93FB-FB80A403298A' OR affilid = '37FF67AB-DAFD-4CCF-93FB-FB80A403298A') 
			AND (enddate IS NULL OR enddate > GETDATE())
GO
/****** Object:  View [dbo].[SDH_StocksVolume]    Script Date: 11.12.2024 13:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[SDH_StocksVolume]
AS
SELECT ctr.[name], stvol.[emitents_id], CONVERT(float, stvol.[vol]) AS vol
FROM
(
	SELECT t.[emitents_id], SUM(t.[announced_volume]) AS vol FROM
	(
		SELECT iss.[rid]
			  ,iss.[emitents_id]
			  ,iss.[kind_id]
			  ,iss.[number_of_emission]
			  ,iss.[state_reg_number]
			  ,iss.[isin]
			  ,iss.[nominal_price]
			  ,iss.[announced_volume]
			  ,ises.[begdate]
			  ,ises.[estatus]
			  ,ROW_NUMBER() OVER(PARTITION BY iss.[rid] ORDER BY ises.[begdate] desc) AS rn
		  FROM [SDH].[SDH].[dbo].[issue_stocks] AS iss
		  LEFT JOIN [SDH].[SDH].[dbo].[issue_stock_emissionstatuses] AS ises ON (iss.[rid] = ises.[stockid])
		  WHERE iss.[kind_id] = 1 -- AND ises.[estatus] IN (8,9,18,19,28)
	
	) AS t
	WHERE t.rn = 1 AND t.[estatus] IN (8,9,18,19,28)
	GROUP BY t.[emitents_id]
) AS stvol LEFT JOIN [SDH].[SDH].[dbo].[Contragents] AS ctr ON (stvol.[emitents_id] = ctr.[rid])

GO
/****** Object:  Index [UX_OUR_CreditRiskLimits]    Script Date: 11.12.2024 13:33:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_OUR_CreditRiskLimits] ON [dbo].[OUR_CreditRiskLimits]
(
	[IssuerId] ASC,
	[SecuritySubTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UX_OUR_StockPortfolioLimits]    Script Date: 11.12.2024 13:33:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_OUR_StockPortfolioLimits] ON [dbo].[OUR_StockPortfolioLimits]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cache_Contragents] ADD  CONSTRAINT [DF_Cache_Contragents_is_bank]  DEFAULT ((0)) FOR [is_bank]
GO
ALTER TABLE [dbo].[CL] ADD  CONSTRAINT [DF_CL_GroupByEmit]  DEFAULT ((0)) FOR [GroupByEmit]
GO
ALTER TABLE [dbo].[CL] ADD  CONSTRAINT [DF_CL_GroupByInstrument]  DEFAULT ((0)) FOR [GroupByInstr]
GO
ALTER TABLE [dbo].[CL] ADD  CONSTRAINT [DF_CL_IsComplex]  DEFAULT ((1)) FOR [IsComplex]
GO
ALTER TABLE [dbo].[CL] ADD  CONSTRAINT [DF_CL_FTId]  DEFAULT ((1)) FOR [FTId]
GO
ALTER TABLE [dbo].[CL] ADD  CONSTRAINT [DF_CL_UseInPC]  DEFAULT ((0)) FOR [UseInPC]
GO
ALTER TABLE [dbo].[CL] ADD  CONSTRAINT [DF_CL_Type]  DEFAULT ((0)) FOR [LimitType]
GO
ALTER TABLE [dbo].[CL_Conditions] ADD  CONSTRAINT [DF_CL_Conditions_Relation]  DEFAULT (N'IN') FOR [Relation]
GO
ALTER TABLE [dbo].[CL_Conditions] ADD  CONSTRAINT [DF_CL_Conditions_IncludeNull]  DEFAULT ((0)) FOR [IncludeNull]
GO
ALTER TABLE [dbo].[ClientsFilter] ADD  CONSTRAINT [DF_ClientsFilter_HideInList]  DEFAULT ((0)) FOR [HideInList]
GO
ALTER TABLE [dbo].[ClientsLimits] ADD  CONSTRAINT [DF_ClientsLimits_MinValue]  DEFAULT ((0)) FOR [MinValue]
GO
ALTER TABLE [dbo].[ClientsLimits] ADD  CONSTRAINT [DF_ClientsLimits_MaxValue]  DEFAULT ((0)) FOR [MaxValue]
GO
ALTER TABLE [dbo].[FactTable] ADD  CONSTRAINT [DF_FactTable_IsInIndes]  DEFAULT ((0)) FOR [IsInIndex]
GO
ALTER TABLE [dbo].[FactTable] ADD  CONSTRAINT [DF_FactTable_IsVariableCoupon]  DEFAULT ((0)) FOR [IsVariableCoupon]
GO
ALTER TABLE [dbo].[FactTable] ADD  CONSTRAINT [DF_FactTable_is_bank]  DEFAULT ((0)) FOR [is_bank]
GO
ALTER TABLE [dbo].[SL_Events] ADD  CONSTRAINT [DF_SL_Events_Readed]  DEFAULT ((0)) FOR [Readed]
GO
ALTER TABLE [dbo].[CL_Conditions]  WITH CHECK ADD  CONSTRAINT [FK_CL_Conditions_CL_Objects] FOREIGN KEY([ObjectId])
REFERENCES [dbo].[CL_Objects] ([Id])
GO
ALTER TABLE [dbo].[CL_Conditions] CHECK CONSTRAINT [FK_CL_Conditions_CL_Objects]
GO
ALTER TABLE [dbo].[CL_Conditions]  WITH CHECK ADD  CONSTRAINT [FK_CL_Conditions_CL_Params] FOREIGN KEY([ParamId])
REFERENCES [dbo].[CL_Params] ([Id])
GO
ALTER TABLE [dbo].[CL_Conditions] CHECK CONSTRAINT [FK_CL_Conditions_CL_Params]
GO
ALTER TABLE [dbo].[CL_Objects]  WITH CHECK ADD  CONSTRAINT [FK_CL_Objects_CL] FOREIGN KEY([CLId])
REFERENCES [dbo].[CL] ([Id])
GO
ALTER TABLE [dbo].[CL_Objects] CHECK CONSTRAINT [FK_CL_Objects_CL]
GO
/****** Object:  StoredProcedure [dbo].[_tmp_FillingScalesLimitGF]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[_tmp_FillingScalesLimitGF]
AS
BEGIN

	DECLARE	@LimitId int	=	10119

	DECLARE @Id int
	DECLARE @ParamNo int
	DECLARE @Name nvarchar(250)
	DECLARE @Ok nvarchar(250)
	DECLARE @NotOk nvarchar(250)

	DECLARE @Inn_Id int
	DECLARE @Inn_ParamNo int
	DECLARE @Inn_Name nvarchar(250)
	DECLARE @Inn_Ok nvarchar(250)
	DECLARE @Inn_NotOk nvarchar(250)

	DECLARE @ObjectId	int	=	0

	DECLARE MainCur CURSOR FOR 
	SELECT [Id],[ParamNo],[Name],[Ok],[NotOk] FROM _tmp_Scales

	OPEN MainCur

	FETCH NEXT FROM MainCur INTO @Id,@ParamNo,@Name,@Ok,@NotOk

	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		
		INSERT INTO CL_Objects([CLId],[Name]) VALUES (@LimitId, @Name)
		SELECT @ObjectId = @@IDENTITY

		

		INSERT INTO [CL_Conditions]([ObjectId],[ParamId],[Relation],[ValuesList],[IncludeNull])
			VALUES (@ObjectId, 100, 'IN', '''акция'' ,''облигация'' ,''Депозит'' ,''дс''', 0)

		INSERT INTO [CL_Conditions]([ObjectId],[ParamId],[Relation],[ValuesList],[IncludeNull])
			VALUES (@ObjectId, @ParamNo, 'IN', @NotOk, 0)

		print CONVERT(nvarchar, @ParamNo) + ' = ' + @Name + ' {' + @NotOk + '}  ObjId = ' + CONVERT(nvarchar, @ObjectId)

		/* Inner cursor	*/

			DECLARE Inn_Cur CURSOR FOR 
				SELECT [Id],[ParamNo],[Name],[Ok],[NotOk] FROM _tmp_Scales WHERE [ParamNo] <> @ParamNo
			OPEN Inn_Cur

			FETCH NEXT FROM Inn_Cur INTO @Inn_Id,@Inn_ParamNo,@Inn_Name,@Inn_Ok,@Inn_NotOk

			WHILE @@FETCH_STATUS = 0  
			BEGIN  

				INSERT INTO [CL_Conditions]([ObjectId],[ParamId],[Relation],[ValuesList],[IncludeNull])
					VALUES (@ObjectId, @Inn_ParamNo, 'NOT IN', @Inn_Ok, 1)
				print '--- ' + CONVERT(nvarchar, @Inn_ParamNo) + ' {' + @Inn_Ok + '}'

				FETCH NEXT FROM Inn_Cur INTO @Inn_Id,@Inn_ParamNo,@Inn_Name,@Inn_Ok,@Inn_NotOk
			END

			CLOSE Inn_Cur  
			DEALLOCATE Inn_Cur

		/* Inner cursor	*/


		FETCH NEXT FROM MainCur INTO @Id,@ParamNo,@Name,@Ok,@NotOk
	END

	CLOSE MainCur  
	DEALLOCATE MainCur


END
GO
/****** Object:  StoredProcedure [dbo].[_tmp_pifstructure]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[_tmp_pifstructure]
AS
BEGIN

	DELETE FROM [dbo].[Pif_structure]


	-- Добавляем сопоставленные бумаги
	INSERT INTO [dbo].[Pif_structure]
           ([pifid]
           ,[rid]
           ,[emitents_id]
           ,[quantity]
           ,[summ]
           ,[Type]
           ,[ID_CB]
           ,[CB_Code])
           (
		   
			SELECT 1 AS pifid
				  ,t.rid AS rid
				  ,t.emitents_id AS emitents_id
				  ,CAST(p.[quantity] AS bigint) AS quantity
				  ,p.[summ] AS summ
				  ,NULL AS [Type]
				  ,NULL AS [ID_CB]
				  ,NULL AS [CB_Code]
			  FROM [LC3_dev].[dbo].[_tmp_pif] AS p LEFT JOIN Cache_Tools AS t ON (p.grn = t.state_reg_number)
			  WHERE t.rid IS NOT NULL
		   
		   )

	-- Добавляем дс
	INSERT INTO [dbo].[Pif_structure]
           ([pifid]
           ,[rid]
           ,[emitents_id]
           ,[quantity]
           ,[summ]
           ,[Type]
           ,[ID_CB]
           ,[CB_Code])
           (
		   
			SELECT 1 AS pifid
				  ,NULL AS rid
				  ,'FBCE6509-54DB-45C9-AC8A-8A452869B46F' AS emitents_id
				  ,CAST([summ] AS bigint) AS quantity
				  ,[summ]
				  ,'дс' AS [Type]
				  ,'810' AS [ID_CB]
				  ,'RUB' AS [CB_Code]
			    FROM [LC3_dev].[dbo].[_tmp_pif] WHERE [type] = 'денежные средства'
	)


			SELECT p.*
			  FROM [LC3_dev].[dbo].[_tmp_pif] AS p LEFT JOIN Cache_Tools AS t ON (p.grn = t.state_reg_number)
			  WHERE t.rid IS NULL AND p.[type] <> 'денежные средства'

END
GO
/****** Object:  StoredProcedure [dbo].[_tmp_piftoportf]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[_tmp_piftoportf]
AS
BEGIN

INSERT INTO [dbo].[Cache_CurrentPortfolio]
           ([ForTime]
           ,[CB_Name]
           ,[CB]
           ,[Group]
           ,[ClientName]
           ,[ClientCode]
           ,[CB_Code]
           ,[ID_CB]
           ,[Board]
           ,[Type]
           ,[Quantity]
           ,[MarketValue]
           ,[RegCode]
           ,[ID_CB_SDH]
           ,[ID_Emit_SDH]
           ,[Nominal]
           ,[CurrencyID]
           ,[IsSubordinated])
 (
	 SELECT 
		NULL AS [ForTime],
		NULL AS [CB_Name],
		NULL AS [CB],
		NULL AS [Group],
		NULL AS [ClientName],
        591 AS [ClientCode],
        [CB_Code],
        [ID_CB],
        NULL AS [Board],
        [Type],
        [quantity] AS [Quantity],
        [summ] AS [MarketValue],
        NULL AS [RegCode],
        [rid] AS [ID_CB_SDH],
        [emitents_id] AS [ID_Emit_SDH],
        NULL AS [Nominal],
        1 AS [CurrencyID],
        NULL AS [IsSubordinated]
	  FROM [LC3_dev].[dbo].[Pif_structure] WHERE [pifid] = 1
)


END
GO
/****** Object:  StoredProcedure [dbo].[AddActionLog]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddActionLog]
	@TableName		nvarchar(50),
	@Action			nvarchar(5),
	@Comments		nvarchar(50)
AS
BEGIN
	INSERT INTO [ActionLog]
           ([Time], [UserName], [TableName], [Action], [Comments])
     VALUES
           (GETDATE(), SUSER_NAME(), @TableName, @Action, @Comments)
END



GO
/****** Object:  StoredProcedure [dbo].[AddSinteticPortfs]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddSinteticPortfs]
AS
BEGIN
			INSERT INTO Cache_CurrentPortfolio
						([ForTime]
						,[CB_Name]
						,[CB]
						,[Group]
						,[ClientName]
						,[ClientCode]
						,[CB_Code]
						,[ID_CB]
						,[Board]
						,[Type]
						,[Quantity]
						,[MarketValue]
						,[RegCode]
						,[ID_CB_SDH]
						,[ID_Emit_SDH]
						,[Nominal]
						,[CurrencyID]
						)
		SELECT 
				MIN(p.[ForTime]) AS [ForTime]
			  ,p.[CB_Name]
			  ,p.[CB]
		      ,'Синтетический' AS [Group]
		      ,C.[Name] AS [ClientName]
		      ,sc.[SintId] AS [ClientCode]
			  ,p.[CB_Code]
			  ,p.[ID_CB]
			  ,p.[Board]
			  ,p.[Type]
			  ,SUM(p.[Quantity]) AS [Quantity]
			  ,SUM(p.[MarketValue]) AS [MarketValue]
			  ,p.[RegCode]
			  ,p.[ID_CB_SDH]
			  ,p.[ID_Emit_SDH]
			  ,p.[Nominal]
			  ,p.[CurrencyID]
		  FROM [SintClient_Content] AS sc LEFT JOIN [Cache_CurrentPortfolio] AS p ON (sc.[ClientId] = p.ClientCode) LEFT JOIN SintClient AS c ON (sc.[SintId] = c.[Id])
		  GROUP BY 
			   sc.[SintId]
			  ,c.[Name]
			  ,p.[CB_Name]
			  ,p.[CB]
			  ,p.[CB_Code]
			  ,p.[ID_CB]
			  ,p.[Board]
			  ,p.[Type]
			  ,p.[RegCode]
			  ,p.[ID_CB_SDH]
			  ,p.[ID_Emit_SDH]
			  ,p.[Nominal]
			  ,p.[CurrencyID]	

END
GO
/****** Object:  StoredProcedure [dbo].[AU_AddUpdate]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AU_AddUpdate]
	@contrid		uniqueidentifier,
	@Type			nvarchar(255),
	@Remark			nvarchar(255),
	@InnerName			nvarchar(255)
AS
BEGIN
	
	UPDATE AU_List SET Remark = @Remark, InnerName = @InnerName WHERE contrid = @contrid AND [Type] = @Type

	IF @@ROWCOUNT = 0 
		INSERT INTO [AU_List] ([contrid], [Type], [Remark], InnerName) VALUES (@contrid, @Type, @Remark, @InnerName)
	
END
GO
/****** Object:  StoredProcedure [dbo].[AU_Delete]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AU_Delete]
	@contrid		uniqueidentifier,
	@Type			nvarchar(255)
AS
BEGIN
	
	DELETE FROM AU_List WHERE contrid = @contrid AND [Type] = @Type

END
GO
/****** Object:  StoredProcedure [dbo].[CacheFondPortfolio]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[CacheFondPortfolio]
	@vFondId		int
AS
BEGIN

	DECLARE	@SummAsset		float
	SELECT @SummAsset = SUM([СуммаАктива]) FROM [INF_ClientsInfo]
			WHERE [КодКлиента] IN (SELECT [ClientId] FROM [BACK_Fond_Content] WHERE [FondId] = @vFondId)

	INSERT INTO [dbo].[FactTable]
           ([ClientCode]
           ,[ClientAccount]
           ,[SummAsset]
           ,[Instrument]
           ,[Quantity]
           ,[MarketValue]
           ,[Percent]
           ,[Issuer]
           ,[InstrumentName]
           ,[InstrumentType]
           ,[InstrumentSubtype]
           ,[SecTypeBr]
           ,[Country]
           ,[QuoteSheet]
           ,[OwnType]
           ,[BondsIssueSumm]
           ,[QuoteSDH]
           ,[QuoteSDHAgo]
           ,[VolCirculation]
           ,[contrid]
           ,[Capitalization]
           ,[RedemptionDate]
           ,[SecurityId]
           ,[IssueNum]
           ,[AnnouncedVol]
           ,[DateStartPlacing]
           ,[DateEndPlacing]
           ,[Currency]
           ,[CB_Code]
           ,[ID_CB_SDH]
           ,[StateRegNum]
           ,[MonthAvgVol]
           ,[F_Rating]
           ,[M_Rating]
           ,[SP_Rating]
           ,[E_Rating]
           ,[A_Rating]
           ,[Contr_F_Rating]
           ,[Contr_M_Rating]
           ,[Contr_SP_Rating]
           ,[Contr_E_Rating]
           ,[Contr_A_Rating]
           ,[enddate]
           ,[IsInIndex]
           ,[IsVariableCoupon]
           ,[IsQuantityGrows]
		   ,[is_bank])

	(
		SELECT 1000000 + @vFondId AS [ClientCode]
			  ,@vFondId AS [ClientAccount]
			  ,@SummAsset AS [SummAsset]
			  ,[Instrument]
			  ,SUM([Quantity]) AS Quantity
			  ,SUM([MarketValue]) AS MarketValue
			  , CASE WHEN @SummAsset > 0 THEN 100 * SUM([MarketValue]) / @SummAsset ELSE 0 END AS [Percent]
			  ,[Issuer]
			  ,[InstrumentName]
			  ,[InstrumentType]
			  ,[InstrumentSubtype]
			  ,[SecTypeBr]
			  ,[Country]
			  ,[QuoteSheet]
			  ,[OwnType]
			  ,[BondsIssueSumm]
			  ,[QuoteSDH]
			  ,[QuoteSDHAgo]
			  ,[VolCirculation]
			  ,[contrid]
			  ,[Capitalization]
			  ,[RedemptionDate]
			  ,[SecurityId]
			  ,[IssueNum]
			  ,[AnnouncedVol]
			  ,[DateStartPlacing]
			  ,[DateEndPlacing]
			  ,[Currency]
			  ,[CB_Code]
			  ,[ID_CB_SDH]
			  ,[StateRegNum]
			  ,[MonthAvgVol]
			  ,[F_Rating]
			  ,[M_Rating]
			  ,[SP_Rating]
			  ,[E_Rating]
			  ,[A_Rating]
			  ,[Contr_F_Rating]
			  ,[Contr_M_Rating]
			  ,[Contr_SP_Rating]
			  ,[Contr_E_Rating]
			  ,[Contr_A_Rating]
			  ,[enddate]
			  ,[IsInIndex]
			  ,[IsVariableCoupon]
			  ,[IsQuantityGrows]
			  ,[is_bank]
		  FROM [FactTable]
		  WHERE [ClientCode] IN (SELECT [ClientId] FROM [BACK_Fond_Content] WHERE [FondId] = @vFondId)
		  GROUP BY
			[Instrument]
			   ,[Issuer]
			  ,[InstrumentName]
			  ,[InstrumentType]
			  ,[InstrumentSubtype]
			  ,[SecTypeBr]
			  ,[Country]
			  ,[QuoteSheet]
			  ,[OwnType]
			  ,[BondsIssueSumm]
			  ,[QuoteSDH]
			  ,[QuoteSDHAgo]
			  ,[VolCirculation]
			  ,[contrid]
			  ,[Capitalization]
			  ,[RedemptionDate]
			  ,[SecurityId]
			  ,[IssueNum]
			  ,[AnnouncedVol]
			  ,[DateStartPlacing]
			  ,[DateEndPlacing]
			  ,[Currency]
			  ,[CB_Code]
			  ,[ID_CB_SDH]
			  ,[StateRegNum]
			  ,[MonthAvgVol]
			  ,[F_Rating]
			  ,[M_Rating]
			  ,[SP_Rating]
			  ,[E_Rating]
			  ,[A_Rating]
			  ,[Contr_F_Rating]
			  ,[Contr_M_Rating]
			  ,[Contr_SP_Rating]
			  ,[Contr_E_Rating]
			  ,[Contr_A_Rating]
			  ,[enddate]
			  ,[IsInIndex]
			  ,[IsVariableCoupon]
			  ,[IsQuantityGrows]
			  ,[is_bank]
	)



END
GO
/****** Object:  StoredProcedure [dbo].[CacheFondPortfolio_Model]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CacheFondPortfolio_Model]
	@vFondId		int
AS
BEGIN

	DECLARE	@SummAsset		float
	SELECT @SummAsset = SUM([СуммаАктива]) FROM [INF_ClientsInfo]
			WHERE [КодКлиента] IN (SELECT [ClientId] FROM [BACK_Fond_Content] WHERE [FondId] = @vFondId)

	DELETE FROM [dbo].[Model_FT] WHERE [ClientCode] = (1000000 + @vFondId)
	
	INSERT INTO [dbo].[Model_FT]
           ([UId]
		   ,[ClientCode]
           ,[ClientAccount]
           ,[SummAsset]
           ,[Instrument]
           ,[Quantity]
           ,[MarketValue]
           ,[Percent]
           ,[Issuer]
           ,[InstrumentName]
           ,[InstrumentType]
           ,[InstrumentSubtype]
           ,[SecTypeBr]
           ,[Country]
           ,[QuoteSheet]
           ,[OwnType]
           ,[BondsIssueSumm]
           ,[QuoteSDH]
           ,[QuoteSDHAgo]
           ,[VolCirculation]
           ,[contrid]
           ,[Capitalization]
           ,[RedemptionDate]
           ,[SecurityId]
           ,[IssueNum]
           ,[AnnouncedVol]
           ,[DateStartPlacing]
           ,[DateEndPlacing]
           ,[Currency]
           ,[CB_Code]
           ,[ID_CB_SDH]
           ,[StateRegNum]
           ,[MonthAvgVol]
           ,[F_Rating]
           ,[M_Rating]
           ,[SP_Rating]
           ,[E_Rating]
           ,[A_Rating]
           ,[Contr_F_Rating]
           ,[Contr_M_Rating]
           ,[Contr_SP_Rating]
           ,[Contr_E_Rating]
           ,[Contr_A_Rating]
           ,[enddate]
           ,[IsInIndex]
           ,[IsVariableCoupon]
           ,[IsQuantityGrows]
		   ,[is_bank])

	(
		SELECT [Uid]
				,1000000 + @vFondId AS [ClientCode]
			  ,@vFondId AS [ClientAccount]
			  ,@SummAsset AS [SummAsset]
			  ,[Instrument]
			  ,SUM([Quantity]) AS Quantity
			  ,SUM([MarketValue]) AS MarketValue
			  , CASE WHEN @SummAsset > 0 THEN 100 * SUM([MarketValue]) / @SummAsset ELSE 0 END AS [Percent]
			  ,[Issuer]
			  ,[InstrumentName]
			  ,[InstrumentType]
			  ,[InstrumentSubtype]
			  ,[SecTypeBr]
			  ,[Country]
			  ,[QuoteSheet]
			  ,[OwnType]
			  ,[BondsIssueSumm]
			  ,[QuoteSDH]
			  ,[QuoteSDHAgo]
			  ,[VolCirculation]
			  ,[contrid]
			  ,[Capitalization]
			  ,[RedemptionDate]
			  ,[SecurityId]
			  ,[IssueNum]
			  ,[AnnouncedVol]
			  ,[DateStartPlacing]
			  ,[DateEndPlacing]
			  ,[Currency]
			  ,[CB_Code]
			  ,[ID_CB_SDH]
			  ,[StateRegNum]
			  ,[MonthAvgVol]
			  ,[F_Rating]
			  ,[M_Rating]
			  ,[SP_Rating]
			  ,[E_Rating]
			  ,[A_Rating]
			  ,[Contr_F_Rating]
			  ,[Contr_M_Rating]
			  ,[Contr_SP_Rating]
			  ,[Contr_E_Rating]
			  ,[Contr_A_Rating]
			  ,[enddate]
			  ,[IsInIndex]
			  ,[IsVariableCoupon]
			  ,[IsQuantityGrows]
			  ,[is_bank]
		  FROM [Model_FT]
		  WHERE [ClientCode] IN (SELECT [ClientId] FROM [BACK_Fond_Content] WHERE [FondId] = @vFondId)
		  GROUP BY
			[Uid]
				,[Instrument]
			   ,[Issuer]
			  ,[InstrumentName]
			  ,[InstrumentType]
			  ,[InstrumentSubtype]
			  ,[SecTypeBr]
			  ,[Country]
			  ,[QuoteSheet]
			  ,[OwnType]
			  ,[BondsIssueSumm]
			  ,[QuoteSDH]
			  ,[QuoteSDHAgo]
			  ,[VolCirculation]
			  ,[contrid]
			  ,[Capitalization]
			  ,[RedemptionDate]
			  ,[SecurityId]
			  ,[IssueNum]
			  ,[AnnouncedVol]
			  ,[DateStartPlacing]
			  ,[DateEndPlacing]
			  ,[Currency]
			  ,[CB_Code]
			  ,[ID_CB_SDH]
			  ,[StateRegNum]
			  ,[MonthAvgVol]
			  ,[F_Rating]
			  ,[M_Rating]
			  ,[SP_Rating]
			  ,[E_Rating]
			  ,[A_Rating]
			  ,[Contr_F_Rating]
			  ,[Contr_M_Rating]
			  ,[Contr_SP_Rating]
			  ,[Contr_E_Rating]
			  ,[Contr_A_Rating]
			  ,[enddate]
			  ,[IsInIndex]
			  ,[IsVariableCoupon]
			  ,[IsQuantityGrows]
			  ,[is_bank]
	)



END
GO
/****** Object:  StoredProcedure [dbo].[Caching_ALL]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Caching_ALL]

AS
BEGIN

	EXEC AddActionLog 'CACHE', 'REFR', ''

	EXEC Caching_CurrentPortfolio
	EXEC Caching_Tools
	EXEC Caching_Contragents
	EXEC Caching_Full_Ratings
	EXEC Caching_Month_turnover_3
	EXEC Caching_FactTable

END





GO
/****** Object:  StoredProcedure [dbo].[Caching_Contragents]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- ================================================

CREATE PROCEDURE [dbo].[Caching_Contragents]
AS
BEGIN

	if object_id('Cache_Contragents') is not null BEGIN
		BEGIN TRANSACTION
			DELETE FROM [Cache_Contragents]
			INSERT INTO [Cache_Contragents] ([rid], [name], [own_type], [own_type_name], [country], [country_name], [bonds_issue_sum], [is_bank])
												(SELECT [rid], [name], [own_type], [own_type_name], [country], [country_name], [bonds_issue_sum], [is_bank]
												FROM [SDH_Contragents])
			print 'Table Cache_Contragents filled!'
		COMMIT TRANSACTION
	END	ELSE print 'Table Cache_Contragents does not exist!'

END




GO
/****** Object:  StoredProcedure [dbo].[Caching_CurrentPortfolio]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[Caching_CurrentPortfolio]
AS
BEGIN

	if object_id('Cache_CurrentPortfolio') is not null BEGIN
		
		BEGIN TRANSACTION

			DELETE FROM Cache_CurrentPortfolio

			INSERT INTO Cache_CurrentPortfolio
						([ForTime]
						,[CB_Name]
						,[CB]
						,[Group]
						,[ClientName]
						,[ClientCode]
						,[CB_Code]
						,[ID_CB]
						,[Board]
						,[Type]
						,[Quantity]
						,[MarketValue]
						,[RegCode]
						,[ID_CB_SDH]
						,[ID_Emit_SDH]
						,[Nominal]
						,[CurrencyID]
						,[IsSubordinated]
						)
			SELECT		[datetime] AS [ForTime],
						[НаименованиеИнструмента] AS [CB_Name],
						[Инструмент] AS [CB],
						[Группа] AS [Group],
						[НаименованиеКлиента] AS [ClientName],
						CONVERT(int, [КодКлиента]) AS [ClientCode],
						[КодЦб] AS [CB_Code],
						[ID_CB] AS [ID_CB],
						[РежимТоргов] AS [Board],
						[Typ] AS [Type],
						CONVERT(bigint, [Количество]) AS [Quantity],
						CONVERT(float, [ОценкаПоРынку] + [НКД]) AS [MarketValue],
						[КодРегистрации] AS [RegCode],
						[ID_CB_CXPI] AS [ID_CB_SDH],
						[ID_Emit_CXPI] AS [ID_Emit_SDH],
						CONVERT(real, [Номинал]) AS [Nominal],
						CONVERT(int, [КодВалютаНоминала]) AS [CurrencyID],
						CONVERT(int, [IsSubordinated]) AS [IsSubordinated]
			FROM [CO1-VT-FO1].[Informer].[dbo].[HistoryRestCountOfTredsNotBack]
			WHERE [datetime] = (SELECT MAX([datetime]) FROM [CO1-VT-FO1].[Informer].[dbo].[HistoryRestCountOfTredsNotBack])

			UPDATE Cache_CurrentPortfolio SET [Type] = 'дс' WHERE [Type] = 'рс'

			EXEC AddSinteticPortfs

			DELETE FROM Cache_CurrentPortfolio WHERE [ClientCode] NOT IN (SELECT * FROM _CL_UsedClients)

			/* Удаляем ПИФ */
			--DELETE FROM Cache_CurrentPortfolio WHERE [ID_CB_SDH] = '809FCD87-18EA-4BA1-828F-7B1E20323B44'

			EXEC [Pif_replacing] @Pifid = 1, @ClientCode = 591

			print 'Table Cache_CurrentPortfolio filled!'

			DELETE FROM [LC3_dev].[dbo].[Cache_TodayDeals]

			INSERT INTO [LC3_dev].[dbo].[Cache_TodayDeals]
			(
					[НомерСделки]
				  ,[ВремяСделки]
				  ,[Инструмент]
				  ,[РежимТоргов]
				  ,[НаименованиеИнструмента]
				  ,[Операция]
				  ,[Цена]
				  ,[Количество]
				  ,[Объем]
				  ,[КодКлиента]
			)
			SELECT
					[НомерСделки]
				  ,[ВремяСделки]
				  ,[Инструмент]
				  ,[РежимТоргов]
				  ,[НаименованиеИнструмента]
				  ,[Операция]
				  ,[Цена]
				  ,[Количество]
				  ,[Объем]
				  ,[КодКлиента]
			  FROM [CO1-VT-FO1].[Informer].[dbo].[vvw_AllTradesTodayForLimit]
			  WHERE [Операция] = 'Продажа'



		COMMIT TRANSACTION

	END	ELSE print 'Table Cache_CurrentPortfolio does not exist!'

END





GO
/****** Object:  StoredProcedure [dbo].[Caching_FactTable]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE PROCEDURE [dbo].[Caching_FactTable]
AS
BEGIN

	if object_id('FactTable') is not null BEGIN TRY 
		BEGIN TRANSACTION
			DELETE FROM [FactTable]
			INSERT INTO [FactTable] (
								[ClientCode]
								,[ClientAccount]
								,[SummAsset]
								,[Instrument]
								,[Quantity]
								,[MarketValue]
								,[Percent]
								,[Issuer]
								,[InstrumentName]
								,[InstrumentType]
								,[InstrumentSubtype]
								,[SecTypeBr]
								,[Country]
								,[QuoteSheet]
								,[OwnType]
								,[BondsIssueSumm]
								,[QuoteSDH]
								,[QuoteSDHAgo]
								,[VolCirculation]
								,[contrid]
								,[Capitalization]
								,[RedemptionDate]
								,[SecurityId]
								,[IssueNum]
								,[AnnouncedVol]
								,[DateStartPlacing]
								,[DateEndPlacing]
								,[Currency]
								,[CB_Code]
								,[ID_CB_SDH]
								,[StateRegNum]
								,[MonthAvgVol]
								,[F_Rating]
								,[M_Rating]
								,[SP_Rating]
								,[E_Rating]
								,[A_Rating]
								,[Contr_F_Rating]
								,[Contr_M_Rating]
								,[Contr_SP_Rating]
								,[Contr_E_Rating]
								,[Contr_A_Rating]
								,[enddate]
								,[is_bank]
								,[for_qual_investors]
								,[NKR_Rating]
								,[NRA_Rating]
								,[Contr_NKR_Rating]
								,[Contr_NRA_Rating]								
								,[IsSubordinated]
								)
					(SELECT
								[ClientCode]
								,[ClientAccount]
								,[SummAsset]
								,[Instrument]
								,[Quantity]
								,[MarketValue]
								,[Percent]
								,[Issuer]
								,RTRIM([InstrumentName]) AS [InstrumentName]
								,[InstrumentType]
								,[InstrumentSubtype]
								,[SecTypeBr]
								,[Country]
								,[QuoteSheet]
								,[OwnType]
								,[BondsIssueSumm]
								,[QuoteSDH]
								,[QuoteSDHAgo]
								,[VolCirculation]
								,[contrid]
								,[Capitalization]
								,[RedemptionDate]
								,[SecurityId]
								,[IssueNum]
								,[AnnouncedVol]
								,[DateStartPlacing]
								,[DateEndPlacing]
								,[Currency]
								,[CB_Code]
								,[ID_CB_SDH]
								,[StateRegNum]
								,[MonthAvgVol]
								,[F_Rating]
								,[M_Rating]
								,[SP_Rating]
								,[E_Rating]
								,[A_Rating]
								,[Contr_F_Rating]
								,[Contr_M_Rating]
								,[Contr_SP_Rating]
								,[Contr_E_Rating]
								,[Contr_A_Rating]
								,[enddate]
								,[is_bank]
								,[for_qual_investors]
								,[NKR_Rating]
								,[NRA_Rating]
								,[Contr_NKR_Rating]
								,[Contr_NRA_Rating]
								,[IsSubordinated]
						FROM [FT_tmp]
					)
																					
			UPDATE [FactTable] SET IsInIndex = 1 WHERE [Instrument] IN (SELECT [ticker] FROM [SDH_RTSICompose])
			UPDATE [FactTable] SET IsVariableCoupon = 1 WHERE ID_CB_SDH IN (SELECT [rid] FROM [SDH].[SDH].[dbo].[issue_bonds] WHERE [rate_type] = 3)
			UPDATE [FactTable] SET DaysToRedemption = DATEDIFF(DAY, GETDATE(), [RedemptionDate]) WHERE [RedemptionDate] IS NOT NULL


			-- Выбираем где остаток увеличился за 3 дня
			UPDATE f Set IsQuantityGrows = (CASE WHEN f.[Quantity] > ISNULL(h.[Quantity], 0) THEN 1 ELSE 0 END)
				FROM dbo.FactTable AS f LEFT JOIN
					(SELECT * FROM [LC3_History].[dbo].[FactTable_History]
						WHERE [Arch_date] = (SELECT MAX([Arch_date]) FROM [LC3_History].[dbo].[FactTable_History] WHERE [Arch_date] < DATEADD(d, -3, GETDATE()))
					) AS h ON (f.[ClientCode] = h.[ClientCode] AND f.[CB_Code] = h.[CB_Code])

			
			PRINT 'Table FactTable filled!'
			exec FT_to_History

			--	Кешируем сделки репо
			
			DELETE FROM [REPODeals]
			INSERT INTO [dbo].[REPODeals]
					   ([КодКлиента]
					   ,[Инструмент]
					   ,[НаименованиеИнструмента]
					   ,[Дата первой части сделки]
					   ,[СрокРепо]
					   ,[Направление первой части]
					   ,[Количество]
					   ,[Цена первой части]
					   ,[Цена второй части]
					   ,[ID_CB_CXPI]
					   ,[ID_Emit_CXPI]
					   ,nominal)
			(
				SELECT t.*, b.[nominal_price] FROM
				(SELECT [КодКлиента]
								  ,[Инструмент]
								  ,[НаименованиеИнструмента]
								  ,[Дата первой части сделки]
								  ,[СрокРепо]
								  ,[Направление первой части]
								  ,[Количество]
								  ,[Цена первой части]
								  ,[Цена второй части]
								  ,[ID_CB_CXPI]
								  ,[ID_Emit_CXPI]
							  FROM [CO1-VT-FO1].[Informer].[dbo].[vw_RepoPlanedPortfolioForLimit]
							  WHERE [DATETIME] < (SELECT MAX(ForTime) FROM [Cache_CurrentPortfolio])
				) AS t LEFT JOIN SDH_Bonds AS b ON (t.[ID_CB_CXPI] = b.[rid])			

			)
				  


			--	Добавляем фонды

			DECLARE	@FondId	int

			DECLARE FondCur CURSOR FOR 
				SELECT [FondId] FROM [BACK_Fonds]
			OPEN FondCur

			FETCH NEXT FROM FondCur INTO @FondId

			WHILE @@FETCH_STATUS = 0  
			BEGIN  
				EXEC CacheFondPortfolio @FondId
				FETCH NEXT FROM FondCur INTO @FondId
			END

			CLOSE FondCur  
			DEALLOCATE FondCur

			PRINT 'Transaction ok!'

		COMMIT TRANSACTION
	END TRY  
	BEGIN CATCH 
		ROLLBACK TRANSACTION
	END CATCH 
	ELSE PRINT 'Table FactTable does not exist!'

END













GO
/****** Object:  StoredProcedure [dbo].[Caching_Full_Ratings]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- ================================================

CREATE PROCEDURE [dbo].[Caching_Full_Ratings]
AS
BEGIN

	if object_id('Cache_Full_Ratings') is not null BEGIN
		BEGIN TRANSACTION
			DELETE FROM [Cache_Full_Ratings]
			EXEC Object_Full_Rating 1					--	Рейтинг контрагентов
			EXEC Object_Full_Rating 2					--	Рейтинг выпусков
			print 'Table Cache_Full_Ratings filled!'
		COMMIT TRANSACTION
	END	ELSE print 'Table Cache_Full_Ratings does not exist!'

END




GO
/****** Object:  StoredProcedure [dbo].[Caching_Month_turnover_3]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Caching_Month_turnover_3]
AS
BEGIN

	IF Object_Id('tempdb..#Month_turnovers') is not null DROP TABLE #Month_turnovers
	CREATE TABLE #Month_turnovers (	Month_ago	int NOT NULL, 
									tickerid	uniqueidentifier NULL,
									ticker		nvarchar(20) NULL,
									turnover	numeric(32, 10) NULL,
									ObjectId	uniqueidentifier NULL
								)

	EXEC Month_turnover 1
	EXEC Month_turnover 2
	EXEC Month_turnover 3


	BEGIN TRANSACTION 

	BEGIN TRY

		DELETE FROM Cache_MonthTurnovers

		INSERT INTO Cache_MonthTurnovers ([ObjectId], [ticker], [turn1], [turn2], [turn3], [IsBig])
		(
			SELECT ISNULL(MA1.ObjectId, ISNULL(MA2.ObjectId, MA3.ObjectId)) AS ObjectId, ISNULL(MA1.ticker, ISNULL(MA2.ticker, MA3.ticker)) AS ticker,
					 MA1.turnover AS turn1, MA2.turnover AS turn2, MA3.turnover AS turn3,
					 CASE WHEN (MA1.turnover > 500000) AND (MA2.turnover > 500000) AND (MA3.turnover > 500000) THEN 1 ELSE 0 END AS IsBig
					 FROM
			(SELECT ObjectId, ticker, turnover FROM #Month_turnovers WHERE Month_ago = 1) AS MA1
				FULL OUTER JOIN
			(SELECT ObjectId, ticker, turnover FROM #Month_turnovers WHERE Month_ago = 2) AS MA2 ON (MA1.ObjectId = MA2.ObjectId)
				FULL OUTER JOIN
			(SELECT ObjectId, ticker, turnover FROM #Month_turnovers WHERE Month_ago = 3) AS MA3 ON (MA1.ObjectId = MA3.ObjectId)
		)

		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH

		ROLLBACK TRANSACTION

	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[Caching_Tools]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- ================================================

CREATE PROCEDURE [dbo].[Caching_Tools]
AS
BEGIN

	if object_id('Cache_Tools') is not null BEGIN
		BEGIN TRANSACTION
			DELETE FROM [Cache_Tools]
			INSERT INTO [Cache_Tools] (
				[rid],[emitents_id],[number_of_emission],[state_reg_number],[redemptiondate],[announced_volume],[vol_circulations],[type],[subtype],[date_of_end_placing],[date_of_start_placing],
				[ticker],[tickerid],[begdate],[enddate],[tender_days_ago],[admittedquote],[volume_avg],[qsheet_code],[qsheet],[SecTypeBr],[for_qual_investors],[is_subordinated]
			)									
			(SELECT t.[rid],[emitents_id],[number_of_emission],[state_reg_number],[redemptiondate],[announced_volume],[vol_circulations],[type],[subtype],[date_of_end_placing],[date_of_start_placing],
						[ticker],[tickerid],[begdate],[enddate],[tender_days_ago],[admittedquote],[volume_avg],aqs.[qsheet],aqs.[name],t.sec_type_br, t.for_qual_investors, t.is_subordinated
												FROM [SDH_Tools] AS t LEFT JOIN [SDH_Active_Sheets] AS aqs ON (t.rid = aqs.rid))
			print 'Table Cache_Tools filled!'
		COMMIT TRANSACTION
	END	ELSE print 'Table Cache_Tools does not exist!'

END



GO
/****** Object:  StoredProcedure [dbo].[CheckLimit]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckLimit]
	@LimitId int,
	@ClientCode int = NULL
AS
BEGIN

	SET NOCOUNT ON	
		
	declare @LimitView varchar(250) = 'CL_Limit_' + CONVERT(nvarchar,  @LimitId)
	
	if @LimitView is null
		return
		
	declare @LimitCheckSql nvarchar(max) = 
		'select t.* from
			(select lv.*, 
					case when ISNULL(lv.LimitValue, 0) < cl.MinValue then 11												-- LimitCheckFailLevel.LowerFail
						when ISNULL(lv.LimitValue, 0) > cl.MaxValue then 12												-- LimitCheckFailLevel.UpperFail
						when (ISNULL(lv.LimitValue, 0) < cl.LowerWarning) and (ISNULL(lv.LimitValue, 0) >= cl.MinValue) then 1		-- LimitCheckFailLevel.LowerWarning
						when (ISNULL(lv.LimitValue, 0) > cl.UpperWarning) and (ISNULL(lv.LimitValue, 0) <= cl.MaxValue) then 2		-- LimitCheckFailLevel.UpperWarning
						else 0																					-- LimitCheckFailLevel.NoFail
					end as FailLevel,
					CONVERT(float, cl.MinValue) AS Мин,
					CONVERT(float, cl.MaxValue) AS Макс
			from dbo.' + @LimitView + ' lv
			right join dbo.ClientsLimits cl on lv.ClientCode = cl.ClientCode
			where cl.IsActive = 1 and
				cl.LimitId = @pLimitId and
				(cl.ClientCode = @pClientCode or @pClientCode is null)
			) AS t'

	print @LimitCheckSql
			
	exec sp_executesql @LimitCheckSql, N'@pLimitId int, @pClientCode int', @pLimitId = @LimitId, @pClientCode = @ClientCode

END




GO
/****** Object:  StoredProcedure [dbo].[CheckLimit_3]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckLimit_3]
	@LimitId int,
	@ClientCode int = NULL
AS
BEGIN

	SET NOCOUNT ON	
		
	declare @LimitView varchar(250) = 'CL_Limit_' + CONVERT(nvarchar,  @LimitId)
	
	if @LimitView is null
		return
		
	declare @LimitCheckSql nvarchar(max) = 
		'select t.* from
			(select lv.*, 
					case when lv.LimitValue < cl.MinValue then 11												-- LimitCheckFailLevel.LowerFail
						when lv.LimitValue > cl.MaxValue then 12												-- LimitCheckFailLevel.UpperFail
						when (lv.LimitValue < cl.LowerWarning) and (lv.LimitValue >= cl.MinValue) then 1		-- LimitCheckFailLevel.LowerWarning
						when (lv.LimitValue > cl.UpperWarning) and (lv.LimitValue <= cl.MaxValue) then 2		-- LimitCheckFailLevel.UpperWarning
						else 0																					-- LimitCheckFailLevel.NoFail
					end as FailLevel,
					CONVERT(float, cl.MinValue) AS Мин,
					CONVERT(float, cl.MaxValue) AS Макс
			from dbo.' + @LimitView + ' lv
			inner join dbo.ClientsLimits cl on lv.ClientCode = cl.ClientCode
			where cl.IsActive = 1 and
				cl.LimitId = @pLimitId and
				(cl.ClientCode = @pClientCode or @pClientCode is null)
			) AS t'

	print @LimitCheckSql
			
	exec sp_executesql @LimitCheckSql, N'@pLimitId int, @pClientCode int', @pLimitId = @LimitId, @pClientCode = @ClientCode

END




GO
/****** Object:  StoredProcedure [dbo].[CheckLimitOnTable]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[CheckLimitOnTable]
	@TableName	nvarchar(250),
	@LimitId int,
	@ClientCode int = NULL
AS
BEGIN

	SET NOCOUNT ON	

	declare @IsComplex bit 
	declare @LimitView varchar(250)
	SELECT @IsComplex = IsComplex FROM CL WHERE Id = @LimitId
	IF (@IsComplex <> 0) SET @LimitView = 'CL_Limit_' + CONVERT(nvarchar,  @LimitId)
		ELSE SELECT @LimitView = LimitQuery FROM CL WHERE Id = @LimitId

	--PRINT @LimitView

	--SELECT text FROM syscomments WHERE id = OBJECT_ID('CL_Limit_10116')

	declare @ViewQuery nvarchar(MAX)	=	''
	DECLARE	@vText	nvarchar(MAX)

			DECLARE Inn_Cur CURSOR FOR 
			SELECT text FROM syscomments WHERE id = OBJECT_ID(@LimitView)
			OPEN Inn_Cur
			FETCH NEXT FROM Inn_Cur INTO @vText

			WHILE @@FETCH_STATUS = 0  
			BEGIN  
				SET @ViewQuery	=	@ViewQuery + @vText
				FETCH NEXT FROM Inn_Cur INTO @vText
			END
			CLOSE Inn_Cur  
			DEALLOCATE Inn_Cur


	--SELECT @ViewQuery = [VIEW_DEFINITION] FROM [LC3_dev].[INFORMATION_SCHEMA].[VIEWS] WHERE [TABLE_NAME] = @LimitView
	declare @BegPos	int	=	PATINDEX('%AS%',@ViewQuery) + 3

	SET @ViewQuery = SUBSTRING(@ViewQuery, @BegPos, LEN(@ViewQuery) - @BegPos + 1)

	SET @ViewQuery = REPLACE(@ViewQuery, 'FactTable', '@#$ ');
	SET @ViewQuery = REPLACE(@ViewQuery, '[FactTable]', '@#$ ');
	SET @ViewQuery = REPLACE(@ViewQuery, 'FT_NoRepo', '@#$');
	SET @ViewQuery = REPLACE(@ViewQuery, '@#$', @TableName);

	PRINT @ViewQuery
	--	Получили текст запроса на проверку

	declare @LimitCheckSql nvarchar(max) = 
		'select t.* from
			(select lv.*, 
					case when ISNULL(lv.LimitValue, 0) < cl.MinValue then 11												-- LimitCheckFailLevel.LowerFail
						when ISNULL(lv.LimitValue, 0) > cl.MaxValue then 12												-- LimitCheckFailLevel.UpperFail
						when (ISNULL(lv.LimitValue, 0) < cl.LowerWarning) and (ISNULL(lv.LimitValue, 0) >= cl.MinValue) then 1		-- LimitCheckFailLevel.LowerWarning
						when (ISNULL(lv.LimitValue, 0) > cl.UpperWarning) and (ISNULL(lv.LimitValue, 0) <= cl.MaxValue) then 2		-- LimitCheckFailLevel.UpperWarning
						else 0																					-- LimitCheckFailLevel.NoFail
					end as FailLevel,
					CONVERT(float, cl.MinValue) AS Мин,
					CONVERT(float, cl.MaxValue) AS Макс
			from (' + @ViewQuery + ') AS lv
			right join dbo.ClientsLimits cl on lv.ClientCode = cl.ClientCode
			where cl.IsActive = 1 and
				cl.LimitId = @pLimitId and
				(cl.ClientCode = @pClientCode or @pClientCode is null)
			) AS t'

	--print @LimitCheckSql

	exec sp_executesql @LimitCheckSql, N'@pLimitId int, @pClientCode int', @pLimitId = @LimitId, @pClientCode = @ClientCode


END




GO
/****** Object:  StoredProcedure [dbo].[CheckWarning]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CheckWarning]
AS
BEGIN

	SELECT * FROM CL_Warning ORDER BY ClientCode

END



GO
/****** Object:  StoredProcedure [dbo].[CL_AddGroupContent]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CL_AddGroupContent]
	@GroupId			int,
	@contrid			uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON
	UPDATE CL_GroupsContent SET [GroupId] = @GroupId, [contrid] = @contrid WHERE [GroupId] = @GroupId AND [contrid] = @contrid
	IF @@ROWCOUNT = 0 INSERT INTO CL_GroupsContent([GroupId], [contrid]) VALUES (@GroupId, @contrid)
END


GO
/****** Object:  StoredProcedure [dbo].[CL_AddSubGroup]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CL_AddSubGroup]
	@ParentId		int,
	@ChildId		int
AS
BEGIN
	SELECT * FROM [CL_SubGroup] WHERE ParentId = @ParentId AND ChildId = @ChildId
	IF @@ROWCOUNT = 0 
		INSERT INTO [CL_SubGroup] ([ParentId],[ChildId])
				VALUES (@ParentId, @ChildId)
END

GO
/****** Object:  StoredProcedure [dbo].[CL_AddUpdate_Group]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CL_AddUpdate_Group]
	@GroupName		nvarchar(50),
	@Id				int		=	0
AS
BEGIN
	SET NOCOUNT ON
	IF @Id = 0
		INSERT INTO [CL_Groups] ([Rid], [GroupName]) VALUES (NEWID(), @GroupName)
	ELSE 
		UPDATE [CL_Groups] SET [GroupName] = @GroupName WHERE [Id] = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[CL_AddUpdateCL]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CL_AddUpdateCL]
	@LimitId int,
	@ClientCode int,
	@IsActive bit,
	@MinValue decimal(18,10),
	@MaxValue decimal(18,10),
	@LowerWarning decimal(18,10),
	@UpperWarning decimal(18,10)
AS
BEGIN

	UPDATE [dbo].[ClientsLimits]
	   SET [IsActive] = @IsActive, 
		   [MinValue] = @MinValue,
		   [MaxValue] = @MaxValue,
		   [LowerWarning] = @LowerWarning,
		   [UpperWarning] = @UpperWarning
	 WHERE [LimitId] = @LimitId AND [ClientCode] = @ClientCode

	 IF @@ROWCOUNT = 0 
		INSERT INTO [ClientsLimits]
			   ([LimitId], [ClientCode], [IsActive], [MinValue], [MaxValue], [LowerWarning], [UpperWarning])
		 VALUES
			   (@LimitId,  @ClientCode, @IsActive, @MinValue, @MaxValue,  @LowerWarning, @UpperWarning)

	DECLARE	@Comment	nvarchar(50);
	SET @Comment	=	CONVERT(nvarchar(10), @LimitId) + '_' + CONVERT(nvarchar(10), @ClientCode);

	EXEC AddActionLog 'CL', 'AUD', @Comment

END
GO
/****** Object:  StoredProcedure [dbo].[CL_AddUpdateRestriction]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[CL_AddUpdateRestriction]
	@ClientId		int,
	@Type			nvarchar(5),
	@rid			uniqueidentifier,
	@LimitType		nvarchar(1),
	@LimitValue		float,
	@Echelon		nvarchar(10)	=	NULL
AS
BEGIN

	IF  @LimitType = 'D' AND @LimitValue = 0
		DELETE FROM [dbo].[RestrictList] WHERE [ClientId] = @ClientId AND [rid] = @rid AND [Type] = @Type
	ELSE BEGIN

		UPDATE [dbo].[RestrictList] SET [LimitType] = @LimitType, [LimitValue] = @LimitValue, [Echelon] = @Echelon
		WHERE [ClientId] = @ClientId AND [rid] = @rid AND [Type] = @Type

		IF @@ROWCOUNT = 0 
			 INSERT INTO [dbo].[RestrictList] ([ClientId], [Type], [rid], [LimitType], [LimitValue], [Echelon])
										VALUES	(@ClientId, @Type, @rid, @LimitType, @LimitValue, @Echelon)

	END

	DECLARE	@Comment	nvarchar(70);
	SET @Comment	=	@Type + ' ' + CONVERT(nvarchar(7), @ClientId) + ' ' + CONVERT(nvarchar(40), @rid) + ' ' + CONVERT(nvarchar(20), @LimitValue) + ' ' + @LimitType

	EXEC AddActionLog 'RestrictList', 'AUD', @Comment

END
GO
/****** Object:  StoredProcedure [dbo].[CL_Delete_Group]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CL_Delete_Group]
	@Id				int
AS
BEGIN
	SET NOCOUNT ON
	DELETE FROM [CL_Groups] WHERE [Id] = @Id
END




GO
/****** Object:  StoredProcedure [dbo].[CL_DeleteGroupContent]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CL_DeleteGroupContent]
	@GroupId			int,
	@contrid			uniqueidentifier
AS
BEGIN

	SET NOCOUNT ON
	DELETE FROM CL_GroupsContent  WHERE [GroupId] = @GroupId AND [contrid] = @contrid

END


GO
/****** Object:  StoredProcedure [dbo].[CL_DeleteLimit]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[CL_DeleteLimit]
		@LimitId		int
AS
BEGIN

	DELETE FROM CL_Conditions WHERE ObjectId IN (SELECT ID FROM CL_Objects WHERE CLId	=	@LimitId)
	DELETE FROM CL_Objects WHERE CLId	=	@LimitId
	DELETE FROM CL WHERE Id	=	@LimitId

END




GO
/****** Object:  StoredProcedure [dbo].[CL_DeleteObject]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[CL_DeleteObject]
		@ObjectId		int
AS
BEGIN

	DELETE FROM CL_Conditions WHERE ObjectId = @ObjectId
	DELETE FROM CL_Objects WHERE Id	=	@ObjectId

	exec CL_FormCondByObject @ObjectId

END




GO
/****** Object:  StoredProcedure [dbo].[CL_DeleteSubGroup]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CL_DeleteSubGroup]
	@ParentId		int,
	@ChildId		int
AS
BEGIN

	DELETE FROM [CL_SubGroup] WHERE ParentId = @ParentId AND ChildId = @ChildId

END

GO
/****** Object:  StoredProcedure [dbo].[CL_FormCondByObject]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CL_FormCondByObject]
	@ObjectId	int
AS
BEGIN
	DECLARE	@LimitId	int	=	(SELECT Top 1 CLId FROM CL_Objects WHERE Id = @ObjectId)
	exec CL_FormCondition @LimitId
END
GO
/****** Object:  StoredProcedure [dbo].[CL_FormCondition]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[CL_FormCondition]
	@LimitId		int	=	0
AS
BEGIN

	IF @LimitId > 0 BEGIN

		DECLARE @GroupByEmit	bit	=	(SELECT GroupByEmit FROM CL WHERE Id = @LimitId)
		DECLARE @GroupByInstr	bit	=	(SELECT GroupByInstr FROM CL WHERE Id = @LimitId)
		DECLARE @Cond	nvarchar(MAX)	=	[dbo].[CL_Limit_Conditions] (@LimitId)
		DECLARE @FTName	nvarchar(MAX)	=	(SELECT ftl.TableName FROM CL AS cl LEFT JOIN FactTablesList as ftl ON (cl.FTId = ftl.Id) WHERE CL.Id = @LimitId)
		UPDATE CL SET Condition = @Cond WHERE Id = @LimitId
		DECLARE @EmitGrpStr	nvarchar(50);
		IF @GroupByEmit = 0 SET @EmitGrpStr = '' ELSE SET @EmitGrpStr = ', [Issuer]'
		DECLARE @InstrGrpStr	nvarchar(50);
		IF @GroupByInstr = 0 SET @InstrGrpStr = '' ELSE SET @InstrGrpStr = ', [InstrumentName], [StateRegNum]'

		DECLARE @SqlTxt	nvarchar(MAX) = 'SELECT [ClientCode], [ClientAccount], [SummAsset]' + @EmitGrpStr + @InstrGrpStr + 
				', SUM(MarketValue) AS [SumMarketValue], CONVERT(decimal(18, 10), SUM([Percent])) AS [SumPercent]
				 FROM ' + @FTName +
				'
				 WHERE (MarketValue IS NOT NULL) '
		IF LEN(@Cond) > 0 SET @SqlTxt = @SqlTxt + 'AND ' + @Cond
		SET @SqlTxt = @SqlTxt + ' GROUP BY [ClientCode], [ClientAccount], [SummAsset]' + @EmitGrpStr + @InstrGrpStr
		SET @SqlTxt = 'ALTER VIEW CL_Limit_' + convert(nvarchar, @LimitId) + ' AS SELECT t.*, t.[SumPercent] AS LimitValue FROM 
			(
				' + @SqlTxt +'
			) AS t'
		SELECT @SqlTxt
		EXEC sp_executesql @SqlTxt

	END

END









GO
/****** Object:  StoredProcedure [dbo].[CL_SaveObjectParam]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[CL_SaveObjectParam]
	@ObjectId			int,
	@ParamId			int,
	@Relation			nvarchar(50),
	@ValuesList			nvarchar(max),
	@IncludeNull		bit
	
AS
BEGIN

	SET NOCOUNT ON

	IF @Relation = '' 
		DELETE FROM CL_Conditions WHERE ObjectId = @ObjectId AND ParamId = @ParamId
	ELSE BEGIN

		UPDATE CL_Conditions SET Relation = @Relation, ValuesList = @ValuesList, IncludeNull = @IncludeNull
		WHERE ObjectId = @ObjectId AND ParamId = @ParamId
		
		IF @@ROWCOUNT = 0
			INSERT INTO CL_Conditions(ObjectId, ParamId, Relation, ValuesList, IncludeNull)	
					VALUES 	(@ObjectId, @ParamId, @Relation, @ValuesList, @IncludeNull)	
			
	END

	exec CL_FormCondByObject @ObjectId

END






GO
/****** Object:  StoredProcedure [dbo].[CL_SelectObjectConditions]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ================================================

CREATE PROCEDURE [dbo].[CL_SelectObjectConditions]
	@ObjectId	int
AS
BEGIN
		SELECT [ParamId],[Relation],[ValuesList],[IncludeNull] FROM [dbo].[CL_Conditions] WHERE [ObjectId] = @ObjectId
END



GO
/****** Object:  StoredProcedure [dbo].[CL_SelectParamList]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CL_SelectParamList]
	@ParamTable	nvarchar(50)
AS
BEGIN

	DECLARE	@PlSQL	nvarchar(250)	=	'SELECT Id, Value, Name FROM ' + @ParamTable + ' ORDER BY Id'
	EXEC sp_executesql @PlSQL

END



GO
/****** Object:  StoredProcedure [dbo].[CL_SelectParams]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CL_SelectParams]
AS
BEGIN
	SELECT [Id], [ColumnName], [Name], [ListTable] FROM [dbo].[CL_Params] ORDER BY [Id]
END



GO
/****** Object:  StoredProcedure [dbo].[CL_UpdateLimit]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[CL_UpdateLimit]
	@LimitId		int,
	@Name			nvarchar(255),
	@GroupByEmit	bit,
	@GroupByInstr	bit,
	@IsComplex		bit,
	@LimitQuery		nvarchar(MAX),
	@FtId			int	=	1
AS
BEGIN

	DECLARE	@vLimitId	int	=	@LimitId

	IF @LimitId > 0 BEGIN
		UPDATE CL SET Name = @Name, GroupByEmit = @GroupByEmit, GroupByInstr = @GroupByInstr, IsComplex = @IsComplex, LimitQuery = @LimitQuery, FTId = @FtId WHERE Id = @LimitId
		EXEC [CL_FormCondition] @LimitId
	END

	IF (@LimitId < 1) OR (@@ROWCOUNT = 0) BEGIN
		INSERT INTO CL(Name, GroupByEmit, GroupByInstr, IsComplex, LimitQuery, OwnerName, FTId) VALUES(@Name, @GroupByEmit, @GroupByInstr, @IsComplex, @LimitQuery, SUSER_NAME(), @FtId)
		SET @vLimitId	=	@@IDENTITY
		EXEC [CL_FormCondition] @vLimitId
	END

	IF (@IsComplex = 0) BEGIN
		DECLARE	@AltSQL	nvarchar(MAX)	=	'ALTER VIEW dbo.CL_Limit_' + convert(nvarchar, @vLimitId) + ' AS SELECT * FROM ' + @LimitQuery	
		EXEC sp_executesql @AltSQL
	END



END










GO
/****** Object:  StoredProcedure [dbo].[CL_UpdateObject]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CL_UpdateObject]
	@ObjectId	int,
	@Name		nvarchar(255),
	@LimitId	int
AS
BEGIN

	IF @ObjectId > 0 
		UPDATE CL_Objects SET Name = @Name WHERE Id = @ObjectId

	IF (@ObjectId < 1) OR (@@ROWCOUNT = 0) 
		INSERT INTO CL_Objects(CLId, Name) VALUES(@LimitId, @Name)

END




GO
/****** Object:  StoredProcedure [dbo].[Copy_RestrList]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Copy_RestrList]
	@RLFrom		int,
	@RLTo		int
AS
BEGIN

	DELETE FROM [dbo].[RestrictList]
	WHERE [ClientId] = @RLTo

	INSERT INTO [dbo].[RestrictList]
			   ([ClientId]
			   ,[Type]
			   ,[rid]
			   ,[LimitType]
			   ,[LimitValue]
			   ,[Echelon])
	(
		SELECT @RLTo AS [ClientId]
			  ,[Type]
			  ,[rid]
			  ,[LimitType]
			  ,[LimitValue]
			  ,[Echelon]
		  FROM [dbo].[RestrictList]
		WHERE [ClientId] = @RLFrom
	)

END
GO
/****** Object:  StoredProcedure [dbo].[FT_to_History]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[FT_to_History]
AS
BEGIN

	INSERT INTO [LC3_History].[dbo].[FactTable_History]
			   ([Arch_date]
			   ,[ClientCode]
			   ,[ClientAccount]
			   ,[SummAsset]
			   ,[Instrument]
			   ,[Quantity]
			   ,[MarketValue]
			   ,[Percent]
			   ,[Issuer]
			   ,[InstrumentName]
			   ,[InstrumentType]
			   ,[InstrumentSubtype]
			   ,[SecTypeBr]
			   ,[Country]
			   ,[QuoteSheet]
			   ,[OwnType]
			   ,[BondsIssueSumm]
			   ,[QuoteSDH]
			   ,[QuoteSDHAgo]
			   ,[VolCirculation]
			   ,[contrid]
			   ,[Capitalization]
			   ,[RedemptionDate]
			   ,[SecurityId]
			   ,[IssueNum]
			   ,[AnnouncedVol]
			   ,[DateStartPlacing]
			   ,[DateEndPlacing]
			   ,[Currency]
			   ,[CB_Code]
			   ,[ID_CB_SDH]
			   ,[StateRegNum]
			   ,[MonthAvgVol]
			   ,[F_Rating]
			   ,[M_Rating]
			   ,[SP_Rating]
			   ,[E_Rating]
			   ,[A_Rating]
			   ,[Contr_F_Rating]
			   ,[Contr_M_Rating]
			   ,[Contr_SP_Rating]
			   ,[Contr_E_Rating]
			   ,[Contr_A_Rating]
			   ,[enddate]
			   ,[IsInIndex]
			   ,[IsVariableCoupon]
			   ,[IsQuantityGrows]
			   ,[DaysToRedemption]
			   ,[is_bank]
			   ,[for_qual_investors]
				,[NKR_Rating]
				,[NRA_Rating]
				,[Contr_NKR_Rating]
				,[Contr_NRA_Rating]
				,[IsSubordinated]
				)
	(SELECT GETDATE() AS [Arch_date], t.* FROM [FactTable] AS t)



END

GO
/****** Object:  StoredProcedure [dbo].[GetMailerParams]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetMailerParams]
AS
BEGIN
	SELECT [Name], [Value] FROM MailerParams
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserAcess]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUserAcess]
AS
BEGIN

	SELECT ISNULL([AccessMode], 0) FROM [UserAccess] WHERE [UserName] = SUSER_NAME()
	DECLARE @Comments nvarchar(50)
	SET  @Comments = HOST_NAME()
	EXEC [AddActionLog] 'LC3', 'Login', @Comments 

END
GO
/****** Object:  StoredProcedure [dbo].[ListByEmitents]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ListByEmitents]
	@aToTime		datetime	=	null
AS
BEGIN

	DECLARE @vToTime	datetime
	SET @vToTime = ISNULL(@aToTime, GETDATE())

	INSERT INTO [dbo].[List_ByEmitents]
           ([Arch_date]
           ,[ClientCode]
           ,[ClientAccount]
           ,[Instrument]
           ,[Quantity]
           ,[MarketValue]
           ,[Issuer]
           ,[InstrumentName]
           ,[InstrumentType]
           ,[InstrumentSubtype]
           ,[CB_Code]
           ,[StateRegNum])
	(
		SELECT [Arch_date]
			  ,[ClientCode]
			  ,[ClientAccount]
			  ,[Instrument]
			  ,[Quantity]
			  ,[MarketValue]
			  ,[Issuer]
			  ,[InstrumentName]
			  ,[InstrumentType]
			  ,[InstrumentSubtype]
			  ,[CB_Code]
			  ,[StateRegNum]
		FROM [LC3_History].[dbo].[FactTable_History]
		WHERE [InstrumentType] IN ('акция', 'облигация','депозит') 
			AND  [Arch_date] = (SELECT MAX([Arch_date]) FROM [LC3_History].[dbo].[FactTable_History] WHERE Arch_date < @vToTime) 
			AND contrid IN (SELECT [contrid] FROM [dbo].[CL_GroupsContent] WHERE GroupId = 82)
	)



END
GO
/****** Object:  StoredProcedure [dbo].[ListByOrganizers]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[ListByOrganizers]
	@aToTime		datetime	=	null
AS
BEGIN

	DECLARE @vToTime	datetime
	SET @vToTime = ISNULL(@aToTime, GETDATE())


	INSERT INTO [dbo].[List_ByOrganizers]
           ([Arch_date]
           ,[ClientCode]
           ,[ClientAccount]
           ,[Instrument]
           ,[Quantity]
           ,[MarketValue]
           ,[Issuer]
           ,[InstrumentName]
           ,[InstrumentType]
           ,[InstrumentSubtype]
           ,[CB_Code]
           ,[StateRegNum]
           ,[Organizer]
           ,[Role])
	(
		SELECT 
				  t.[Arch_date]
				  ,t.[ClientCode]
				  ,t.[ClientAccount]
				  ,t.[Instrument]
				  ,t.[Quantity]
				  ,t.[MarketValue]
				  ,t.[Issuer]
				  ,t.[InstrumentName]
				  ,t.[InstrumentType]
				  ,t.[InstrumentSubtype]
				  ,t.[CB_Code]
				  ,t.[StateRegNum]
				  ,c.[name] AS [Organizer]
				  ,r.[name] AS [Role]
		FROM
		(
			SELECT [Arch_date]
				  ,[ClientCode]
				  ,[ClientAccount]
				  ,[Instrument]
				  ,[Quantity]
				  ,[MarketValue]
				  ,[Issuer]
				  ,[InstrumentName]
				  ,[InstrumentType]
				  ,[InstrumentSubtype]
				  ,[SecurityId]
				  ,[CB_Code]
				  ,[StateRegNum]
			FROM [LC3_History].[dbo].[FactTable_History]
			WHERE [InstrumentType] IN ('акция', 'облигация','депозит') 
				AND  [Arch_date] = (SELECT MAX([Arch_date]) FROM [LC3_History].[dbo].[FactTable_History] WHERE Arch_date < @vToTime) 
		) AS t
		LEFT JOIN [SDH].[SDH].[dbo].[issue_bond_organizers] AS o ON (t.[SecurityId] = o.[bondid])
		LEFT JOIN [SDH].[SDH].[dbo].[Contragents] AS c ON (o.[contrid_dmart] = c.[rid])
		LEFT JOIN [SDH].[SDH].[dbo].[spr_org_roles] AS r ON (o.[org_role_dmart] = r.[id])
		WHERE o.[contrid_dmart] IN (SELECT [contrid] FROM [dbo].[CL_GroupsContent] WHERE GroupId = 83) 
						AND o.[org_role_dmart] IN (1,3,4,5,12,13,15,19,22,23,24,33,36,38)
		--ORDER BY t.ClientCode, t.Issuer
	)



END
GO
/****** Object:  StoredProcedure [dbo].[Mailer_AddCheck]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Mailer_AddCheck]
			   @CvheckTime	datetime,
			   @vLimitId	int,
			   @vClientId	int,
			   @vIssuer		nvarchar(250),
			   @vFailLevel	int
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO [LC3_History].[dbo].[MailerCheck_History]
			   ([CheckTime]
			   ,[LimitId]
			   ,[ClientId]
			   ,[Issuer]
			   ,[FailLevel])
		 VALUES
			   ( @CvheckTime,
			   @vLimitId,
			   @vClientId,
			   @vIssuer,
			   @vFailLevel)
END
GO
/****** Object:  StoredProcedure [dbo].[Mailer_Comparing]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Mailer_Comparing]
AS
BEGIN

SET NOCOUNT ON;
	SELECT 
      l.[Name]
      ,cl.ПолноеНаименование
      ,mc.[Issuer]
      ,ISNULL(mc.[FL1], -1) AS StatusNew
      ,ISNULL(mc.[FL2], -1) AS StatusOld
	FROM [LC3_History].[dbo].[MailerCompare] AS mc 
		LEFT JOIN [CL] AS l ON (mc.[LimitId] = l.Id)
		LEFT JOIN [_CL_Clients] AS cl ON (mc.ClientId = cl.КодКлиента)
	ORDER BY mc.LimitId, mc.ClientId
END
GO
/****** Object:  StoredProcedure [dbo].[Model_AddDeal]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Model_AddDeal]
	@DClientCode		int,
	@DSecurityId		uniqueidentifier,
	@DQuantity			int,
	@DMarketValue		float	=	0
AS
BEGIN

	DECLARE	@vQuantity		int		=	0
	DECLARE @vMarketValue	float	=	0
	DECLARE @vCount			int		=	0
	DECLARE	@vPrice			float	=	0

	SELECT @vCount	=	COUNT(*) FROM Model_FT WHERE [UId]	=	SUSER_ID() AND ClientCode	=	@DClientCode AND SecurityId	=	@DSecurityId

	IF @vCount	>	0	BEGIN
		SELECT @vQuantity	=	Quantity, @vMarketValue	=	MarketValue FROM Model_FT 
			WHERE [UId]	=	SUSER_ID() AND ClientCode	=	@DClientCode AND SecurityId	=	@DSecurityId
		IF @vQuantity <> 0	SET @vPrice	=	@vMarketValue	/	@vQuantity	ELSE SET @vPrice	=	0
		UPDATE Model_FT SET Quantity	=	@vQuantity + @DQuantity, MarketValue	=	@vPrice * (@vQuantity + @DQuantity),
			InstrumentName = (CASE WHEN SUBSTRING(InstrumentName, 1, 3) = '(M)' THEN InstrumentName ELSE '(M) ' + InstrumentName END)
			WHERE [UId]	=	SUSER_ID() AND ClientCode	=	@DClientCode AND SecurityId	=	@DSecurityId
	END ELSE BEGIN

		INSERT INTO [Model_FT] ([UId], [ClientCode], [SecurityId], [Quantity], [MarketValue])
			VALUES (SUSER_ID(), @DClientCode, @DSecurityId, @DQuantity, @DMarketValue)
		
		UPDATE mf SET
			mf.contrid	=	ct.emitents_id, mf.InstrumentType = ct.[type], mf.IssueNum = ct.number_of_emission, mf.StateRegNum = ct.state_reg_number,
			mf.RedemptionDate	=	ct.redemptiondate, mf.AnnouncedVol	=	ct.announced_volume, mf.VolCirculation	=	ct.vol_circulations,
			mf.InstrumentSubtype	=	ct.subtype, mf.DateEndPlacing	=	ct.date_of_end_placing, mf.DateStartPlacing	=	ct.date_of_start_placing,
			mf.QuoteSDHAgo	=	ct.tender_days_ago, mf.QuoteSDH	=	ct.admittedquote, mf.MonthAvgVol	=	ct.volume_avg, 
			mf.QuoteSheet	=	ct.qsheet, mf.SecTypeBr	=	ct.SecTypeBr, mf.ID_CB_SDH	=	ct.rid, mf.IsQuantityGrows	=	0, mf.Currency	=	1,
			mf.Instrument	=	ct.ticker
		FROM Model_FT AS mf INNER JOIN Cache_Tools AS ct ON (mf.SecurityId = ct.rid)
		WHERE mf.UId = SUSER_ID() AND mf.ClientCode	=	@DClientCode AND mf.SecurityId	=	@DSecurityId

		UPDATE mf SET
			mf.Issuer	=	cn.name, mf.OwnType	=	cn.own_type_name, mf.Country	=	cn.country_name, mf.BondsIssueSumm	=	cn.bonds_issue_sum,
			mf.InstrumentName	=	'(M) ' + cn.name	+	' ' + mf.InstrumentSubtype + '-' + mf.IssueNum,
			mf.is_bank = cn.is_bank
		FROM Model_FT AS mf INNER JOIN Cache_Contragents AS cn ON (mf.contrid = cn.rid)
		WHERE mf.UId = SUSER_ID() AND mf.ClientCode	=	@DClientCode AND mf.SecurityId	=	@DSecurityId

		UPDATE mf SET
			mf.F_Rating	=	cfr.F_Rating, mf.M_Rating	=	cfr.M_Rating, mf.SP_Rating = cfr.SP_Rating, mf.A_Rating	=	cfr.A_Rating, mf.E_Rating	=	cfr.E_Rating
		FROM Model_FT AS mf INNER JOIN Cache_Full_Ratings AS cfr ON (mf.SecurityId = cfr.ObjectId)
		WHERE mf.UId = SUSER_ID() AND mf.ClientCode	=	@DClientCode AND mf.SecurityId	=	@DSecurityId

		UPDATE mf SET
			mf.Contr_F_Rating	=	cfr.F_Rating, mf.Contr_M_Rating	=	cfr.M_Rating, mf.Contr_SP_Rating = cfr.SP_Rating, mf.Contr_A_Rating	=	cfr.A_Rating, mf.Contr_E_Rating	=	cfr.E_Rating
		FROM Model_FT AS mf INNER JOIN Cache_Full_Ratings AS cfr ON (mf.contrid = cfr.ObjectId)
		WHERE mf.UId = SUSER_ID() AND mf.ClientCode	=	@DClientCode AND mf.SecurityId	=	@DSecurityId

		UPDATE mf SET
			mf.ClientAccount	=	ci.СчетКлиента, mf.SummAsset	=	ci.СуммаАктива
		FROM Model_FT AS mf INNER JOIN [INF_ClientsInfo] AS ci ON (mf.ClientCode = ci.[КодКлиента])
		WHERE mf.UId = SUSER_ID() AND mf.ClientCode	=	@DClientCode AND mf.SecurityId	=	@DSecurityId

	--	UPDATE Model_FT SET [Percent]	=	CASE WHEN ISNULL(SummAsset, 0) <> 0 THEN 100 * MarketValue	/	ISNULL(SummAsset, 0)	ELSE 0 END 
	--	WHERE [UId] = SUSER_ID() AND ClientCode	=	@DClientCode AND SecurityId	=	@DSecurityId

		UPDATE Model_FT SET IsInIndex = 1 WHERE UId = SUSER_ID() AND [Instrument] IN (SELECT [ticker] FROM [SDH_RTSICompose])
		UPDATE Model_FT SET IsVariableCoupon = 1 WHERE UId = SUSER_ID() AND ID_CB_SDH IN (SELECT [rid] FROM [SDH].[SDH].[dbo].[issue_bonds] WHERE [rate_type] = 3)

		SELECT 0

	END

		UPDATE Model_FT SET [Percent]	=	CASE WHEN ISNULL(SummAsset, 0) <> 0 THEN 100 * MarketValue	/	ISNULL(SummAsset, 0)	ELSE 0 END 
		WHERE [UId] = SUSER_ID() AND ClientCode	=	@DClientCode AND SecurityId	=	@DSecurityId
	
	EXEC Model_AddFondsPortfolio


END
GO
/****** Object:  StoredProcedure [dbo].[Model_AddFondsPortfolio]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Model_AddFondsPortfolio]
AS
BEGIN

			DECLARE	@FondId	int

			DECLARE FondCur CURSOR FOR 
				SELECT [FondId] FROM [BACK_Fonds]
			OPEN FondCur

			FETCH NEXT FROM FondCur INTO @FondId

			WHILE @@FETCH_STATUS = 0  
			BEGIN  
				EXEC CacheFondPortfolio_Model @FondId
				FETCH NEXT FROM FondCur INTO @FondId
			END

			CLOSE FondCur  
			DEALLOCATE FondCur
END
GO
/****** Object:  StoredProcedure [dbo].[Model_CopyFromFT]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[Model_CopyFromFT]

AS
BEGIN

	DELETE FROM [Model_FT] WHERE [UId] = SUSER_ID()

	INSERT INTO [Model_FT]
           (
			   [UId]
			   ,[ClientCode]
			   ,[ClientAccount]
			   ,[SummAsset]
			   ,[Instrument]
			   ,[Quantity]
			   ,[MarketValue]
			   ,[Percent]
			   ,[Issuer]
			   ,[InstrumentName]
			   ,[InstrumentType]
			   ,[InstrumentSubtype]
			   ,[SecTypeBr]
			   ,[Country]
			   ,[QuoteSheet]
			   ,[OwnType]
			   ,[BondsIssueSumm]
			   ,[QuoteSDH]
			   ,[QuoteSDHAgo]
			   ,[VolCirculation]
			   ,[contrid]
			   ,[Capitalization]
			   ,[RedemptionDate]
			   ,[SecurityId]
			   ,[IssueNum]
			   ,[AnnouncedVol]
			   ,[DateStartPlacing]
			   ,[DateEndPlacing]
			   ,[Currency]
			   ,[CB_Code]
			   ,[ID_CB_SDH]
			   ,[StateRegNum]
			   ,[MonthAvgVol]
			   ,[F_Rating]
			   ,[M_Rating]
			   ,[SP_Rating]
			   ,[E_Rating]
			   ,[A_Rating]
			   ,[Contr_F_Rating]
			   ,[Contr_M_Rating]
			   ,[Contr_SP_Rating]
			   ,[Contr_E_Rating]
			   ,[Contr_A_Rating]
			   ,[enddate]
			   ,[IsInIndex]
			   ,[IsVariableCoupon]
			   ,[IsQuantityGrows]
				,[DaysToRedemption]
				,[is_bank]
				,[for_qual_investors]
			  ,[NKR_Rating]
			  ,[NRA_Rating]
			  ,[Contr_NKR_Rating]
			  ,[Contr_NRA_Rating]
			  ,[IsSubordinated]
		   )
           (
				SELECT SUSER_ID() AS [UId]
						,[ClientCode]
					  ,[ClientAccount]
					  ,[SummAsset]
					  ,[Instrument]
					  ,[Quantity]
					  ,[MarketValue]
					  ,[Percent]
					  ,[Issuer]
					  ,[InstrumentName]
					  ,[InstrumentType]
					  ,[InstrumentSubtype]
					  ,[SecTypeBr]
					  ,[Country]
					  ,[QuoteSheet]
					  ,[OwnType]
					  ,[BondsIssueSumm]
					  ,[QuoteSDH]
					  ,[QuoteSDHAgo]
					  ,[VolCirculation]
					  ,[contrid]
					  ,[Capitalization]
					  ,[RedemptionDate]
					  ,[SecurityId]
					  ,[IssueNum]
					  ,[AnnouncedVol]
					  ,[DateStartPlacing]
					  ,[DateEndPlacing]
					  ,[Currency]
					  ,[CB_Code]
					  ,[ID_CB_SDH]
					  ,[StateRegNum]
					  ,[MonthAvgVol]
					  ,[F_Rating]
					  ,[M_Rating]
					  ,[SP_Rating]
					  ,[E_Rating]
					  ,[A_Rating]
					  ,[Contr_F_Rating]
					  ,[Contr_M_Rating]
					  ,[Contr_SP_Rating]
					  ,[Contr_E_Rating]
					  ,[Contr_A_Rating]
					  ,[enddate]
					  ,[IsInIndex]
					  ,[IsVariableCoupon]
					  ,[IsQuantityGrows]
					  ,[DaysToRedemption]
					  ,[is_bank]
					  ,[for_qual_investors]
					  ,[NKR_Rating]
					  ,[NRA_Rating]
					  ,[Contr_NKR_Rating]
					  ,[Contr_NRA_Rating]
					  ,[IsSubordinated]
				  FROM [dbo].[FactTable]		   
		   )

END
GO
/****** Object:  StoredProcedure [dbo].[Month_turnover]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Month_turnover]
	@Month_ago		int
AS
BEGIN

	SET NOCOUNT ON

	DECLARE	@BeginDt	datetime
	DECLARE	@EndDt	datetime

	SET @BeginDt	=	DATEADD(M, -@Month_ago, DATEADD(D, -DAY(GETDATE()) + 1, GETDATE()))
	SET @EndDt		=	DATEADD(M, 1, @BeginDt)

	SET @BeginDt	=	DATEADD(D, -1, @BeginDt)
	SET @EndDt		=	DATEADD(D, -1, @EndDt)

	
	IF Object_Id('tempdb..#Month_turnovers') is not null
	INSERT INTO #Month_turnovers (Month_ago, tickerid, ticker, turnover, ObjectId)
	(
		SELECT     @Month_ago, tt_avg.tickerid, ec.ticker, tt_avg.volume_summ, CASE WHEN ec.for_obj = 2 THEN ec.stockid ELSE ec.bondid END AS objectid
		FROM         (SELECT     tickerid, SUM(volume_currency) AS volume_summ
							   FROM          [SDH].SDH.dbo.tender_total_stocks AS tts
							   WHERE      (tenderdate < @EndDt) AND (tenderdate >= @BeginDt) AND (contrid = '6CCF6D58-7F71-4650-8693-925B17B09462')
							   GROUP BY tickerid) AS tt_avg LEFT OUTER JOIN [SDH].SDH.dbo.exchange_codes AS ec ON (tt_avg.tickerid = ec.rid)
		UNION
		SELECT     @Month_ago, tt_avg.tickerid, ec.ticker, tt_avg.volume_summ, CASE WHEN ec.for_obj = 2 THEN ec.stockid ELSE ec.bondid END AS objectid
		FROM         (SELECT     tickerid, SUM(volume_currency) AS volume_summ
							   FROM          [SDH].SDH.dbo.tender_total_bonds AS tts
							   WHERE      (tenderdate < @EndDt) AND (tenderdate >= @BeginDt) AND (contrid = '6CCF6D58-7F71-4650-8693-925B17B09462')
							   GROUP BY tickerid) AS tt_avg LEFT OUTER JOIN [SDH].SDH.dbo.exchange_codes AS ec ON tt_avg.tickerid = ec.rid
	)


END
GO
/****** Object:  StoredProcedure [dbo].[Object_Full_Rating]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[Object_Full_Rating]
	@for_obj		int
AS
BEGIN

	if object_id('tempdb..#Ratings_tmp') is not null DROP TABLE #Ratings_tmp

	SELECT [agencyid]
		  , CASE [for_obj] WHEN 1 THEN [contrid] WHEN 2 THEN [bondid] ELSE NULL END AS ObjectId
		  ,[assigndate]
		  ,[scale]
		  ,[scale_val]
		  ,[ScaleName]
		  ,[minval]
		  ,[ord]
		  ,[comment]
		  , row_number() over (partition by CASE [for_obj] WHEN 1 THEN [contrid] WHEN 2 THEN [bondid] ELSE NULL END, [agencyid] order by [assigndate] /*[ord]*/ desc) AS rnum
	INTO #Ratings_tmp
	FROM [SDH_Current_Ratings] WHERE [for_obj] = @for_obj

	if object_id('tempdb..#Ratings') is not null DROP TABLE #Ratings

	SELECT * INTO #Ratings FROM #Ratings_tmp WHERE rnum = 1

	INSERT INTO [Cache_Full_Ratings]([for_obj], [ObjectId], [SP_Rating], [F_Rating], [M_Rating], [E_Rating], [A_Rating],[Own_Rating],[Own_Comment])
	(
		SELECT @for_obj, ol.ObjectId, spr.Minval AS SP_Rating, fr.Minval AS F_Rating, mr.Minval AS M_Rating,
				 er.Minval AS E_Rating, ar.Minval AS A_Rating, own.minval AS [Own_Rating], own.[comment] AS [Own_Comment]
		 FROM
		(SELECT distinct ObjectId FROM #Ratings) AS ol
			LEFT JOIN
		(SELECT ObjectId, Minval  FROM #Ratings WHERE agencyid = 'B9DB46B4-045F-4A13-855E-0D8AF9467501') AS spr	ON (ol.ObjectId = spr.ObjectId)			--	S&P
			LEFT JOIN 
		(SELECT ObjectId, Minval  FROM #Ratings WHERE agencyid = '5267D9CB-F7CB-4F2F-B3D2-D2DEB793C141') AS fr ON (ol.ObjectId = fr.ObjectId)			--	Fitch
			LEFT JOIN 
		(SELECT ObjectId, Minval  FROM #Ratings WHERE agencyid = 'BF59D186-F293-4E11-85CD-02C1E80812C71') AS mr ON (ol.ObjectId = mr.ObjectId)			--	Moody
			LEFT JOIN 
		(SELECT ObjectId, Minval  FROM #Ratings WHERE agencyid = 'DF0B1036-C1AB-4C04-B475-F830EC16CC61') AS er ON (ol.ObjectId = er.ObjectId)			--	Эксперт
			LEFT JOIN 
		(SELECT ObjectId, Minval  FROM #Ratings WHERE agencyid = '123CB33A-7200-4332-968F-12E8F1C322C0') AS ar ON (ol.ObjectId = ar.ObjectId)			--	АРКА
			LEFT JOIN 
		(SELECT ObjectId, Minval, [comment]  FROM #Ratings WHERE agencyid = '37FF67AB-DAFD-4CCF-93FB-FB80A403298A') AS own ON (ol.ObjectId = own.ObjectId)			--	Внутренний
	)

	
	

END




GO
/****** Object:  StoredProcedure [dbo].[OpenLimitByInstruments]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[OpenLimitByInstruments]
	@LimitId	int,
	@ClientCode int,
	@IsModel	int	=	0
AS
BEGIN

	DECLARE @Condition	nvarchar(MAX)
	DECLARE @FtId	int	=	1
	DECLARE @IsComplex	bit	=	-1

	SELECT @Condition = [Condition], @IsComplex = [IsComplex], @FtId = [FTId] FROM [CL] WHERE [Id] = @LimitId

	IF (@IsModel <> 0) SET @FtId = 3

	DECLARE @FtTable	nvarchar(MAX)

	SELECT @FtTable = [TableName] FROM [FactTablesList] WHERE [Id] = @FtId


	IF (@IsComplex <> 0) AND (LEN(@Condition) > 0) BEGIN

		DECLARE @OpenLimitQuery	nvarchar(max)	=	
			'SELECT [Instrument],[InstrumentName],[Issuer],[MarketValue],[Percent] FROM ' 
			+ @FtTable + ' WHERE (ClientCode = ' + CONVERT(nvarchar, @ClientCode) + ') AND (' + @Condition + ') ORDER BY [InstrumentName]'
	
		print @OpenLimitQuery			
		exec sp_executesql @OpenLimitQuery

	END ELSE 
		SELECT 'Лимит не является составным' AS Answer




END
GO
/****** Object:  StoredProcedure [dbo].[PC_Check_Results]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PC_Check_Results]
	@CheckId	int
AS
BEGIN
	SELECT r.[ClientId]
		  ,r.[LimitId]
		  ,l.[Name]
		  ,r.[SummAsset]
		  ,r.[Max]
		  ,r.[Min]
		  ,r.[SumMarketVaule]
		  ,r.[SumPercent]
		  ,r.[FailsNum]
		  ,r.[WarningNum]
		  ,r.[SumMarketVaule2]
		  ,r.[SumPercent2]
		  ,r.[FailsNum2]
		  ,r.[WarningNum2]
	  FROM [PC_Results] AS r LEFT JOIN [CL] AS l on (r.LimitId = l.Id) WHERE r.CheckId = @CheckId
END
GO
/****** Object:  StoredProcedure [dbo].[PC_CheckLimit]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[PC_CheckLimit]
	@CheckId	int,
	@LimitId	int,
	@ClientCode int,
	@IsBefore	int = 0
AS
BEGIN

	SET NOCOUNT ON	

	declare @TableName	nvarchar(250)
	set @TableName = 'My_Model_FT'
	declare @IsComplex bit 
	declare @LimitView varchar(250)
	SELECT @IsComplex = IsComplex FROM CL WHERE Id = @LimitId
	IF (@IsComplex <> 0) SET @LimitView = 'CL_Limit_' + CONVERT(nvarchar,  @LimitId)
		ELSE SELECT @LimitView = LimitQuery FROM CL WHERE Id = @LimitId


	declare @ViewQuery nvarchar(MAX)	=	''
	DECLARE	@vText	nvarchar(MAX)

			DECLARE Inn_Cur CURSOR FOR 
			SELECT text FROM syscomments WHERE id = OBJECT_ID(@LimitView)
			OPEN Inn_Cur
			FETCH NEXT FROM Inn_Cur INTO @vText

			WHILE @@FETCH_STATUS = 0  
			BEGIN  
				SET @ViewQuery	=	@ViewQuery + @vText
				FETCH NEXT FROM Inn_Cur INTO @vText
			END
			CLOSE Inn_Cur  
			DEALLOCATE Inn_Cur


	--SELECT @ViewQuery = [VIEW_DEFINITION] FROM [LC3_dev].[INFORMATION_SCHEMA].[VIEWS] WHERE [TABLE_NAME] = @LimitView
	declare @BegPos	int	=	PATINDEX('%AS%',@ViewQuery) + 3

	SET @ViewQuery = SUBSTRING(@ViewQuery, @BegPos, LEN(@ViewQuery) - @BegPos + 1)

	SET @ViewQuery = REPLACE(@ViewQuery, 'FactTable ', '@#$ ');
	SET @ViewQuery = REPLACE(@ViewQuery, '[FactTable]', '@#$ ');
	SET @ViewQuery = REPLACE(@ViewQuery, 'FT_NoRepo', '@#$');
	SET @ViewQuery = REPLACE(@ViewQuery, '@#$', @TableName);

	--PRINT @ViewQuery
	--	Получили текст запроса на проверку

	--	Готовим табличку для результата
	if object_id('_tmp_PC_Res') is not null DROP TABLE _tmp_PC_Res

	declare @LimitCheckSql nvarchar(max) = 
		'select t.* into _tmp_PC_Res from
			(select lv.*, 
					case when ISNULL(lv.LimitValue, 0) < cl.MinValue then 11												-- LimitCheckFailLevel.LowerFail
						when ISNULL(lv.LimitValue, 0) > cl.MaxValue then 12												-- LimitCheckFailLevel.UpperFail
						when (ISNULL(lv.LimitValue, 0) < cl.LowerWarning) and (ISNULL(lv.LimitValue, 0) >= cl.MinValue) then 1		-- LimitCheckFailLevel.LowerWarning
						when (ISNULL(lv.LimitValue, 0) > cl.UpperWarning) and (ISNULL(lv.LimitValue, 0) <= cl.MaxValue) then 2		-- LimitCheckFailLevel.UpperWarning
						else 0																					-- LimitCheckFailLevel.NoFail
					end as FailLevel,
					CONVERT(float, cl.MinValue) AS Мин,
					CONVERT(float, cl.MaxValue) AS Макс
			from (' + @ViewQuery + ') AS lv
			right join dbo.ClientsLimits cl on lv.ClientCode = cl.ClientCode
			where cl.IsActive = 1 and
				cl.LimitId = @pLimitId and
				cl.ClientCode = @pClientCode
			) AS t'

--	print @LimitCheckSql

	exec sp_executesql @LimitCheckSql, N'@pLimitId int, @pClientCode int', @pLimitId = @LimitId, @pClientCode = @ClientCode
	--select * from _tmp_PC_Res

	DECLARE @FailsNum	int
	DECLARE @WarnNum	int
	SELECT @FailsNum = COUNT(*) FROM _tmp_PC_Res WHERE FailLevel > 10
	SELECT @WarnNum = COUNT(*) FROM _tmp_PC_Res WHERE FailLevel < 10 AND FailLevel > 0
	DECLARE @SumMarketValue	float
	DECLARE @SumPercent		float
	SELECT @SumMarketValue = Max(SumMarketValue), @SumPercent = Max(SumPercent) FROM _tmp_PC_Res

	if (@IsBefore <> 0) BEGIN
		--	До добавления сделки
		INSERT INTO PC_Results
			   ([CheckId],[ClientId],[LimitId],[SummAsset],[Max],[Min],[SumMarketVaule],[SumPercent])
		(
			SELECT @CheckId, @ClientCode, @LimitId, SummAsset, Макс AS [Max], Мин AS [Min], @SumMarketValue AS SumMarketValue, @SumPercent AS SumPercent
			FROM _tmp_PC_Res GROUP BY SummAsset, Мин, Макс
		)
		UPDATE PC_Results SET [FailsNum] = @FailsNum, [WarningNum] = @WarnNum WHERE [CheckId] = @CheckId AND [ClientId] = @ClientCode AND [LimitId] = @LimitId

	END 
	
	ELSE BEGIN

		UPDATE PC_Results SET [FailsNum2] = @FailsNum, [WarningNum2] = @WarnNum, [SumMarketVaule2] = @SumMarketValue, [SumPercent2] = @SumPercent
		WHERE [CheckId] = @CheckId AND [ClientId] = @ClientCode AND [LimitId] = @LimitId

	END

	if object_id('_tmp_PC_Res') is not null DROP TABLE _tmp_PC_Res

END




GO
/****** Object:  StoredProcedure [dbo].[PC_Control_Deal]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[PC_Control_Deal]
	@IDClientBack					int,
	@Instrument						varchar(255),
	@InstrumentName					varchar(255),
	@Amount							bigint,
	@MarkToMarket					float,
	@InstrumentType					varchar(255),
	@IDCBSDH						uniqueidentifier,
	@IDIssuerSDH					uniqueidentifier,
	@IDCBBack						varchar(255),
	@GRN							varchar(255),
	@IdInstrumentType				int,
	@CacheControlId					int		=	0

AS
BEGIN

	SET NOCOUNT ON

	begin try

		begin transaction


			-- Забабахаем айдишник проверки
			DECLARE @vControlId int 
			INSERT INTO [PC_Check]([Time], [ClientId], [Instrument], [Amount], [MarkToMarket], [IDCBSDH], [IDIssuerSDH], [CacheControlId], [TimeLog]) 
							VALUES (getdate(), @IDClientBack, @Instrument, @Amount, @MarkToMarket, @IDCBSDH, @IDIssuerSDH, @CacheControlId, '')
			SET @vControlId	=	convert(int, @@IDENTITY)

			DECLARE @TimeStart float
			SET @TimeStart = CONVERT(float, GETDATE())


			-- Если нужно - перекешируем портфель и ЦХПИ. Лучше если не нужно
			IF (@CacheControlId = 1) exec Caching_ALL
			UPDATE [PC_Check] SET TimeLog = TimeLog + 'Caching: ' + CONVERT(varchar, ROUND(86400 * (CONVERT(float, GETDATE()) - @TimeStart) ,2)) + '; ' WHERE Id = @vControlId

			--	Берем модельный портфель из таблицы фактов
			exec Model_CopyFromFT
			UPDATE [PC_Check] SET TimeLog = TimeLog + 'Model: ' + CONVERT(varchar, ROUND(86400 * (CONVERT(float, GETDATE()) - @TimeStart) ,2)) + '; ' WHERE Id = @vControlId


			--	TODO	:	Сделать проверку без сделки с табличкой результатов
			DECLARE @vLimitId	int

			DECLARE crsLimits CURSOR FOR SELECT [LimitId] FROM [ClientsLimits] WHERE  [ClientCode] = @IDClientBack AND [IsActive] <> 0 
						AND [LimitId] NOT IN (SELECT ID FROM CL WHERE UseInPC = 0)
			OPEN crsLimits

				BEGIN TRY
					FETCH NEXT FROM crsLimits INTO @vLimitId
					WHILE @@FETCH_STATUS = 0
					BEGIN
						--print convert(varchar, @vControlId) + ' ' + convert(varchar, @vLimitId) + ' ' + convert(varchar, @IDClientBack)						
						EXEC PC_CheckLimit @vControlId, @vLimitId, @IDClientBack, 1
						FETCH NEXT FROM crsLimits INTO @vLimitId
					END
				END TRY
				BEGIN CATCH 
					CLOSE crsLimits
					DEALLOCATE crsLimits
				END CATCH
			CLOSE crsLimits
			DEALLOCATE crsLimits


			UPDATE [PC_Check] SET TimeLog = TimeLog + 'CheckBefore: ' + CONVERT(varchar, ROUND(86400 * (CONVERT(float, GETDATE()) - @TimeStart) ,2)) + '; ' WHERE Id = @vControlId

			
			-- добавляем туда сделку
			exec Model_AddDeal @IDClientBack, @IDCBSDH, @Amount, @MarkToMarket

			--	проверяем лимиты после добавления сделки
			DECLARE crsLimits1 CURSOR FOR SELECT [LimitId] FROM [ClientsLimits] WHERE  [ClientCode] = @IDClientBack AND [IsActive] <> 0
						AND [LimitId] NOT IN (SELECT ID FROM CL WHERE UseInPC = 0)
			OPEN crsLimits1
				BEGIN TRY
					FETCH NEXT FROM crsLimits1 INTO @vLimitId
					WHILE @@FETCH_STATUS = 0
					BEGIN						
						EXEC PC_CheckLimit @vControlId, @vLimitId, @IDClientBack, 0
						FETCH NEXT FROM crsLimits1 INTO @vLimitId
					END
				END TRY
				BEGIN CATCH 
					CLOSE crsLimits1
					DEALLOCATE crsLimits1
				END CATCH

			CLOSE crsLimits1
			DEALLOCATE crsLimits1			
			

			UPDATE [PC_Check] SET TimeLog = TimeLog + 'CheckAfter: ' + CONVERT(varchar, ROUND(86400 * (CONVERT(float, GETDATE()) - @TimeStart) ,2)) + '; ' WHERE Id = @vControlId

			SELECT @vControlId AS ResultId, SUM([FailsNum]) AS FailsNum, SUM([WarningNum]) AS WarningNum, SUM([FailsNum2]) AS FailsNum2, SUM([WarningNum2]) AS WarningNum2
					FROM PC_Results WHERE CheckId = @vControlId

		commit transaction

	end try
	begin catch
		rollback transaction	
		declare @message nvarchar(max) = error_message()
		raiserror(@message, 16, 1)
	end catch



END
GO
/****** Object:  StoredProcedure [dbo].[Pif_replacing]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Pif_replacing]
	@Pifid		int,
	@ClientCode	int
AS
BEGIN

	BEGIN TRANSACTION

		DELETE FROM Cache_CurrentPortfolio WHERE ClientCode = @ClientCode AND [ID_CB_SDH] = (SELECT pif_rid FROM Pifs WHERE id = @Pifid)

		IF (@@ROWCOUNT > 0) 
			INSERT INTO [dbo].[Cache_CurrentPortfolio]
				   ([ForTime]
				   ,[CB_Name]
				   ,[CB]
				   ,[Group]
				   ,[ClientName]
				   ,[ClientCode]
				   ,[CB_Code]
				   ,[ID_CB]
				   ,[Board]
				   ,[Type]
				   ,[Quantity]
				   ,[MarketValue]
				   ,[RegCode]
				   ,[ID_CB_SDH]
				   ,[ID_Emit_SDH]
				   ,[Nominal]
				   ,[CurrencyID]
				   ,[IsSubordinated])

           (
				SELECT 
					NULL AS [ForTime],
					'(В составе ПИФ)' AS [CB_Name],
					'(В составе ПИФ)' AS [CB],
					NULL AS [Group],
					NULL AS [ClientName],
					@ClientCode AS [ClientCode],
					[CB_Code],
					[ID_CB],
					NULL AS [Board],
					[Type],
					[quantity] AS [Quantity],
					[summ] AS [MarketValue],
					NULL AS [RegCode],
					[rid] AS [ID_CB_SDH],
					[emitents_id] AS [ID_Emit_SDH],
					NULL AS [Nominal],
					1 AS [CurrencyID],
					NULL AS [IsSubordinated]
				 FROM [dbo].[Pif_structure] WHERE [pifid] = @Pifid
		   )

	COMMIT


END
GO
/****** Object:  StoredProcedure [dbo].[RenewAllViews]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RenewAllViews]
AS
BEGIN
	DECLARE lc CURSOR FOR
	SELECT Id, Name FROM CL WHERE [IsComplex] <> 0 ORDER BY Id

	OPEN lc

	DECLARE @Id	int
	DECLARE @Name nvarchar(250)

	FETCH NEXT FROM lc INTO @id, @name  

	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		PRINT CONVERT(nvarchar, @id) + ' '  + @name
		EXEC CL_FormCondition @id
		FETCH NEXT FROM lc INTO @id, @name  
	END   
	CLOSE lc
	DEALLOCATE lc
END
GO
/****** Object:  StoredProcedure [dbo].[RL_GetShowCode]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[RL_GetShowCode]
	@RLCode		nvarchar(5)
AS
BEGIN

	SELECT ShowCode FROM RL_Types WHERE Code LIKE @RLCode

END
GO
/****** Object:  StoredProcedure [dbo].[RL_U_AddUpdate]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[RL_U_AddUpdate] 
	@ClientId int,
	@CORG nvarchar(5),
	@CORGid uniqueidentifier,
	@RestrictType nvarchar(5),
	@IssueRid uniqueidentifier,
	@TypesList nvarchar(250), 
	@LimitType nvarchar(5),
	@Min real,
	@Max real,
	@NoBuy	int		=	NULL,
	@Ridtodel uniqueidentifier = NULL
	
AS
BEGIN

	 
	IF @RestrictType = 'I' 
		UPDATE [dbo].[RL_Universal]	SET [Min] = @Min, [Max] = @Max, [NoBuy] = @NoBuy
			WHERE [ClientId] = @ClientId AND [CORG] = @CORG AND [CORGid] = @CORGid AND [RestrictType] = @RestrictType AND [IssueRid] = @IssueRid AND [LimitType] = @LimitType;	
	ELSE
		UPDATE [dbo].[RL_Universal]	SET [Min] = @Min, [Max] = @Max, [NoBuy] = @NoBuy
			WHERE [ClientId] = @ClientId AND [CORG] = @CORG AND [CORGid] = @CORGid AND [RestrictType] = @RestrictType AND [TypesList] = @TypesList AND [LimitType] = @LimitType;

	
	IF @@ROWCOUNT = 0 BEGIN
		BEGIN TRAN t;
		IF @Ridtodel IS NOT NULL DELETE FROM [RL_Universal] WHERE [id] = @Ridtodel;
		INSERT INTO [dbo].[RL_Universal]
				   ([id], [ClientId], [CORG], [CORGid], [RestrictType], [IssueRid], [TypesList], [LimitType], [Min], [Max], [NoBuy])
			 VALUES
				   (NEWID(), @ClientId, @CORG, @CORGid, @RestrictType, @IssueRid, @TypesList, @LimitType, @Min, @Max, @NoBuy);
		COMMIT TRAN t;
	END;


END
GO
/****** Object:  StoredProcedure [dbo].[RL_U_CopyToClient]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[RL_U_CopyToClient]
	@Rid uniqueidentifier,
	@ClientTo int
AS
BEGIN
	DECLARE @CORG nvarchar(5);
	DECLARE @CORGid uniqueidentifier;
	DECLARE @RestrictType nvarchar(5);
	DECLARE @IssueRid uniqueidentifier;
	DECLARE @TypesList nvarchar(250);
	DECLARE @LimitType nvarchar(5);
	DECLARE @Min real;
	DECLARE @Max real;
	DECLARE @NoBuy int;

	SELECT 
		@CORG = [CORG]
      , @CORGid = [CORGid]
      , @RestrictType = [RestrictType]
      , @IssueRid = [IssueRid]
      , @TypesList = [TypesList]
      , @LimitType = [LimitType]
      , @Min = [Min]
      , @Max = [Max]
	  , @NoBuy = [NoBuy]
  FROM [dbo].[RL_Universal] WHERE [id] = @Rid;

  IF @@ROWCOUNT > 0
	EXEC [RL_U_AddUpdate] 
		@ClientTo, @CORG, @CORGid, @RestrictType, @IssueRid, @TypesList, @LimitType, @Min, @Max, @NoBuy;

END
GO
/****** Object:  StoredProcedure [dbo].[ShowPortfolio]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ShowPortfolio]
	@ClientId		int,
	@LimitId		int
AS
BEGIN

	declare @LimitQuery varchar(MAX) = ''

	SELECT @LimitQuery = [Condition] FROM [dbo].[CL] WHERE [Id] = @LimitId AND [IsComplex] <> 0
	
	SELECT * FROM FactTable ORDER BY ClientCode
	
	/*
	if @LimitView is null
		return
		
	declare @LimitCheckSql nvarchar(max) = 
		'select t.* from
			(select lv.*, 
					case when lv.LimitValue < cl.MinValue then 11												-- LimitCheckFailLevel.LowerFail
						when lv.LimitValue > cl.MaxValue then 12												-- LimitCheckFailLevel.UpperFail
						when (lv.LimitValue < cl.LowerWarning) and (lv.LimitValue >= cl.MinValue) then 1		-- LimitCheckFailLevel.LowerWarning
						when (lv.LimitValue > cl.UpperWarning) and (lv.LimitValue <= cl.MaxValue) then 2		-- LimitCheckFailLevel.UpperWarning
						else 0																					-- LimitCheckFailLevel.NoFail
					end as FailLevel,
					CONVERT(float, cl.MinValue) AS Мин,
					CONVERT(float, cl.MaxValue) AS Макс
			from dbo.' + @LimitView + ' lv
			inner join dbo.ClientsLimits cl on lv.ClientCode = cl.ClientCode
			where cl.IsActive = 1 and
				cl.LimitId = @pLimitId and
				(cl.ClientCode = @pClientCode or @pClientCode is null)
			) AS t'

	print @LimitCheckSql
			
	exec sp_executesql @LimitCheckSql, N'@pLimitId int, @pClientCode int', @pLimitId = @LimitId, @pClientCode = @ClientCode


	
	*/

END
GO
/****** Object:  StoredProcedure [dbo].[SL_CheckEventsInLast]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SL_CheckEventsInLast]
AS
BEGIN

	INSERT INTO [SL_Events]
			   ([Date]
			   ,[CB_Name]
			   ,[CB]
			   ,[ID_CB_SDH]
			   ,[PCurr]
			   ,[PPrev]
			   ,[Readed]
			   ,[Reader])
	(
			   SELECT 
				ISNULL([Date1],GETDATE())
				,[CB_Name]
				,[CB]
				,[ID_CB_SDH]
				,ISNULL([P1], 0)
				,ISNULL([P2], 0)
				,0
				,''
			   FROM [SL_LastChanging]
			   WHERE [P5Changed] = 1
	)

END
GO
/****** Object:  StoredProcedure [dbo].[SL_EveryDayCheck]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SL_EveryDayCheck]
AS
BEGIN
	EXEC SL_GetList
	EXEC SL_CheckEventsInLast
END
GO
/****** Object:  StoredProcedure [dbo].[SL_GetList]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SL_GetList]
AS
BEGIN

	DECLARE @vCurrDT	datetime
	SET	@vCurrDT	=	GETDATE() 

	INSERT INTO [dbo].[SL_Data]
			   ([SLDate]
			   ,[CB_Name]
			   ,[CB]
			   ,[ID_CB_SDH]
			   ,[RegCode]
			   ,[SummQty]
			   ,[announced_volume]
			   ,[Percent])
	(	
		SELECT @vCurrDT 
			  ,p.[CB_Name]
			  ,p.[CB]
			  ,p.[ID_CB_SDH]
			  ,p.[RegCode]
			  ,p.[SummQty]
			  , ISNULL(t.[amount_units], ISNULL(sv.vol, 0)) AS [announced_volume]
			  , CASE WHEN t.[amount_units] > 0 
					THEN (p.[SummQty] / t.[amount_units]) * 100 
					ELSE 
						CASE WHEN ISNULL(sv.vol, 0) > 0 THEN (p.[SummQty] / ISNULL(sv.vol, 0)) * 100 ELSE 101 END
					END AS [Percent]
			/*  ,ISNULL(sv.vol, 0) AS [announced_volume]
			  ,CASE WHEN ISNULL(sv.vol, 0) > 0 THEN (p.[SummQty] / ISNULL(sv.vol, 0)) * 100 ELSE 101 END AS [Percent] 
			 
			  ,t.[amount_units] AS [announced_volume]
			  , CASE WHEN t.[amount_units] > 0 THEN (p.[SummQty] / t.[amount_units]) * 100 ELSE 101 END AS [Percent] 
			  */
		  FROM 
			(SELECT CB_Name, CB, ID_CB_SDH, ID_Emit_SDH, RegCode,   SUM([Quantity]) AS SummQty
			FROM [Cache_CurrentPortfolio] WHERE [ClientCode] IN (SELECT [ClientId] FROM [ClientsFilter] WHERE [UseInSL] = 1)
					AND [Type] IN ('ао', 'ап') AND ID_CB_SDH IS NOT NULL GROUP BY CB_Name, CB, ID_CB_SDH, ID_Emit_SDH, RegCode) AS p
			LEFT JOIN 
			SDH_StocksVolume AS sv ON (p.ID_Emit_SDH = sv.emitents_id) 
			LEFT JOIN
			(
				SELECT isc.* FROM
				(
					SELECT [stockid],[amount_units],ROW_NUMBER() OVER(PARTITION BY [stockid] ORDER BY [changedate] desc) AS rn
					FROM [SDH].[SDH].[dbo].[issue_stock_circulations]
				) AS isc WHERE isc.rn = 1			
							
			) AS t ON (p.[ID_CB_SDH] = t.[stockid])
			
	)

END
GO
/****** Object:  StoredProcedure [dbo].[SL_GetUnreaded]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SL_GetUnreaded]
AS
BEGIN
	SELECT * FROM SL_Events WHERE Readed = 0 ORDER BY [Date] desc, CB
END
GO
/****** Object:  StoredProcedure [dbo].[SL_GetUnreaded_Mailer]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SL_GetUnreaded_Mailer]
AS
BEGIN
	SELECT * FROM SL_Events WHERE (Readed = 0) AND ((PCurr <> 0 AND PPrev <> 0) OR (ABS(PCurr - PPrev) > 5)) ORDER BY [Date] desc, CB
END
GO
/****** Object:  StoredProcedure [dbo].[SL_ReadEvent]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SL_ReadEvent]
	@CB	varchar,
	@EvDate	datetime
AS
BEGIN
	UPDATE [SL_Events] SET [Readed] = 1,[Reader] = SUSER_NAME()
	--SELECT * FROM [SL_Events]
	WHERE [CB] LIKE ('%' + @CB + '%') AND DATEDIFF(S, [Date], CONVERT(datetime, @EvDate)) < 2
										AND DATEDIFF(S, [Date], CONVERT(datetime, @EvDate)) > -2
END
GO
/****** Object:  StoredProcedure [dbo].[tmp_Ierarchy]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[tmp_Ierarchy]
AS


SELECT  cl.НаименованиеКлиента
		,rl.ClientId
      ,rl.rid
	  ,g.GroupName
      ,rl.LimitValue
	 ,gc.contrid
	 ,ft.Issuer
	 ,ft.[Percent]
	 ,ft.InstrumentName
  FROM RestrictList AS rl INNER JOIN  _CL_Clients_2 AS cl ON (rl.ClientId = cl.КодКлиента)
		LEFT JOIN CL_Groups AS g ON (rl.rid = g.Rid) LEFT JOIN CL_GroupsContent AS gc ON (gc.GroupId = g.Id)
		INNER JOIN FactTable AS ft ON (rl.ClientId = ft.ClientCode AND gc.contrid = ft.contrid)
WHERE rl.Type = 'X' AND ft.InstrumentType IN ('акция','облигация')
ORDER BY rl.ClientId, g.Id, ft.Issuer


GO
/****** Object:  StoredProcedure [dbo].[User_TransformOldParams]    Script Date: 11.12.2024 13:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[User_TransformOldParams]
AS
BEGIN
	
	print 'Desactivate PK and IDENTITY on CL_Groups!'

	BEGIN TRY 
		BEGIN TRANSACTION
			DELETE FROM [ClientsLimits]
			INSERT INTO [ClientsLimits]
					   ([LimitId]
					   ,[ClientCode]
					   ,[IsActive]
					   ,[MinValue]
					   ,[MaxValue]
					   ,[LowerWarning]
					   ,[UpperWarning])
				(
				SELECT  10000 + l.NewLimitId AS [LimitId]
						,cl.[ClientCode]
						,cl.Active AS [IsActive]
						,cl.[MinValue]
						,cl.[MaxValue]						
						,cl.[LowerThreshold] AS [LowerWarning]
						,cl.[UpperThreshold] AS [UpperWarning]
					FROM [MSK-CO1-LC1\LC1].[LimitControlSimple_prod].[dbo].[ClientLimits] AS cl 
						LEFT JOIN [MSK-CO1-LC1\LC1].[LimitControlSimple_prod].[dbo].[Limits] AS l ON (cl.LimitId = l.Id)
				WHERE l.NewLimitId IS NOT NULL AND cl.Active <> 0				
				)

			UPDATE [ClientsLimits] SET [MaxValue] = 100, [UpperWarning] = 90 WHERE [LimitId] IN (10069, 10071, 10075)

			print 'ClientsLimits OK!'


			DELETE FROM [RestrictList]
			INSERT INTO [dbo].[RestrictList]
					   ([ClientId]
					   ,[Type]
					   ,[rid]
					   ,[LimitType]
					   ,[LimitValue]
					   ,[Echelon])
				 (SELECT [ClientId]
					  ,[Type]
					  ,[rid]
					  ,[LimitType]
					  ,[LimitValue]
					  ,[Echelon]
				  FROM [MSK-CO1-LC1\LC1].[LimitControlSimple_prod].[dbo].[RestrictList])
			print 'Restrictions OK!'

			DELETE FROM [CL_Groups]
			INSERT INTO [CL_Groups]
					   ([Id]
					   ,[Rid]
					   ,[GroupName])
				 (SELECT [Id]
					  ,[Rid]
					  ,[GroupName]
				  FROM [MSK-CO1-LC1\LC1].[LimitControlSimple_prod].[dbo].[CL_Groups])

			DELETE FROM [CL_GroupsContent]
			INSERT INTO [CL_GroupsContent]
					   ([GroupId]
					   ,[contrid])
				 (SELECT [GroupId]
					  ,[contrid]
				  FROM [MSK-CO1-LC1\LC1].[LimitControlSimple_prod].[dbo].[CL_GroupsContent])


			DELETE FROM [CL_SubGroup]
			INSERT INTO [CL_SubGroup]
					   ([ParentId]
					   ,[ChildId])
				(SELECT [ParentId]
					  ,[ChildId]
				  FROM [MSK-CO1-LC1\LC1].[LimitControlSimple_prod].[dbo].[CL_SubGroup])

			print 'Groups with content OK'



			INSERT INTO [dbo].[CL_Groups]
					   ([Id]
					   ,[Rid]
					   ,[GroupName])
				 (SELECT -t.[Id],
						NEWID(),
						'Вкладчики ' + CONVERT(varchar, t.[Id]) FROM
						(
							SELECT DISTINCT [Id] FROM [MSK-CO1-LC1\LC1].[LimitControlSimple_prod].[dbo].[InvestorsList]
						) AS t)

			INSERT INTO [CL_GroupsContent]
					   ([GroupId]
					   ,[contrid])
				 (SELECT -[Id]
					  ,[Conrtid]
				  FROM [MSK-CO1-LC1\LC1].[LimitControlSimple_prod].[dbo].[InvestorsList])


			DELETE FROM [ClientsInvestorList]
			INSERT INTO [ClientsInvestorList]
					   ([ClientId]
					   ,[InvestorListId])
				 (SELECT [ClientId]
					  ,-[InvestorListId]
				  FROM [MSK-CO1-LC1\LC1].[LimitControlSimple_prod].[dbo].[ClientsInvestorList])

			print 'Investors OK'


		COMMIT TRANSACTION
	END TRY  
	BEGIN CATCH 
		ROLLBACK TRANSACTION
		print 'Error! Rollback all'
	END CATCH 

	print 'Activate PK and IDENTITY on CL_Groups!'

END






GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CL', @level2type=N'COLUMN',@level2name=N'GroupByEmit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 - Common, 1 - Group, 2 - Emitent, 3 - Instrument' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CL', @level2type=N'COLUMN',@level2name=N'LimitType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifier of group, emitent or instrument depending on limit type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ClientsLimits', @level2type=N'COLUMN',@level2name=N'Identifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C - contragent  G - group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RL_Universal', @level2type=N'COLUMN',@level2name=N'CORG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'I - конкретный выпуск, A - любая бумага эмитента из указанных типов, S - сумма бумаг эмитента из типов' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RL_Universal', @level2type=N'COLUMN',@level2name=N'RestrictType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'P - %, R - рубли' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RL_Universal', @level2type=N'COLUMN',@level2name=N'LimitType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'> 127 возможность редактирования' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserAccess', @level2type=N'COLUMN',@level2name=N'AccessMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 - просмотр, 2 - проверка лимитов, 4 - плановый портфель и обновление, 8 - редактирование ведомостей, групп, 16 - редактирование ограничений, 32 - редактирование лимитов' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserAccess_Web', @level2type=N'COLUMN',@level2name=N'AccessMode'
GO
USE [master]
GO
ALTER DATABASE [LC3_dev] SET  READ_WRITE 
GO
