USE [changeit]
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_VerificarPuntoHabito]    Script Date: 26/6/2021 02:00:41 ******/
DROP PROCEDURE [dbo].[changeit_SP_VerificarPuntoHabito]
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_VerificarCostoHabito]    Script Date: 26/6/2021 02:00:41 ******/
DROP PROCEDURE [dbo].[changeit_SP_VerificarCostoHabito]
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_GeneracionDeUsers]    Script Date: 26/6/2021 02:00:41 ******/
DROP PROCEDURE [dbo].[changeit_SP_GeneracionDeUsers]
GO
ALTER TABLE [dbo].[Values] DROP CONSTRAINT [FK_Values_UTMTags]
GO
ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [FK_Transactions_TransType]
GO
ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [FK_Transactions_TransSubTypes]
GO
ALTER TABLE [dbo].[Transactions] DROP CONSTRAINT [FK_Transactions_PaymentAttempts]
GO
ALTER TABLE [dbo].[TagsxPost] DROP CONSTRAINT [FK_TagsxPost_UTMTags]
GO
ALTER TABLE [dbo].[TagsxPost] DROP CONSTRAINT [fk_TagsxPost_PostId1]
GO
ALTER TABLE [dbo].[Prices] DROP CONSTRAINT [FK_Prices_Locations]
GO
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [fk_Post_UserId1]
GO
ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [fk_Post_PostypeId1]
GO
ALTER TABLE [dbo].[PostInteractions] DROP CONSTRAINT [fk_PostInteractions_UserId1]
GO
ALTER TABLE [dbo].[PostInteractions] DROP CONSTRAINT [fk_PostInteractions_PostId1]
GO
ALTER TABLE [dbo].[PostInteractions] DROP CONSTRAINT [fk_PostInteractions_Interaction1]
GO
ALTER TABLE [dbo].[PaymentAttempts] DROP CONSTRAINT [fk_PaymentAttempts_User1]
GO
ALTER TABLE [dbo].[PaymentAttempts] DROP CONSTRAINT [fk_PaymentAttempts_Status1]
GO
ALTER TABLE [dbo].[PaymentAttempts] DROP CONSTRAINT [fk_PaymentAttempts_Merchant1]
GO
ALTER TABLE [dbo].[MediaAuthentication] DROP CONSTRAINT [fk_Media_UserId1]
GO
ALTER TABLE [dbo].[MediaAuthentication] DROP CONSTRAINT [fk_Media_MediaId1]
GO
ALTER TABLE [dbo].[Logs] DROP CONSTRAINT [FK_Logs_Severities]
GO
ALTER TABLE [dbo].[Logs] DROP CONSTRAINT [FK_Logs_LogTypes]
GO
ALTER TABLE [dbo].[Logs] DROP CONSTRAINT [FK_Logs_EntityTypes]
GO
ALTER TABLE [dbo].[Logs] DROP CONSTRAINT [FK_Logs_AppSource]
GO
ALTER TABLE [dbo].[LocationsxUser] DROP CONSTRAINT [fk_LocationxUsers_User1]
GO
ALTER TABLE [dbo].[LocationsxHabit] DROP CONSTRAINT [fk_LocationxHabit_Location1]
GO
ALTER TABLE [dbo].[LocationsxHabit] DROP CONSTRAINT [FK_LocationsxHabit_Habits1]
GO
ALTER TABLE [dbo].[Locations] DROP CONSTRAINT [FK_Locations_Cities]
GO
ALTER TABLE [dbo].[Habits] DROP CONSTRAINT [FK_Habits_Users]
GO
ALTER TABLE [dbo].[HabitCheck] DROP CONSTRAINT [FK_HabitCheck_Users]
GO
ALTER TABLE [dbo].[HabitCheck] DROP CONSTRAINT [FK_HabitCheck_Locations]
GO
ALTER TABLE [dbo].[HabitCheck] DROP CONSTRAINT [FK_HabitCheck_Habits]
GO
ALTER TABLE [dbo].[AcomplishedGoals] DROP CONSTRAINT [fk_Acomplished_Habit1]
GO
ALTER TABLE [dbo].[AcomplishedGoals] DROP CONSTRAINT [fk_Acomplished_Achiev1]
GO
ALTER TABLE [dbo].[flyway_schema_history] DROP CONSTRAINT [DF__flyway_sc__insta__2E11BAA1]
GO
/****** Object:  Table [dbo].[Values]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Values]') AND type in (N'U'))
DROP TABLE [dbo].[Values]
GO
/****** Object:  Table [dbo].[UTMTags]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UTMTags]') AND type in (N'U'))
DROP TABLE [dbo].[UTMTags]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[TransType]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransType]') AND type in (N'U'))
DROP TABLE [dbo].[TransType]
GO
/****** Object:  Table [dbo].[TransSubTypes]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransSubTypes]') AND type in (N'U'))
DROP TABLE [dbo].[TransSubTypes]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Transactions]') AND type in (N'U'))
DROP TABLE [dbo].[Transactions]
GO
/****** Object:  Table [dbo].[TagsxPost]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TagsxPost]') AND type in (N'U'))
DROP TABLE [dbo].[TagsxPost]
GO
/****** Object:  Table [dbo].[SocialMedia]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SocialMedia]') AND type in (N'U'))
DROP TABLE [dbo].[SocialMedia]
GO
/****** Object:  Table [dbo].[Severities]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Severities]') AND type in (N'U'))
DROP TABLE [dbo].[Severities]
GO
/****** Object:  Table [dbo].[Prices]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prices]') AND type in (N'U'))
DROP TABLE [dbo].[Prices]
GO
/****** Object:  Table [dbo].[PostTypes]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostTypes]') AND type in (N'U'))
DROP TABLE [dbo].[PostTypes]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Posts]') AND type in (N'U'))
DROP TABLE [dbo].[Posts]
GO
/****** Object:  Table [dbo].[PostInteractions]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostInteractions]') AND type in (N'U'))
DROP TABLE [dbo].[PostInteractions]
GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentStatus]') AND type in (N'U'))
DROP TABLE [dbo].[PaymentStatus]
GO
/****** Object:  Table [dbo].[PaymentAttempts]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentAttempts]') AND type in (N'U'))
DROP TABLE [dbo].[PaymentAttempts]
GO
/****** Object:  Table [dbo].[Merchants]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Merchants]') AND type in (N'U'))
DROP TABLE [dbo].[Merchants]
GO
/****** Object:  Table [dbo].[MediaAuthentication]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MediaAuthentication]') AND type in (N'U'))
DROP TABLE [dbo].[MediaAuthentication]
GO
/****** Object:  Table [dbo].[LogTypes]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogTypes]') AND type in (N'U'))
DROP TABLE [dbo].[LogTypes]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logs]') AND type in (N'U'))
DROP TABLE [dbo].[Logs]
GO
/****** Object:  Table [dbo].[LocationsxUser]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LocationsxUser]') AND type in (N'U'))
DROP TABLE [dbo].[LocationsxUser]
GO
/****** Object:  Table [dbo].[LocationsxHabit]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LocationsxHabit]') AND type in (N'U'))
DROP TABLE [dbo].[LocationsxHabit]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
DROP TABLE [dbo].[Locations]
GO
/****** Object:  Table [dbo].[Interactions]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Interactions]') AND type in (N'U'))
DROP TABLE [dbo].[Interactions]
GO
/****** Object:  Table [dbo].[Habits]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Habits]') AND type in (N'U'))
DROP TABLE [dbo].[Habits]
GO
/****** Object:  Table [dbo].[HabitCheck]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HabitCheck]') AND type in (N'U'))
DROP TABLE [dbo].[HabitCheck]
GO
/****** Object:  Table [dbo].[flyway_schema_history]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[flyway_schema_history]') AND type in (N'U'))
DROP TABLE [dbo].[flyway_schema_history]
GO
/****** Object:  Table [dbo].[Fast_Food_Restaurants2]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Fast_Food_Restaurants2]') AND type in (N'U'))
DROP TABLE [dbo].[Fast_Food_Restaurants2]
GO
/****** Object:  Table [dbo].[EntityTypes]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EntityTypes]') AND type in (N'U'))
DROP TABLE [dbo].[EntityTypes]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cities]') AND type in (N'U'))
DROP TABLE [dbo].[Cities]
GO
/****** Object:  Table [dbo].[Ausar]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ausar]') AND type in (N'U'))
DROP TABLE [dbo].[Ausar]
GO
/****** Object:  Table [dbo].[AppSource]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AppSource]') AND type in (N'U'))
DROP TABLE [dbo].[AppSource]
GO
/****** Object:  Table [dbo].[AcomplishedGoals]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AcomplishedGoals]') AND type in (N'U'))
DROP TABLE [dbo].[AcomplishedGoals]
GO
/****** Object:  Table [dbo].[Achievements]    Script Date: 26/6/2021 02:00:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Achievements]') AND type in (N'U'))
DROP TABLE [dbo].[Achievements]
GO
/****** Object:  Table [dbo].[Achievements]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achievements](
	[AchievementId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NOT NULL,
 CONSTRAINT [PK__Achievem__276330C098FDF0E4] PRIMARY KEY CLUSTERED 
(
	[AchievementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcomplishedGoals]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcomplishedGoals](
	[AcomplishedGoals] [bigint] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[HabitId] [bigint] NOT NULL,
	[AchievmentId] [bigint] NOT NULL,
	[meassureUnit] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Acomplis__3D602F193B394342] PRIMARY KEY CLUSTERED 
(
	[AcomplishedGoals] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppSource]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppSource](
	[AppSourceId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varbinary](300) NULL,
 CONSTRAINT [PK_AppSource] PRIMARY KEY CLUSTERED 
(
	[AppSourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ausar]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ausar](
	[ï»¿ID] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[province] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[latitude] [varchar](50) NULL,
	[longitude] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Cities] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityTypes]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityTypes](
	[EntityTypeId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varbinary](300) NULL,
 CONSTRAINT [PK_EntityTypes] PRIMARY KEY CLUSTERED 
(
	[EntityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fast_Food_Restaurants2]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fast_Food_Restaurants2](
	[id] [varchar](max) NULL,
	[dateAdded] [varchar](max) NULL,
	[dateUpdated] [varchar](max) NULL,
	[address] [varchar](max) NULL,
	[categories] [varchar](max) NULL,
	[city] [varchar](max) NULL,
	[country] [varchar](max) NULL,
	[keys] [varchar](max) NULL,
	[latitude] [varchar](max) NULL,
	[longitude] [varchar](max) NULL,
	[name] [varchar](max) NULL,
	[postalCode] [varchar](max) NULL,
	[province] [varchar](max) NULL,
	[sourceURLs] [varchar](max) NULL,
	[websites] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flyway_schema_history]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flyway_schema_history](
	[installed_rank] [int] NOT NULL,
	[version] [nvarchar](50) NULL,
	[description] [nvarchar](200) NULL,
	[type] [nvarchar](20) NOT NULL,
	[script] [nvarchar](1000) NOT NULL,
	[checksum] [int] NULL,
	[installed_by] [nvarchar](100) NOT NULL,
	[installed_on] [datetime] NOT NULL,
	[execution_time] [int] NOT NULL,
	[success] [bit] NOT NULL,
 CONSTRAINT [flyway_schema_history_pk] PRIMARY KEY CLUSTERED 
(
	[installed_rank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HabitCheck]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabitCheck](
	[HabitCheckId] [bigint] IDENTITY(1,1) NOT NULL,
	[HabitId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[LocationId] [bigint] NOT NULL,
	[ComputerName] [varchar](300) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[IP] [varchar](50) NOT NULL,
	[CheckSum] [varbinary](300) NOT NULL,
 CONSTRAINT [PK_HabitCheck] PRIMARY KEY CLUSTERED 
(
	[HabitCheckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habits]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habits](
	[HabitId] [bigint] IDENTITY(1,1) NOT NULL,
	[Tittle] [nvarchar](128) NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[Description] [varchar](256) NOT NULL,
	[PictureURL] [varchar](200) NOT NULL,
	[Enable] [bit] NOT NULL,
	[UserId] [bigint] NOT NULL,
 CONSTRAINT [PK__Habits__C587AF633F04D177] PRIMARY KEY CLUSTERED 
(
	[HabitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Habits] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interactions]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interactions](
	[InteractionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Interact__922C0496A3BE1058] PRIMARY KEY CLUSTERED 
(
	[InteractionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [bigint] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NOT NULL,
	[Location] [geography] NOT NULL,
 CONSTRAINT [PK__Location__E7FEA497591B7867] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationsxHabit]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationsxHabit](
	[LocationxHabitId] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationId] [bigint] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Amount] [money] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Ratio] [float] NOT NULL,
	[HabitId] [bigint] NOT NULL,
	[ComputerName] [varchar](300) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[IP] [varchar](50) NOT NULL,
	[CheckSum] [varbinary](300) NOT NULL,
 CONSTRAINT [PK__Location__2C0422C3B7F1750D] PRIMARY KEY CLUSTERED 
(
	[LocationxHabitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationsxUser]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationsxUser](
	[LocationxUserId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Location] [geography] NOT NULL,
	[PostTime] [datetime] NOT NULL,
 CONSTRAINT [PK__Location__CC650774DE834DEB] PRIMARY KEY CLUSTERED 
(
	[LocationxUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[LogId] [bigint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[Description] [varchar](300) NULL,
	[ComputerName] [varchar](300) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[IP] [varchar](50) NOT NULL,
	[Ref1] [bigint] NOT NULL,
	[Ref2] [bigint] NOT NULL,
	[OldValue] [varchar](200) NOT NULL,
	[NewValue] [varchar](200) NOT NULL,
	[CheckSum] [varbinary](300) NOT NULL,
	[LogTypeId] [int] NOT NULL,
	[AppSourceId] [int] NOT NULL,
	[EntityTypeId] [int] NOT NULL,
	[SevirityId] [int] NOT NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[PostTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogTypes]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTypes](
	[LogTypeId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varbinary](300) NULL,
 CONSTRAINT [PK_LogTypes] PRIMARY KEY CLUSTERED 
(
	[LogTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaAuthentication]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaAuthentication](
	[MediaAuthenticationId] [bigint] IDENTITY(1,1) NOT NULL,
	[Token] [varbinary](200) NOT NULL,
	[tokenStartDate] [datetime] NOT NULL,
	[tokenEndDate] [datetime] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[SocialMediaId] [int] NOT NULL,
	[ReferenceNumber] [varbinary](200) NOT NULL,
 CONSTRAINT [PK__MediaAut__2C86F6C7C832351E] PRIMARY KEY CLUSTERED 
(
	[MediaAuthenticationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Merchants]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Merchants](
	[Merchantid] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[MerchantURL] [varchar](200) NOT NULL,
	[IconURL] [varchar](200) NOT NULL,
 CONSTRAINT [PK__Merchant__044E508BD4FE890F] PRIMARY KEY CLUSTERED 
(
	[Merchantid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Merchants] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentAttempts]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentAttempts](
	[PaymentAttemptId] [bigint] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](20, 2) NOT NULL,
	[description] [varchar](365) NULL,
	[CurrencySymbol] [varchar](6) NOT NULL,
	[Posttime] [date] NOT NULL,
	[ReferenceNumber] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ErrorNumber] [int] NOT NULL,
	[MerchantTransNumber] [int] NOT NULL,
	[PaymentTimeStamp] [timestamp] NOT NULL,
	[IpAdress] [varchar](100) NOT NULL,
	[CheckSum] [varbinary](300) NOT NULL,
	[MerchantId] [bigint] NOT NULL,
	[PaymentStatusId] [int] NOT NULL,
 CONSTRAINT [PK__PaymentA__1D02F9A75267F7D1] PRIMARY KEY CLUSTERED 
(
	[PaymentAttemptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentStatus](
	[PaymentStatusId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK__PaymentS__34F8AC3F80B24FBB] PRIMARY KEY CLUSTERED 
(
	[PaymentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostInteractions]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostInteractions](
	[PostInteractionId] [bigint] IDENTITY(1,1) NOT NULL,
	[PostId] [bigint] NOT NULL,
	[UserID] [bigint] NULL,
	[InteractionId] [int] NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[Quantity] [bigint] NOT NULL,
	[CheckSum] [varbinary](300) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[ComputerName] [varchar](300) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[IP] [varchar](50) NOT NULL,
 CONSTRAINT [PK__PostInte__4DBCE0E9B41DC1E0] PRIMARY KEY CLUSTERED 
(
	[PostInteractionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[PostURL] [varchar](200) NOT NULL,
	[UserId] [bigint] NULL,
	[PostTypeId] [int] NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[ActionURL] [varchar](255) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[ComputerName] [varchar](300) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[IP] [varchar](50) NOT NULL,
	[CheckSum] [varbinary](300) NOT NULL,
 CONSTRAINT [PK__Posts__AA12601830DADA69] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostTypes]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTypes](
	[PostTypeID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK__PostType__AB212610BF6E1D3A] PRIMARY KEY CLUSTERED 
(
	[PostTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prices]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prices](
	[PriceId] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationId] [bigint] NOT NULL,
	[ToValue] [money] NOT NULL,
	[FromValue] [money] NOT NULL,
	[PostTime] [datetime] NOT NULL,
 CONSTRAINT [PK__Prices__49575BAFFA66A0FA] PRIMARY KEY CLUSTERED 
(
	[PriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Severities]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Severities](
	[SevirityId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varbinary](300) NULL,
 CONSTRAINT [PK_Severities] PRIMARY KEY CLUSTERED 
(
	[SevirityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialMedia]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialMedia](
	[SocialMediaId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[mediaURL] [varchar](200) NOT NULL,
 CONSTRAINT [PK__SocialMe__3B026C1BFBF3A5D8] PRIMARY KEY CLUSTERED 
(
	[SocialMediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsxPost]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsxPost](
	[TagsxPostID] [bigint] IDENTITY(1,1) NOT NULL,
	[PostId] [bigint] NOT NULL,
	[UTMTagId] [bigint] NOT NULL,
 CONSTRAINT [PK__TagsxPos__72C6953A981F998F] PRIMARY KEY CLUSTERED 
(
	[TagsxPostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [bigint] IDENTITY(1,1) NOT NULL,
	[checksum] [varbinary](300) NOT NULL,
	[computerName] [varchar](200) NOT NULL,
	[Date] [datetime] NOT NULL,
	[TransTypeId] [int] NOT NULL,
	[TransSubTypeId] [int] NOT NULL,
	[ReferenceId1] [bigint] NOT NULL,
	[ReferenceId2] [bigint] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[IpAddress] [varbinary](16) NOT NULL,
	[PaymentAttemptId] [bigint] NULL,
 CONSTRAINT [PK__Transact__55433A6BD2080A9F] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransSubTypes]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransSubTypes](
	[TransSubTypeId] [int] NOT NULL,
	[name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TransSubTypes] PRIMARY KEY CLUSTERED 
(
	[TransSubTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_TransSubTypes] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransType]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransType](
	[TransTypeId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_TransType] PRIMARY KEY CLUSTERED 
(
	[TransTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_TransType] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](128) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[secondName] [nvarchar](128) NOT NULL,
	[mail] [varchar](200) NOT NULL,
	[CheckSum] [varbinary](100) NOT NULL,
	[birthday] [datetime] NOT NULL,
 CONSTRAINT [PK__Users__1788CC4C83F1E4FE] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UTMTags]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UTMTags](
	[UTMTagId] [bigint] IDENTITY(1,1) NOT NULL,
	[utmURL] [bigint] NOT NULL,
 CONSTRAINT [PK__UTMTags__5D3836C2F083BB89] PRIMARY KEY CLUSTERED 
(
	[UTMTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Values]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Values](
	[ValueId] [bigint] NOT NULL,
	[Value] [varchar](255) NOT NULL,
	[UTMTagId] [bigint] NOT NULL,
 CONSTRAINT [PK_Values] PRIMARY KEY CLUSTERED 
(
	[ValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[flyway_schema_history] ADD  DEFAULT (getdate()) FOR [installed_on]
GO
ALTER TABLE [dbo].[AcomplishedGoals]  WITH CHECK ADD  CONSTRAINT [fk_Acomplished_Achiev1] FOREIGN KEY([AchievmentId])
REFERENCES [dbo].[Achievements] ([AchievementId])
GO
ALTER TABLE [dbo].[AcomplishedGoals] CHECK CONSTRAINT [fk_Acomplished_Achiev1]
GO
ALTER TABLE [dbo].[AcomplishedGoals]  WITH CHECK ADD  CONSTRAINT [fk_Acomplished_Habit1] FOREIGN KEY([HabitId])
REFERENCES [dbo].[Habits] ([HabitId])
GO
ALTER TABLE [dbo].[AcomplishedGoals] CHECK CONSTRAINT [fk_Acomplished_Habit1]
GO
ALTER TABLE [dbo].[HabitCheck]  WITH CHECK ADD  CONSTRAINT [FK_HabitCheck_Habits] FOREIGN KEY([HabitId])
REFERENCES [dbo].[Habits] ([HabitId])
GO
ALTER TABLE [dbo].[HabitCheck] CHECK CONSTRAINT [FK_HabitCheck_Habits]
GO
ALTER TABLE [dbo].[HabitCheck]  WITH CHECK ADD  CONSTRAINT [FK_HabitCheck_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[HabitCheck] CHECK CONSTRAINT [FK_HabitCheck_Locations]
GO
ALTER TABLE [dbo].[HabitCheck]  WITH CHECK ADD  CONSTRAINT [FK_HabitCheck_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[HabitCheck] CHECK CONSTRAINT [FK_HabitCheck_Users]
GO
ALTER TABLE [dbo].[Habits]  WITH CHECK ADD  CONSTRAINT [FK_Habits_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Habits] CHECK CONSTRAINT [FK_Habits_Users]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Cities]
GO
ALTER TABLE [dbo].[LocationsxHabit]  WITH CHECK ADD  CONSTRAINT [FK_LocationsxHabit_Habits1] FOREIGN KEY([HabitId])
REFERENCES [dbo].[Habits] ([HabitId])
GO
ALTER TABLE [dbo].[LocationsxHabit] CHECK CONSTRAINT [FK_LocationsxHabit_Habits1]
GO
ALTER TABLE [dbo].[LocationsxHabit]  WITH CHECK ADD  CONSTRAINT [fk_LocationxHabit_Location1] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[LocationsxHabit] CHECK CONSTRAINT [fk_LocationxHabit_Location1]
GO
ALTER TABLE [dbo].[LocationsxUser]  WITH CHECK ADD  CONSTRAINT [fk_LocationxUsers_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[LocationsxUser] CHECK CONSTRAINT [fk_LocationxUsers_User1]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_AppSource] FOREIGN KEY([AppSourceId])
REFERENCES [dbo].[AppSource] ([AppSourceId])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_AppSource]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_EntityTypes] FOREIGN KEY([EntityTypeId])
REFERENCES [dbo].[EntityTypes] ([EntityTypeId])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_EntityTypes]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_LogTypes] FOREIGN KEY([LogTypeId])
REFERENCES [dbo].[LogTypes] ([LogTypeId])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_LogTypes]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_Severities] FOREIGN KEY([SevirityId])
REFERENCES [dbo].[Severities] ([SevirityId])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_Severities]
GO
ALTER TABLE [dbo].[MediaAuthentication]  WITH CHECK ADD  CONSTRAINT [fk_Media_MediaId1] FOREIGN KEY([SocialMediaId])
REFERENCES [dbo].[SocialMedia] ([SocialMediaId])
GO
ALTER TABLE [dbo].[MediaAuthentication] CHECK CONSTRAINT [fk_Media_MediaId1]
GO
ALTER TABLE [dbo].[MediaAuthentication]  WITH CHECK ADD  CONSTRAINT [fk_Media_UserId1] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[MediaAuthentication] CHECK CONSTRAINT [fk_Media_UserId1]
GO
ALTER TABLE [dbo].[PaymentAttempts]  WITH CHECK ADD  CONSTRAINT [fk_PaymentAttempts_Merchant1] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[Merchants] ([Merchantid])
GO
ALTER TABLE [dbo].[PaymentAttempts] CHECK CONSTRAINT [fk_PaymentAttempts_Merchant1]
GO
ALTER TABLE [dbo].[PaymentAttempts]  WITH CHECK ADD  CONSTRAINT [fk_PaymentAttempts_Status1] FOREIGN KEY([PaymentStatusId])
REFERENCES [dbo].[PaymentStatus] ([PaymentStatusId])
GO
ALTER TABLE [dbo].[PaymentAttempts] CHECK CONSTRAINT [fk_PaymentAttempts_Status1]
GO
ALTER TABLE [dbo].[PaymentAttempts]  WITH CHECK ADD  CONSTRAINT [fk_PaymentAttempts_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[PaymentAttempts] CHECK CONSTRAINT [fk_PaymentAttempts_User1]
GO
ALTER TABLE [dbo].[PostInteractions]  WITH CHECK ADD  CONSTRAINT [fk_PostInteractions_Interaction1] FOREIGN KEY([InteractionId])
REFERENCES [dbo].[Interactions] ([InteractionId])
GO
ALTER TABLE [dbo].[PostInteractions] CHECK CONSTRAINT [fk_PostInteractions_Interaction1]
GO
ALTER TABLE [dbo].[PostInteractions]  WITH CHECK ADD  CONSTRAINT [fk_PostInteractions_PostId1] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[PostInteractions] CHECK CONSTRAINT [fk_PostInteractions_PostId1]
GO
ALTER TABLE [dbo].[PostInteractions]  WITH CHECK ADD  CONSTRAINT [fk_PostInteractions_UserId1] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[PostInteractions] CHECK CONSTRAINT [fk_PostInteractions_UserId1]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [fk_Post_PostypeId1] FOREIGN KEY([PostTypeId])
REFERENCES [dbo].[PostTypes] ([PostTypeID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [fk_Post_PostypeId1]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [fk_Post_UserId1] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [fk_Post_UserId1]
GO
ALTER TABLE [dbo].[Prices]  WITH CHECK ADD  CONSTRAINT [FK_Prices_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[Prices] CHECK CONSTRAINT [FK_Prices_Locations]
GO
ALTER TABLE [dbo].[TagsxPost]  WITH CHECK ADD  CONSTRAINT [fk_TagsxPost_PostId1] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[TagsxPost] CHECK CONSTRAINT [fk_TagsxPost_PostId1]
GO
ALTER TABLE [dbo].[TagsxPost]  WITH CHECK ADD  CONSTRAINT [FK_TagsxPost_UTMTags] FOREIGN KEY([UTMTagId])
REFERENCES [dbo].[UTMTags] ([UTMTagId])
GO
ALTER TABLE [dbo].[TagsxPost] CHECK CONSTRAINT [FK_TagsxPost_UTMTags]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_PaymentAttempts] FOREIGN KEY([PaymentAttemptId])
REFERENCES [dbo].[PaymentAttempts] ([PaymentAttemptId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_PaymentAttempts]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_TransSubTypes] FOREIGN KEY([TransSubTypeId])
REFERENCES [dbo].[TransSubTypes] ([TransSubTypeId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_TransSubTypes]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_TransType] FOREIGN KEY([TransTypeId])
REFERENCES [dbo].[TransType] ([TransTypeId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_TransType]
GO
ALTER TABLE [dbo].[Values]  WITH CHECK ADD  CONSTRAINT [FK_Values_UTMTags] FOREIGN KEY([UTMTagId])
REFERENCES [dbo].[UTMTags] ([UTMTagId])
GO
ALTER TABLE [dbo].[Values] CHECK CONSTRAINT [FK_Values_UTMTags]
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_GeneracionDeUsers]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[changeit_SP_GeneracionDeUsers]
	@n BIGINT
AS 
BEGIN	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @i BIGINT
	DECLARE @userNames TABLE (id INT, name VARCHAR(128), apellido VARCHAR(128))
	DECLARE @nombreid SMALLINT
	DECLARE @nombre VARCHAR(128)
	DECLARE @apellido VARCHAR(128)
	DECLARE @mail VARCHAR(200)
	DECLARE @DateStart DATE
	DECLARE @DateEnd  DATE 
	DECLARE @date DATE 

	BEGIN TRY
		SET @CustomError = 2001
		SET @DateStart = '1990/01/01'
		SET @DateEnd = '2002/01/01'
		SET @i = 0

		INSERT INTO @userNames VALUES (1,'Roberto','Juarez') ,(2,'Gail','Jordan'), (3,'Marta','Soto'),(4,'Juan','Perez'),(5,'Pedro','Coto'),	(6,'Alicia','Vega'),(7,'Leo','Farinha'),(8,'Ricardo','Araya')

		WHILE (@i < @n)	
		BEGIN
				SET @nombreid= CAST(RAND()*8+1 AS INT)
				SELECT @nombre = name FROM @userNames WHERE id = @nombreid

				SET @nombreid= CAST(RAND()*8+1 AS INT)		
				SELECT @apellido = apellido FROM @userNames WHERE id = @nombreid

				SET @date = DATEADD(DAY, RAND() * DATEDIFF(DAY, @DateStart, @DateEnd), @DateStart)
				SET @mail = CONCAT(@nombre,@apellido,CONVERT(VARCHAR,@i),'@gmail.com')
				SET @nombre =  CONCAT(@nombre,CONVERT(VARCHAR(50),@i))

				INSERT INTO Users VALUES 
				(@nombre, 1, @apellido,@mail, CONVERT(VARBINARY,CHECKSUM(CONCAT(@nombre,@apellido,@i))),@date)

				SET @i = @i + 1
		END	 
			
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	
END














GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_VerificarCostoHabito]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[changeit_SP_VerificarCostoHabito]
	@CenterPoint GEOGRAPHY,
	@Ratio FLOAT
AS 
BEGIN	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)

	DECLARE @locationId BIGINT
	DECLARE @locationId2 BIGINT
	DECLARE @PriceId BIGINT
	DECLARE @Point GEOGRAPHY
	DECLARE @Enable BIT
	DECLARE @Amount MONEY
	DECLARE @TotalAmount MONEY
	DECLARE @QuantHab BIGINT
	DECLARE @AuxQuantHab BIGINT
	DECLARE @inside INT
	DECLARE @Population FLOAT
	DECLARE @PasValue MONEY
	DECLARE habitxlocaCursor CURSOR FOR SELECT LocationId,Enabled,Amount FROM dbo.LocationsxHabit
    DECLARE habitCheckCursor CURSOR FOR SELECT LocationId FROM dbo.HabitCheck

	SET @QuantHab = 0
	SET @TotalAmount = 1
	OPEN habitxlocaCursor
		FETCH NEXT FROM habitxlocaCursor INTO @locationId,@Enable,@Amount 
		WHILE @@FETCH_STATUS = 0
		BEGIN		
			IF @Enable = 1 
				SET @Point = (SELECT Location FROM Locations WHERE @locationId=LocationId )
				EXEC @inside = dbo.changeit_SP_VerificarPuntoHabito @Point,@Ratio,@CenterPoint
				IF @inside = 1
					SET @QuantHab = @QuantHab + 1
					SET @TotalAmount = @TotalAmount + @Amount
			FETCH NEXT FROM habitxlocaCursor INTO @locationId,@Enable,@Amount
		END
	CLOSE habitxlocaCursor
	DEALLOCATE habitxlocaCursor

	SET @Population = 1

	OPEN habitCheckCursor
		FETCH NEXT FROM habitCheckCursor INTO @locationId
		WHILE @@FETCH_STATUS = 0
		BEGIN		
			SET @Point = (SELECT Location FROM Locations WHERE @locationId=LocationId )
			EXEC @inside = dbo.changeit_SP_VerificarPuntoHabito @Point,@Ratio,@CenterPoint
			IF @inside = 1
				SET @Population = @Population + 1
			FETCH NEXT FROM habitCheckCursor INTO @locationId
		END
	CLOSE habitCheckCursor
	DEALLOCATE habitCheckCursor

	SET @TotalAmount = ((@TotalAmount/(@QuantHab+1))*(@Population/10))+10+(@Ratio/10)

	BEGIN TRY
		SET @CustomError = 2001

		SET @locationId = (SELECT LocationId FROM Locations WHERE Location.STDistance (@CenterPoint) = 0 )

		IF @locationId = NULL
			BEGIN
				IF IDENT_CURRENT('Cities') = NULL
					INSERT INTO [dbo].[Cities] VALUES ('El más alla')
				INSERT INTO Locations VALUES (1,@CenterPoint)
				SET @locationId2 = IDENT_CURRENT('Locations')
				INSERT INTO Prices VALUES (@locationId2,@TotalAmount,0, GETDATE()) 
			END
		ELSE
			BEGIN
				SET @PriceId = (SELECT PriceId FROM Prices WHERE LocationId = (@locationId))
				IF @PriceId = NULL
					BEGIN
						INSERT INTO Prices VALUES (@locationId,@TotalAmount,0, GETDATE()) 
					END
				ELSE
					BEGIN
						SET @PasValue = (SELECT ToValue FROM Prices WHERE PriceId = @PriceId)
						UPDATE Prices SET ToValue = @TotalAmount, FromValue = @PasValue , PostTime = GETDATE() WHERE PriceId = @PriceId
					END
			END	

		RETURN @TotalAmount

	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	
END

declare @location geography = geography::Point(10.660108958171534, 107.77588345061677, 4326)
INSERT INTO Locations VALUES (1,@location)
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_VerificarPuntoHabito]    Script Date: 26/6/2021 02:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[changeit_SP_VerificarPuntoHabito]
	@Point GEOGRAPHY,
	@Ratio FLOAT,
	@CenterPoint GEOGRAPHY
AS 
BEGIN	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	   	
	BEGIN TRY
		SET @CustomError = 2001

		return @CenterPoint.BufferWithTolerance ( @Ratio, 0.1, 1 ).STContains(@Point)
			
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	
END
GO
