USE [master]
GO
/****** Object:  Database [graduate_rentcar]    Script Date: 2020/2/8 15:45:54 ******/
CREATE DATABASE [graduate_rentcar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'graduate_rentcar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\graduate_rentcar.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'graduate_rentcar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\graduate_rentcar_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [graduate_rentcar] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [graduate_rentcar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [graduate_rentcar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [graduate_rentcar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [graduate_rentcar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [graduate_rentcar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [graduate_rentcar] SET ARITHABORT OFF 
GO
ALTER DATABASE [graduate_rentcar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [graduate_rentcar] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [graduate_rentcar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [graduate_rentcar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [graduate_rentcar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [graduate_rentcar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [graduate_rentcar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [graduate_rentcar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [graduate_rentcar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [graduate_rentcar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [graduate_rentcar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [graduate_rentcar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [graduate_rentcar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [graduate_rentcar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [graduate_rentcar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [graduate_rentcar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [graduate_rentcar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [graduate_rentcar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [graduate_rentcar] SET RECOVERY FULL 
GO
ALTER DATABASE [graduate_rentcar] SET  MULTI_USER 
GO
ALTER DATABASE [graduate_rentcar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [graduate_rentcar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [graduate_rentcar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [graduate_rentcar] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'graduate_rentcar', N'ON'
GO
USE [graduate_rentcar]
GO
/****** Object:  Table [dbo].[car]    Script Date: 2020/2/8 15:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[car](
	[id] [varchar](32) NOT NULL,
	[brand] [varchar](255) NULL,
	[cartype] [varchar](255) NULL,
	[number] [varchar](100) NULL,
	[price] [varchar](100) NULL,
	[contents] [varchar](255) NULL,
	[seat] [varchar](100) NULL,
	[safe] [varchar](100) NULL,
	[oil] [varchar](100) NULL,
	[state] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[maintain]    Script Date: 2020/2/8 15:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[maintain](
	[id] [varchar](32) NOT NULL,
	[carid] [varchar](32) NULL,
	[contents] [varchar](255) NULL,
	[price] [varchar](100) NULL,
	[time] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2020/2/8 15:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[id] [varchar](32) NOT NULL,
	[carid] [varchar](32) NULL,
	[returntime] [varchar](255) NULL,
	[safe] [varchar](255) NULL,
	[price] [varchar](100) NULL,
	[evaluate] [varchar](255) NULL,
	[qxstate] [varchar](100) NULL,
	[createtime] [varchar](255) NULL,
	[createid] [varchar](100) NULL,
	[createname] [varchar](100) NULL,
	[buytype] [varchar](100) NULL,
	[rentime] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[repair]    Script Date: 2020/2/8 15:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[repair](
	[id] [varchar](32) NOT NULL,
	[carid] [varchar](32) NULL,
	[contents] [varchar](255) NULL,
	[price] [varchar](100) NULL,
	[time] [varchar](100) NULL,
	[userid] [varchar](100) NULL,
	[username] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rules]    Script Date: 2020/2/8 15:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rules](
	[id] [varchar](32) NOT NULL,
	[carid] [varchar](32) NULL,
	[contents] [varchar](255) NULL,
	[price] [varchar](100) NULL,
	[time] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[safe]    Script Date: 2020/2/8 15:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[safe](
	[id] [varchar](32) NOT NULL,
	[carid] [varchar](32) NULL,
	[price] [varchar](100) NULL,
	[begintime] [varchar](100) NULL,
	[userid] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[endtime] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 2020/2/8 15:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [varchar](32) NOT NULL,
	[name] [varchar](100) NULL,
	[phone] [varchar](100) NULL,
	[yajin] [varchar](100) NULL,
	[yjstate] [varchar](5) NULL,
	[xinyong] [varchar](100) NULL,
	[auth] [varchar](100) NULL,
	[password] [varchar](100) NULL,
	[gender] [varchar](100) NULL,
	[yjtype] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[car] ([id], [brand], [cartype], [number], [price], [contents], [seat], [safe], [oil], [state]) VALUES (N'29b63d1a15054ed5963e34d9d53800b2', N'奥迪', N'A6', N'吉A1100', N'1000', N'1123', N'4', N'50', N'满', N'0')
INSERT [dbo].[car] ([id], [brand], [cartype], [number], [price], [contents], [seat], [safe], [oil], [state]) VALUES (N'6effdbd78b844b649f323c5efd53fb6b', N'奥迪', N'A6', N'吉A2345', N'1000', N'跑得快', N'4', N'50', N'满', N'0')
INSERT [dbo].[orders] ([id], [carid], [returntime], [safe], [price], [evaluate], [qxstate], [createtime], [createid], [createname], [buytype], [rentime]) VALUES (N'19259c0ca34d46009f4411f65150bc6b', N'29b63d1a15054ed5963e34d9d53800b2', N'2020-02-12', N'0', N'3150', NULL, N'0', N'2020-02-08 15:41:24', N'f916c7fd909645f9a85a0f40048237b6', N'张三', N'银行卡', N'2020-02-10')
INSERT [dbo].[orders] ([id], [carid], [returntime], [safe], [price], [evaluate], [qxstate], [createtime], [createid], [createname], [buytype], [rentime]) VALUES (N'3aff3ec7b80b46d5abe11aaa72fa9775', N'29b63d1a15054ed5963e34d9d53800b2', N'2020-02-11', N'0', N'2100', NULL, N'1', N'2020-02-08 15:40:49', N'f916c7fd909645f9a85a0f40048237b6', N'张三', N'微信钱包', N'2020-02-10')
INSERT [dbo].[orders] ([id], [carid], [returntime], [safe], [price], [evaluate], [qxstate], [createtime], [createid], [createname], [buytype], [rentime]) VALUES (N'3ec25186770c4faf93df162359a52019', N'29b63d1a15054ed5963e34d9d53800b2', N'2020-02-09', N'0', N'2100', N'1111', N'2', N'2020-02-08 15:40:23', N'f916c7fd909645f9a85a0f40048237b6', N'张三', N'支付宝', N'2020-02-08')
INSERT [dbo].[orders] ([id], [carid], [returntime], [safe], [price], [evaluate], [qxstate], [createtime], [createid], [createname], [buytype], [rentime]) VALUES (N'b70111af562c4d2f9fe20f5595d47c4b', N'6effdbd78b844b649f323c5efd53fb6b', N'2020-02-09', N'0', N'2100', NULL, N'0', N'2020-02-08 15:39:58', N'f916c7fd909645f9a85a0f40048237b6', N'张三', N'支付宝', N'2020-02-08')
INSERT [dbo].[safe] ([id], [carid], [price], [begintime], [userid], [username], [endtime]) VALUES (N'6ce35b42ac7a48b8a8afc8e83f645c1e', N'29b63d1a15054ed5963e34d9d53800b2', N'100', N'2020-02-10', N'f916c7fd909645f9a85a0f40048237b6', N'张三', N'2020-02-11')
INSERT [dbo].[safe] ([id], [carid], [price], [begintime], [userid], [username], [endtime]) VALUES (N'cae51f147e8b4de9aabf7b7e93e94df7', N'29b63d1a15054ed5963e34d9d53800b2', N'100', N'2020-02-08', N'f916c7fd909645f9a85a0f40048237b6', N'张三', N'2020-02-09')
INSERT [dbo].[safe] ([id], [carid], [price], [begintime], [userid], [username], [endtime]) VALUES (N'e954682c85e54be9b8be009cf75b378c', N'29b63d1a15054ed5963e34d9d53800b2', N'150', N'2020-02-10', N'f916c7fd909645f9a85a0f40048237b6', N'张三', N'2020-02-12')
INSERT [dbo].[safe] ([id], [carid], [price], [begintime], [userid], [username], [endtime]) VALUES (N'f7f06c056c3d4956a2a19d54fd1ff2da', N'6effdbd78b844b649f323c5efd53fb6b', N'100', N'2020-02-08', N'f916c7fd909645f9a85a0f40048237b6', N'张三', N'2020-02-09')
INSERT [dbo].[users] ([id], [name], [phone], [yajin], [yjstate], [xinyong], [auth], [password], [gender], [yjtype]) VALUES (N'0', N'system', N'18811111111', N'', N'0', N'0', N'0', N'111111', N'男', NULL)
INSERT [dbo].[users] ([id], [name], [phone], [yajin], [yjstate], [xinyong], [auth], [password], [gender], [yjtype]) VALUES (N'2fb16e1a0ea7477591601845b1e2aa22', N'lisi', N'118812341234', N'1000', N'0', N'0', N'2', N'111111', N'女', N'微信钱包')
INSERT [dbo].[users] ([id], [name], [phone], [yajin], [yjstate], [xinyong], [auth], [password], [gender], [yjtype]) VALUES (N'4fe83426b12a4f4dbf9a72305b67c31c', N'员工B', N'118812341234', NULL, N'0', N'0', N'1', N'111111', N'女', NULL)
INSERT [dbo].[users] ([id], [name], [phone], [yajin], [yjstate], [xinyong], [auth], [password], [gender], [yjtype]) VALUES (N'5f89607677d04a1eb64d98f7c17fad38', N'员工A', N'18811111111', NULL, N'0', N'0', N'1', N'111111', N'男', NULL)
INSERT [dbo].[users] ([id], [name], [phone], [yajin], [yjstate], [xinyong], [auth], [password], [gender], [yjtype]) VALUES (N'f916c7fd909645f9a85a0f40048237b6', N'张三', N'18811111111', N'0', N'0', N'40', N'2', N'111111', N'男', N'')
ALTER TABLE [dbo].[car] ADD  DEFAULT ('') FOR [brand]
GO
ALTER TABLE [dbo].[car] ADD  DEFAULT (NULL) FOR [cartype]
GO
ALTER TABLE [dbo].[car] ADD  DEFAULT ('') FOR [number]
GO
ALTER TABLE [dbo].[car] ADD  DEFAULT ('') FOR [price]
GO
ALTER TABLE [dbo].[car] ADD  DEFAULT ('') FOR [seat]
GO
ALTER TABLE [dbo].[car] ADD  DEFAULT ('') FOR [safe]
GO
ALTER TABLE [dbo].[car] ADD  DEFAULT ('') FOR [oil]
GO
ALTER TABLE [dbo].[car] ADD  DEFAULT ('0') FOR [state]
GO
ALTER TABLE [dbo].[maintain] ADD  DEFAULT (NULL) FOR [carid]
GO
ALTER TABLE [dbo].[maintain] ADD  DEFAULT (NULL) FOR [price]
GO
ALTER TABLE [dbo].[maintain] ADD  DEFAULT (NULL) FOR [time]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (NULL) FOR [carid]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (NULL) FOR [returntime]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('0') FOR [safe]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (NULL) FOR [price]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('0') FOR [qxstate]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (NULL) FOR [createtime]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (NULL) FOR [createid]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (NULL) FOR [createname]
GO
ALTER TABLE [dbo].[repair] ADD  DEFAULT (NULL) FOR [carid]
GO
ALTER TABLE [dbo].[repair] ADD  DEFAULT (NULL) FOR [price]
GO
ALTER TABLE [dbo].[repair] ADD  DEFAULT (NULL) FOR [time]
GO
ALTER TABLE [dbo].[repair] ADD  DEFAULT (NULL) FOR [userid]
GO
ALTER TABLE [dbo].[repair] ADD  DEFAULT (NULL) FOR [username]
GO
ALTER TABLE [dbo].[rules] ADD  DEFAULT (NULL) FOR [carid]
GO
ALTER TABLE [dbo].[rules] ADD  DEFAULT (NULL) FOR [price]
GO
ALTER TABLE [dbo].[rules] ADD  DEFAULT (NULL) FOR [time]
GO
ALTER TABLE [dbo].[safe] ADD  DEFAULT (NULL) FOR [carid]
GO
ALTER TABLE [dbo].[safe] ADD  DEFAULT (NULL) FOR [price]
GO
ALTER TABLE [dbo].[safe] ADD  DEFAULT (NULL) FOR [begintime]
GO
ALTER TABLE [dbo].[safe] ADD  DEFAULT (NULL) FOR [userid]
GO
ALTER TABLE [dbo].[safe] ADD  DEFAULT (NULL) FOR [username]
GO
ALTER TABLE [dbo].[safe] ADD  CONSTRAINT [DF_safe_begintime1]  DEFAULT (NULL) FOR [endtime]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('') FOR [name]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('') FOR [phone]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('') FOR [yajin]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF__users__yjstate__44FF419A]  DEFAULT ((0)) FOR [yjstate]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF__users__xinyong__45F365D3]  DEFAULT ((0)) FOR [xinyong]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('2') FOR [auth]
GO
USE [master]
GO
ALTER DATABASE [graduate_rentcar] SET  READ_WRITE 
GO
