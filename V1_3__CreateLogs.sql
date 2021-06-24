USE [changeit]
GO
/****** DELETE TABLES IF EXIST -- EXEC sp_fkeys 'Table_Name' ******/

DROP TABLE IF EXISTS [dbo].[Logs];
DROP TABLE IF EXISTS [dbo].[LogTypes];
DROP TABLE IF EXISTS [dbo].[AppSource];
DROP TABLE IF EXISTS [dbo].[Severities];
DROP TABLE IF EXISTS [dbo].[EntityTypes];

DROP TABLE IF EXISTS [dbo].AcomplishedGoals;
DROP TABLE IF EXISTS [dbo].Achievements;

DROP TABLE IF EXISTS [dbo].LocationsxHabit;
DROP TABLE IF EXISTS [dbo].Prices;
DROP TABLE IF EXISTS [dbo].Locations;
DROP TABLE IF EXISTS [dbo].Cities;

DROP TABLE IF EXISTS [dbo].Sponsors;
DROP TABLE IF EXISTS [dbo].HabitCheck;
DROP TABLE IF EXISTS [dbo].Habits;

DROP TABLE IF EXISTS [dbo].PostInteractions;
DROP TABLE IF EXISTS [dbo].Interactions;

DROP TABLE IF EXISTS [dbo].LocationsxUser;

DROP TABLE IF EXISTS [dbo].Transactions;
DROP TABLE IF EXISTS [dbo].TransSubTypes;
DROP TABLE IF EXISTS [dbo].TransType;

DROP TABLE IF EXISTS [dbo].MediaAuthentication;
DROP TABLE IF EXISTS [dbo].PaymentAttempts;
DROP TABLE IF EXISTS [dbo].Merchants;
DROP TABLE IF EXISTS [dbo].PaymentStatus;

DROP TABLE IF EXISTS [dbo].SocialMedia;

DROP TABLE IF EXISTS [dbo].UTMTagsxTags;
DROP TABLE IF EXISTS [dbo].TagsxPost;

DROP TABLE IF EXISTS [dbo].Posts;
DROP TABLE IF EXISTS [dbo].PostTypes;

DROP TABLE IF EXISTS [dbo].UTMTags;
DROP TABLE IF EXISTS [dbo].Users;
GO
/****** Object:  Table [dbo].[Achievements]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[AcomplishedGoals]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[AppSource]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[Cities]    Script Date: 23/6/2021 02:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityTypes]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[HabitCheck]    Script Date: 23/6/2021 02:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabitCheck](
	[HabitCheckId] [bigint] IDENTITY(1,1) NOT NULL,
	[HabitId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[PostTime] [datetime] NOT NULL,
 CONSTRAINT [PK_HabitCheck] PRIMARY KEY CLUSTERED 
(
	[HabitCheckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habits]    Script Date: 23/6/2021 02:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habits](
	[HabitId] [bigint] IDENTITY(1,1) NOT NULL,
	[Tittle] [nvarchar](128) NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[Description] [varchar](256) NOT NULL,
	[LocationxHabit] [bigint] NOT NULL,
	[PictureURL] [varchar](200) NOT NULL,
	[Enable] [bit] NOT NULL,
 CONSTRAINT [PK__Habits__C587AF633F04D177] PRIMARY KEY CLUSTERED 
(
	[HabitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interactions]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[Locations]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[LocationsxHabit]    Script Date: 23/6/2021 02:18:24 ******/
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
 CONSTRAINT [PK__Location__2C0422C3B7F1750D] PRIMARY KEY CLUSTERED 
(
	[LocationxHabitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationsxUser]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[Logs]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[LogTypes]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[MediaAuthentication]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[Merchants]    Script Date: 23/6/2021 02:18:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentAttempts]    Script Date: 23/6/2021 02:18:24 ******/
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
	[SponsorId] [bigint] NOT NULL,
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
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[PostInteractions]    Script Date: 23/6/2021 02:18:24 ******/
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
 CONSTRAINT [PK__PostInte__4DBCE0E9B41DC1E0] PRIMARY KEY CLUSTERED 
(
	[PostInteractionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 23/6/2021 02:18:24 ******/
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
 CONSTRAINT [PK__Posts__AA12601830DADA69] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostTypes]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[Prices]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[Severities]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[SocialMedia]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[Sponsors]    Script Date: 23/6/2021 02:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsors](
	[SponsorId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[HabitId] [bigint] NOT NULL,
	[PostTime] [datetime] NOT NULL,
 CONSTRAINT [PK__Sponsors__3B609ED54E3EF023] PRIMARY KEY CLUSTERED 
(
	[SponsorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsxPost]    Script Date: 23/6/2021 02:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsxPost](
	[TagsxPostID] [bigint] IDENTITY(1,1) NOT NULL,
	[PostId] [bigint] NOT NULL,
	[UTMtagId] [bigint] NOT NULL,
 CONSTRAINT [PK__TagsxPos__72C6953A981F998F] PRIMARY KEY CLUSTERED 
(
	[TagsxPostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 23/6/2021 02:18:24 ******/
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
/****** Object:  Table [dbo].[TransSubTypes]    Script Date: 23/6/2021 02:18:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransType]    Script Date: 23/6/2021 02:18:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23/6/2021 02:18:24 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UTMTags]    Script Date: 23/6/2021 02:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UTMTags](
	[UTMTagId] [bigint] IDENTITY(1,1) NOT NULL,
	[utmURL] [varchar](255) NOT NULL,
 CONSTRAINT [PK__UTMTags__5D3836C2F083BB89] PRIMARY KEY CLUSTERED 
(
	[UTMTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UTMTagsxTags]    Script Date: 23/6/2021 02:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UTMTagsxTags](
	[UTMTagsxTagId] [bigint] NOT NULL,
	[UTMTagId] [bigint] NOT NULL,
	[TagsxPostID] [bigint] NOT NULL,
 CONSTRAINT [PK_UTMTagsxTags] PRIMARY KEY CLUSTERED 
(
	[UTMTagsxTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[HabitCheck]  WITH CHECK ADD  CONSTRAINT [FK_HabitCheck_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[HabitCheck] CHECK CONSTRAINT [FK_HabitCheck_Users]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([CityId])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Cities]
GO
ALTER TABLE [dbo].[LocationsxHabit]  WITH CHECK ADD  CONSTRAINT [FK_LocationsxHabit_Habits] FOREIGN KEY([HabitId])
REFERENCES [dbo].[Habits] ([HabitId])
GO
ALTER TABLE [dbo].[LocationsxHabit] CHECK CONSTRAINT [FK_LocationsxHabit_Habits]
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
ALTER TABLE [dbo].[Sponsors]  WITH CHECK ADD  CONSTRAINT [fk_Sponsors_HabitId1] FOREIGN KEY([HabitId])
REFERENCES [dbo].[Habits] ([HabitId])
GO
ALTER TABLE [dbo].[Sponsors] CHECK CONSTRAINT [fk_Sponsors_HabitId1]
GO
ALTER TABLE [dbo].[Sponsors]  WITH CHECK ADD  CONSTRAINT [fk_Sponsors_UserId1] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Sponsors] CHECK CONSTRAINT [fk_Sponsors_UserId1]
GO
ALTER TABLE [dbo].[TagsxPost]  WITH CHECK ADD  CONSTRAINT [fk_TagsxPost_PostId1] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[TagsxPost] CHECK CONSTRAINT [fk_TagsxPost_PostId1]
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
ALTER TABLE [dbo].[UTMTagsxTags]  WITH CHECK ADD  CONSTRAINT [FK_UTMTagsxTags_TagsxPost] FOREIGN KEY([TagsxPostID])
REFERENCES [dbo].[TagsxPost] ([TagsxPostID])
GO
ALTER TABLE [dbo].[UTMTagsxTags] CHECK CONSTRAINT [FK_UTMTagsxTags_TagsxPost]
GO
ALTER TABLE [dbo].[UTMTagsxTags]  WITH CHECK ADD  CONSTRAINT [FK_UTMTagsxTags_UTMTags] FOREIGN KEY([UTMTagId])
REFERENCES [dbo].[UTMTags] ([UTMTagId])
GO
ALTER TABLE [dbo].[UTMTagsxTags] CHECK CONSTRAINT [FK_UTMTagsxTags_UTMTags]
GO
