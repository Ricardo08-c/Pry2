USE [changeit]
GO
/****** Object:  StoredProcedure [dbo].[insertHabits]    Script Date: 30/6/2021 08:31:24 ******/
DROP PROCEDURE [dbo].[insertHabits]
GO
/****** Object:  StoredProcedure [dbo].[CreateAuxTables]    Script Date: 30/6/2021 08:31:24 ******/
DROP PROCEDURE [dbo].[CreateAuxTables]
GO
/****** Object:  StoredProcedure [dbo].[checkinReference]    Script Date: 30/6/2021 08:31:24 ******/
DROP PROCEDURE [dbo].[checkinReference]
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_VerificarPuntoHabito]    Script Date: 30/6/2021 08:31:24 ******/
DROP PROCEDURE [dbo].[changeit_SP_VerificarPuntoHabito]
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_VerificarCostoHabito]    Script Date: 30/6/2021 08:31:24 ******/
DROP PROCEDURE [dbo].[changeit_SP_VerificarCostoHabito]
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_RetornarPlataPatrocinios]    Script Date: 30/6/2021 08:31:24 ******/
DROP PROCEDURE [dbo].[changeit_SP_RetornarPlataPatrocinios]
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_PostsJmeter]    Script Date: 30/6/2021 08:31:24 ******/
DROP PROCEDURE [dbo].[changeit_SP_PostsJmeter]
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_PatrocinarUnHabito]    Script Date: 30/6/2021 08:31:24 ******/
DROP PROCEDURE [dbo].[changeit_SP_PatrocinarUnHabito]
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_GenerarPatrocinios]    Script Date: 30/6/2021 08:31:24 ******/
DROP PROCEDURE [dbo].[changeit_SP_GenerarPatrocinios]
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_GeneracionDeUsers]    Script Date: 30/6/2021 08:31:24 ******/
DROP PROCEDURE [dbo].[changeit_SP_GeneracionDeUsers]
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_CheckinJmeter]    Script Date: 30/6/2021 08:31:24 ******/
DROP PROCEDURE [dbo].[changeit_SP_CheckinJmeter]
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
ALTER TABLE [dbo].[flyway_schema_history] DROP CONSTRAINT [DF__flyway_sc__insta__19C0A931]
GO
/****** Object:  Table [dbo].[Values]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Values]') AND type in (N'U'))
DROP TABLE [dbo].[Values]
GO
/****** Object:  Table [dbo].[UTMTags]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UTMTags]') AND type in (N'U'))
DROP TABLE [dbo].[UTMTags]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[TransType]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransType]') AND type in (N'U'))
DROP TABLE [dbo].[TransType]
GO
/****** Object:  Table [dbo].[TransSubTypes]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransSubTypes]') AND type in (N'U'))
DROP TABLE [dbo].[TransSubTypes]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Transactions]') AND type in (N'U'))
DROP TABLE [dbo].[Transactions]
GO
/****** Object:  Table [dbo].[TagsxPost]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TagsxPost]') AND type in (N'U'))
DROP TABLE [dbo].[TagsxPost]
GO
/****** Object:  Table [dbo].[SocialMedia]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SocialMedia]') AND type in (N'U'))
DROP TABLE [dbo].[SocialMedia]
GO
/****** Object:  Table [dbo].[Severities]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Severities]') AND type in (N'U'))
DROP TABLE [dbo].[Severities]
GO
/****** Object:  Table [dbo].[Restaurants]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Restaurants]') AND type in (N'U'))
DROP TABLE [dbo].[Restaurants]
GO
/****** Object:  Table [dbo].[Prices]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prices]') AND type in (N'U'))
DROP TABLE [dbo].[Prices]
GO
/****** Object:  Table [dbo].[PostTypes]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostTypes]') AND type in (N'U'))
DROP TABLE [dbo].[PostTypes]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Posts]') AND type in (N'U'))
DROP TABLE [dbo].[Posts]
GO
/****** Object:  Table [dbo].[PostInteractions]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PostInteractions]') AND type in (N'U'))
DROP TABLE [dbo].[PostInteractions]
GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentStatus]') AND type in (N'U'))
DROP TABLE [dbo].[PaymentStatus]
GO
/****** Object:  Table [dbo].[PaymentAttempts]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaymentAttempts]') AND type in (N'U'))
DROP TABLE [dbo].[PaymentAttempts]
GO
/****** Object:  Table [dbo].[Merchants]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Merchants]') AND type in (N'U'))
DROP TABLE [dbo].[Merchants]
GO
/****** Object:  Table [dbo].[MediaAuthentication]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MediaAuthentication]') AND type in (N'U'))
DROP TABLE [dbo].[MediaAuthentication]
GO
/****** Object:  Table [dbo].[LogTypes]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogTypes]') AND type in (N'U'))
DROP TABLE [dbo].[LogTypes]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Logs]') AND type in (N'U'))
DROP TABLE [dbo].[Logs]
GO
/****** Object:  Table [dbo].[LocationsxUser]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LocationsxUser]') AND type in (N'U'))
DROP TABLE [dbo].[LocationsxUser]
GO
/****** Object:  Table [dbo].[LocationsxHabit]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LocationsxHabit]') AND type in (N'U'))
DROP TABLE [dbo].[LocationsxHabit]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
DROP TABLE [dbo].[Locations]
GO
/****** Object:  Table [dbo].[Interactions]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Interactions]') AND type in (N'U'))
DROP TABLE [dbo].[Interactions]
GO
/****** Object:  Table [dbo].[Habits]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Habits]') AND type in (N'U'))
DROP TABLE [dbo].[Habits]
GO
/****** Object:  Table [dbo].[HabitCheck]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HabitCheck]') AND type in (N'U'))
DROP TABLE [dbo].[HabitCheck]
GO
/****** Object:  Table [dbo].[flyway_schema_history]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[flyway_schema_history]') AND type in (N'U'))
DROP TABLE [dbo].[flyway_schema_history]
GO
/****** Object:  Table [dbo].[EntityTypes]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EntityTypes]') AND type in (N'U'))
DROP TABLE [dbo].[EntityTypes]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cities]') AND type in (N'U'))
DROP TABLE [dbo].[Cities]
GO
/****** Object:  Table [dbo].[checkinValues]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[checkinValues]') AND type in (N'U'))
DROP TABLE [dbo].[checkinValues]
GO
/****** Object:  Table [dbo].[Ausar]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ausar]') AND type in (N'U'))
DROP TABLE [dbo].[Ausar]
GO
/****** Object:  Table [dbo].[AppSource]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AppSource]') AND type in (N'U'))
DROP TABLE [dbo].[AppSource]
GO
/****** Object:  Table [dbo].[AcomplishedGoals]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AcomplishedGoals]') AND type in (N'U'))
DROP TABLE [dbo].[AcomplishedGoals]
GO
/****** Object:  Table [dbo].[Achievements]    Script Date: 30/6/2021 08:31:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Achievements]') AND type in (N'U'))
DROP TABLE [dbo].[Achievements]
GO
/****** Object:  Table [dbo].[Achievements]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[AcomplishedGoals]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcomplishedGoals](
	[AcomplishedGoalId] [bigint] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[HabitId] [bigint] NOT NULL,
	[AchievmentId] [bigint] NOT NULL,
	[meassureUnit] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Acomplis__3D602F193B394342] PRIMARY KEY CLUSTERED 
(
	[AcomplishedGoalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppSource]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[Ausar]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ausar](
	[ID] [varchar](10) NULL,
	[name] [varchar](50) NULL,
	[province] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[Ausarid] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[checkinValues]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkinValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idGroupLocation] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[EntityTypes]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[flyway_schema_history]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[HabitCheck]    Script Date: 30/6/2021 08:31:24 ******/
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
	[IP] [varbinary](16) NOT NULL,
	[CheckSum] [varbinary](300) NOT NULL,
 CONSTRAINT [PK_HabitCheck] PRIMARY KEY CLUSTERED 
(
	[HabitCheckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habits]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[Interactions]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[Locations]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[CityId] [int] NOT NULL,
	[Location] [geography] NOT NULL,
 CONSTRAINT [PK__Location__E7FEA497591B7867] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationsxHabit]    Script Date: 30/6/2021 08:31:24 ******/
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
	[IP] [varbinary](16) NOT NULL,
	[CheckSum] [varbinary](300) NOT NULL,
 CONSTRAINT [PK__Location__2C0422C3B7F1750D] PRIMARY KEY CLUSTERED 
(
	[LocationxHabitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationsxUser]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[Logs]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[LogTypes]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[MediaAuthentication]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[Merchants]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[PaymentAttempts]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[PostInteractions]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[PostTypes]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[Prices]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[Restaurants]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurants](
	[id] [nvarchar](100) NOT NULL,
	[dateAdded] [nvarchar](100) NOT NULL,
	[dateUpdated] [nvarchar](100) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[categories] [nvarchar](100) NOT NULL,
	[city] [nvarchar](100) NOT NULL,
	[country] [nvarchar](100) NOT NULL,
	[keys] [nvarchar](100) NOT NULL,
	[latitude] [nvarchar](100) NOT NULL,
	[longitude] [nvarchar](100) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[postalCode] [nvarchar](100) NOT NULL,
	[province] [nvarchar](100) NOT NULL,
	[sourceURLs] [nvarchar](max) NOT NULL,
	[websites] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Severities]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[SocialMedia]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[TagsxPost]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[Transactions]    Script Date: 30/6/2021 08:31:24 ******/
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
	[HabitId] [bigint] NULL,
 CONSTRAINT [PK__Transact__55433A6BD2080A9F] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransSubTypes]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransSubTypes](
	[TransSubTypeId] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[TransType]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[UTMTags]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  Table [dbo].[Values]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Values](
	[ValueId] [bigint] IDENTITY(1,1) NOT NULL,
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
/****** Object:  StoredProcedure [dbo].[changeit_SP_CheckinJmeter]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[changeit_SP_CheckinJmeter]
	@CantidadCheks BIGINT
AS 
BEGIN 
	DECLARE @Pocos BIGINT 
	DECLARE @Medios BIGINT 
	DECLARE @Muchos BIGINT 
	DECLARE @AuxNum BIGINT 
	DECLARE @i BIGINT = 1
	DECLARE @HabitId BIGINT
	DECLARE @name VARCHAR(60)
	DECLARE @city VARCHAR(255)
	DECLARE @cityId BIGINT
	DECLARE @latitudeReference FLOAT
	DECLARE @longitudeReference FLOAT
	DECLARE @NameUs VARCHAR(128)
	DECLARE @UserID BIGINT
	DECLARE @IPaddres VARBINARY(16)
	DECLARE @FromDate DATETIME
	DECLARE @ToDate   DATETIME
	DECLARE @RanEndDat   DATETIME
	DECLARE @Seconds INT
	DECLARE @Random INT
	DECLARE @locationidpoint BIGINT
	DECLARE @ResName VARCHAR(128)

	DECLARE @FromDate2  DATETIME
	DECLARE @ToDate2  DATETIME
	DECLARE @RanEndDat2  DATETIME
	DECLARE @Seconds2 INT
	DECLARE @Random2 INT

	DECLARE @GruposZonas AS TABLE
	(			 GrupoId INT,
				 Name Varchar(50),
				 StartDate DATETIME,
				 EndDate DATETIME,
				 LAT FLOAT,
				 LON FLOAT,
				 HabitId BIGINT,
				 NameCity VARCHAR(255),
				 AuxId BIGINT IDENTITY(1,1)
	)
	SELECT * FROM Ausar
	INSERT INTO @GruposZonas 
	SELECT DISTINCT Aus.ID Grupo, Aus.name Name,LocHab.StartDate StartDate,LocHab.EndDate EndDate,Aus.latitude LAT,Aus.longitude LON,LocHab.HabitId HabitId,Aus.City NameCity  FROM Locations Locs
	INNER JOIN dbo.LocationsxHabit LocHab on LocHab.LocationId = Locs.LocationId
	INNER JOIN dbo.Ausar Aus on geography::Point(Aus.latitude, Aus.longitude, 4326).STDistance(Locs.Location) = 0 

	SET @Pocos = CAST (@CantidadCheks * 0.5 AS BIGINT)
	SET @Medios = CAST (@CantidadCheks * 0.15 AS BIGINT)
	SET @Muchos = CAST (@CantidadCheks * 0.80 AS BIGINT) 

	SET @AuxNum =(SELECT CAST(RAND()*(SELECT COUNT(AuxId) FROM @GruposZonas)+1 AS INT))

	SELECT @FromDate2 = StartDate,	@ToDate2 = EndDate	FROM @GruposZonas WHERE AuxId = @AuxNum

	SET @Seconds2= DATEDIFF(DAY, @FromDate2, @ToDate2)
	SET @Random2= ROUND(((@Seconds2-1) * RAND()), 0)
	SET @RanEndDat2= DATEADD(DAY, @Random2, @FromDate2)

		WHILE @i <=  @CantidadCheks
			BEGIN 
			IF @i <=  @Pocos
				SET @AuxNum =(SELECT CAST(RAND()*(SELECT COUNT(AuxId) FROM @GruposZonas WHERE GrupoId = 1)+1 AS INT))
			IF @i > @Pocos AND @i <= (@Medios + @Pocos)
				SET @AuxNum =(SELECT CAST(RAND()*(SELECT COUNT(AuxId) FROM @GruposZonas WHERE GrupoId = 2)+1 AS INT))
			IF @i > (@Medios + @Pocos) AND @i <= @CantidadCheks
				SET @AuxNum =(SELECT CAST(RAND()*(SELECT COUNT(AuxId) FROM @GruposZonas WHERE GrupoId = 3)+1 AS INT))

			SELECT @ResName = Name , @FromDate = StartDate,	@ToDate = EndDate,	@latitudeReference = LAT,	@longitudeReference = LON,	@HabitId = HabitId,	@city = NameCity
			FROM @GruposZonas WHERE AuxId = @AuxNum
			
			IF @RanEndDat2 >= @FromDate AND @RanEndDat2 <= @ToDate
				BEGIN
					SET @cityId = (SELECT CityId FROM Cities WHERE Name = @city)

					DECLARE @puntoRand FLOAT =  0.0001*(RAND()*100+10)*CAST(RAND()*9 AS INT)
					DECLARE @locationPoint GEOGRAPHY = GEOGRAPHY::Point((@latitudeReference+@puntoRand), (@longitudeReference+@puntoRand), 4326)
					INSERT INTO Locations VALUES (CONCAT(@ResName,CAST(RAND()*(99999999-10000000)+10000000 AS BIGINT)),@cityId,@locationPoint)
		
					SET @locationidpoint =  SCOPE_IDENTITY()

					SET @UserID = CAST(RAND()*(IDENT_CURRENT('Users')) AS BIGINT)

					set ansi_nulls off
					WHILE (SELECT Name FROM Users WHERE UserId = @UserID) = NULL
						BEGIN
						SET @UserID = CAST(RAND()*(IDENT_CURRENT('Users')) AS BIGINT)
						END

					SET @NameUs = CONCAT((SELECT Name FROM Users WHERE UserId = @UserID),' User',@UserID,CAST(RAND()*(IDENT_CURRENT('Users')+1) AS INT))
					SET @IPaddres = CAST( CONCAT(CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1)) AS VARBINARY)
					SET @Seconds = DATEDIFF(SECOND, @FromDate, @ToDate)
					SET @Random = ROUND(((@Seconds-1) * RAND()), 0)
					SET @RanEndDat = DATEADD(SECOND, @Random, @FromDate)

					INSERT INTO HabitCheck VALUES(
					@HabitId,
					@UserID,
					@RanEndDat,
					@locationidpoint,
					CONCAT('PC-',@NameUs),
					@NameUs,
					@IPaddres,
					CHECKSUM(@habitId,@UserID,@RanEndDat,@locationidpoint,CONCAT('PC-',@NameUs),@NameUs,@IPaddres))
					COMMIT
					SET @i = @i +1					
				END
			END 
END
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_GeneracionDeUsers]    Script Date: 30/6/2021 08:31:24 ******/
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
	DECLARE @FromDate DATETIME
	DECLARE @ToDate   DATETIME
	DECLARE @RanStarDat   DATETIME
	DECLARE @RanEndDat   DATETIME
	DECLARE @Seconds INT
	DECLARE @Random INT
	DECLARE @UserID BIGINT
	DECLARE @date DATE 
	DECLARE @PointLoc GEOGRAPHY 

	BEGIN TRY
 

		SET @CustomError = 2001
		SET @DateStart = '1990/01/01'
		SET @DateEnd = '2002/01/01'
		SET @i = 0 + IDENT_CURRENT('Users')
		SET @n = @n + IDENT_CURRENT('Users')
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
				SET @UserID = IDENT_CURRENT('Users')

				SET @FromDate = '2020-11-01 00:00:00' 
				SET @ToDate = '2020-12-30 00:00:00' 
				SET @Seconds = DATEDIFF(SECOND, @FromDate, @ToDate)
				SET @Random = ROUND(((@Seconds-1) * RAND()), 0)
				SET @RanStarDat = DATEADD(SECOND, @Random, @FromDate)
				SET @FromDate = '2023-01-01 00:00:00' 
				SET @ToDate = '2024-01-30 00:00:00' 
				SET @Seconds = DATEDIFF(SECOND, @FromDate, @ToDate)
				SET @Random = ROUND(((@Seconds-1) * RAND()), 0)
				SET @RanEndDat = DATEADD(SECOND, @Random, @FromDate)
				INSERT INTO MediaAuthentication VALUES 
				(CRYPT_GEN_RANDOM(200),@RanStarDat,@RanEndDat,@UserID,CAST(RAND()*(3-1)+1 AS INT),CRYPT_GEN_RANDOM(200))

				SET @FromDate = '2021-01-01 00:00:00' 
				SET @ToDate = '2021-12-30 00:00:00' 
				SET @Seconds = DATEDIFF(SECOND, @FromDate, @ToDate)
				SET @Random = ROUND(((@Seconds-1) * RAND()), 0)
				SET @RanEndDat = DATEADD(SECOND, @Random, @FromDate)

				SET @Random = RAND()*10

				IF @Random > 9
					SET @PointLoc = geography::Point(RAND()*(40.09755-38.09755 )+38.09755 , RAND()*(-93.58253-(-95.58253))-95.58253, 4326)
				IF @Random > 7 AND @Random <= 9 
					SET @PointLoc = geography::Point(RAND()*(48.60864-46.60864)+46.60864  , RAND()*(-121.34741-(-123.34741))-123.34741, 4326)
				IF @Random <= 7 
					SET @PointLoc = geography::Point(RAND()*(41.71948-39.71948)+39.71948  , RAND()*(-73.01427-(-75.01427))-75.01427, 4326)

				INSERT INTO LocationsxUser VALUES
				(@UserID,@PointLoc,@RanEndDat)

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
/****** Object:  StoredProcedure [dbo].[changeit_SP_GenerarPatrocinios]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[changeit_SP_GenerarPatrocinios]
	@Cantidad BIGINT
AS 
BEGIN	
	SET NOCOUNT ON
	
	DECLARE @FromDate2 DATETIME
	DECLARE @ToDate2 DATETIME
	DECLARE @Seconds2 BIGINT
	DECLARE @Random2 BIGINT
	DECLARE @RanEndDat2 DATETIME
	DECLARE @randUser BIGINT
	DECLARE @randHabit BIGINT
	DECLARE @habname VARCHAR(128)
	DECLARE @usename VARCHAR(128)
	DECLARE @AuxNum BIGINT

	SET @AuxNum = 1

	WHILE @AuxNum <= @Cantidad
	BEGIN
		SET @FromDate2 = '2021-01-01 00:00:00'
		SET @ToDate2 = '2022-01-01 00:00:00'
		SET @Seconds2= DATEDIFF(SECOND, @FromDate2, @ToDate2)
		SET @Random2= ROUND(((@Seconds2-1) * RAND()), 0)
		SET @RanEndDat2= DATEADD(SECOND, @Random2, @FromDate2)

		set @randUser = cast(rand()*IDENT_CURRENT('Users') as BIGINT)
		IF @randUser = 0
			set @randUser = 1

		set @randHabit = cast(rand()*IDENT_CURRENT('Habits') as BIGINT)
		IF @randHabit = 0
			set @randHabit = 1

		SET @Random2 = CAST(RAND()*(10000-1)+1 AS DECIMAL(10,2))
		SELECT @habname = Name FROM Habits WHERE HabitId= @randHabit
		SELECT @usename = Name FROM Users WHERE UserId= @randUser
		EXEC [changeit_SP_PatrocinarUnHabito] @habname,@usename,@Random2,@RanEndDat2
		SET @AuxNum = @AuxNum + 1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_PatrocinarUnHabito]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[changeit_SP_PatrocinarUnHabito]
	@HabitName VARCHAR(128),
	@UserName VARCHAR(128),
	@Amount DECIMAL(10,2),
	@Date DATETIME
AS 
BEGIN	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	DECLARE @HabitId BIGINT
	DECLARE @UserId BIGINT
	DECLARE @SubTypeTraId BIGINT
	DECLARE @TypeTraId BIGINT

	DECLARE @CheckSum VARBINARY(300)
	DECLARE @ComputerName VARCHAR(200)
	DECLARE @Description VARCHAR(255)
	DECLARE @IPaddres VARBINARY(16)
	DECLARE @PaymentAtt BIGINT
	DECLARE @Destina BIGINT
	DECLARE @PayADS DECIMAL(10,2)
	DECLARE @PayUS DECIMAL(10,2)


	SET @ComputerName = CONCAT('PC-',@UserName)
	SET @IPaddres = CAST( CONCAT(CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1)) AS VARBINARY)

	
	SET @UserId = (SELECT UserId FROM Users WHERE Name = @UserName)
	SET @TypeTraId = 1
	SET @Destina = 0

	SET @PayADS = @Amount*0.9
	SET @PayUS = @Amount*0.1

	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	BEGIN TRY
		SET @CustomError = 2001
		SET @HabitId = (SELECT HabitId FROM Habits WHERE Name = @HabitName)

		SET @SubTypeTraId = 4
		SET @Description = CONCAT('Pago de ',@PayUS, ' de ', @UserName, ' para changeit')	
		INSERT INTO PaymentAttempts
		([Amount],[description],[CurrencySymbol],[Posttime],[ReferenceNumber],[UserId],[ErrorNumber],[MerchantTransNumber],[IpAdress],[CheckSum],[MerchantId],[PaymentStatusId])
		VALUES
		(@PayUS,@Description,'$',@Date,@Destina,@UserId,0,CAST(RAND()*10 AS INT),@IPaddres,
		CHECKSUM(@PayUS,@Description,'$',@Date,@Destina,@UserId,0,@IPaddres),1,1)
		SET @PaymentAtt = SCOPE_IDENTITY()
		INSERT INTO Transactions VALUES
		(CHECKSUM(@ComputerName,@Date,@TypeTraId,@SubTypeTraId,@UserId,@Destina,@Amount,@Description,@IPaddres)
		,@ComputerName,@Date,@TypeTraId,@SubTypeTraId,@UserId,@Destina,@PayUS,@Description,@IPaddres,@PaymentAtt,@HabitId)

		SET @SubTypeTraId = 2
		SET @Description = CONCAT('Pago de ',@PayADS, ' de ', @UserName, ' para patrocinar ', @HabitName)	
		INSERT INTO PaymentAttempts 
		([Amount],[description],[CurrencySymbol],[Posttime],[ReferenceNumber],[UserId],[ErrorNumber],[MerchantTransNumber],[IpAdress],[CheckSum],[MerchantId],[PaymentStatusId])
		VALUES
		(@PayADS,@Description,'$',@Date,@Destina,@UserId,0,CAST(RAND()*10 AS INT),@IPaddres,
		CHECKSUM(@PayADS,@Description,'$',@Date,@Destina,@UserId,0,@IPaddres),1,1)
		SET @PaymentAtt = SCOPE_IDENTITY()
		INSERT INTO Transactions VALUES
		(CHECKSUM(@ComputerName,@Date,@TypeTraId,@SubTypeTraId,@UserId,@Destina,@Amount,@Description,@IPaddres)
		,@ComputerName,@Date,@TypeTraId,@SubTypeTraId,@UserId,@Destina,@PayADS,@Description,@IPaddres,@PaymentAtt,@HabitId)

		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_PostsJmeter]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[changeit_SP_PostsJmeter]
	@CantidadPosts BIGINT
AS 
BEGIN 
	DECLARE @RandMes BIGINT
	DECLARE @PostId BIGINT
	DECLARE @Name VARCHAR(128)
	DECLARE @PostURL VARCHAR(200)
	DECLARE @ActionURL VARCHAR(255)	
	DECLARE @UserID BIGINT
	DECLARE @UserName VARCHAR(100)
	DECLARE @IPaddres VARBINARY(16)
	DECLARE @StartDate DATETIME
	DECLARE @EndDate   DATETIME
	DECLARE @ComputerName VARCHAR(300)	
	DECLARE @PostTypeId BIGINT
	DECLARE @PostTime DATETIME
	DECLARE @AuxNum BIGINT 
	DECLARE @AuxNum2 BIGINT 
	DECLARE @AuxNum3 BIGINT 
	DECLARE @AuxNum4 BIGINT 
	DECLARE @UtmId BIGINT
	DECLARE @ValueId BIGINT
	DECLARE @PostName VARCHAR(100)
	DECLARE @RanEndDat   DATETIME
	DECLARE @Seconds BIGINT
	DECLARE @Random BIGINT
	DECLARE @NumWhi BIGINT
	DECLARE @IdDatos BIGINT
	DECLARE @HabitId BIGINT
	DECLARE @HabitName VARCHAR(128)
	DECLARE @Cantidad BIGINT
	DECLARE @Canti1 BIGINT
	DECLARE	@Quantity BIGINT
	DECLARE	@meassureUnit VARCHAR(20)
	DECLARE	@name2 VARCHAR(128)

	DECLARE @Datos AS TABLE
	(	Cantidad BIGINT,
		HabitId BIGINT,
		Quantity BIGINT,
		meassureUnit VARCHAR(20), 
		name VARCHAR(128),
		AuxId BIGINT IDENTITY(1,1)
	)

	SET @AuxNum = 1
	SET @PostTypeId = 2	
	set @StartDate	= '2021-01-01'
	SET @EndDate = DateAdd(MONTH, CAST(RAND()*(13-1)+1 AS INT) , @StartDate)
	SET @StartDate = DateAdd(MONTH, -1 , @EndDate)


	WHILE @AuxNum <= @CantidadPosts
	BEGIN
		set ansi_nulls off
		SET @UserID = CAST(RAND()*(IDENT_CURRENT('Users')) AS BIGINT)
		WHILE (SELECT Name FROM Users WHERE UserId = @UserID) = NULL OR (SELECT DISTINCT UserId FROM HabitCheck WHERE UserId = @UserID) = NULL
			BEGIN
			SET @UserID = CAST(RAND()*(IDENT_CURRENT('Users')) AS BIGINT)
			END

		DELETE @Datos
		INSERT INTO @Datos	
		SELECT COUNT(Che.UserId),Che.HabitId,Aco.Quantity , Aco.meassureUnit , Achi.name FROM dbo.AcomplishedGoals Aco 
		LEFT MERGE JOIN [dbo].[Achievements] Achi on Achi.AchievementId = Aco.[AchievmentId]
		INNER MERGE JOIN dbo.HabitCheck Che on Che.HabitId = Aco.HabitId		
		WHERE Che.UserId = @UserID
		GROUP BY Che.HabitId,Aco.Quantity , Aco.meassureUnit , Achi.name 
		OPTION (HASH GROUP, FAST 10)

		SET @IdDatos = (SELECT CAST(RAND()*(SELECT COUNT(AuxId) FROM @Datos)+1 AS BIGINT))

		SELECT @Canti1 = Cantidad, @HabitId = HabitId, @Quantity = Quantity, @meassureUnit = meassureUnit, @name2 = name
		FROM @Datos WHERE AuxId = @IdDatos

		
		SET @Cantidad = @Canti1 * @Quantity

		SELECT @HabitName = Tittle FROM Habits WHERE HabitId = @HabitId

		SET @Name = CONCAT( (SELECT Name FROM Users WHERE UserId = @UserID), @UserID, CONVERT(BIGINT , IDENT_CURRENT('Posts')) )
		 
		SET @IPaddres = CAST( CONCAT(CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1)) AS VARBINARY)
		SET @PostName = (SELECT name FROM [dbo].[PostTypes] WHERE PostTypeId = @PostTypeId)



		SET @PostURL = CONCAT('www.changeit.com/', @PostName , '/', @Name)
		SET @ActionURL = CONCAT('www.changeit.com/', @PostName , '/', @Name ,'/', @UserID ,'/',CONCAT(@HabitName,'/',@Cantidad,'/',@meassureUnit,'/',@name2))
		SET @UserName = CONCAT('User-',@Name)
		SET @PostTime = DateAdd(DAY,CAST(RAND()*(365-1)+1 AS INT)*(-1), @StartDate)
		SET @ComputerName = CONCAT('PC-',@Name)


		INSERT INTO Posts
		VALUES(@name,@PostURL,@UserId,@PostTypeId,@PostTime,@ActionURL,@StartDate,@EndDate,@ComputerName,@UserName,@IPaddres, 
		CHECKSUM(@name,@PostURL,@UserId,@PostTypeId,@PostTime,@ActionURL,@StartDate,@EndDate,@ComputerName,@UserName,@IPaddres))

		SET @PostId = SCOPE_IDENTITY()

		INSERT INTO [dbo].[UTMTags] VALUES (CAST( (RAND()*(1000-1)+1) AS BIGINT) +@PostId )

		SET @UtmId = SCOPE_IDENTITY()

		INSERT INTO [dbo].[Values] ([Value],[UTMTagId])VALUES
		(CAST(@PostName AS VARCHAR),@UtmId),
		(CAST(@Name AS VARCHAR),@UtmId),
		(CAST(@UserID AS VARCHAR),@UtmId),
		(CAST(@HabitName AS VARCHAR),@UtmId),
		(CAST(@Cantidad AS VARCHAR),@UtmId),
		(CAST(@meassureUnit AS VARCHAR),@UtmId),
		(CAST(@name2 AS VARCHAR),@UtmId)


		INSERT INTO [dbo].[TagsxPost] VALUES
		(@PostId,@UtmId)


		SET @Seconds = DATEDIFF(SECOND, @StartDate, @EndDate)
		SET @Random = ROUND(((@Seconds-1) * RAND()), 0)
		SET @RanEndDat = DATEADD(SECOND, @Random, @StartDate)
		SET @AuxNum2 = CAST(RAND()*IDENT_CURRENT('Users') AS BIGINT)
		SET @AuxNum3 = CAST(RAND()*(3-1)+1 AS BIGINT)
		SET @AuxNum4 = CAST(RAND()*(100000-100)+100 AS BIGINT)

		INSERT INTO [dbo].[PostInteractions] VALUES
		(@PostId, 
		@AuxNum2, 
		@AuxNum3, 
		@RanEndDat, 
		@AuxNum4,
		CHECKSUM(@PostId,@AuxNum2,@AuxNum3,@RanEndDat,@AuxNum4,@StartDate,@RanEndDat,@ComputerName,@UserName,@IPaddres), 
		@StartDate,
		@RanEndDat,
		@ComputerName,
		@UserName,
		@IPaddres)	

		SET @AuxNum = @AuxNum + 1 
	END	
	COMMIT
END

GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_RetornarPlataPatrocinios]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[changeit_SP_RetornarPlataPatrocinios]
	@Mes INT
AS 
BEGIN	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	DECLARE @Amount DECIMAL(10,2)
	DECLARE @HabitId BIGINT
	DECLARE @UserId BIGINT
	DECLARE @SubTypeTraId BIGINT
	DECLARE @TypeTraId BIGINT

	DECLARE @CheckSum VARBINARY(300)
	DECLARE @ComputerName VARCHAR(200)
	DECLARE @Description VARCHAR(255)
	DECLARE @IPaddres VARBINARY(16)
	DECLARE @PaymentAtt BIGINT
	DECLARE @Destina BIGINT
	DECLARE @PayADS DECIMAL(10,2)
	DECLARE @PayUS DECIMAL(10,2)
	DECLARE @Random INT
	DECLARE @AuxIdHab2 BIGINT
	DECLARE @AuxIdHab BIGINT
	DECLARE @HabAnt BIGINT
	DECLARE @UserName VARCHAR(128)
	DECLARE @Date DATETIME

	DECLARE @AuxHabits AS TABLE
	(	HabitId BIGINT,
		UserId BIGINT,
		AuxId BIGINT IDENTITY(1,1)
	)

	INSERT INTO @AuxHabits	
	SELECT tra.HabitId, tra.ReferenceId1 FROM Transactions tra
	WHERE MONTH(tra.Date) = @Mes AND tra.TransSubTypeId = 2
	ORDER BY tra.HabitId


	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	BEGIN TRY
		SET @CustomError = 2001
		
		SET @Date = DATEADD(MONTH,1,CAST(CONCAT(YEAR(GETDATE()),'-',@Mes,'-01') AS DATETIME))
		SET @AuxIdHab2 = CAST((SELECT COUNT(AuxId) FROM @AuxHabits) AS BIGINT)
		SET @AuxIdHab = 1
		SET @HabAnt = 0
		SET @Random = RAND()*3
		SET @ComputerName = 'PC-CHANGEIT'
		SET @IPaddres = CAST('0.4.2.0' AS VARBINARY)
		SET @SubTypeTraId = 3
		SET @TypeTraId = 2
		SET @Destina = 0

		WHILE @AuxIdHab <= @AuxIdHab2
			BEGIN
				SET @UserId = (SELECT UserId FROM @AuxHabits WHERE AuxId = @AuxIdHab)
				SET @HabitId = (SELECT HabitId FROM @AuxHabits WHERE AuxId = @AuxIdHab)
	
				IF @HabAnt <> @HabitId
					SET @Random = CAST(RAND()*3 AS INT)

				SET @Amount = (SELECT SUM(tra.Amount) FROM Transactions tra 
				WHERE MONTH(tra.Date) = @Mes AND tra.TransSubTypeId = 2 
				AND tra.HabitId = @HabitId	AND tra.ReferenceId1 = @UserId
				GROUP BY tra.HabitId)

				SET @Amount = @Amount * @Random

				SELECT @UserName = Name FROM Users WHERE UserId = @UserId
				SET @Description = CONCAT('Pago de ',@Amount, ' de changeit para ', @UserName)	

				INSERT INTO PaymentAttempts
				([Amount],[description],[CurrencySymbol],[Posttime],[ReferenceNumber],[UserId],[ErrorNumber],[MerchantTransNumber],[IpAdress],[CheckSum],[MerchantId],[PaymentStatusId])
				VALUES
				(@Amount,@Description,'$',@Date,@Destina,@UserId,0,CAST(RAND()*10 AS INT),@IPaddres,
				CHECKSUM(@Amount,@Description,'$',@Date,@Destina,@UserId,0,@IPaddres),1,1)

				SET @PaymentAtt = SCOPE_IDENTITY()

				INSERT INTO Transactions VALUES
				(CHECKSUM(@ComputerName,@Date,@TypeTraId,@SubTypeTraId,@Destina,@UserId,@Amount,@Description,@IPaddres)
				,@ComputerName,@Date,@TypeTraId,@SubTypeTraId,@UserId,@Destina,@Amount,@Description,@IPaddres,@PaymentAtt,@HabitId)


				SET @HabAnt = @HabitId		
				SET @AuxIdHab = @AuxIdHab + 1
			END

		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_VerificarCostoHabito]    Script Date: 30/6/2021 08:31:24 ******/
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
	set ansi_nulls off
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

	SET @TotalAmount = ((@TotalAmount/(@QuantHab+1))*(@Population/100))+10+(@Ratio/100)

	BEGIN TRY
		SET @CustomError = 2001

		SET @locationId = (SELECT LocationId FROM Locations WHERE Location.STDistance (@CenterPoint) = 0 )

		IF @locationId = NULL
			BEGIN
				IF IDENT_CURRENT('Cities') = NULL
					INSERT INTO [dbo].[Cities] VALUES ('El más alla')
				IF IDENT_CURRENT('Locations') <> NULL
					INSERT INTO Locations VALUES (CONCAT('PuntoPrecio',IDENT_CURRENT('Locations')),1,@CenterPoint)
				IF IDENT_CURRENT('Locations') = NULL
					INSERT INTO Locations VALUES (CONCAT('PuntoPrecio',0),1,@CenterPoint)
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
GO
/****** Object:  StoredProcedure [dbo].[changeit_SP_VerificarPuntoHabito]    Script Date: 30/6/2021 08:31:24 ******/
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
/****** Object:  StoredProcedure [dbo].[checkinReference]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[checkinReference]
	@habitId BIGINT,
	@n BIGINT,
	@locationid BIGINT
AS 
BEGIN 
	DECLARE @i BIGINT = 0 
	DECLARE @name VARCHAR(60)
	DECLARE @city BIGINT
	DECLARE @latitudeReference FLOAT
	DECLARE @longitudeReference FLOAT
	DECLARE @NameUs VARCHAR(128)
	DECLARE @UserID BIGINT
	DECLARE @IPaddres VARBINARY(16)
	DECLARE @FromDate DATETIME
	DECLARE @ToDate   DATETIME
	DECLARE @RanEndDat   DATETIME
	DECLARE @Seconds INT
	DECLARE @Random INT

	SELECT @name = name, @city = CityId,@latitudeReference = Locations.Location.Lat, @longitudeReference=Locations.Location.Long FROM Locations WHERE LocationId = @locationid
	SET @name = SUBSTRING(@name ,0,CHARINDEX(left(right(@name , 8),1),@name ))
	WHILE @i < @n 
		BEGIN
		DECLARE @puntoRand FLOAT =  0.0001*(RAND()*100+10)*CAST(RAND()*9 AS INT)
		DECLARE @locationPoint GEOGRAPHY = GEOGRAPHY::Point((@latitudeReference+@puntoRand), (@longitudeReference+@puntoRand), 4326)
		DECLARE @lati FLOAT = @latitudeReference+@puntoRand
		DECLARE @longi FLOAT = @longitudeReference+@puntoRand
		DECLARE @locationidpoint BIGINT 
		SELECT @locationidpoint = Locations.LocationId FROM Locations WHERE Locations.Location.Lat = @lati AND Locations.Location.Long = @longi
		IF not exists(SELECT Locations.Location.Lat,Locations.Location.Long FROM Locations WHERE Locations.Location.Lat = @lati AND Locations.Location.Long = @longi)
		BEGIN 
			INSERT INTO Locations VALUES (CONCAT(@name,CAST(RAND()*(99999999-10000000)+10000000 AS BIGINT)),@city,@locationPoint)
			SET @locationidpoint =  IDENT_CURRENT('Locations')
		END

		SET @UserID = CAST(RAND()*IDENT_CURRENT('Users')+1 AS INT)
		SET @NameUs = (SELECT Name FROM Users WHERE UserId = @UserID)
		SET @IPaddres = CAST( CONCAT(CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1)) AS VARBINARY)

		SET @FromDate = '2021-01-01 00:00:00' 
		SET @ToDate = '2021-12-30 00:00:00' 
		SET @Seconds = DATEDIFF(SECOND, @FromDate, @ToDate)
		SET @Random = ROUND(((@Seconds-1) * RAND()), 0)
		SET @RanEndDat = DATEADD(SECOND, @Random, @FromDate)

		INSERT INTO HabitCheck VALUES(@habitId,@UserID,@RanEndDat,@locationidpoint,CONCAT('PC-',@NameUs),@NameUs,@IPaddres,CHECKSUM(@habitId,@UserID,@RanEndDat,@locationidpoint,CONCAT('PC-',@NameUs),@NameUs,@IPaddres))
		SET @i = @i +1
		END 
END


GO
/****** Object:  StoredProcedure [dbo].[CreateAuxTables]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CreateAuxTables] as 
begin 


DROP TABLE IF EXISTS [dbo].checkinValues;
DROP TABLE IF EXISTS [dbo].Ausar;

create table checkinValues  ( id int identity(1,1),idGroupLocation varchar(10))
create table Ausar (ID varchar(10),name varchar(50),province varchar(50), city varchar(50),latitude float, longitude float, Ausarid int identity(1,1))

delete checkinValues
DBCC CHECKIDENT ('checkinValues', RESEED, 0)

delete Ausar
DBCC CHECKIDENT ('Ausar', RESEED, 0)

insert into Ausar
SELECT '1'as ID,name,province,city,latitude,longitude FROM [dbo].[Restaurants] 
WHERE 40.09755 > CAST(latitude AS FLOAT) AND CAST(latitude AS FLOAT) > 38.09755 AND CAST(longitude AS FLOAT) < -93.58253 AND CAST(longitude AS FLOAT) > -95.58253
UNION
-- SEATLLE 47.608649159818405, -122.34741263090288 MEDIO POBLADOS
SELECT '2' as ID,name,province,city,latitude,longitude FROM [dbo].[Restaurants]
WHERE 48.60864 > CAST(latitude AS FLOAT) AND CAST(latitude AS FLOAT) > 46.60864 AND CAST(longitude AS FLOAT) < -121.34741 AND CAST(longitude AS FLOAT) > -123.34741
UNION
-- NUEVA YORK 40.71948994105135, -74.01427182245892 MUY POBLADO
SELECT '3'as ID,name,province,city,latitude,longitude FROM [dbo].[Restaurants]
WHERE 41.71948 > CAST(latitude AS FLOAT) AND CAST(latitude AS FLOAT) > 39.71948 AND CAST(longitude AS FLOAT) < -73.01427 AND CAST(longitude AS FLOAT) > -75.01427
ORDER BY latitude,longitude,province,city

end
GO
/****** Object:  StoredProcedure [dbo].[insertHabits]    Script Date: 30/6/2021 08:31:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[insertHabits]
as 
begin 
declare @i bigint = 0 

exec [dbo].CreateAuxTables

DECLARE @habits TABLE (id INT,title varchar(200), name varchar(128),description varchar(200),
picture varchar(300))
insert into @habits values (1,'No comprar botellas plasticas','Disminucion de plastico'
	,'Este habito consiste en no comprar botellas plasticas en el establecimento en el 
	que se encuentra','http:googleDrive/Antiplatic.png'),
	(2,'Sin pajillas','Anti-Pajilla'
	,'Este habito intenta reducir el uso de pajillas','http:googleDrive/AntiPajilla.png'),
	(3,'Sin miedo a reciclar','Recicla y venceras'
	,'Este habito consiste reciclar lo ultimo que consumio','http:googleDrive/Reicle.png'),
	(4,'A la playa','La playa es vida'
	,'Este habito consiste recoger unas cuantas basuras de su playa mas cercana','http:googleDrive/playa.png'),
	(5,'Cuidemos el agua','El agua es vida'
	,'No hay razón para dejarla correr mientras te cepillas los dientes, lavas las verduras o limpias','http:googleDrive/agua.png'),
	(6,'Cuidemos la electiricidad','La electricidad es cara'
	,'Desconecta los aparatos electrónicos cuando no los estás usando','http:googleDrive/ApagarAparatos.png'),
	(7,'Camina más','No uses tanto tu auto'
	,'Reduce la contaminación y te hace muy bien a tu salud','http:googleDrive/Caminemos.png'),
	(8,'Nada de latas','Deja de comer alimentos enlatados'
	,'No son buenos para la salud y además alientan la producción de latas de aluminio','http:googleDrive/MenosAluminio.png'),
	(9,'Ayudemos a la tierra','Recoge una basura del suelo'
	,'Recoge la basura más cercana a ti para mejorar el mundo','http:googleDrive/MejorandoElMundo.png'),
	(10,'No a los aerosoles','Los aerosoles contaminan nuestra atmosfera'
	,'No hay razón para usarlos, usemos otros tipos de productos para dejar de dañar nuestra atmosfera','http:googleDrive/AyudaAtmosfera.png')



declare @checkinQuantity int
declare @idgroup varchar(10)
declare @idCount bigint
declare @cityid bigint
declare @city varchar(50)
declare @Ausarid int
declare @lati float
declare @longi float
declare @locationHabit bigint 
declare @rand int
declare @habitid bigint 
declare @amount money 
declare @ratio bigint 
declare @geoLoc geography 
declare @date date 
declare @date2 date 
declare @UserName VARCHAR(128) 
DECLARE @IPaddres VARBINARY(16)
Declare @DateStart	Date 
Declare @DateEnd	Date 
declare @habit bigint
declare @randUser bigint
declare @user bigint
declare @Quantity INT  
declare  @AchievmentId BIGINT
declare  @meassureUnit VARCHAR(20)


while @i < 1000
begin
	set @idgroup  = '1'	
	select  @idCount = count(idGroupLocation) from checkinValues where idGroupLocation = @idgroup
	if @idCount <100
		begin
		set @checkinQuantity = 3
		insert into checkinValues values (@idgroup)
		end
	else begin
		set @idgroup ='2'
		select  @idCount = count(idGroupLocation) from checkinValues where idGroupLocation = @idgroup

		if @idCount <200
			begin
			set @checkinQuantity = 5
			insert into checkinValues values (@idgroup)
			end
		else
			begin
			set @idgroup ='3'
			select  @idCount = count(idGroupLocation) from checkinValues where idGroupLocation = @idgroup
			if @idCount <1000
				begin
				set @checkinQuantity = 8
				insert into checkinValues values (@idgroup)
				end
			else
				begin
				delete from checkinValues
				DBCC CHECKIDENT ('checkinValues', RESEED, 0)
				set @idgroup = '1'
				set @checkinQuantity = 3
				insert into checkinValues values (@idgroup)
			end
		end
	end

	select top 1 @city = city, @Ausarid = Ausarid from Ausar where ID = @idgroup order by newid()
	
	--Locations
	select @cityid = (SELECT CityId from Cities where name = @city)



		select @lati= latitude, @longi=longitude from Ausar where  Ausarid = @Ausarid;

		select @locationHabit = Locations.LocationId from Locations where Locations.Location.Lat = @lati and Locations.Location.Long = @longi
		if not exists(select Locations.Location.Lat,Locations.Location.Long from Locations where Locations.Location.Lat = @lati and Locations.Location.Long = @longi)
		begin
			insert into Locations 
			select top 1 CONCAT(name,CAST(RAND()*(99999999-10000000)+10000000 AS BIGINT)), @cityid,geography::Point(latitude, longitude, 4326) from Ausar where Ausarid = @Ausarid;
			set @locationHabit =  IDENT_CURRENT('Locations')
		end
	

	
	
		-- ingreso a habits

		set @rand = cast(rand()*10+1 as int)

		Insert into Habits select 
		concat(title,convert(varchar(20),@i)),
		concat(name,@locationHabit,convert(varchar(20),@i)),
		description,
		picture,
		1,
		cast(rand()*IDENT_CURRENT('Users') as int)
		from @habits where id = @rand;
	
		set @habitid = IDENT_CURRENT('Habits')

	    IF @rand = 1 OR @rand = 2 OR @rand = 3
		BEGIN
			SET @Quantity = CAST(RAND()*(100-10)+10 AS INT)
			SET @AchievmentId = 1
			SET @meassureUnit = 'Gramos'
		END
		IF @rand = 4 OR @rand = 9
		BEGIN
			SET @Quantity = CAST(RAND()*(100-10)+10 AS INT)
			SET @AchievmentId = 2
			SET @meassureUnit = 'Gramos'
		END
		IF @rand = 5
		BEGIN
			SET @Quantity = CAST(RAND()*(1000-100)+100 AS INT)
			SET @AchievmentId = 3
			SET @meassureUnit = 'Mililitros'
		END
		IF @rand = 6
		BEGIN
			SET @Quantity = CAST(RAND()*(1000-100)+100 AS INT)
			SET @AchievmentId = 4
			SET @meassureUnit = 'Watts'
		END
		IF @rand = 7
		BEGIN
			SET @Quantity = CAST(RAND()*(100-10)+10 AS INT)
			SET @AchievmentId = 5
			SET @meassureUnit = 'Centímetros Cúbicos'
		END
		IF @rand = 8
		BEGIN
			SET @Quantity = CAST(RAND()*(1000-100)+100 AS INT)
			SET @AchievmentId = 6
			SET @meassureUnit = 'Gramos'
		END
		IF @rand = 10
		BEGIN	
			SET @Quantity = CAST(RAND()*(1000-100)+100 AS INT)
			SET @AchievmentId = 7
			SET @meassureUnit = 'Centímetros Cúbicos'
		END

		INSERT INTO [dbo].[AcomplishedGoals] VALUES
		( @Quantity, @HabitId, @AchievmentId, @meassureUnit )



		exec [dbo].checkinReference @habitid,@checkinQuantity,@locationHabit;

		-- ingreso a locationxHabits
	


		set @ratio = rand()*1000+100
		select @geoLoc = geography::Point(Locations.Location.Lat, Locations.Location.Long, 4326) from Locations where Locations.LocationId = @locationHabit
		EXEC @amount = dbo.changeit_SP_VerificarCostoHabito @geoLoc,@ratio

		set @DateStart	= '2021-01-01'
		set @DateEnd = '2021-12-30'


		set @date = DateAdd(Day, Rand() * DateDiff(Day, @DateStart, @DateEnd), @DateStart)
		set @date2 = DateAdd(Day, Rand() * DateDiff(Day, @date, @DateEnd), @date)

		set @randUser = cast(rand()*IDENT_CURRENT('Users')+1 as int)
		select @user = UserId from Users where UserId = @randUser

		SET @UserName = (SELECT Name FROM Users WHERE UserId = @user)
		SET @IPaddres = CAST( CONCAT(CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1)) AS VARBINARY)

		insert into LocationsxHabit values (@locationHabit,1,@amount,@date,@date2,@ratio,@habitid,
		CONCAT('PC-',@UserName),@UserName,@IPaddres,
		CHECKSUM(@locationHabit,1,@amount,@date,@date2,@ratio,@habitid,CONCAT('PC-',@UserName),@UserName,@IPaddres))
		set @i = @i +1
		COMMIT
	end
		
end


GO
