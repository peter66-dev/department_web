USE [master]
GO
/****** Object:  Database [department_db]    Script Date: 6/22/2022 12:34:29 PM ******/
CREATE DATABASE [department_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'department_web', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\department_web.mdf' , SIZE = 233472KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'department_web_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\department_web_log.ldf' , SIZE = 1785856KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [department_db] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [department_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [department_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [department_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [department_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [department_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [department_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [department_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [department_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [department_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [department_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [department_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [department_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [department_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [department_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [department_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [department_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [department_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [department_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [department_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [department_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [department_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [department_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [department_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [department_db] SET RECOVERY FULL 
GO
ALTER DATABASE [department_db] SET  MULTI_USER 
GO
ALTER DATABASE [department_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [department_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [department_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [department_db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [department_db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'department_db', N'ON'
GO
USE [department_db]
GO
/****** Object:  Table [dbo].[CommentReplies]    Script Date: 6/22/2022 12:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentReplies](
	[CommentReplyID] [uniqueidentifier] NOT NULL,
	[UserReplyID] [uniqueidentifier] NOT NULL,
	[CommentID] [uniqueidentifier] NOT NULL,
	[CommentReplyContent] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblCommentReply] PRIMARY KEY CLUSTERED 
(
	[CommentReplyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/22/2022 12:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [uniqueidentifier] NOT NULL,
	[UserCommentID] [uniqueidentifier] NOT NULL,
	[PostID] [uniqueidentifier] NOT NULL,
	[CommentContent] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblComment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Groups]    Script Date: 6/22/2022 12:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupID] [uniqueidentifier] NOT NULL,
	[GroupOwnerID] [uniqueidentifier] NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[GroupDescription] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[PublicStatus] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblGroup] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupUsers]    Script Date: 6/22/2022 12:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupUsers](
	[GroupUserID] [uniqueidentifier] NOT NULL,
	[MemberID] [uniqueidentifier] NOT NULL,
	[GroupID] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblGroupUser] PRIMARY KEY CLUSTERED 
(
	[GroupUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Likes]    Script Date: 6/22/2022 12:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[LikeID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[PostID] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblLike] PRIMARY KEY CLUSTERED 
(
	[LikeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 6/22/2022 12:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [uniqueidentifier] NOT NULL,
	[UserPostID] [uniqueidentifier] NOT NULL,
	[GroupPostID] [uniqueidentifier] NOT NULL,
	[PostTypeID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[LikesTotal] [int] NOT NULL CONSTRAINT [default_LikesTotal]  DEFAULT ((0)),
	[CommentsTotal] [int] NOT NULL CONSTRAINT [default_CommentsTotal]  DEFAULT ((0)),
	[Views] [int] NOT NULL,
	[Tags] [nvarchar](100) NOT NULL,
	[PostContent] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblPost] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostTypes]    Script Date: 6/22/2022 12:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTypes](
	[PostTypeID] [uniqueidentifier] NOT NULL,
	[PostTypeName] [nvarchar](150) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblPostType] PRIMARY KEY CLUSTERED 
(
	[PostTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/22/2022 12:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/22/2022 12:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] NOT NULL,
	[StatusName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/22/2022 12:34:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [uniqueidentifier] NOT NULL,
	[RoleID] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Password] [varchar](150) NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Email] [varchar](90) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Avatar] [varchar](120) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'877527da-176f-4054-8479-004d0f937aa2', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'ba07087c-139d-4c75-a6f9-d7d10a82cecc', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CAST(N'2021-08-23 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'bf0cfac9-1ef0-47ed-8936-056e42e4d4a7', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'5e56945f-44c4-4a3e-a220-04a681418f8a', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', CAST(N'2021-09-14 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'4db281c3-8fad-4198-bd49-05af85a22734', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'06b66c33-cd92-40d1-bcd8-1c41eaff7a76', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-12-25 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'0fc649b6-0a60-4dc3-84eb-0635f20a934b', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'd9d77288-f188-4e6d-af76-61279fce39b7', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', CAST(N'2021-07-16 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'a03bda86-4f93-4cdd-9ef8-07318725f4e5', N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'8d468eeb-3abe-41ba-8696-46088cfacfa1', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', CAST(N'2021-09-08 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'b804a793-c978-40a6-ab61-09cffa3a57e2', N'3fff369c-0e73-4ba6-945a-e3e3c62b8bf1', N'77c6829e-13f7-48c6-85d8-22e091e24f3a', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', CAST(N'2021-10-24 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'88a40369-67e1-4f0d-b548-0d5e6bc23966', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'acc6224d-2627-4dad-8c85-d0970b3ae2ea', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', CAST(N'2021-07-07 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'6f80fade-b6fa-4004-bd9c-10fc82ed1458', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'70c7b661-be5f-4a88-8be1-0240504c835b', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', CAST(N'2021-09-14 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'b44ec57f-671f-4952-9027-1cb6eaf79f3f', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'be4a811f-1fde-4fe6-b4a8-695777b71a80', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', CAST(N'2021-08-16 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'96252a42-984a-4377-8379-1cc2fd01d372', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'7f4dcc54-0986-4ec5-a0a7-48a16b3c646b', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-06-30 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'53ff19ce-011b-4958-a188-1d88d85c1751', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'09755583-299c-4911-b615-736dad368b5f', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', CAST(N'2021-08-08 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'9418e99f-c984-4993-9fe5-1f4933baa94c', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'8db731ca-03b6-4790-8650-9f18531c8083', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', CAST(N'2021-06-24 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'e76bea1e-fd43-4535-b01a-21587a53aded', N'3fff369c-0e73-4ba6-945a-e3e3c62b8bf1', N'bf93ff5a-6562-4453-9ace-387e6647caf9', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', CAST(N'2021-10-12 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'81879ff1-0b80-4be1-92be-2491d20a548a', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'a501c0e7-dd1b-4a51-8a5d-ec584cc5936a', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', CAST(N'2021-09-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'889d08ec-a5bb-4d72-92d4-24975050dd3e', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'8f5118a4-ee0a-4125-b05b-fbdabaab5ace', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', CAST(N'2021-09-14 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'efe72678-de40-4c85-bfb0-2cf51e70154b', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'd91b7d74-a255-4c23-944b-847a2f8beb73', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', CAST(N'2021-11-30 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'b64c2aca-4b03-4b4f-9d3f-2d3a849d9708', N'55f41f81-c88d-4145-9903-912509151244', N'2da2a1f8-549f-4156-9de4-6e68d2163ace', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', CAST(N'2021-11-29 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'7c31e854-19b9-4ffb-82a0-2faaca6eafb2', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'c4523314-3140-495f-8d50-12d409cb09d3', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-07-29 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'4c8eadee-df29-4294-8776-347c2ca32ad5', N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'33d57be6-f958-4e37-88d0-724209aa5d41', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', CAST(N'2021-11-04 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'2da8899b-d8f2-4ade-b08b-359a3f6befe4', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'78d338a2-52ce-447e-9ce4-33bf328ae289', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', CAST(N'2021-08-18 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'd51d11fc-209a-42dd-ae54-36710b9579de', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'72b18bd6-0c39-4f3c-a72c-18370e3438b4', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', CAST(N'2021-07-27 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'f3fd1957-f1e0-4cbf-a0a0-36df0fa8eaa2', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'6cedaa2f-2b14-4527-ac15-03d6d1c8d563', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-10-04 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'991c1f2b-959d-4fbe-b94f-3b0d3dba4d35', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'19c5f979-417c-4756-b7e8-8de7d90f8260', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', CAST(N'2021-07-27 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'f4cebe01-575d-4def-8f7d-3dbb8ecdd287', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'ba07087c-139d-4c75-a6f9-d7d10a82cecc', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', CAST(N'2022-01-10 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'c1a68bed-7837-4201-93a9-3e964f13bfee', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'589c97e0-263f-43da-adf6-787190a79c6e', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', CAST(N'2022-01-11 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'285e70f4-1a31-43d3-a73a-408b48ba44af', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'3eaeb98e-d588-4bbf-a777-8b0f3cc3bbbb', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', CAST(N'2021-12-21 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'b1ee12de-b3f8-4731-a837-4133d6bcafd9', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'040eb6d0-faa9-4ffe-9b64-4367cf98f7d2', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.', CAST(N'2021-07-14 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'ec385f66-7d33-4499-b473-444a4c237113', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'd3f93e63-5270-4c22-8def-18b4feadf58d', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', CAST(N'2021-07-06 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'af2665c4-7693-421f-870a-4eb512616077', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'c042461e-f2ea-4fa6-9d9b-d2d135358ab2', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', CAST(N'2021-07-21 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'18b35632-def6-49d8-a8bb-51c8b537e116', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'2d3c8a2d-318c-4287-a28e-973f9e74550f', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', CAST(N'2021-07-28 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'f29409b8-bbe4-4b7c-a5d6-5a0fc36f5675', N'a9931c38-6cc9-45ab-941a-da20e3e187c3', N'188d9ef6-c823-4007-98b9-78e5432fbfc3', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', CAST(N'2022-01-14 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'29ef0adf-a74d-4ec4-89ca-5a5bbb175ac4', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'643544ad-76bb-495b-b514-b7257d30faf2', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', CAST(N'2021-07-16 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'61a4f38f-3d6a-4a7b-a414-5b0c52bcc7cf', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'd91b7d74-a255-4c23-944b-847a2f8beb73', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', CAST(N'2021-11-30 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'e9474ee9-3c80-4853-bebf-5d92e6a14263', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'19c5f979-417c-4756-b7e8-8de7d90f8260', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', CAST(N'2021-11-04 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'1e429656-662a-4ad6-95ec-5e79a8c0709e', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'33d57be6-f958-4e37-88d0-724209aa5d41', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', CAST(N'2021-07-21 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'4803c475-cd82-4131-96f8-658fe8891e20', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'7f4dcc54-0986-4ec5-a0a7-48a16b3c646b', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', CAST(N'2021-08-30 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'4f25d250-584a-4c7a-b1af-6d25648dbb95', N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'5b4838d9-c7fe-4c40-8575-c00d874f46db', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-06-30 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'b220cced-a63c-4603-88ac-6e364d265930', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'1a06c452-c3ed-45b0-9d0d-20efa8082aa0', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', CAST(N'2021-10-25 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'2e94c14b-81e3-4d99-854e-6fc9a81c4a5d', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'6677c71e-a1ac-48f8-a36c-6b0b98fc1f20', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', CAST(N'2021-10-25 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'c01fbb57-beb8-42c0-845f-713577652459', N'e3a28655-71a1-4508-8f81-adab92741a77', N'3ca4b3a2-0dda-4fb6-94dc-4fdec9f4cf75', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', CAST(N'2021-07-07 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'e695159e-bf51-48da-bc4d-748e6d9d534b', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'a5a197e8-cd47-4f53-b2e6-4bd9ebe7044d', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', CAST(N'2022-01-11 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'dc052459-935c-4eb8-9084-78146571b890', N'272359eb-3947-48bf-b94c-e57b803e898e', N'ee477e1e-bb45-4def-9845-5017d93919c0', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CAST(N'2021-09-13 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'bd0e7934-3098-45ca-90f7-79cb96218ce1', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'8f5118a4-ee0a-4125-b05b-fbdabaab5ace', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', CAST(N'2021-10-24 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'8328cf91-8f9e-4154-b44b-7a122dbba4ff', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'8e909914-dfbd-4316-b98d-967da17c17dc', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', CAST(N'2021-09-14 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'3b8cb758-7627-4c90-8148-7aa749d93bc6', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'5b4838d9-c7fe-4c40-8575-c00d874f46db', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', CAST(N'2021-12-22 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'e68daa3d-8cdf-4e93-83dc-7bc29f3acd1a', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'77c6829e-13f7-48c6-85d8-22e091e24f3a', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', CAST(N'2021-08-16 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'58dfe632-fee9-494b-98c5-7ce4867bbc27', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'10e76e73-21c6-49a1-86c6-5e199621c410', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', CAST(N'2021-08-25 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'56572b7f-f74d-4efd-860a-83539193f7fc', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'9f6b38d8-8ec2-4a9f-a662-ae3e93ddaa7d', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', CAST(N'2022-01-10 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'9d0bd931-f395-415a-bff0-8536c88fc11e', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'1b19d93c-9a6c-492b-84b5-8402cd379985', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', CAST(N'2022-01-05 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'4d69bfc6-38ca-49f8-b5f4-865f874376b9', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'6a70c4c9-21ba-4924-83db-03b8375f4d1b', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-10-04 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'0346b246-b345-499d-aa26-86cd21cbfc83', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'44dfe2a0-9b30-477f-9166-3a53d56e5d41', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', CAST(N'2021-06-24 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'3fa13bb0-1859-4b7c-b92e-86d64f1dfba0', N'66f2807d-870d-475e-9995-453cc81f2e90', N'8e909914-dfbd-4316-b98d-967da17c17dc', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', CAST(N'2021-11-15 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'9e3bec9a-dac6-453f-bcfb-8792472d5f22', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'bf93ff5a-6562-4453-9ace-387e6647caf9', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', CAST(N'2021-07-06 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'ff88c258-9f21-4a22-b633-88bb0ca80455', N'272359eb-3947-48bf-b94c-e57b803e898e', N'bcb5844d-6203-42af-bcc5-38f97e5cc42a', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-12-25 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'd6da8111-dff7-4bb9-abfe-8cd78cea4667', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'8694325c-cfcd-4f54-a27f-6f8e6f09584b', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', CAST(N'2021-07-28 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'e605b334-fcb6-4ab5-83ac-8d54b25e7e52', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'e3cf4cbc-eecd-4a82-8eb7-9dab0b40e72f', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', CAST(N'2021-08-25 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'5b57433e-d6df-4b49-8653-936dd4e90b54', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'cf4f3b22-f82d-4bd8-92aa-5a9309e521ba', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', CAST(N'2021-09-08 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'1a1e647c-736d-4b87-b804-94dbb8be0d49', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'8db731ca-03b6-4790-8650-9f18531c8083', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', CAST(N'2022-01-20 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'68d0d06b-1786-458f-9f7f-953df013623e', N'272359eb-3947-48bf-b94c-e57b803e898e', N'8f4004de-c1b7-4d46-9bdd-2ed9487cc7aa', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', CAST(N'2022-01-19 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'33a219ce-8ca3-40fd-bffe-96555d658126', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'040eb6d0-faa9-4ffe-9b64-4367cf98f7d2', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', CAST(N'2021-06-24 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'78a15e0a-0e57-41a9-8d8e-9b53057ffde8', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'cf4f3b22-f82d-4bd8-92aa-5a9309e521ba', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', CAST(N'2021-07-17 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'dea95c0f-0e8b-4640-b09e-9e65ca83f252', N'e3a28655-71a1-4508-8f81-adab92741a77', N'5086ad6a-4ff9-48c5-a2ec-8c68c40fbe59', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', CAST(N'2021-11-29 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'c04ebe36-78d5-4116-a222-9ec5ba39072a', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'd3f93e63-5270-4c22-8def-18b4feadf58d', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CAST(N'2021-09-13 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'62c05d00-14ee-4641-8543-ac924dcd0d0a', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'83b2642f-f281-40e1-8739-a95ff64613c4', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', CAST(N'2021-09-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'c0dc26dd-4b57-49d8-a246-b558a0e79393', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'fe83e945-597b-4943-8237-64f602bb8427', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', CAST(N'2021-07-28 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'953e9f11-f625-4e60-a837-b5b460520811', N'e3a28655-71a1-4508-8f81-adab92741a77', N'66e5edf3-3b72-4700-aff2-08313a65b9b6', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', CAST(N'2022-01-20 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'a750a4a6-ce4f-4cef-ac5a-b84243cbd719', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'8f5118a4-ee0a-4125-b05b-fbdabaab5ace', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', CAST(N'2021-07-17 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'6fd547e5-b551-45de-afaa-b8ca1b0952c8', N'66f2807d-870d-475e-9995-453cc81f2e90', N'be4a811f-1fde-4fe6-b4a8-695777b71a80', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', CAST(N'2021-11-25 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'ba6db232-5881-47b1-9cef-b924c2c53d95', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'c46ade76-0637-4b6a-befd-5b84d0f22055', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', CAST(N'2022-01-10 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'3764a789-5b1d-4960-8f57-b94e9efd5272', N'66f2807d-870d-475e-9995-453cc81f2e90', N'36e2d35f-e6e6-4e3c-aaae-c8652057f25d', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', CAST(N'2021-09-14 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'06ea2dfa-bccf-444d-998a-bf4ebbbbc436', N'3e89a21a-4554-48e7-b11f-4f70b39e43b5', N'8db731ca-03b6-4790-8650-9f18531c8083', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', CAST(N'2022-01-10 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'f0c3b8bb-2a0c-4961-b129-c79835ce4925', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'966b3fab-d63d-42ba-a64b-4a34e3b5e3e1', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', CAST(N'2021-11-29 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'187f4162-5d45-472f-8226-c7fd3f9cd6ae', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'bf93ff5a-6562-4453-9ace-387e6647caf9', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', CAST(N'2021-11-25 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'f12b6bda-d7a7-4f80-914a-c87865acc1cc', N'55f41f81-c88d-4145-9903-912509151244', N'1f44ba3a-e75a-48dc-9da8-50e6d5428fea', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', CAST(N'2021-10-12 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'eb26c33c-b0bb-48b1-904b-cb89e674d718', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'8e909914-dfbd-4316-b98d-967da17c17dc', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CAST(N'2021-07-18 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'e8e39c4f-d27d-4ac5-95c0-cbc8ad7146fd', N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'bcb5844d-6203-42af-bcc5-38f97e5cc42a', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', CAST(N'2021-06-24 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'e04135d3-0a51-4e21-b2ff-ce467783175f', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'66be98b6-b938-46ba-a274-e595c0e41d1a', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', CAST(N'2022-01-14 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'86d2e0e0-1cce-4295-81b6-ceaf9489db44', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'e3cf4cbc-eecd-4a82-8eb7-9dab0b40e72f', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CAST(N'2021-07-13 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'4087bbeb-3c26-480d-9261-d2e595815cc6', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'cf4f3b22-f82d-4bd8-92aa-5a9309e521ba', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', CAST(N'2021-10-12 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'ed5e1b5b-2569-49e4-902e-d3b3262142ba', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'4cba8a6b-aec6-406a-a0b0-d8cb7a185236', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', CAST(N'2021-11-15 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'97e92fef-1a65-4b98-a1c4-d3e721361443', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'af26bddb-af25-4d8f-aa14-a5c76458b473', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', CAST(N'2021-08-08 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'f4777dd4-ac8d-4089-8a22-d6f57d9bff91', N'e3a28655-71a1-4508-8f81-adab92741a77', N'b784f916-3ded-4681-99f7-ba12e49e50e7', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-11-02 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'4494689c-46da-4d3b-aed7-d788eb59de39', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'78d338a2-52ce-447e-9ce4-33bf328ae289', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-07-29 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'a3d7ba8c-a6f8-482d-ac42-dee04dad4a00', N'e3a28655-71a1-4508-8f81-adab92741a77', N'4cba8a6b-aec6-406a-a0b0-d8cb7a185236', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', CAST(N'2021-08-30 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'33008706-135f-4e8b-9108-e006294eb6e6', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'188d9ef6-c823-4007-98b9-78e5432fbfc3', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CAST(N'2021-08-23 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'19490ccd-fe30-44f0-987f-e385e778badb', N'815557cc-5534-4717-91aa-fd75088c96c5', N'bf93ff5a-6562-4453-9ace-387e6647caf9', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.', CAST(N'2021-07-14 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'fa220b89-6357-4604-94ca-e698c697c89f', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'293c329b-8e3e-4a27-a5d6-0a10acd424ef', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', CAST(N'2021-08-18 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'efe4d193-2922-4291-bedb-e8b7e61fa896', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'b9c60c1f-ca4c-4c8e-8b2e-cf683073717c', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', CAST(N'2021-09-14 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'214bc66b-78f5-45c0-b0ab-e8d306022148', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'af26bddb-af25-4d8f-aa14-a5c76458b473', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', CAST(N'2021-12-27 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'a452e950-b13f-4a51-bc83-f019f4eb75d2', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'acc6224d-2627-4dad-8c85-d0970b3ae2ea', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CAST(N'2021-07-13 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'927f517c-440d-4f0b-bfed-f138ae76bd3a', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'293c329b-8e3e-4a27-a5d6-0a10acd424ef', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', CAST(N'2022-01-19 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'ecd4dacd-7a75-4939-b997-f367ad837edc', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'8f4004de-c1b7-4d46-9bdd-2ed9487cc7aa', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CAST(N'2021-07-18 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'863d9b09-a765-46da-93b6-f6fadcc2ba30', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'fe6f2d1c-036a-4af1-98df-6d38ff7b321c', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-11-02 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'00b8ac5d-a69a-467b-a905-f83e0bd6d640', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'5cca6286-4c08-42e8-8157-890475ff593e', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', CAST(N'2021-11-29 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'eb3da1e8-5034-44f2-815a-f874721b080d', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'77c6829e-13f7-48c6-85d8-22e091e24f3a', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', CAST(N'2021-12-27 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'8883e012-db11-427c-a0f4-f91a49dd8d1c', N'272359eb-3947-48bf-b94c-e57b803e898e', N'6ee9a1d5-1b37-4233-9c0a-449f0138f8d3', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', CAST(N'2021-12-22 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'2169281e-ca80-4396-a8cf-f9f668f9b397', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'77f7244c-fc1b-4bc4-949c-c40ba790a79d', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', CAST(N'2021-12-21 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'0f77e160-d2e7-4e60-b961-fc4bc5dfd438', N'55f41f81-c88d-4145-9903-912509151244', N'2d3c8a2d-318c-4287-a28e-973f9e74550f', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', CAST(N'2021-07-28 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'd49330c3-7c29-4846-89c4-fef9a38edb03', N'3e89a21a-4554-48e7-b11f-4f70b39e43b5', N'30b064fc-00b1-49b2-b9eb-f020090da524', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', CAST(N'2021-10-12 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CommentReplies] ([CommentReplyID], [UserReplyID], [CommentID], [CommentReplyContent], [CreatedDate], [Status]) VALUES (N'5e828243-cc0a-4c72-9766-ff6c121d6db0', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'188d9ef6-c823-4007-98b9-78e5432fbfc3', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', CAST(N'2022-01-05 00:00:00.000' AS DateTime), 5)
GO
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'b2b71920-56f5-4687-b2ae-00a6157ddd65', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'7764c440-5588-4264-9a70-c2608dccb740', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', CAST(N'2021-10-15 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'70c7b661-be5f-4a88-8be1-0240504c835b', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'2303bc2f-6239-478d-8df3-a59eda249c7e', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-11-07 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'6a70c4c9-21ba-4924-83db-03b8375f4d1b', N'815557cc-5534-4717-91aa-fd75088c96c5', N'3953eaa1-bd32-42af-a784-12523d9549c3', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', CAST(N'2022-01-15 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'6cedaa2f-2b14-4527-ac15-03d6d1c8d563', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'6956f02d-f19c-4d09-b160-668e050d3c38', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CAST(N'2021-06-22 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'5e56945f-44c4-4a3e-a220-04a681418f8a', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'67be807f-4d2e-4d68-b313-bcd763f436d0', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', CAST(N'2022-01-15 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'66e5edf3-3b72-4700-aff2-08313a65b9b6', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'6956f02d-f19c-4d09-b160-668e050d3c38', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', CAST(N'2022-01-20 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'293c329b-8e3e-4a27-a5d6-0a10acd424ef', N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'fddc7ea2-d75c-4d4f-b0de-dbfa249cda36', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', CAST(N'2021-11-27 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'c834362f-94c1-4b4a-a9df-1260ad44ecd7', N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'dd77f7dc-e4e2-4e66-b222-d55fb925eea0', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', CAST(N'2021-09-15 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'c4523314-3140-495f-8d50-12d409cb09d3', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'cd428cbe-a3c8-4968-8ba3-476be6652a42', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', CAST(N'2022-01-01 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'72b18bd6-0c39-4f3c-a72c-18370e3438b4', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'5708e356-9b31-4004-9eca-70bf042ebcc3', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', CAST(N'2021-08-03 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'd3f93e63-5270-4c22-8def-18b4feadf58d', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'235c28f9-b6d4-4e75-a8c1-b351c841854c', N'Fusce consequat. Nulla nisl. Nunc nisl.', CAST(N'2021-08-13 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'06b66c33-cd92-40d1-bcd8-1c41eaff7a76', N'a9931c38-6cc9-45ab-941a-da20e3e187c3', N'86096ac6-f2fd-46c1-9c82-8bc53448e587', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-07-02 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'1a06c452-c3ed-45b0-9d0d-20efa8082aa0', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'3953eaa1-bd32-42af-a784-12523d9549c3', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'77c6829e-13f7-48c6-85d8-22e091e24f3a', N'1c8f9668-f74f-4007-9333-a087df15231a', N'ffbd32fa-cdc8-4b88-a2c6-45452299f186', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-07-02 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'8f4004de-c1b7-4d46-9bdd-2ed9487cc7aa', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'235c28f9-b6d4-4e75-a8c1-b351c841854c', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CAST(N'2021-09-12 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'1ba1cc4f-1a8b-419e-ad1f-30c65694c497', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'170fee80-d746-4855-ab0a-b845ad10cee7', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', CAST(N'2021-11-18 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'78d338a2-52ce-447e-9ce4-33bf328ae289', N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'620ed551-d5d4-4152-aa09-249dc7ca162e', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', CAST(N'2021-08-04 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'bf93ff5a-6562-4453-9ace-387e6647caf9', N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'620ed551-d5d4-4152-aa09-249dc7ca162e', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', CAST(N'2021-07-13 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'bcb5844d-6203-42af-bcc5-38f97e5cc42a', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'7eaa336f-d427-4d71-8526-358dfc00d265', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CAST(N'2021-10-17 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'44dfe2a0-9b30-477f-9166-3a53d56e5d41', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'56bcefaf-40a2-438d-be58-36f87c3b713f', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', CAST(N'2021-10-04 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'9fce6d9a-763a-45cd-8748-416dcf2563d5', N'e3a28655-71a1-4508-8f81-adab92741a77', N'c6a5f24b-3a43-41e5-a867-838470a0963c', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', CAST(N'2021-12-29 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'36f85776-d11c-4e6e-a992-42497d3fdb60', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'37d61d6f-0f4b-47df-91db-1ff649e9081d', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CAST(N'2021-06-25 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'040eb6d0-faa9-4ffe-9b64-4367cf98f7d2', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'6956f02d-f19c-4d09-b160-668e050d3c38', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CAST(N'2021-07-26 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'6ee9a1d5-1b37-4233-9c0a-449f0138f8d3', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'405a10e9-b391-4682-8419-3044731dbdfb', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', CAST(N'2021-12-29 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'f395f89e-90b9-405c-b0fc-457162895ff4', N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'c6a5f24b-3a43-41e5-a867-838470a0963c', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', CAST(N'2021-10-27 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'8d468eeb-3abe-41ba-8696-46088cfacfa1', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'37d61d6f-0f4b-47df-91db-1ff649e9081d', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', CAST(N'2021-08-12 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'7f4dcc54-0986-4ec5-a0a7-48a16b3c646b', N'55f41f81-c88d-4145-9903-912509151244', N'e7317e00-2291-4321-8cb0-f711a600ca6e', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', CAST(N'2021-08-27 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'966b3fab-d63d-42ba-a64b-4a34e3b5e3e1', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'dd77f7dc-e4e2-4e66-b222-d55fb925eea0', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', CAST(N'2021-09-13 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'a5a197e8-cd47-4f53-b2e6-4bd9ebe7044d', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'8ba3a1e9-a61c-4a20-9072-318680595453', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-08-10 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'6b3d419d-2967-43d4-a243-4eb366f0a571', N'272359eb-3947-48bf-b94c-e57b803e898e', N'7eaa336f-d427-4d71-8526-358dfc00d265', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', CAST(N'2021-08-28 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'3ca4b3a2-0dda-4fb6-94dc-4fdec9f4cf75', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'cd428cbe-a3c8-4968-8ba3-476be6652a42', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', CAST(N'2021-09-15 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'ee477e1e-bb45-4def-9845-5017d93919c0', N'e3a28655-71a1-4508-8f81-adab92741a77', N'1b038258-8bd2-4091-9129-b96d28c1292f', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', CAST(N'2021-07-22 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'1f44ba3a-e75a-48dc-9da8-50e6d5428fea', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'7eaa336f-d427-4d71-8526-358dfc00d265', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', CAST(N'2021-11-08 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'ccea3e0f-5131-4b09-8f5d-57e77c3ff7aa', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'e1b5fe3f-cae2-4759-a71a-5744ffe05c11', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CAST(N'2021-08-18 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'cf4f3b22-f82d-4bd8-92aa-5a9309e521ba', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'c2d4391b-ac32-497e-8567-6605073697c8', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', CAST(N'2021-12-20 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'b11f6dd0-2cd4-4e2d-b54c-5b060cbb2d04', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'8ba3a1e9-a61c-4a20-9072-318680595453', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-11-07 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'c46ade76-0637-4b6a-befd-5b84d0f22055', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'286ea286-c6f5-44f1-a78c-c7607a5b6520', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-08-10 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'10e76e73-21c6-49a1-86c6-5e199621c410', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'0f6052bb-1195-4904-a118-a9ca0e9b9df3', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CAST(N'2021-11-18 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'd9d77288-f188-4e6d-af76-61279fce39b7', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'e08bb62b-c2f7-41bc-897b-b0ccb3b9f69f', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CAST(N'2021-06-22 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'fe83e945-597b-4943-8237-64f602bb8427', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'fddc7ea2-d75c-4d4f-b0de-dbfa249cda36', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', CAST(N'2021-08-21 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'be4a811f-1fde-4fe6-b4a8-695777b71a80', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'f0e4b9c8-7b53-4270-b520-8bd96717629d', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', CAST(N'2021-08-27 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'6677c71e-a1ac-48f8-a36c-6b0b98fc1f20', N'815557cc-5534-4717-91aa-fd75088c96c5', N'37d61d6f-0f4b-47df-91db-1ff649e9081d', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', CAST(N'2021-11-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'e7bd419e-47c8-463b-8a7c-6d0f0a0bc09b', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'286ea286-c6f5-44f1-a78c-c7607a5b6520', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', CAST(N'2021-07-30 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'fe6f2d1c-036a-4af1-98df-6d38ff7b321c', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'f3d0987e-cc86-4412-81d8-16722dcf7ef4', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', CAST(N'2021-08-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'2da2a1f8-549f-4156-9de4-6e68d2163ace', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'65cdbefa-fccb-4f33-882b-2fbe94b0fd61', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', CAST(N'2021-09-30 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'8694325c-cfcd-4f54-a27f-6f8e6f09584b', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'65cdbefa-fccb-4f33-882b-2fbe94b0fd61', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CAST(N'2021-06-25 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'33d57be6-f958-4e37-88d0-724209aa5d41', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'286ea286-c6f5-44f1-a78c-c7607a5b6520', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', CAST(N'2021-10-08 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'09755583-299c-4911-b615-736dad368b5f', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'f3d0987e-cc86-4412-81d8-16722dcf7ef4', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', CAST(N'2021-11-06 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'9f0cce33-efde-45a2-b9bf-739be90084e3', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'65cdbefa-fccb-4f33-882b-2fbe94b0fd61', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', CAST(N'2022-01-20 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'589c97e0-263f-43da-adf6-787190a79c6e', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'2303bc2f-6239-478d-8df3-a59eda249c7e', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', CAST(N'2021-11-05 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'188d9ef6-c823-4007-98b9-78e5432fbfc3', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'f0e4b9c8-7b53-4270-b520-8bd96717629d', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', CAST(N'2021-11-08 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'5bf88fc5-0313-41e0-ae60-7f9f1ba01f9d', N'272359eb-3947-48bf-b94c-e57b803e898e', N'37d61d6f-0f4b-47df-91db-1ff649e9081d', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', CAST(N'2021-07-22 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'c01c9d6f-346a-4e51-8675-82ca80309ed6', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'235c28f9-b6d4-4e75-a8c1-b351c841854c', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', CAST(N'2021-10-21 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'1b19d93c-9a6c-492b-84b5-8402cd379985', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'f2ab473a-e46d-4a73-a173-371159a08950', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', CAST(N'2021-09-15 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'd91b7d74-a255-4c23-944b-847a2f8beb73', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'16e80cc6-6c19-412a-9e91-f83832462182', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', CAST(N'2021-12-29 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'5cca6286-4c08-42e8-8157-890475ff593e', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'f2ab473a-e46d-4a73-a173-371159a08950', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CAST(N'2021-08-18 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'3eaeb98e-d588-4bbf-a777-8b0f3cc3bbbb', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'80a409f6-016e-4688-8724-c9b21856724e', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', CAST(N'2021-08-12 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'a3eaafce-77ec-4cb7-9565-8b633638719f', N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'1b038258-8bd2-4091-9129-b96d28c1292f', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CAST(N'2021-10-17 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'5086ad6a-4ff9-48c5-a2ec-8c68c40fbe59', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'3953eaa1-bd32-42af-a784-12523d9549c3', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', CAST(N'2021-12-12 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'19c5f979-417c-4756-b7e8-8de7d90f8260', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'5708e356-9b31-4004-9eca-70bf042ebcc3', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', CAST(N'2021-12-12 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'c67c30d8-912a-4ac7-932a-92bc313bded1', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'ffbd32fa-cdc8-4b88-a2c6-45452299f186', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', CAST(N'2021-09-13 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'82e748d4-7d5c-43b1-a5f0-940b48e62389', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'b8e3274d-125f-4b4f-9f36-7ad8894e6e91', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CAST(N'2021-07-26 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'8e909914-dfbd-4316-b98d-967da17c17dc', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'6a53274c-6478-453e-a1fb-91fc891bfb7d', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', CAST(N'2022-01-01 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'2d3c8a2d-318c-4287-a28e-973f9e74550f', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'0cc50b29-dcb2-45ec-a343-028681d1dd55', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', CAST(N'2021-08-14 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'737b95cf-b1af-4637-aec4-9abfe0648433', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'235c28f9-b6d4-4e75-a8c1-b351c841854c', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', CAST(N'2021-08-28 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'e3cf4cbc-eecd-4a82-8eb7-9dab0b40e72f', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'80a409f6-016e-4688-8724-c9b21856724e', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', CAST(N'2021-08-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'8db731ca-03b6-4790-8650-9f18531c8083', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'3953eaa1-bd32-42af-a784-12523d9549c3', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', CAST(N'2021-12-20 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'af26bddb-af25-4d8f-aa14-a5c76458b473', N'272359eb-3947-48bf-b94c-e57b803e898e', N'7764c440-5588-4264-9a70-c2608dccb740', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', CAST(N'2021-12-29 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'2abb8de0-d3d6-4659-b3a8-a64225284edb', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'3953eaa1-bd32-42af-a784-12523d9549c3', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', CAST(N'2021-12-31 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'83b2642f-f281-40e1-8739-a95ff64613c4', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'f0e4b9c8-7b53-4270-b520-8bd96717629d', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', CAST(N'2021-08-14 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'9f6b38d8-8ec2-4a9f-a662-ae3e93ddaa7d', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'2303bc2f-6239-478d-8df3-a59eda249c7e', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', CAST(N'2021-07-11 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'fbfe588c-79b5-4c01-94db-ae58136f4144', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'3953eaa1-bd32-42af-a784-12523d9549c3', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', CAST(N'2021-08-04 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'738f1c33-0756-4245-aeea-b29d9adeb058', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'37d61d6f-0f4b-47df-91db-1ff649e9081d', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', CAST(N'2021-08-08 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'65720505-724a-4239-9dd0-b6195bd583a0', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'1b038258-8bd2-4091-9129-b96d28c1292f', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', CAST(N'2022-01-18 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'643544ad-76bb-495b-b514-b7257d30faf2', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'c6a5f24b-3a43-41e5-a867-838470a0963c', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', CAST(N'2021-08-08 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'b784f916-3ded-4681-99f7-ba12e49e50e7', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'e08bb62b-c2f7-41bc-897b-b0ccb3b9f69f', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', CAST(N'2021-08-19 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'a231cc0c-1b56-4a9f-96cb-bad47da2ee0f', N'e3a28655-71a1-4508-8f81-adab92741a77', N'7eaa336f-d427-4d71-8526-358dfc00d265', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', CAST(N'2021-11-05 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'a8f690d3-9028-46d2-986c-bd082bafcb6c', N'e3a28655-71a1-4508-8f81-adab92741a77', N'6a53274c-6478-453e-a1fb-91fc891bfb7d', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', CAST(N'2021-11-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'5b4838d9-c7fe-4c40-8575-c00d874f46db', N'1c8f9668-f74f-4007-9333-a087df15231a', N'bd3b67d0-85c1-42e8-b318-2f52b678e749', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CAST(N'2021-11-18 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'7cafa3ff-73df-4421-8370-c033362476d4', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'67be807f-4d2e-4d68-b313-bcd763f436d0', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', CAST(N'2021-12-30 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'8394e9e6-6afd-4437-9f6e-c30d5616bc72', N'3fff369c-0e73-4ba6-945a-e3e3c62b8bf1', N'5708e356-9b31-4004-9eca-70bf042ebcc3', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', CAST(N'2022-01-18 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'77f7244c-fc1b-4bc4-949c-c40ba790a79d', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'c6779da1-3ca2-43fe-b30b-5d8daa475c11', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', CAST(N'2021-08-19 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'36e2d35f-e6e6-4e3c-aaae-c8652057f25d', N'815557cc-5534-4717-91aa-fd75088c96c5', N'bd3b67d0-85c1-42e8-b318-2f52b678e749', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', CAST(N'2021-11-06 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'b9c60c1f-ca4c-4c8e-8b2e-cf683073717c', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'c6a5f24b-3a43-41e5-a867-838470a0963c', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', CAST(N'2021-12-31 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'acc6224d-2627-4dad-8c85-d0970b3ae2ea', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'91faa128-f2a1-4123-bd75-df5d97b561fe', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CAST(N'2021-09-12 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'9ff42a35-465e-4ae5-8632-d164e7ce86c8', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'286ea286-c6f5-44f1-a78c-c7607a5b6520', N'Fusce consequat. Nulla nisl. Nunc nisl.', CAST(N'2021-08-13 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'95dd61cb-e6d1-456d-9503-d19a8e6a56a7', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'ffbd32fa-cdc8-4b88-a2c6-45452299f186', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', CAST(N'2021-11-18 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'c042461e-f2ea-4fa6-9d9b-d2d135358ab2', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'e1b5fe3f-cae2-4759-a71a-5744ffe05c11', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', CAST(N'2021-08-21 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'f2d5f184-c171-4cc6-ad8e-d37ff55d8881', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'6a53274c-6478-453e-a1fb-91fc891bfb7d', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', CAST(N'2021-08-03 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'ba07087c-139d-4c75-a6f9-d7d10a82cecc', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'fddc7ea2-d75c-4d4f-b0de-dbfa249cda36', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', CAST(N'2021-10-15 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'60d1b52f-11f0-439a-bd0b-d8944f7337b5', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'80a409f6-016e-4688-8724-c9b21856724e', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', CAST(N'2021-11-27 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'4cba8a6b-aec6-406a-a0b0-d8cb7a185236', N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'80a409f6-016e-4688-8724-c9b21856724e', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', CAST(N'2021-07-30 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'66be98b6-b938-46ba-a274-e595c0e41d1a', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'8ba3a1e9-a61c-4a20-9072-318680595453', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', CAST(N'2021-12-30 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'a501c0e7-dd1b-4a51-8a5d-ec584cc5936a', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'c2d4391b-ac32-497e-8567-6605073697c8', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', CAST(N'2021-10-08 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'30b064fc-00b1-49b2-b9eb-f020090da524', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'e1b5fe3f-cae2-4759-a71a-5744ffe05c11', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', CAST(N'2021-07-11 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'b50347bc-9864-43ae-8537-f04859d962f0', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'f2ab473a-e46d-4a73-a173-371159a08950', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', CAST(N'2021-07-13 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'a730c0a4-7776-4aa8-8573-f2d1de00222d', N'66f2807d-870d-475e-9995-453cc81f2e90', N'9b21ec30-1bf3-4d29-9dea-c0dd480bf464', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', CAST(N'2021-10-04 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'ad48cd30-aafb-4985-bcb6-fa3bf686cb27', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'5708e356-9b31-4004-9eca-70bf042ebcc3', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', CAST(N'2021-10-27 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'8f5118a4-ee0a-4125-b05b-fbdabaab5ace', N'3e89a21a-4554-48e7-b11f-4f70b39e43b5', N'f3d0987e-cc86-4412-81d8-16722dcf7ef4', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', CAST(N'2021-10-21 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Comments] ([CommentID], [UserCommentID], [PostID], [CommentContent], [CreatedDate], [Status]) VALUES (N'bfb7b7e6-8a01-44e8-9993-ff982767b2a3', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'6a53274c-6478-453e-a1fb-91fc891bfb7d', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', CAST(N'2021-09-15 00:00:00.000' AS DateTime), 6)
GO
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'Services', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', CAST(N'2022-03-07 00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'bd64380a-895d-4b00-af7a-12c80c1faa32', N'a9931c38-6cc9-45ab-941a-da20e3e187c3', N'Marketing', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', CAST(N'2022-04-13 00:00:00.000' AS DateTime), 5, 2)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'1a64cd61-c9fe-482b-921d-1c84145266d2', N'815557cc-5534-4717-91aa-fd75088c96c5', N'Research and Development', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CAST(N'2021-08-22 00:00:00.000' AS DateTime), 5, 2)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'7ec693d6-b5ca-4619-9480-426ffc7931a6', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'Legal', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', CAST(N'2021-12-11 00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'dbdf043d-5f19-4237-8eee-4355eaba7071', N'e3a28655-71a1-4508-8f81-adab92741a77', N'Research and Development', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', CAST(N'2021-08-14 00:00:00.000' AS DateTime), 5, 2)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'3b813c84-335d-4582-8ab3-46900554336d', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'Business Development', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CAST(N'2021-12-24 00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'c344843d-c8b2-437e-acbb-602f06764b11', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'Marketing', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', CAST(N'2022-01-05 00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'42422529-d855-40b4-b7c0-619ef761dcb3', N'3fff369c-0e73-4ba6-945a-e3e3c62b8bf1', N'Product Management', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', CAST(N'2022-01-10 00:00:00.000' AS DateTime), 5, 2)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'a3281a9f-a2f0-461c-bebc-6994251a38cb', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'Training', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', CAST(N'2021-10-29 00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', N'1c8f9668-f74f-4007-9333-a087df15231a', N'Accounting', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', CAST(N'2022-03-12 00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'86b71704-025c-49a0-93c1-88155b2f50c5', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'Business Development', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', CAST(N'2021-11-14 00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'Human Resources', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', CAST(N'2021-08-02 00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'433ef784-2a38-4f26-bf49-a807e47e6b41', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'Marketing', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', CAST(N'2021-09-29 00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', N'a9931c38-6cc9-45ab-941a-da20e3e187c3', N'Accounting', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', CAST(N'2021-07-22 00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'184887fa-56f1-4654-a8ad-b81efb5e2617', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'Accounting', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', CAST(N'2021-11-21 00:00:00.000' AS DateTime), 5, 2)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'1fb8c327-7c95-467a-af73-baa7089f750a', N'66f2807d-870d-475e-9995-453cc81f2e90', N'Sales', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', CAST(N'2022-04-20 00:00:00.000' AS DateTime), 5, 2)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'a405e29b-9a13-43f3-a9e7-c3b863e02075', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'Engineering', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', CAST(N'2022-02-22 00:00:00.000' AS DateTime), 5, 2)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'Research and Development', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', CAST(N'2021-09-25 00:00:00.000' AS DateTime), 5, 2)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'c8dca944-1203-4ebe-a026-d5351abfb236', N'815557cc-5534-4717-91aa-fd75088c96c5', N'Business Development', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', CAST(N'2021-07-09 00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Groups] ([GroupID], [GroupOwnerID], [GroupName], [GroupDescription], [CreatedDate], [PublicStatus], [Status]) VALUES (N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'Marketing', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', CAST(N'2021-10-04 00:00:00.000' AS DateTime), 5, 2)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b49b7dd5-4dfe-460d-98e7-00cc58745008', N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'19e75748-c570-49e5-b897-00d456dc3618', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ec244be2-fabe-4692-bedf-00e553cbc929', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'7933d075-0f6e-4c79-8750-0102b1c607bf', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'0bb5a0af-137a-42db-aa53-01e29a14ef50', N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'fd47f19b-74b8-4594-bed7-02157887e8cb', N'272359eb-3947-48bf-b94c-e57b803e898e', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'31769d25-c39f-4f7e-9163-024c1bd8851d', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ed730dec-6f38-423f-8771-0287fbc05925', N'3e89a21a-4554-48e7-b11f-4f70b39e43b5', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ea390551-a710-4ed6-ae4a-0393f721e1ce', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'19a1af3e-f857-4eea-a2fc-03ae1f3f82c1', N'e3a28655-71a1-4508-8f81-adab92741a77', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'02b74e3c-8ed4-4726-a613-04200b1a2d52', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'90c63c99-3edf-48a4-a04e-043160c2701e', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'18c88197-4a79-45b7-be87-049afbf4e926', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'68e870de-4b55-4adc-b18f-05695db31d42', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'aac0b36d-57e1-43f0-a07f-061b05abcab2', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'fc3ca053-0bbb-4aa6-b9b0-06c4d61b79e3', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'71e6dcbd-8e3b-4219-9ae8-072a59c16d0c', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8efcc990-949a-4f54-9617-075dd3c9d56d', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'9fd0005b-3868-4b4f-bbd4-080040b96e08', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'97f11400-903f-4385-b753-086082930813', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'16464fab-ddb8-42a6-bc69-088ae41e54d4', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3620e581-cb2d-47d6-9d78-08e70deb23a7', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f244556e-9d72-46ba-8d80-094547cde468', N'66f2807d-870d-475e-9995-453cc81f2e90', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'6743d69b-99dd-4b2a-9be4-0a12b9b46a72', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5168ca28-df65-4d10-be15-0a91e5326b10', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e1745044-7367-4462-ac25-0ae115e1d7a2', N'66f2807d-870d-475e-9995-453cc81f2e90', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd128c4ae-a104-443f-a5d4-0b0a96e4044f', N'1c8f9668-f74f-4007-9333-a087df15231a', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3d38b3c6-0574-40a1-8903-0b230db6f6a7', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b40501e9-d0ce-48dc-a954-0be1ebd697f8', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'975343f5-6038-42df-8ec1-0d5d5f5f1f03', N'3fff369c-0e73-4ba6-945a-e3e3c62b8bf1', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'728cb0a4-38f6-47cc-8d9a-0d66c6ca9215', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c9adc4a2-7c13-4538-9aae-0ea96009378d', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'aa5b8ea0-d4c1-4a21-a46a-0f2206e8f4cb', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5fa47de5-c6ed-4cbe-a1f3-0fec74fa6958', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b2861ce1-21e2-4e8c-aaeb-100cd7a1810c', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'7380a048-9750-4541-947b-1067f86115a6', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f4b83db5-7970-4f9a-81e7-10df32027a89', N'815557cc-5534-4717-91aa-fd75088c96c5', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3412aad0-08ac-4822-82d5-116115a39bf9', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'50859471-3da2-4ea1-9ad9-117e8582da11', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'9b2c1eb1-4f20-4fa1-83c1-12a9d35fd377', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a875a33b-5a89-42e4-8eab-13152bf2abdd', N'66f2807d-870d-475e-9995-453cc81f2e90', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'9a43075d-9bd9-4590-8aa4-135bc3a0ad54', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd0ba9549-efd9-4e46-af16-142141f4d20a', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1734b973-53e4-40f8-ad32-14b5e32a3e51', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'01db860e-0097-47c4-95c0-17265fe95a9e', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'95ab6e78-1b99-4458-bdf2-17c69788de53', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'4c527fc5-3c68-4406-9051-1827f44a2408', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'240b2102-d8d1-482c-a5f5-19238c7f8097', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'6b81a244-f406-43ba-ba0c-1930c64d7f7d', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'dfc33506-4394-4fbd-8af7-193b310d409c', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5be9648d-ec02-43d4-bc43-1a5725dbb7bd', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f98853b8-492a-458e-86bf-1b05f23845f3', N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ae3a41b4-c261-439f-8a9a-1b71ceb6a0ad', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a18aae53-e91e-47b7-b013-1ba515015fee', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'0a69869a-5c63-467f-9fa0-1be4ee655c92', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'21603928-7725-45ec-8c8a-1d0c0374ac3f', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'61ecf0a2-f99c-4632-b36d-1d46abab2689', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ad8b54df-afd5-4e00-9ebb-1d9fe88f82a5', N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5af04a7a-34a1-42d7-9307-1db00293ffe7', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e2a68a4e-5d27-4163-8b20-1de2df52699a', N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'286e12f5-bbb5-4b45-ab45-1e24ef5a634b', N'1c8f9668-f74f-4007-9333-a087df15231a', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'4250dec4-67be-459f-9742-1e98f309cffd', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'661616b3-a029-46df-b70f-1f1796b4db66', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'aeb85c94-1706-4879-bbbb-1f2afaaa9795', N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'93cfca8b-095c-4eb2-9240-201b0ea3b0be', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'76aa9cba-ee8a-40bc-9210-202cbe8feae5', N'66f2807d-870d-475e-9995-453cc81f2e90', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'6bb1f8d1-4ab8-4163-b630-204e953d3655', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e29837b2-1597-41e5-b4c7-21af52a77188', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e4bcffa1-2bcb-49c8-8cb1-21f19887815a', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'aeddc31d-2f79-429b-9f09-2250d491e082', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'60990a1b-d3e1-4e08-9397-238d3be977d1', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd320520f-e62b-410e-81f7-23af3f7469e8', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd20cd3f1-f8ca-41d3-ab34-24bca8fa5afd', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'9dff952b-1728-44d0-a756-252130844b23', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e7f7dee9-cee5-42c9-a61d-2545798869b0', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a527dbc8-56cd-464e-8351-271032c2fe21', N'3fff369c-0e73-4ba6-945a-e3e3c62b8bf1', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'723949d4-0efa-4b8f-a31c-271cc8f2403b', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'49ab6c60-43c0-426a-ba8e-278d565544b3', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f76a6f9c-70a4-41b9-9b0f-2910b278befb', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'66bec93e-387e-4bd4-934d-293e8c020a0e', N'272359eb-3947-48bf-b94c-e57b803e898e', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c04ebf3b-412c-48b9-97e9-29be13d6be1d', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd07d5db7-8e0e-4fef-8c39-2ad6d8cc32c4', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1bb75c3e-6eff-463b-8078-2b3fc47dca86', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'cde022ce-2cb1-45c3-8072-2c6d70f92b99', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3ba13182-2196-4ea8-8f56-2d380f035cc0', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5ca323bd-464a-4c56-af65-2d65421148ac', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c692674a-0a68-474c-bff9-2e32b08987b0', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'19985c49-d85c-4c08-b31a-2ef9af5a2c90', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c204d1bd-caa0-4228-b256-2efe48ca6257', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'94f4c800-ebed-4a83-81f5-2f97c0395eb7', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'dc3dc497-5e23-4b72-b2b1-2fde9348010f', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'87762183-d7d9-4359-830a-301288d93f2a', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8bbf85fb-09ec-4f5d-accc-305ed98fabcf', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'988ea94b-0295-4f2d-ad16-31124c6ebc8f', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'539c0cce-8b40-421d-aad7-321a004f93af', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd2983936-aa7f-4c77-8582-3261218720ed', N'e3a28655-71a1-4508-8f81-adab92741a77', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5a5c3013-fece-45f6-872e-32c3f052404f', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'2037a6ad-4127-4da2-a8d8-331ebd3860c6', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f51f6228-4b4f-43e7-9a2e-3321bbd43001', N'1c8f9668-f74f-4007-9333-a087df15231a', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'6d7fb805-2107-4062-b200-334b10737c9a', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
GO
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c75b13de-a5af-4323-a59c-33f9ed4c939b', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd3e6c7e8-f676-49dc-a846-3831de741cb9', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'7f2d7fb9-510b-4556-9bd6-38dc65147926', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'31cddb87-3ce2-4a4b-a34f-38eb24f7260e', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a743476f-7142-4a45-b05c-39caa5d5d94a', N'55f41f81-c88d-4145-9903-912509151244', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8fe61c66-2026-48c9-9c90-3a6ec87fb40c', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'aa016571-39df-4889-b213-3a81716dc60d', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5881464b-181b-4544-a105-3ab5cde49dce', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a0ade103-25a5-467e-b383-3acb655e6094', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a55697b5-4eef-40a0-a1ee-3ae823e3beca', N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f692d2b0-d88f-41de-b401-3af1d865f7a2', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e2ddb798-10ba-4ef9-9161-3b4d3823dbd6', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'69b31901-1449-44d3-81bf-3b6064f61a7f', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1132c7b2-6bab-4c2f-bbbc-3bc78c8a18da', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ced7e07f-7acd-4982-bb98-3c420d62641e', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'09dde50d-c191-4124-890e-3d7003bd588b', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'90cb4333-f1ec-41b0-ada4-3d701589df31', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'79ed4fcc-ff15-4ff2-b386-40245cd4f06a', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'aa6d907c-cae8-40eb-98a9-417d86cb2d95', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'92b971b8-2cc4-4638-bcf7-426496167433', N'55f41f81-c88d-4145-9903-912509151244', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'821441d5-a485-4cd2-9ca7-42dd32f18f68', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a08d29b8-e74c-43fb-accd-43406c51176b', N'66f2807d-870d-475e-9995-453cc81f2e90', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'0bb99bf7-d9f9-4645-a0ea-4482b2dde4f2', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'00b76e9b-551d-4f13-b7a5-448c1570d079', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'6a956b59-8b42-4b75-ba4b-44d7f38efd50', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'cc0b4b1b-a997-4814-a242-456330ced5ca', N'3e89a21a-4554-48e7-b11f-4f70b39e43b5', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ed1acf52-092d-4490-8c87-45b0e5b4714f', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'96087be5-0c3f-4497-aec0-461e029c66e5', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f3606cdb-a7ed-443a-a9ca-471b4c645909', N'55f41f81-c88d-4145-9903-912509151244', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'66cfb427-f43b-4518-a5dc-490586e731c2', N'3fff369c-0e73-4ba6-945a-e3e3c62b8bf1', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5a2b14d7-31ae-4846-b568-491c89b6be57', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'193c3f44-d2a8-4e34-824c-49855afeed2f', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'29c0a621-f9b8-448e-ad57-4a0659645cae', N'55f41f81-c88d-4145-9903-912509151244', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'652ab37b-02c0-4bd8-b8ba-4bcd2ad3ea14', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'93442a1a-6c53-4799-99f2-4d4abfb8dfb5', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'0c0d9d1a-6f43-4580-b363-4dd93cf121f9', N'66f2807d-870d-475e-9995-453cc81f2e90', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a8d4c7b6-0e2c-4430-a6c2-4e07f0865b0e', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'faf45ab6-16d7-43bf-a900-4ec7e6f84dfc', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'6b045995-43ac-4019-945f-4f79469e52ee', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'bc68f79a-242e-4415-b741-4f9012a04027', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1481cf0b-87fd-466c-8d63-50f082abec7d', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'cdd28ad1-98ea-434c-86a0-514c6ca0aa02', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'9079c673-09f9-446c-a483-522342ea6197', N'3fff369c-0e73-4ba6-945a-e3e3c62b8bf1', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5f33ebb2-10bf-4309-bfd3-527d12370e17', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1261720e-b8d6-4666-8f6b-53dd7b7d594b', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ca9a2b8e-3f3a-4c4a-b297-5574a6fc0e64', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c32edf38-36b9-4d5d-a179-558c76150ba8', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'cf2f2bca-6b7b-4106-b7a5-5665ee37caf5', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'93aa5f13-5dba-4b7e-9fbe-57232a4c9bdd', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'34455f63-7d67-4e4e-8349-57545a4f8e60', N'1c8f9668-f74f-4007-9333-a087df15231a', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8dcabe22-0bfc-47e2-89e1-5831d599651a', N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd19720ea-cfc8-4f44-a36c-583fd79a2ff6', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'9ca4b4fd-5551-4842-9ce8-586ac37fe95a', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a1c0b9d5-c0e4-47eb-8941-5900e6b0f9b5', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5fa4e1b8-e864-4085-a549-592401fa9bad', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'87594bc0-5467-4a8c-aedf-59349e53fc5a', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'9b21afd6-28f3-4b91-acfc-59ca55fbe531', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b4d59002-e4ad-4684-9a37-59e7690fdd62', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'dc5fff69-967b-4d07-a97e-5b4f6ebfbcdb', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'23bbd91a-1bbf-43d6-9f70-5b8ad945b2d4', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd6569eb5-e176-4d22-b679-5baaddd3e8ec', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'67d974c7-580a-4da9-ba0d-5c081afb5e57', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'53c297d2-447f-432d-b360-5c1eb5497ed6', N'55f41f81-c88d-4145-9903-912509151244', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f9321705-25f4-417e-a72b-5c352f437458', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'46c92058-b00f-4a1b-b1a9-5c77b47fd0b0', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5ee56499-480b-4b15-8ae9-5c8692531856', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a873694d-8335-4689-8b1e-5cabd2b84c38', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'cf51b7d0-8a38-4a9f-9997-5d4d913f2d70', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'4f067b3c-4e8c-4dba-8bdb-5d52040cf63b', N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'65c525a7-7d56-4257-8710-5db2b73204ca', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'4dde5e7d-255c-4008-928a-5dbc24a3dc03', N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3487673f-a1c5-4bee-af5b-5eef71f5c707', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8138af35-d5a8-4cc9-beb4-5efbb7129213', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8cbe8298-f6a5-468a-805c-5f0f2057bb31', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd338cddd-f85a-4642-ad1d-5f6f8c954be8', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b6d1b176-20f4-4174-83cd-5f80cd000a13', N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'4d3d6093-3060-43e2-af46-5fd74d2d8b18', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'01bdb758-1439-4243-b215-62eb08237f7f', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e4fa1bb1-bf47-406a-a087-630f35991228', N'1c8f9668-f74f-4007-9333-a087df15231a', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f0cf1415-2606-471c-bcc6-63300f4f9021', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'dac93b3d-a634-45aa-ae7e-63c78aff277d', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'2544fda5-e6aa-40b4-97a5-63d94bcc801b', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e13bdea2-8f9f-4dc0-8085-64600ccdb165', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd3486851-f72a-4676-b654-663a3ce92a1e', N'a9931c38-6cc9-45ab-941a-da20e3e187c3', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'68feac0c-0a30-4b11-9083-6689907e3977', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'df437324-3179-45c8-8843-668f8d87c67b', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5fd391d7-ea6b-44c6-bb4d-66b3d6e4e9ed', N'55f41f81-c88d-4145-9903-912509151244', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f84b308d-323e-40d2-b98c-66d05e108743', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ebda1f8f-5cc4-4895-ba3c-674504c88700', N'3e89a21a-4554-48e7-b11f-4f70b39e43b5', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'00dc1610-115b-4857-8828-67d600edef03', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a1ee48f1-6d7f-41b0-a1d9-67d926235764', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8133eaa5-1b89-48b7-a03d-68837c414e74', N'3fff369c-0e73-4ba6-945a-e3e3c62b8bf1', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1bef5be1-f12f-41ed-800c-69040d41e419', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c4f0f0e7-1e3b-44cf-954a-6994230369c6', N'272359eb-3947-48bf-b94c-e57b803e898e', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'114775d8-3223-4d07-bdda-69d031a8041b', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'6e026a53-724d-4605-8575-6a5d76334703', N'e3a28655-71a1-4508-8f81-adab92741a77', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c561e4de-3150-4820-be98-6b0cc601020b', N'a9931c38-6cc9-45ab-941a-da20e3e187c3', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'7b9489cf-b4c3-4b58-aafd-6b36b12a5077', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'6e512f9a-d58f-42fd-8129-6b6a10b74682', N'3fff369c-0e73-4ba6-945a-e3e3c62b8bf1', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'51af1670-6af1-437f-936c-6bf9f4ba6b03', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
GO
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3c7c6e43-7b2d-4fcb-83e0-6c932dbf489d', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'36726b29-ed87-4231-8732-6caefb056294', N'3fff369c-0e73-4ba6-945a-e3e3c62b8bf1', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'10cd41a3-754f-4fe7-9cd3-6db9e219c833', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'eb585e4f-3644-4b54-a799-6de0b1993155', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'507f97cd-e5f1-4351-a355-6e46647cb944', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f563dc6c-d920-4a89-b218-6f86414354ff', N'66f2807d-870d-475e-9995-453cc81f2e90', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5fa3cda7-dd71-40a4-bc05-6fa186dc0a82', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c470a7e3-b8b9-46d0-8db9-7060388a04c4', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'cd937567-1592-47a3-a3f2-71be4cd7722e', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f9fe5bb3-435d-4f5d-8c4a-71bf93a64f6b', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8441162e-4ca6-47cf-9292-72204c7c85e1', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'67f6816b-610e-4c09-8de6-7245f22cf496', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'102ca065-e0b9-426c-bba1-7287a327a052', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'939d82bd-4be5-4953-a88f-732e27ba6fee', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ddc2f7b8-e3d1-4365-90e8-73eabf38062a', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd7d572ac-206e-40ff-925d-73ee83d9a9ea', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5b3f5bf9-b0ef-46be-bc7f-73ef03deea56', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'63beceea-9f56-417e-8bdf-7424eca57980', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5b6cac78-76ce-48d2-bfcd-744c23b9fb07', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'2ad26c09-d98b-4c4f-bfac-7527fd5945b6', N'55f41f81-c88d-4145-9903-912509151244', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a390d66c-7699-4255-b5ed-7543b6455c6b', N'66f2807d-870d-475e-9995-453cc81f2e90', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'4355bfe1-70dd-4fb3-aa80-763de0f127f5', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5da41bb7-525b-4b1a-a636-7690482e63ea', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'91a4d102-1f6e-4aae-810d-76922c42a9ed', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c95d5df9-c127-48be-b2be-771942e4b846', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'50f3e1b4-5c6d-471c-80e6-7887ac2faa73', N'66f2807d-870d-475e-9995-453cc81f2e90', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1de84604-7ab6-4286-aa71-788d13ec1076', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8c478d4b-20b0-46e4-b1ec-7890bcd53367', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5f5dc449-c8d6-4ffb-b945-78cb2024f5cc', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'eb3e773f-9d9a-4fe6-8f57-790236d0b881', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'74fbe6ab-e856-4b37-a12e-7905870dfec2', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'dc034fc1-6044-4353-97ff-7925163f87eb', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd3744315-2c23-4aec-8a0d-7a9528ccce3e', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'654ca592-9bea-426d-b413-7b79ba80a9b3', N'272359eb-3947-48bf-b94c-e57b803e898e', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'de214407-e4ee-4366-a654-7c5096aa7b5d', N'272359eb-3947-48bf-b94c-e57b803e898e', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'54df7e4f-cc37-4e5b-922b-7c57ec98da61', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'4f841b6f-3711-4234-ba51-7ca97e4ea8a3', N'3e89a21a-4554-48e7-b11f-4f70b39e43b5', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'337419ab-1f97-4e3a-bcb1-7d8121306eda', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ca2b46b1-7e92-4d65-a3ca-7dd8378ecf90', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'2cf56654-4b94-4943-aefd-7e39ac475599', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1d8f4d66-798a-4f7f-a22e-7e3da4f2c405', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'597aa9c5-29fa-4af5-8fd6-7e54dbe5a6b0', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a4bddc77-f860-4f58-aa90-7eb0e2cf54dc', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f563c679-107d-402e-90cf-7ec3cb81c24d', N'e3a28655-71a1-4508-8f81-adab92741a77', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'699006ef-2d2a-4b58-acad-7f0a32b82103', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'91bc3b80-4f8c-4016-9ddf-7f32f1f115d7', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'6cefe560-101f-4a36-a566-7f5e4d905faf', N'55f41f81-c88d-4145-9903-912509151244', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5a65e013-a97e-4eec-8d03-80376a10e3d1', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e44b26c7-9f33-418f-8c32-8079cac119bc', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3e49b7b7-d5ae-4971-9aa8-80d8653e3cb3', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'807b7fc6-1a86-4c0e-a167-80d8e6f1dbc3', N'e3a28655-71a1-4508-8f81-adab92741a77', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'21ec7c69-4f59-4a98-8799-81a6e15c6ee4', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'845baf14-5dba-474f-baae-81cfe4ba8882', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'fca4852f-30e5-4014-a841-81edf453e9ae', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd8173a1d-b205-4a12-80aa-81ee622d6d71', N'e3a28655-71a1-4508-8f81-adab92741a77', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'94d546af-cd40-4c88-b9a9-81f1c112959c', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f6c898b6-c12f-41a4-9d9d-81f308b27a8e', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e67eab17-527b-49ab-8378-81f9d1a7fdeb', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1d1154d4-63ab-405a-a288-81ff7289d3fc', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'66ea833a-5173-4fe9-877b-82dd35bce7b4', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'15ae71ca-1007-4b02-86d1-831aa782c03f', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1c1d7c67-aa5e-4557-894b-8330a0c1fe93', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'7c96ad3f-4d16-4302-9c89-8338989516dd', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3e361c7b-cdec-49af-bc8f-835ed3e3986b', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e2fd7279-15a6-43ad-a0aa-843426e7468f', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ffdcd092-e9a0-402e-a908-85f89d8d2831', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'bbdf51c7-9b7a-42e1-bd71-86753a75cb79', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'7a67aa3b-3bef-4fd6-8fb5-86ccac3c548f', N'815557cc-5534-4717-91aa-fd75088c96c5', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f88a32ee-d1d8-4a23-8561-8807b82e1ddd', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'acf0793d-efe3-442e-a5fd-881e532e6636', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'221df550-9fa6-4d23-8520-8881658947de', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1018d443-68be-49ee-b4ac-88dddeb3fce1', N'3e89a21a-4554-48e7-b11f-4f70b39e43b5', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b0cfb34a-0537-40ed-b9d7-8919d8cd8bac', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'36a27bf4-db84-4506-b0ba-8953d5ad3800', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd282d816-e2f2-4fa8-8e5e-89e85b6f6423', N'66f2807d-870d-475e-9995-453cc81f2e90', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5c37d65e-9478-4a50-bbb1-8a0774047815', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'89b58446-ab9d-4cfd-b32d-8a3a997b30d9', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'360b22ee-00e1-45d1-8f68-8beee57e5bde', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'27b983c5-a80a-4d90-a501-8bf385166431', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'bf216419-cbae-4376-a6c4-8c8239ad9f55', N'66f2807d-870d-475e-9995-453cc81f2e90', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3474696a-0852-4941-8ed6-8d10f7910c6f', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'820b1db3-97fb-4ba5-8566-8d35f1cc05df', N'815557cc-5534-4717-91aa-fd75088c96c5', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b0928520-5692-4360-9033-8d9ac6fe3cb3', N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'9393da0c-fb34-447e-bd05-8dbabed43983', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'89d5767c-5e25-4334-81b3-8dd6d3399cea', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a2b7214f-3afa-4a86-9a91-8e2fbbc87bd4', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'10a3774b-0f5a-43a0-8823-8ea76f18dfb7', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8b8fcfd0-befd-4e3f-ad26-90fa6f2fa6c8', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'51710901-fe7c-4319-9817-9150e474d0c0', N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'7d4089ae-5cc8-4866-a61e-915e078b4523', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'83a989cf-bd48-431a-832c-91807eeaa25d', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'4e4fb462-a57c-4f28-a6de-91ebce6b4350', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f098ca6a-ac31-407c-9c6a-92db45300946', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'41821222-0e2b-4441-8a97-9375f4c4401f', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'065f4df1-7dd1-47ca-9f8c-93f9b6858d16', N'815557cc-5534-4717-91aa-fd75088c96c5', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c9705221-23fb-423a-80dc-948091eb7a85', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'bd3d4342-a2e9-4453-816b-94c746987558', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'22bbecaa-c191-4768-ae09-95662dedf170', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'9e203fc8-5b15-44d6-a50d-9602107d1cf6', N'1c8f9668-f74f-4007-9333-a087df15231a', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c90ab98a-2234-45d2-8c8f-96c8d70b62f2', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
GO
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c7942513-2bdf-48c9-9f25-96f7398714dc', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'21ae2c01-1c49-4b15-91fd-97337c3f27ba', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'24888b09-1505-4337-b77a-976ee7dff0cb', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b9b73124-7986-49ab-b1e1-98273b285f21', N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'48aa59f3-6e62-462c-966d-9860d386c879', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'0687455a-3835-4a94-9d44-999a8b5be239', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'65dcb385-891c-4ee2-be96-99b2e5c56f72', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e9489519-b6b8-4b0b-bc17-9a042abf1867', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c1f31cb0-a936-4820-932d-9a6782ad68bd', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b62538c3-d5e2-4e76-953e-9a7eb0e2a99a', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1fa6b7bb-6159-417b-bbe3-9a84a5bba94a', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e82be005-3e7e-4df1-8bef-9c4b1a87edd1', N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'7a64c21d-82af-4fb3-88a4-9c92608ffdbd', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8410e3e1-8bd5-4b1a-b04d-9ee194bd5a22', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'97f0d371-1074-4734-b00e-9f4f9ed32bc4', N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd90626b5-ecf7-4fa8-b7de-9fb6cff5f0b0', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'cbeeb6c2-aa18-4ade-ab71-a11934526718', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'4a4794eb-5f52-473c-af1c-a1a9bd187067', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'2955f17b-2300-4071-8adc-a27f4c6a41af', N'66f2807d-870d-475e-9995-453cc81f2e90', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'fd73ad09-d60d-42f7-9fb8-a2ca633622e4', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'62c63e0e-677f-41f5-a5b0-a33c73e9dc6a', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'04c35d91-9f09-4ca9-8a61-a37915154ace', N'815557cc-5534-4717-91aa-fd75088c96c5', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'45c7c28c-cc4b-4c99-a745-a4cb438a28a0', N'55f41f81-c88d-4145-9903-912509151244', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ca147a53-2c44-4d8e-8dcf-a52e05ccfe02', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1038880d-b618-415e-9846-a5308efe47ef', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd435bf41-5200-4767-9471-a6409b492db8', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a6a77905-b3cb-4d9e-b881-a6552d087c0e', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd00195ea-916b-4ff9-bf3a-a6862e396697', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'0a1aee48-454e-452c-8a0b-a7211b7c37b0', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c5bc546a-1fc5-47cb-a791-a85f81e89ed6', N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5946bf0a-3d3b-4a3d-a1c5-a8b66de8566a', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'826f3d59-970d-425f-8bbf-a8cf9ffd957c', N'a9931c38-6cc9-45ab-941a-da20e3e187c3', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'142fcdbe-a9f9-4f67-89af-a8f582b9936e', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd39e6333-9d7f-4121-93bd-a9c5882b4e38', N'a9931c38-6cc9-45ab-941a-da20e3e187c3', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1362706e-eabc-4912-99d6-a9c5bc65749a', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a52b752d-9eaf-4039-bb6e-aa964c8f62e8', N'272359eb-3947-48bf-b94c-e57b803e898e', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd878433e-048b-4d50-8b5d-abc1a430e288', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'273ec0a3-500c-46de-8e5f-ad08c10c2446', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ed435abb-6fda-4d10-95f3-ae3036d2ccb6', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e13c46e5-c43d-4cce-919a-ae35cd4f5fdc', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'6b60b60a-e81a-45e4-98c0-af14bee9660a', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ee209abe-1838-4637-a03f-af60ce78c40b', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'65ff814f-562b-4faf-8576-afa33099f02d', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f4ec2c68-6097-43e7-abb8-afcee47dda4c', N'55f41f81-c88d-4145-9903-912509151244', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'7bf9c08a-f779-41b3-897c-b0c22dfdb563', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd8abe0f7-9b0b-4d99-a63c-b12a0dc122c3', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b825c3f5-d00b-4e7c-9d3b-b19756a77792', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'14b1a6ad-4828-4e69-97c8-b1dbcd99706c', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'010f24ce-49c3-43fd-8a5d-b27117eb2c86', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'4d51e608-4ac1-4b77-ba07-b2e835f0c816', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'34a7f070-604c-4495-84c8-b367a03d96e7', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c0797dcd-7fa3-4962-9dbd-b36b9f7fe43e', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1aed0780-0729-46c6-b43f-b3d58211c48c', N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'985b6c0a-066c-4ef4-9142-b442c5e51278', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a65983f0-d236-4f07-bdb2-b45f45c19a6c', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b9bf2597-a43e-4a23-9779-b65ff0baff88', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5ae63f5a-a26d-4d29-b0df-b6f142acf23d', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8cac70a4-3456-4879-a8d5-b7226fd35d4b', N'a9931c38-6cc9-45ab-941a-da20e3e187c3', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'2278dc3b-9182-419e-8471-b75ecf2f9456', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b7b0b0aa-90b5-42ae-aebe-b821a9dcb210', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'9939b8e7-eb6e-42d4-bbc3-b95b67a87af6', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'73a8f814-27c6-4e63-a07e-b9654c675785', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'bb1e0ed4-080c-4298-9d05-b9c5f6a20bc8', N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'bb6ca191-8dc4-40dd-9b38-ba1efdc85ece', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1671e7dc-a96b-41b0-8613-ba7d11d7fc54', N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3816d6b4-869d-45b7-96cb-bbe04a9249ce', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'2d0fb427-76b1-4175-bcf2-bbeba81af07d', N'1c8f9668-f74f-4007-9333-a087df15231a', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd8ff2c02-4099-4e64-8e50-bbf3af663254', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd5fb52c6-ed88-4103-8556-bc5f3e8f7123', N'66f2807d-870d-475e-9995-453cc81f2e90', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b0fc2820-39ac-4fda-aa11-bc6edac59fa7', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'09f69867-e45a-4e28-80da-bc80f45acf77', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b1c68924-1df9-47b5-9828-bcd0913e5c2e', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f6d1cef3-f1e3-4049-98c8-be3451462ea7', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'4307f06a-9881-43ab-a165-be63cc26d2dd', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a0afd2cc-398b-42a2-9221-be86a2b45696', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'986f0a6f-efee-48f7-847e-bee763572f38', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'63511d21-8ee1-4a6f-a2be-bf8331027827', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e240cbf4-d720-4f2d-ae8e-c178ed8b164c', N'66f2807d-870d-475e-9995-453cc81f2e90', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd7a83efe-c4f8-4817-a584-c18860298f78', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'609e4d29-61d5-45db-a3f8-c258044d820b', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'91e65ecb-34db-4caf-9ce0-c2996c4c2b26', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1e65cef3-be63-4115-8906-c2f1efedcfc5', N'55f41f81-c88d-4145-9903-912509151244', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'91ab5abf-3c61-4b0c-850e-c34db2cfb7ad', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b0df8459-d292-4f9f-bf45-c39a607d4a5f', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'0290b3c9-0a5e-4976-ab70-c45ee8af60f3', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'18d8e5d3-b596-4c4d-ab0a-c5880dc96b49', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8d944a69-de6e-4b15-91cb-c65d20af1f30', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'dd83c601-57d6-4109-b28d-c698c37f02eb', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c3e4c97f-dd0c-489c-8b08-c70d713413df', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'41d9b9cb-10d5-48e9-bcc1-c7275ed0fa34', N'815557cc-5534-4717-91aa-fd75088c96c5', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'28661871-7705-460d-91a5-c75fbd0d79d0', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'0e0361c2-08fa-44c9-84bb-c7b1ae4f0b08', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'9fe64768-434a-462c-b288-c85e2e98aa2c', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'269029d4-44bf-4a2f-ad42-c8d114c3bc52', N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'86b68e8b-1317-4a0b-93e5-c91026352a0c', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'4c28993b-ff0e-481e-905c-c927ed44c4f3', N'815557cc-5534-4717-91aa-fd75088c96c5', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'595202d6-0a92-4ad9-b9b4-c99551877558', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'631cf464-4e9f-48f3-9b2d-c9a5c4bc42ce', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f077593b-e229-487b-ac62-c9e4a9b85b4a', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'6aa957cc-2b18-403f-b6d1-c9e5225025af', N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
GO
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c1bd3616-2a2d-4d0c-9a83-c9f53dbe0fbb', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'49bbee83-28d4-4484-ba5f-ca3158e6abd6', N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5095d4bc-0deb-4da2-b54b-cb35f741a30f', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'0e42a896-8d2b-40f0-a8ce-cd6a30c4432c', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3939208f-4a0c-475d-9070-cd858a65b79b', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'af41b7bf-9085-42bd-bdf9-cdbd76a55de3', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'82cbd555-9b15-4c84-8e14-cdc824de2901', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'057f8e13-fa76-42a1-84c3-ce7e0c029312', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5a6e617e-3dbf-4684-8cae-cea6b2fb417b', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'34f0eaee-74b2-44e0-b930-cec23ae75b5f', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'fb3bd1cb-0127-48fb-970d-ced45d84d47a', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'64d83120-c19d-4c78-ac19-cf123182c747', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e37f6546-8cd5-4980-9007-cf36c9511d18', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'0bde1991-ff8a-4b76-8796-cf59854a8d71', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e552d2d9-3cb0-4f99-9988-d057cc7c241a', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'250c3b62-67d4-44a9-9991-d43b2daa8e12', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b0726591-b313-4a83-a909-d519f192eb35', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c86f0bf6-7a8a-4889-9501-d523d4f5efc9', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'9ca3fbf7-98ca-4750-ac1e-d602addcd0ae', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'74d1744b-8715-41f6-abe6-d62025be361e', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1eb76cf7-1922-4c5c-afea-d62a1769fcf4', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'75f4d668-5725-46e2-9682-d6f2aba383d4', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ed6fadcf-9e4b-40fc-8ed4-d6f658cc2cf8', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ea6e5e99-0662-4620-b8ba-d76517673e96', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a873a4e3-6168-4dfd-916b-d76764c8aef2', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a09f5317-5680-4f5c-ae39-d7e07ce44e6e', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'6fda9274-7f18-4fea-97cf-d8442bebae92', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'77bcb72c-eadf-4161-b31d-d91ba2a812f0', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ecd5de5d-f964-4545-9ba0-d92585b840bc', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f270ac93-0dd6-4ad9-a01f-da003e3d3b21', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8287f678-e49b-4dc5-8dcf-da18451c8c98', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'a75dc3e9-a4a8-4a38-bf07-da45e825eed2', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd36d19a2-0637-4ed3-936f-da4f1e66917b', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd81f6346-15ab-44a9-adbc-da779eb976bd', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd4534eeb-2322-4765-9d9b-db5cc16f9190', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f6c6093e-c299-41d6-8aff-dd68077cb835', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'70472065-24ce-4958-9ac4-dd881559459b', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'2b804a85-aed1-445e-ae61-dd91ac4b4f18', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'fc34a076-8040-41d8-ac0e-dd959bb0a564', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'25c1693d-25c1-401f-ab8b-de3354edd997', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'844c1bfe-37a0-4d84-a9dd-dedf1b351c55', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ce1a9077-cc93-476e-9eae-dee36693046f', N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'93ef62cc-f653-4d8a-aca8-df2e832f99cc', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'33396d92-1294-4232-b3f4-dfa1cd2dd3bb', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'16ba485c-19d7-43b3-90d5-e03f4e3e17a5', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f5263da7-81d3-4098-8075-e13be4c17dac', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'433ef784-2a38-4f26-bf49-a807e47e6b41', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b19743b7-7e61-46e5-8051-e289c1381e65', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'238e4e5e-9457-4224-8da0-e2ca4ae80874', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'51a103de-43da-4a15-8544-e65516d3c95c', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'4675dc11-b6db-4b69-a2ed-e661a20089a1', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'7831d4e2-388b-4e22-bc12-e698dae5d165', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd1667451-1239-47f5-a56a-e6c9665b730d', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'141bcc0f-e85f-4be9-bcdb-e6fb70a4863a', N'1c8f9668-f74f-4007-9333-a087df15231a', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e8436e3d-cd4d-4879-8930-e743c16bc55c', N'55f41f81-c88d-4145-9903-912509151244', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'd3fb9a21-4a0f-4d48-8d7d-e7d0228e42b9', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'040dd75c-d172-48f4-bf54-e7dd650552c4', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c0a2638f-a77b-45a7-8152-e90bb7458867', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'eed250bc-f159-4ee5-b39a-e947195a58da', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'6397d149-d1f0-4ca0-af4f-e95beb622c09', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'64d972d4-a63e-4c98-ae70-e9b00737d4ad', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'2431b155-85de-4a1d-9f2e-e9c5db7b7528', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'0a357a22-f3a0-43b0-9950-e9faa02af0d5', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'110b2858-c3ec-4827-9243-ea274fd8519d', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e636308c-9c45-4fa2-b015-ea2a6935a7c0', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'12a2c14b-b119-4fe1-92d6-eaaa370aedda', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'72f97935-a3d4-4283-a749-eb774dcc5017', N'a9931c38-6cc9-45ab-941a-da20e3e187c3', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b60e6cc6-c3b0-41b2-995e-eb8e55d4aedb', N'815557cc-5534-4717-91aa-fd75088c96c5', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3cc75729-5a11-4a38-bcf0-ebd6cc7db6ff', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'e434c08c-7b4d-417a-bf52-ec905c52bdf7', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'bd64380a-895d-4b00-af7a-12c80c1faa32', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'9c9269b7-f8f1-48ba-9427-ed5ea2c1a65d', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'57cf9655-95a5-432c-b3c5-ed61ee5ac10b', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3d345104-24a5-4067-9b8b-ee025add76ce', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'eb64fdaa-4e08-4592-b408-ee5d23975758', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'0228b24e-25f1-4327-9273-efb2731fb539', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'6e7800f8-bee4-47da-b74d-eff217f96a86', N'272359eb-3947-48bf-b94c-e57b803e898e', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'63a0c5c3-cfa9-4405-bba8-f1179b8ccad0', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'68da2521-2371-4020-b7eb-f12a7c3fcb61', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'1a64cd61-c9fe-482b-921d-1c84145266d2', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'8d54c836-491d-4bbd-a687-f1513307f24b', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'7e608841-c9a1-4c7a-a1c3-f18407cc8681', N'e3a28655-71a1-4508-8f81-adab92741a77', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3174e9be-a51c-4fc6-9fd4-f304c379716a', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c5d12b97-ba13-4276-a41a-f318a7f97092', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'dbdf043d-5f19-4237-8eee-4355eaba7071', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'89ff3bc0-65aa-4c7f-808d-f37de4adbd11', N'66f2807d-870d-475e-9995-453cc81f2e90', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'fec7420c-644f-4e9b-919c-f41f6c144e2c', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'51eceb20-fdc6-4b73-9189-f4dfd331af2f', N'e3a28655-71a1-4508-8f81-adab92741a77', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'79ded28e-359f-488b-9c9f-f80c09f81422', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'c344843d-c8b2-437e-acbb-602f06764b11', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'aeb6378b-7305-46a4-b576-f872c5a362a1', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1f418a54-6bf8-4902-abc6-f8b3d071a712', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'610cc564-5f7b-4a74-8da9-f972268e1339', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'b4ddd572-5b0e-421b-a089-fb14f42b43ac', N'1c8f9668-f74f-4007-9333-a087df15231a', N'184887fa-56f1-4654-a8ad-b81efb5e2617', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'3897890d-cac2-4b80-aa80-fccde94ac0e4', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'c8dca944-1203-4ebe-a026-d5351abfb236', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'5cd45da1-4c62-46f7-ba50-fcd7b00a00e2', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'3b813c84-335d-4582-8ab3-46900554336d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'f7cdbae1-59b6-4540-b3a5-fceaa55c9601', N'e3a28655-71a1-4508-8f81-adab92741a77', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'eb7947ff-a28a-45c0-acdc-fd14718aad82', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'ce62bff2-2afd-488a-a37f-fdc9e5376318', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'0babec4c-6774-46e2-8b51-fdd620030425', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'bd64c4f1-c760-459e-986e-fe708b6d5dac', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'1fb8c327-7c95-467a-af73-baa7089f750a', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'035e0212-9941-41ca-bd88-fe936908cbfe', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'03986329-6d1d-408a-8dc5-febe3060f515', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'1e38991e-af24-4e7e-87a3-ff0d7b708748', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'86b71704-025c-49a0-93c1-88155b2f50c5', 1)
INSERT [dbo].[GroupUsers] ([GroupUserID], [MemberID], [GroupID], [Status]) VALUES (N'c6693984-3a72-4dbb-afc7-ff1426a166ad', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'42422529-d855-40b4-b7c0-619ef761dcb3', 1)
GO
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd03fc102-6e70-44f6-b19b-01255abcafff', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'a2db113d-a17e-4bab-81b4-b04cdf39a03e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'62206fc4-ddff-4927-8436-01f7375d1540', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'341348c4-1e57-478d-90da-6d9e4d72d78f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd1460130-edc8-46bd-8a45-02e83a423253', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'0cc50b29-dcb2-45ec-a343-028681d1dd55', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'b7b38af1-70b3-45a0-b5c7-05af040685e0', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'56bcefaf-40a2-438d-be58-36f87c3b713f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'020e590e-432f-4c04-994a-09d250066e24', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'1b038258-8bd2-4091-9129-b96d28c1292f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'094e5952-1ef1-40c6-99b0-09d939becee5', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'9b21ec30-1bf3-4d29-9dea-c0dd480bf464', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'9db7a08d-de66-4225-a63f-0b5e9ca8a8b7', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'fddc7ea2-d75c-4d4f-b0de-dbfa249cda36', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'611b5b1d-b163-460c-b1ae-0b6d47f680e9', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'e1b5fe3f-cae2-4759-a71a-5744ffe05c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd5c8051d-9292-4ba7-940e-0d29faac4081', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'341348c4-1e57-478d-90da-6d9e4d72d78f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'a6f57203-9a6d-4181-b8fd-0e6520c8a77f', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'16e80cc6-6c19-412a-9e91-f83832462182', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'f6fd47d7-7b32-492c-98ce-0ed8eb9db05a', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'dd77f7dc-e4e2-4e66-b222-d55fb925eea0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'0fbdbc4a-74be-4e92-bc66-10dfdf8b83a1', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'e1b5fe3f-cae2-4759-a71a-5744ffe05c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'431dff72-96f9-49c9-9f2e-10e7fc474c4c', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'67be807f-4d2e-4d68-b313-bcd763f436d0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'81a969f0-dfb5-4afb-8726-1111d52a11c2', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'37d61d6f-0f4b-47df-91db-1ff649e9081d', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'9d6fed18-c31d-4a41-9f04-12c02256dacb', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'dd77f7dc-e4e2-4e66-b222-d55fb925eea0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'026ce1df-9852-44e2-812b-138fec6bdb4f', N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'f3d0987e-cc86-4412-81d8-16722dcf7ef4', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'86ab55ac-6284-43de-b385-13f7897bbfcb', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'286ea286-c6f5-44f1-a78c-c7607a5b6520', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c9b3dc66-44ad-4374-b88e-15199048cbab', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'7764c440-5588-4264-9a70-c2608dccb740', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c94253ea-87a7-4e1f-aa7f-171cf0982110', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'd91355db-5c2d-4734-930a-7e69bfdde7c0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'8016c317-48cf-4bf5-a0a6-179e7bc371f1', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'5284811c-8307-48e1-b1db-6904c2d727bb', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'35305045-dd42-45cf-96f4-1915b583c6d6', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'c6a5f24b-3a43-41e5-a867-838470a0963c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'bd725cb8-fdff-4445-86c0-1a869fd6e0a9', N'a9931c38-6cc9-45ab-941a-da20e3e187c3', N'cd428cbe-a3c8-4968-8ba3-476be6652a42', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'6b85a671-6457-4083-98b6-1b640b682c07', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'e1b5fe3f-cae2-4759-a71a-5744ffe05c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'503a947b-f576-446c-9226-1b7de98b91db', N'815557cc-5534-4717-91aa-fd75088c96c5', N'30fd1aaa-5ebf-4117-9dc2-b0d36d3a723f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'09df6176-63ad-46b5-b4d2-1cab52378c7c', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'56bcefaf-40a2-438d-be58-36f87c3b713f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'797ea199-4cff-4f8a-896e-1d70e1d444c0', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'170fee80-d746-4855-ab0a-b845ad10cee7', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'074ee53d-0fef-41ae-b926-1ec0b4b1573c', N'1c8f9668-f74f-4007-9333-a087df15231a', N'7764c440-5588-4264-9a70-c2608dccb740', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c05b57ac-d5e0-4704-9ce3-1f3e93ed0ad5', N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'f3d0987e-cc86-4412-81d8-16722dcf7ef4', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'b32ea1fb-b9c1-42eb-a5bc-212540160f9a', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'e7317e00-2291-4321-8cb0-f711a600ca6e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'4d409e3e-fc9e-44ad-9048-22163498a003', N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'620ed551-d5d4-4152-aa09-249dc7ca162e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'13cf8adb-e5eb-4de1-8753-226cb8786d78', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'56bcefaf-40a2-438d-be58-36f87c3b713f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'5c52be8b-6f04-488b-b923-227db115346e', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'fddc7ea2-d75c-4d4f-b0de-dbfa249cda36', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c5e787c8-5baf-4eed-995a-2332e21548c6', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'86096ac6-f2fd-46c1-9c82-8bc53448e587', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'e16c9874-152f-4707-92d0-24150bdc14ac', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'c6a5f24b-3a43-41e5-a867-838470a0963c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'fdf7d350-064b-4072-a75a-241d9e8d8698', N'a9931c38-6cc9-45ab-941a-da20e3e187c3', N'3953eaa1-bd32-42af-a784-12523d9549c3', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c8a22183-592f-4767-93dd-242def814e50', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'235c28f9-b6d4-4e75-a8c1-b351c841854c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'761313e6-bcd5-41c8-9a0a-24ae4adbe48b', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'0cc50b29-dcb2-45ec-a343-028681d1dd55', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd27812bd-0f11-41b0-887d-2592dc962178', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'dd77f7dc-e4e2-4e66-b222-d55fb925eea0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'6ae333e2-d28a-46ef-9bdc-265f319978c4', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'65cdbefa-fccb-4f33-882b-2fbe94b0fd61', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'7f0983e2-8a71-425b-9593-268d2148deaa', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'286ea286-c6f5-44f1-a78c-c7607a5b6520', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'42a614bc-cfda-4824-9bdd-286c12bb021c', N'272359eb-3947-48bf-b94c-e57b803e898e', N'235c28f9-b6d4-4e75-a8c1-b351c841854c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'1b79c13f-5cd0-4ffd-a2b9-2896d132089d', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'8ba3a1e9-a61c-4a20-9072-318680595453', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'2eb36513-071a-41be-a1d8-28d36388078a', N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'7764c440-5588-4264-9a70-c2608dccb740', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'0cf5848c-7488-4472-80eb-29888ace0b30', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'fddc7ea2-d75c-4d4f-b0de-dbfa249cda36', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'dd96dfc7-ffe3-47c1-b6b6-29bf101b7612', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'0f6052bb-1195-4904-a118-a9ca0e9b9df3', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'88990883-c40f-4bd8-9537-29f6655f4351', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'91faa128-f2a1-4123-bd75-df5d97b561fe', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'18e48213-7d1f-4716-8c8b-2bd281652b16', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'bd3b67d0-85c1-42e8-b318-2f52b678e749', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'29b19aac-43db-410f-9a3f-2bfc2ddae9cc', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'65cdbefa-fccb-4f33-882b-2fbe94b0fd61', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'36d75d5f-ba8b-4778-a8d6-2c245ca9f7c8', N'1c8f9668-f74f-4007-9333-a087df15231a', N'f0e4b9c8-7b53-4270-b520-8bd96717629d', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'2d59bd28-1a12-4ac8-9465-2d96371bf5b9', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'3953eaa1-bd32-42af-a784-12523d9549c3', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'5d17dfd7-6afa-437e-a98f-2f64a2396b71', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'170fee80-d746-4855-ab0a-b845ad10cee7', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'e8f85f72-d25b-4b1a-80dc-301c3ff7a84a', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'170fee80-d746-4855-ab0a-b845ad10cee7', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'e9a849b5-1783-41a4-88e1-310c40dfc248', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'e7317e00-2291-4321-8cb0-f711a600ca6e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'95a4d2aa-3e71-4fe3-bf23-334aea55e3b5', N'815557cc-5534-4717-91aa-fd75088c96c5', N'620ed551-d5d4-4152-aa09-249dc7ca162e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'815ffc05-ccea-4d41-92ae-33a912111e47', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'c6a5f24b-3a43-41e5-a867-838470a0963c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'ced570cd-cc6f-42cf-9cfb-36ee1bd3550a', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'8eeaef42-7c82-4f55-b50f-6fcdf2ae0aff', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'42bdb496-17c1-480f-b2ca-385faae0ab82', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'91faa128-f2a1-4123-bd75-df5d97b561fe', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'8d94e325-bb61-4a75-a2bf-39034d32764f', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'80a409f6-016e-4688-8724-c9b21856724e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'b160b8ec-bab2-4792-90e3-391b56531cfb', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'99374f32-0531-41fb-ae46-cf8ca591a80b', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c93b5325-f1c7-4031-ab22-3a6069e4bcb6', N'a9931c38-6cc9-45ab-941a-da20e3e187c3', N'65cdbefa-fccb-4f33-882b-2fbe94b0fd61', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd3d16165-d9ef-4fe6-b46d-3b45a4e8d820', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'0cc50b29-dcb2-45ec-a343-028681d1dd55', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'bc19f37f-bd83-443c-b41d-3b6a6282c0e5', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'd91355db-5c2d-4734-930a-7e69bfdde7c0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'8e315d97-733a-43d1-b7ae-3bb7c60f2cb5', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'2303bc2f-6239-478d-8df3-a59eda249c7e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'372bf05d-58b8-4897-b89c-3bd5c5ec33db', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'6a53274c-6478-453e-a1fb-91fc891bfb7d', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'50a2581b-c652-4004-a179-3c5585add9e4', N'1c8f9668-f74f-4007-9333-a087df15231a', N'8ba3a1e9-a61c-4a20-9072-318680595453', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c236adee-6ace-4f83-b2f6-3d280ccdc664', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'80a409f6-016e-4688-8724-c9b21856724e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'b1b34d03-dd52-4ee5-9c37-3d9b0f5757c8', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'0cc50b29-dcb2-45ec-a343-028681d1dd55', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'3cb482e1-1008-414b-88b9-3df1d2fbca62', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'5708e356-9b31-4004-9eca-70bf042ebcc3', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'24dc9138-791f-4985-b730-3e18087811cf', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'f2ab473a-e46d-4a73-a173-371159a08950', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'e83b63e8-31ba-47d7-99b7-3e82f57cd754', N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'405a10e9-b391-4682-8419-3044731dbdfb', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'2eaea4b2-58f3-4cf3-800f-4066ad2fde75', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'c6a5f24b-3a43-41e5-a867-838470a0963c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'92ed6c07-2831-4d69-8c3d-40ca205839c7', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'2303bc2f-6239-478d-8df3-a59eda249c7e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'2ce802e2-638b-4edc-b703-41a5d05e2367', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'86096ac6-f2fd-46c1-9c82-8bc53448e587', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'0072e32c-4344-46d5-a0b1-41caa0f5ac1b', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'b7877c1a-27d8-45ce-af50-95d0ec3d2c89', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'7c687346-5610-4695-8c9c-42376969c5fa', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'3e44af08-3b22-498b-9891-e4912015de26', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'f549a320-c1a7-42d8-8917-425d6932f524', N'1c8f9668-f74f-4007-9333-a087df15231a', N'9b21ec30-1bf3-4d29-9dea-c0dd480bf464', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'9e1a1f57-6367-4e39-b8c7-43e74e40f03b', N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'e1b5fe3f-cae2-4759-a71a-5744ffe05c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'4172b472-35b5-4296-8303-44037984d8c6', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'f3d0987e-cc86-4412-81d8-16722dcf7ef4', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'a722dcc3-23ed-41f6-955a-44568dd30bec', N'1c8f9668-f74f-4007-9333-a087df15231a', N'cea3ed45-e113-46d5-95d7-1d1d113eed6c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c2ab5030-086d-4fd5-a0ae-461287afb023', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'3953eaa1-bd32-42af-a784-12523d9549c3', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'5b106ec0-f0d2-489d-ac7c-475a495d867a', N'272359eb-3947-48bf-b94c-e57b803e898e', N'8eeaef42-7c82-4f55-b50f-6fcdf2ae0aff', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'8adc192f-a066-4e90-a01a-4785a3f436e1', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'c6a5f24b-3a43-41e5-a867-838470a0963c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'40c59639-2cac-4e98-af6b-4a9123d911c7', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'7eaa336f-d427-4d71-8526-358dfc00d265', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'a563827c-2679-4d02-a777-4ab83052fb77', N'815557cc-5534-4717-91aa-fd75088c96c5', N'3e44af08-3b22-498b-9891-e4912015de26', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'7cea24d1-a2d3-4a3b-976b-4b91baf102fc', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'99374f32-0531-41fb-ae46-cf8ca591a80b', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'8135e3ec-11c7-41c8-a929-4c13ef29c544', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'7764c440-5588-4264-9a70-c2608dccb740', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd3422f7a-ca65-4975-99b7-4d89a23df9bf', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'0f6052bb-1195-4904-a118-a9ca0e9b9df3', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'97198097-29ea-4f0e-9fd7-4e1dfacda383', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'b8e3274d-125f-4b4f-9f36-7ad8894e6e91', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'84760521-38ee-4f34-bc11-4f36bceb4a58', N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'cd428cbe-a3c8-4968-8ba3-476be6652a42', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'df502b57-6542-4882-a1d5-5026471bd758', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'f0e4b9c8-7b53-4270-b520-8bd96717629d', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'1b6ba670-9922-467e-94cc-516292956386', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'f2ab473a-e46d-4a73-a173-371159a08950', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'13c0503c-de01-458d-b7da-5370d500e987', N'1c8f9668-f74f-4007-9333-a087df15231a', N'bd3b67d0-85c1-42e8-b318-2f52b678e749', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'6a2a2df9-ca3f-45ea-ba87-5661a87c6e41', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'b8e3274d-125f-4b4f-9f36-7ad8894e6e91', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'33a69ff7-960c-4d63-b9a4-59a09a41aa74', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'5708e356-9b31-4004-9eca-70bf042ebcc3', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'e49bbe69-eb2e-46fe-9f05-5dfccceef756', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'b7877c1a-27d8-45ce-af50-95d0ec3d2c89', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'fefb74d7-71cc-4b6d-8c05-5e4861219b66', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'f3d0987e-cc86-4412-81d8-16722dcf7ef4', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'bda66354-9a41-47b4-ac55-5e4d8ddc5768', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'0f6052bb-1195-4904-a118-a9ca0e9b9df3', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'5b1cd6ed-4c6c-4634-9b97-60e87aafe864', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'3953eaa1-bd32-42af-a784-12523d9549c3', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'27c8d28c-2c5b-4cab-b8e7-617f3a38cb37', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'9b21ec30-1bf3-4d29-9dea-c0dd480bf464', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'b9a32867-c022-47b9-9055-61cedb1f9adc', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'91faa128-f2a1-4123-bd75-df5d97b561fe', 5)
GO
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'767a91fc-6af4-47a1-95a5-61e1846d7d94', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'235c28f9-b6d4-4e75-a8c1-b351c841854c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'1908bb25-b83b-4e95-a15c-62bbb34180be', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'9b21ec30-1bf3-4d29-9dea-c0dd480bf464', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'e071211c-e85c-4ff1-8deb-66c943219df1', N'55f41f81-c88d-4145-9903-912509151244', N'56bcefaf-40a2-438d-be58-36f87c3b713f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'227d60f4-00e9-4ec0-92d7-66d5736c7939', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'b8e3274d-125f-4b4f-9f36-7ad8894e6e91', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd7bba32d-ee9c-4237-bca4-670a5f49a8a1', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'5284811c-8307-48e1-b1db-6904c2d727bb', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd8d5e6d9-4b56-4a6b-b912-67f7b61614eb', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'1b038258-8bd2-4091-9129-b96d28c1292f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'9d05942c-e9ea-4a30-85d4-68388e18bfa0', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'a2db113d-a17e-4bab-81b4-b04cdf39a03e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'8bff987c-0b92-431b-bb85-6997c385a2f7', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'86096ac6-f2fd-46c1-9c82-8bc53448e587', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'805fba87-9645-427f-bc3f-69decea78832', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'30fd1aaa-5ebf-4117-9dc2-b0d36d3a723f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd664351f-4409-4ed0-b57c-6af13adfdae3', N'1c8f9668-f74f-4007-9333-a087df15231a', N'3953eaa1-bd32-42af-a784-12523d9549c3', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'56caa699-51d0-4317-a51e-6ce32a6a3ba5', N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'8eeaef42-7c82-4f55-b50f-6fcdf2ae0aff', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'f47b652c-e885-4fc2-a947-72eddd55567b', N'55f41f81-c88d-4145-9903-912509151244', N'1b038258-8bd2-4091-9129-b96d28c1292f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'34ce45e6-32f9-4495-92ce-733a8d009277', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'e08bb62b-c2f7-41bc-897b-b0ccb3b9f69f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c9851318-efd0-4da9-8269-734e8829f503', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'e1b5fe3f-cae2-4759-a71a-5744ffe05c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'175c1bd5-bc26-43cd-bbee-7391608eb598', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'235c28f9-b6d4-4e75-a8c1-b351c841854c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'5198ecb3-a7ab-4446-b147-76e7c1738483', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'235c28f9-b6d4-4e75-a8c1-b351c841854c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'4f3a1fa4-b930-490e-b85a-776859c118b2', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'7764c440-5588-4264-9a70-c2608dccb740', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'363f0efd-2a13-4e73-b587-783afc5d49be', N'815557cc-5534-4717-91aa-fd75088c96c5', N'c6779da1-3ca2-43fe-b30b-5d8daa475c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'64b36e2e-40ff-4726-bd79-7ae955ff1b16', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'5284811c-8307-48e1-b1db-6904c2d727bb', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'6b0b1717-bd03-44fb-9fd1-7bf864ecb2f2', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'86096ac6-f2fd-46c1-9c82-8bc53448e587', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'e36d7ca0-ba85-475d-9c21-7c775de3951e', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'd91355db-5c2d-4734-930a-7e69bfdde7c0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'1c76c2bb-2aaf-401f-8755-7caab733b4c8', N'66f2807d-870d-475e-9995-453cc81f2e90', N'30fd1aaa-5ebf-4117-9dc2-b0d36d3a723f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'a436b70a-39f2-4eae-a8ac-7db16d916e14', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'56bcefaf-40a2-438d-be58-36f87c3b713f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd8b0c051-e51d-44b8-aef9-7f4b0419c908', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'c2d4391b-ac32-497e-8567-6605073697c8', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'cc4f1d0d-0aba-482d-b042-803b03172cce', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'f0e4b9c8-7b53-4270-b520-8bd96717629d', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'a20b711c-d662-4b26-b1a3-8100b3f4f895', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'ffbd32fa-cdc8-4b88-a2c6-45452299f186', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'5d6d499b-81af-4787-8fb4-8128859ecccf', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'e1b5fe3f-cae2-4759-a71a-5744ffe05c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'e88bc529-b66c-4642-9efa-84c2567a59c3', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'0f6052bb-1195-4904-a118-a9ca0e9b9df3', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'619006eb-d4e1-4f6d-965b-84d0f3248393', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'67be807f-4d2e-4d68-b313-bcd763f436d0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'5ba7b509-9d40-4dcc-a15d-857754b9b3cc', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'37d61d6f-0f4b-47df-91db-1ff649e9081d', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c3565c5e-f1fc-45b1-a31a-86e845a2f7ac', N'815557cc-5534-4717-91aa-fd75088c96c5', N'91faa128-f2a1-4123-bd75-df5d97b561fe', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'4c10deb4-85a5-4f13-9f8c-8898413aa79b', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'86096ac6-f2fd-46c1-9c82-8bc53448e587', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'0025c920-8c92-46ee-8e6b-894fbdac6e10', N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'f3d0987e-cc86-4412-81d8-16722dcf7ef4', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'e15bb81e-ebca-4592-8be4-8ba1f773d487', N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'405a10e9-b391-4682-8419-3044731dbdfb', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'0683a35e-53ee-45cb-a3f6-8cf3bd09f762', N'e3a28655-71a1-4508-8f81-adab92741a77', N'7764c440-5588-4264-9a70-c2608dccb740', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c5e2bb6b-3585-4b75-9103-8d2448141b47', N'1c8f9668-f74f-4007-9333-a087df15231a', N'a2db113d-a17e-4bab-81b4-b04cdf39a03e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'3be76e2a-c4ac-4b9c-b0bf-8df5a6889911', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'3e44af08-3b22-498b-9891-e4912015de26', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'6edd9ef4-b768-44da-9804-8ea3849c9e90', N'66f2807d-870d-475e-9995-453cc81f2e90', N'cd428cbe-a3c8-4968-8ba3-476be6652a42', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'89460b3e-e440-4b4c-802e-8f0cdbca3e79', N'815557cc-5534-4717-91aa-fd75088c96c5', N'235c28f9-b6d4-4e75-a8c1-b351c841854c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'b09e6981-606a-46fe-ae5e-8f5e30686439', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'7764c440-5588-4264-9a70-c2608dccb740', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'a85edcac-cad3-4cf6-9c7b-92da59076f18', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'341348c4-1e57-478d-90da-6d9e4d72d78f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'37526f45-6647-4fed-81ff-93a183bd3728', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'ffbd32fa-cdc8-4b88-a2c6-45452299f186', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'978d19ed-c740-4d4d-881d-96a04a9a36e1', N'3e89a21a-4554-48e7-b11f-4f70b39e43b5', N'86096ac6-f2fd-46c1-9c82-8bc53448e587', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'fe2c8988-9193-4963-a7f9-985f6e73d0ec', N'1c8f9668-f74f-4007-9333-a087df15231a', N'b7877c1a-27d8-45ce-af50-95d0ec3d2c89', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'2c4aee3a-560f-48bb-a966-987567ce058a', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'6956f02d-f19c-4d09-b160-668e050d3c38', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'fa029af2-6bbc-492e-ac4d-98c2b3ac5839', N'55f41f81-c88d-4145-9903-912509151244', N'e1b5fe3f-cae2-4759-a71a-5744ffe05c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'51d7c6fc-1a00-41b0-bc60-99410f4a334a', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'6a53274c-6478-453e-a1fb-91fc891bfb7d', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'8a6a9b22-9435-4dc6-91fb-99f2087df7f6', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'c2d4391b-ac32-497e-8567-6605073697c8', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'631610e5-bf84-4d03-8a5a-9a3693ae8858', N'3fff369c-0e73-4ba6-945a-e3e3c62b8bf1', N'e7317e00-2291-4321-8cb0-f711a600ca6e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'48098653-60f9-4258-9903-9a92397728e0', N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'0cc50b29-dcb2-45ec-a343-028681d1dd55', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'879d0fc3-0864-4518-9b09-9a9a7234a259', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'7eaa336f-d427-4d71-8526-358dfc00d265', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'3494d519-8ee3-4ab7-8d57-9cce0b75de4e', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'235c28f9-b6d4-4e75-a8c1-b351c841854c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'aed7bb9f-90a0-4c87-8826-9fc21ab8e551', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'c6779da1-3ca2-43fe-b30b-5d8daa475c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd65291bb-395d-4ff0-881f-a088997834aa', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'5284811c-8307-48e1-b1db-6904c2d727bb', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'8e0ddd86-277a-4299-9838-a08b2938d9f0', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'bd3b67d0-85c1-42e8-b318-2f52b678e749', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'ba5ac202-0bdc-4316-ae9f-a138bda1aa24', N'3e89a21a-4554-48e7-b11f-4f70b39e43b5', N'30fd1aaa-5ebf-4117-9dc2-b0d36d3a723f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'18ead7dd-5b5f-48d0-866a-a25ecbff3a1d', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'56bcefaf-40a2-438d-be58-36f87c3b713f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'9b770d46-070f-4b4f-a8a4-a43910c51b7b', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'e7317e00-2291-4321-8cb0-f711a600ca6e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd18bab18-65cc-4582-9b9f-a4e970d281e7', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'91faa128-f2a1-4123-bd75-df5d97b561fe', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'5eb4b64d-9206-4c5f-9354-a6fcb62ec283', N'66f2807d-870d-475e-9995-453cc81f2e90', N'341348c4-1e57-478d-90da-6d9e4d72d78f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'e862e00c-ac8e-41cc-a22d-a7481fe0465a', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'9b21ec30-1bf3-4d29-9dea-c0dd480bf464', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd2d61315-933f-4798-9d61-a84c52d14da3', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'37d61d6f-0f4b-47df-91db-1ff649e9081d', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'a6441608-ea89-4a85-b89c-a9066d4413a8', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'cea3ed45-e113-46d5-95d7-1d1d113eed6c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'bb1747cc-9cf6-474b-8ed2-ab1c9f23a280', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'341348c4-1e57-478d-90da-6d9e4d72d78f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'8435fc8a-67c3-4840-9488-abc1eb8f8313', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'3e44af08-3b22-498b-9891-e4912015de26', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'1495ef75-0abe-4fb2-b06d-abe7b250bda0', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'dd77f7dc-e4e2-4e66-b222-d55fb925eea0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'74bb1912-37d8-4856-b12f-ace91719b99a', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'fddc7ea2-d75c-4d4f-b0de-dbfa249cda36', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'98a9284b-32a9-44da-bca7-adfd9e680c7b', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'91faa128-f2a1-4123-bd75-df5d97b561fe', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'a275229b-79cb-4b59-a655-afa846ac20e6', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'7764c440-5588-4264-9a70-c2608dccb740', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'9e11c874-3aef-4824-a414-afd4a63fe7ee', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'6a53274c-6478-453e-a1fb-91fc891bfb7d', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'3781313f-e8ce-4c14-834c-afede90572af', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'3e44af08-3b22-498b-9891-e4912015de26', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'0a1275e4-8aa1-4ab2-a425-b01f35e3d0d7', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'0cc50b29-dcb2-45ec-a343-028681d1dd55', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'f56f8747-d8da-455a-be39-b07a879e7a30', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'65cdbefa-fccb-4f33-882b-2fbe94b0fd61', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'2c78daee-1127-47a2-8284-b0c21b956728', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'c6a5f24b-3a43-41e5-a867-838470a0963c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'af6e0bc0-bee5-4aef-8d92-b0cc16cd330c', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'30fd1aaa-5ebf-4117-9dc2-b0d36d3a723f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'501074a1-d11d-41ef-8945-b140050c49d5', N'66f2807d-870d-475e-9995-453cc81f2e90', N'6956f02d-f19c-4d09-b160-668e050d3c38', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'65215bec-0634-4982-9b14-b1a7a40d34e7', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'0cc50b29-dcb2-45ec-a343-028681d1dd55', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'96d0e07d-b53d-4942-b284-b273a6a53b14', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'86096ac6-f2fd-46c1-9c82-8bc53448e587', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'b1c859cf-abbe-456f-9e0d-b453c01815f0', N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'e1b5fe3f-cae2-4759-a71a-5744ffe05c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd52c56dc-e88e-4c4c-83bb-b52f995d8233', N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'c6779da1-3ca2-43fe-b30b-5d8daa475c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'79a03572-47a9-4557-86a0-b8cf6c8fff65', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'3e44af08-3b22-498b-9891-e4912015de26', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'bf339329-5b90-4328-87f7-b92c9e851920', N'66f2807d-870d-475e-9995-453cc81f2e90', N'e7317e00-2291-4321-8cb0-f711a600ca6e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'a1f23738-1ce6-4493-aba1-ba513c0a509f', N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'cd428cbe-a3c8-4968-8ba3-476be6652a42', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'76c43b84-b295-4798-9dc0-bc6ceb7e0a08', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'341348c4-1e57-478d-90da-6d9e4d72d78f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'fde090bd-aefc-48f9-aff7-bc6e26cf7cc0', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'0f6052bb-1195-4904-a118-a9ca0e9b9df3', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c7fb3b72-3bdd-41e4-97e7-bcec6798ea37', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'6956f02d-f19c-4d09-b160-668e050d3c38', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'e87519ea-dd40-45aa-9119-bd7f7813d751', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'16e80cc6-6c19-412a-9e91-f83832462182', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'8da067ac-74e0-43e4-9982-bf53a60eba9e', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'235c28f9-b6d4-4e75-a8c1-b351c841854c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd8331db5-c104-4fa4-9efa-c019472af53c', N'3e89a21a-4554-48e7-b11f-4f70b39e43b5', N'620ed551-d5d4-4152-aa09-249dc7ca162e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'168ad438-e17b-4052-83b4-c14989dace23', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'405a10e9-b391-4682-8419-3044731dbdfb', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'0214a968-1aee-4101-abf5-c20c1d06ced6', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'620ed551-d5d4-4152-aa09-249dc7ca162e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'db6d1e3f-7290-4066-8a68-c36077671310', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'235c28f9-b6d4-4e75-a8c1-b351c841854c', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'68eba317-6482-48de-a80b-c40c760e30d7', N'66f2807d-870d-475e-9995-453cc81f2e90', N'7764c440-5588-4264-9a70-c2608dccb740', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'bb8cf195-92a9-4c90-a608-c4a27eeeb3fb', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'3e44af08-3b22-498b-9891-e4912015de26', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'9b79d7c7-107c-41cd-85da-c5875e209f31', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'67be807f-4d2e-4d68-b313-bcd763f436d0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'dd01b2b9-f33e-443d-9c97-c6448d241199', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'fddc7ea2-d75c-4d4f-b0de-dbfa249cda36', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'f16d46bd-30a7-42f2-9fe8-c6b32949a668', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'6956f02d-f19c-4d09-b160-668e050d3c38', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'79cc4cd3-ff75-4c1a-9929-c6ddddbe1397', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'e7317e00-2291-4321-8cb0-f711a600ca6e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'e0d60394-f3ae-4242-b194-c7841a39bdd5', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'6956f02d-f19c-4d09-b160-668e050d3c38', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'9c34e959-729a-4f17-a3fb-c79bd137037f', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'fddc7ea2-d75c-4d4f-b0de-dbfa249cda36', 5)
GO
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'1381505e-b456-4e8f-97fa-cb82c6a456cf', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'c2d4391b-ac32-497e-8567-6605073697c8', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c2cce10e-b03f-46ed-b4d9-ccd3e8eb198c', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'16e80cc6-6c19-412a-9e91-f83832462182', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'429102b8-8c96-43b8-bdea-ccf3dbd5f2ce', N'e3a28655-71a1-4508-8f81-adab92741a77', N'65cdbefa-fccb-4f33-882b-2fbe94b0fd61', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'35f66a82-d5d2-4f72-a7db-ce443a074b0d', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'6a53274c-6478-453e-a1fb-91fc891bfb7d', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'f26e38ab-d72c-4f20-a8af-d0b89d81bc48', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'67be807f-4d2e-4d68-b313-bcd763f436d0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'5e76b50d-7eba-4085-bdba-d220f9f3e501', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'405a10e9-b391-4682-8419-3044731dbdfb', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'07fd9227-c595-43d2-be21-d3a7e4fb707a', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'c6779da1-3ca2-43fe-b30b-5d8daa475c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'30d049d2-adf5-43a7-8a38-d3e94e909d7b', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'0cc50b29-dcb2-45ec-a343-028681d1dd55', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'652ac7c5-32e6-4620-a1aa-d483601e1219', N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'dd77f7dc-e4e2-4e66-b222-d55fb925eea0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'39cd561b-e118-4078-a01e-d5a837ec2c80', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'dd77f7dc-e4e2-4e66-b222-d55fb925eea0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'090e425d-278a-40c3-aaa1-d5d857a6702e', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'0f6052bb-1195-4904-a118-a9ca0e9b9df3', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'3bd02f29-de5e-4496-8533-d66bf0b6ff25', N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'e1b5fe3f-cae2-4759-a71a-5744ffe05c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'a7d94e1b-d1d3-451b-97b9-d790baa2283f', N'3fff369c-0e73-4ba6-945a-e3e3c62b8bf1', N'405a10e9-b391-4682-8419-3044731dbdfb', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'b4caab8b-7d01-4dc8-a471-d8ab0d7cb851', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'a2db113d-a17e-4bab-81b4-b04cdf39a03e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'4128026a-7318-4ea3-80f0-d980a7dc67d9', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'e7317e00-2291-4321-8cb0-f711a600ca6e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'4c24ef6b-884a-4cad-a829-d9aca4d58459', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'86096ac6-f2fd-46c1-9c82-8bc53448e587', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'9d5095ae-fc85-4499-89bd-da6a0586d933', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'620ed551-d5d4-4152-aa09-249dc7ca162e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'b745d6ea-aee9-41e0-b095-dad2ad9c9165', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'dd77f7dc-e4e2-4e66-b222-d55fb925eea0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'f1e64400-9003-4ddb-8890-dafb5d657c10', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'e1b5fe3f-cae2-4759-a71a-5744ffe05c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'083bc6c3-4bfc-443c-a9c8-dbf63ed53b25', N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'341348c4-1e57-478d-90da-6d9e4d72d78f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'4d966c33-ddb5-47c3-aa2f-de22328fefd2', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'30fd1aaa-5ebf-4117-9dc2-b0d36d3a723f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'2b85dee1-36ab-4ca0-9f25-deb8b7c4e8ab', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'1b038258-8bd2-4091-9129-b96d28c1292f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'14431cd6-6643-49fb-8a6f-df06d67f6271', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'f3d0987e-cc86-4412-81d8-16722dcf7ef4', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'44b708a7-4390-4de3-8166-e20bab5db8c2', N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'1b038258-8bd2-4091-9129-b96d28c1292f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c70707bd-d9d0-4d46-9436-e24b4298b843', N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'cd428cbe-a3c8-4968-8ba3-476be6652a42', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'd7e7e24d-70fa-4787-8f5c-e334d1c7083f', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'16e80cc6-6c19-412a-9e91-f83832462182', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'38a0df92-e5da-4676-9e90-e419f6ca1e97', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'37d61d6f-0f4b-47df-91db-1ff649e9081d', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'8f24a8fe-97fd-40c2-8e3c-e4cb2b82ab4c', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'7eaa336f-d427-4d71-8526-358dfc00d265', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'7b4202a0-0534-447f-b016-e55fb6e12263', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'7764c440-5588-4264-9a70-c2608dccb740', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'aee135ad-6383-41ac-a49f-e7b8467fd2b8', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'dd77f7dc-e4e2-4e66-b222-d55fb925eea0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'57704f50-2438-4b21-993c-e8bd55302eac', N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'86096ac6-f2fd-46c1-9c82-8bc53448e587', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'cf7e83ef-c14c-4d80-bb38-e92460aec2c4', N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'30fd1aaa-5ebf-4117-9dc2-b0d36d3a723f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'301ea54b-a475-490a-9c84-e9d478d87100', N'3e89a21a-4554-48e7-b11f-4f70b39e43b5', N'c6779da1-3ca2-43fe-b30b-5d8daa475c11', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'5c49c653-1295-4f08-8283-eeb545ff7f58', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'86096ac6-f2fd-46c1-9c82-8bc53448e587', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'04b45264-28c5-48bb-b233-ef2567364ad6', N'e3a28655-71a1-4508-8f81-adab92741a77', N'16e80cc6-6c19-412a-9e91-f83832462182', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'21cda844-b502-4ad4-a1ea-f2a0724baa66', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'620ed551-d5d4-4152-aa09-249dc7ca162e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'c57adbad-9543-4d87-84ea-f4fb39308614', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'37d61d6f-0f4b-47df-91db-1ff649e9081d', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'95265785-0f30-4358-a2cb-f683b6c8dea8', N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'86096ac6-f2fd-46c1-9c82-8bc53448e587', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'e624b598-7f92-474a-9ba2-f6907c0fe138', N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'e7317e00-2291-4321-8cb0-f711a600ca6e', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'caf5cf9c-32b6-4cfe-b4f4-f87472f6a329', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'0cc50b29-dcb2-45ec-a343-028681d1dd55', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'3a4ed10c-7f0b-4e45-bcf2-f942f2bcb782', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'3e44af08-3b22-498b-9891-e4912015de26', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'1db86811-431f-48ec-85cc-f966524822f6', N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'56bcefaf-40a2-438d-be58-36f87c3b713f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'4345f82d-532a-4a29-8d53-fa25124adda6', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'30fd1aaa-5ebf-4117-9dc2-b0d36d3a723f', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'47178889-ab13-4028-a297-fa27fb94d35b', N'272359eb-3947-48bf-b94c-e57b803e898e', N'86096ac6-f2fd-46c1-9c82-8bc53448e587', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'a0292d19-73ba-4bfe-bea8-fb27f8848ff9', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'c2d4391b-ac32-497e-8567-6605073697c8', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'70600fa8-e2b8-44dd-8fa6-fcba17d59d7e', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'0cc50b29-dcb2-45ec-a343-028681d1dd55', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'04d52c57-48c0-40a4-a92c-fd2b1e28144d', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'dd77f7dc-e4e2-4e66-b222-d55fb925eea0', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'6dc778ba-80a9-4645-aef8-ff098cbf1fae', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'ffbd32fa-cdc8-4b88-a2c6-45452299f186', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'e934da06-6a8d-4bf3-84e1-ff72b15888bc', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'f0e4b9c8-7b53-4270-b520-8bd96717629d', 5)
INSERT [dbo].[Likes] ([LikeID], [UserID], [PostID], [Status]) VALUES (N'7b8dd3ef-b008-4e09-a0d0-fffe547ac1af', N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'5284811c-8307-48e1-b1db-6904c2d727bb', 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'0cc50b29-dcb2-45ec-a343-028681d1dd55', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'433ef784-2a38-4f26-bf49-a807e47e6b41', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Tribes', 10, 1, 39, N'announcement Code JavaScript', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', CAST(N'2022-01-03 00:00:00.000' AS DateTime), CAST(N'2022-02-10 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'3953eaa1-bd32-42af-a784-12523d9549c3', N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'dd63c158-62f2-488f-a099-b2e1b1dc0c1c', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Gold Diggers of 1937', 5, 6, 27, N'beauty department news announcement relax sports gym IT services karaoke', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.', CAST(N'2021-09-03 00:00:00.000' AS DateTime), CAST(N'2022-01-26 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'f3d0987e-cc86-4412-81d8-16722dcf7ef4', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Pixar Story, The', 6, 3, 27, N'beauty department news announcement relax sports gym IT services karaoke', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', CAST(N'2021-07-04 00:00:00.000' AS DateTime), CAST(N'2022-02-03 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'cea3ed45-e113-46d5-95d7-1d1d113eed6c', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'184887fa-56f1-4654-a8ad-b81efb5e2617', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Liquidator, The', 2, 0, 23, N'beauty department news announcement relax sports gym IT services karaoke', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', CAST(N'2022-01-20 00:00:00.000' AS DateTime), CAST(N'2022-06-03 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'37d61d6f-0f4b-47df-91db-1ff649e9081d', N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Jamie and Jessie Are Not Together', 5, 5, 15, N'beauty department news announcement relax sports gym IT services karaoke', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', CAST(N'2021-10-07 00:00:00.000' AS DateTime), CAST(N'2022-06-10 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'620ed551-d5d4-4152-aa09-249dc7ca162e', N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'bd64380a-895d-4b00-af7a-12c80c1faa32', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Scoop', 6, 2, 19, N'beauty department news announcement relax sports gym IT services karaoke', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', CAST(N'2021-09-21 00:00:00.000' AS DateTime), CAST(N'2022-02-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'bd3b67d0-85c1-42e8-b318-2f52b678e749', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Devil''s Double, The', 3, 2, 19, N'beauty department news announcement relax sports gym IT services karaoke', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', CAST(N'2021-12-08 00:00:00.000' AS DateTime), CAST(N'2022-06-13 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'65cdbefa-fccb-4f33-882b-2fbe94b0fd61', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'bd64380a-895d-4b00-af7a-12c80c1faa32', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Dreamland', 5, 3, 35, N'beauty department news announcement relax sports gym IT services karaoke', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', CAST(N'2021-10-18 00:00:00.000' AS DateTime), CAST(N'2022-02-03 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'405a10e9-b391-4682-8419-3044731dbdfb', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'433ef784-2a38-4f26-bf49-a807e47e6b41', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'High Strung', 5, 1, 27, N'beauty department news announcement relax sports gym IT services karaoke', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', CAST(N'2022-01-20 00:00:00.000' AS DateTime), CAST(N'2022-03-18 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'8ba3a1e9-a61c-4a20-9072-318680595453', N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'86b71704-025c-49a0-93c1-88155b2f50c5', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Every Little Step', 2, 3, 19, N'beauty department news announcement relax sports gym IT services karaoke', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', CAST(N'2021-12-20 00:00:00.000' AS DateTime), CAST(N'2022-06-17 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'7eaa336f-d427-4d71-8526-358dfc00d265', N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'c344843d-c8b2-437e-acbb-602f06764b11', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Stuck in Love', 3, 4, 19, N'beauty department news announcement relax sports gym IT services karaoke', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', CAST(N'2021-08-14 00:00:00.000' AS DateTime), CAST(N'2022-01-23 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'56bcefaf-40a2-438d-be58-36f87c3b713f', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'86b71704-025c-49a0-93c1-88155b2f50c5', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Forgotten Silver', 7, 1, 39, N'beauty department news announcement relax sports gym IT services karaoke', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', CAST(N'2021-08-09 00:00:00.000' AS DateTime), CAST(N'2022-03-20 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'f2ab473a-e46d-4a73-a173-371159a08950', N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'24 Hour Woman, The', 2, 3, 27, N'beauty department news announcement relax sports gym IT services karaoke', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', CAST(N'2022-01-20 00:00:00.000' AS DateTime), CAST(N'2022-06-08 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'ffbd32fa-cdc8-4b88-a2c6-45452299f186', N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Brussels Business, The', 3, 3, 15, N'beauty department news announcement relax sports gym IT services karaoke', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', CAST(N'2021-08-18 00:00:00.000' AS DateTime), CAST(N'2022-05-31 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'cd428cbe-a3c8-4968-8ba3-476be6652a42', N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'433ef784-2a38-4f26-bf49-a807e47e6b41', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Jane Eyre', 5, 2, 27, N'beauty department news announcement relax sports gym IT services karaoke', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', CAST(N'2021-09-23 00:00:00.000' AS DateTime), CAST(N'2022-06-03 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'e1b5fe3f-cae2-4759-a71a-5744ffe05c11', N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Bridge at Remagen, The', 10, 3, 39, N'beauty department news announcement relax sports gym IT services karaoke', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', CAST(N'2021-08-20 00:00:00.000' AS DateTime), CAST(N'2022-03-03 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'c6779da1-3ca2-43fe-b30b-5d8daa475c11', N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Human Condition I, The (Ningen no joken I)', 5, 1, 27, N'beauty department news announcement relax sports gym IT services karaoke', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', CAST(N'2021-10-22 00:00:00.000' AS DateTime), CAST(N'2022-05-13 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'c2d4391b-ac32-497e-8567-6605073697c8', N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'c8dca944-1203-4ebe-a026-d5351abfb236', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Origin: Spirits of the Past (Gin-iro no kami no Agito)', 4, 2, 19, N'beauty department news announcement relax sports gym IT services karaoke', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', CAST(N'2022-01-16 00:00:00.000' AS DateTime), CAST(N'2022-03-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'6956f02d-f19c-4d09-b160-668e050d3c38', N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'1a64cd61-c9fe-482b-921d-1c84145266d2', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Cutlet for Three (Ein Schnitzel für drei)', 5, 3, 23, N'beauty department news announcement relax sports gym IT services karaoke', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', CAST(N'2021-08-08 00:00:00.000' AS DateTime), CAST(N'2022-05-21 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'5284811c-8307-48e1-b1db-6904c2d727bb', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'dbdf043d-5f19-4237-8eee-4355eaba7071', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Yellow Sky', 5, 0, 19, N'beauty department news announcement relax sports gym IT services karaoke', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', CAST(N'2021-07-22 00:00:00.000' AS DateTime), CAST(N'2022-05-30 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'341348c4-1e57-478d-90da-6d9e4d72d78f', N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'433ef784-2a38-4f26-bf49-a807e47e6b41', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Wonderful, Horrible Life of Leni Riefenstahl, The (Macht der Bilder: Leni Riefenstahl, Die)', 7, 0, 15, N'beauty department news announcement relax sports gym IT services karaoke', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', CAST(N'2021-08-01 00:00:00.000' AS DateTime), CAST(N'2022-04-28 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'8eeaef42-7c82-4f55-b50f-6fcdf2ae0aff', N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Real Men', 3, 0, 27, N'beauty department news announcement relax sports gym IT services karaoke', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.', CAST(N'2021-12-20 00:00:00.000' AS DateTime), CAST(N'2022-01-28 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'5708e356-9b31-4004-9eca-70bf042ebcc3', N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'dbdf043d-5f19-4237-8eee-4355eaba7071', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Eklavya: The Royal Guard', 2, 4, 27, N'beauty department news announcement relax sports gym IT services karaoke', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', CAST(N'2021-10-17 00:00:00.000' AS DateTime), CAST(N'2022-02-27 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'b8e3274d-125f-4b4f-9f36-7ad8894e6e91', N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'c344843d-c8b2-437e-acbb-602f06764b11', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Mark of Zorro, The', 3, 1, 19, N'beauty department news announcement relax sports gym IT services karaoke', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', CAST(N'2021-08-27 00:00:00.000' AS DateTime), CAST(N'2022-03-13 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'd91355db-5c2d-4734-930a-7e69bfdde7c0', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Caught Inside', 3, 0, 39, N'beauty department news announcement relax sports gym IT services karaoke', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', CAST(N'2021-12-13 00:00:00.000' AS DateTime), CAST(N'2022-06-17 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'c6a5f24b-3a43-41e5-a867-838470a0963c', N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Earthquake', 6, 4, 39, N'beauty department news announcement relax sports gym IT services karaoke', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', CAST(N'2021-09-25 00:00:00.000' AS DateTime), CAST(N'2022-03-10 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'86096ac6-f2fd-46c1-9c82-8bc53448e587', N'e3a28655-71a1-4508-8f81-adab92741a77', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Bikini Beach', 12, 1, 39, N'beauty department news announcement relax sports gym IT services karaoke', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', CAST(N'2021-10-01 00:00:00.000' AS DateTime), CAST(N'2022-02-17 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'f0e4b9c8-7b53-4270-b520-8bd96717629d', N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'On the Run', 4, 3, 31, N'beauty department news announcement relax sports gym IT services karaoke', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', CAST(N'2021-10-05 00:00:00.000' AS DateTime), CAST(N'2022-06-12 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'6a53274c-6478-453e-a1fb-91fc891bfb7d', N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'8e4fd77d-1a72-4458-94e8-9270ed3388f6', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Wild Bees, The (Divoké vcely)', 4, 4, 15, N'beauty department news announcement relax sports gym IT services karaoke', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', CAST(N'2021-12-24 00:00:00.000' AS DateTime), CAST(N'2022-04-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'b7877c1a-27d8-45ce-af50-95d0ec3d2c89', N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'1a64cd61-c9fe-482b-921d-1c84145266d2', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Imago mortis', 3, 0, 19, N'beauty department news announcement relax sports gym IT services karaoke', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', CAST(N'2021-07-16 00:00:00.000' AS DateTime), CAST(N'2022-01-21 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'2303bc2f-6239-478d-8df3-a59eda249c7e', N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'86b71704-025c-49a0-93c1-88155b2f50c5', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Black Moon', 2, 3, 27, N'beauty department news announcement relax sports gym IT services karaoke', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', CAST(N'2021-06-27 00:00:00.000' AS DateTime), CAST(N'2022-02-14 00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'0f6052bb-1195-4904-a118-a9ca0e9b9df3', N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'3b813c84-335d-4582-8ab3-46900554336d', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Happy Tears', 6, 1, 19, N'beauty department news announcement relax sports gym IT services karaoke', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', CAST(N'2021-07-13 00:00:00.000' AS DateTime), CAST(N'2022-06-20 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'a2db113d-a17e-4bab-81b4-b04cdf39a03e', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'3b813c84-335d-4582-8ab3-46900554336d', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Teeth', 4, 0, 27, N'beauty department news announcement relax sports gym IT services karaoke', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', CAST(N'2021-11-19 00:00:00.000' AS DateTime), CAST(N'2022-02-12 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'e08bb62b-c2f7-41bc-897b-b0ccb3b9f69f', N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'c344843d-c8b2-437e-acbb-602f06764b11', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Boy', 1, 2, 31, N'beauty department news announcement relax sports gym IT services karaoke', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', CAST(N'2021-10-11 00:00:00.000' AS DateTime), CAST(N'2022-03-31 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'30fd1aaa-5ebf-4117-9dc2-b0d36d3a723f', N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'a405e29b-9a13-43f3-a9e7-c3b863e02075', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'18 Again!', 8, 0, 31, N'beauty department news announcement relax sports gym IT services karaoke', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-12-19 00:00:00.000' AS DateTime), CAST(N'2022-03-11 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'235c28f9-b6d4-4e75-a8c1-b351c841854c', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'We''re No Angels', 9, 4, 23, N'beauty department news announcement relax sports gym IT services karaoke', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', CAST(N'2021-06-27 00:00:00.000' AS DateTime), CAST(N'2022-06-09 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'170fee80-d746-4855-ab0a-b845ad10cee7', N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'bd64380a-895d-4b00-af7a-12c80c1faa32', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Education for Death', 3, 1, 39, N'beauty department news announcement relax sports gym IT services karaoke', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', CAST(N'2021-06-25 00:00:00.000' AS DateTime), CAST(N'2022-03-25 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'1b038258-8bd2-4091-9129-b96d28c1292f', N'55f41f81-c88d-4145-9903-912509151244', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Red Sonja', 5, 3, 23, N'beauty department news announcement relax sports gym IT services karaoke', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', CAST(N'2021-10-22 00:00:00.000' AS DateTime), CAST(N'2022-05-10 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'67be807f-4d2e-4d68-b313-bcd763f436d0', N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Bitter Sugar (Azúcar amarga)', 4, 2, 35, N'beauty department news announcement relax sports gym IT services karaoke', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', CAST(N'2022-01-04 00:00:00.000' AS DateTime), CAST(N'2022-06-19 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'9b21ec30-1bf3-4d29-9dea-c0dd480bf464', N'3e89a21a-4554-48e7-b11f-4f70b39e43b5', N'0128a1ff-7742-41e7-9ec5-fef92f887e4e', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Show Me', 5, 1, 19, N'beauty department news announcement relax sports gym IT services karaoke', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', CAST(N'2021-10-03 00:00:00.000' AS DateTime), CAST(N'2022-03-20 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'7764c440-5588-4264-9a70-c2608dccb740', N'1c8f9668-f74f-4007-9333-a087df15231a', N'7ec693d6-b5ca-4619-9480-426ffc7931a6', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Late Show, The', 10, 2, 31, N'beauty department news announcement relax sports gym IT services karaoke', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', CAST(N'2021-09-30 00:00:00.000' AS DateTime), CAST(N'2022-03-27 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'286ea286-c6f5-44f1-a78c-c7607a5b6520', N'e78747da-a300-4a57-8db6-2d6789eb739a', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Being Elmo: A Puppeteer''s Journey', 2, 4, 35, N'beauty department news announcement relax sports gym IT services karaoke', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', CAST(N'2021-12-20 00:00:00.000' AS DateTime), CAST(N'2022-02-01 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'80a409f6-016e-4688-8724-c9b21856724e', N'272359eb-3947-48bf-b94c-e57b803e898e', N'42422529-d855-40b4-b7c0-619ef761dcb3', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Gulliver''s Travels', 2, 4, 35, N'beauty department news announcement relax sports gym IT services karaoke', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', CAST(N'2021-10-18 00:00:00.000' AS DateTime), CAST(N'2022-03-21 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'99374f32-0531-41fb-ae46-cf8ca591a80b', N'39656d70-38c6-4214-8ace-76efa38ad30f', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Who Are you Polly Maggoo (Qui êtes-vous, Polly Maggoo?)', 2, 0, 23, N'beauty department news announcement relax sports gym IT services karaoke', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', CAST(N'2021-10-21 00:00:00.000' AS DateTime), CAST(N'2022-05-08 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'dd77f7dc-e4e2-4e66-b222-d55fb925eea0', N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'b79a3fdc-ec55-4086-95de-76278a6cf8a7', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Return to the Blue Lagoon', 9, 2, 27, N'beauty department news announcement relax sports gym IT services karaoke', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', CAST(N'2021-08-24 00:00:00.000' AS DateTime), CAST(N'2022-02-08 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'fddc7ea2-d75c-4d4f-b0de-dbfa249cda36', N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Hitchcock', 6, 3, 15, N'beauty department news announcement relax sports gym IT services karaoke', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', CAST(N'2021-07-26 00:00:00.000' AS DateTime), CAST(N'2022-05-19 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'91faa128-f2a1-4123-bd75-df5d97b561fe', N'815557cc-5534-4717-91aa-fd75088c96c5', N'f5f757d1-158e-4fa6-a3dc-0618cc86b34a', N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Dirt Bike Kid, The', 6, 1, 31, N'beauty department news announcement relax sports gym IT services karaoke', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', CAST(N'2022-01-19 00:00:00.000' AS DateTime), CAST(N'2022-05-15 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'3e44af08-3b22-498b-9891-e4912015de26', N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'1d41d65c-3fb1-4401-9cb9-cbfaf5cbd77d', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Hateship Loveship', 8, 0, 15, N'beauty department news announcement relax sports gym IT services karaoke', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', CAST(N'2021-11-15 00:00:00.000' AS DateTime), CAST(N'2022-02-28 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'e7317e00-2291-4321-8cb0-f711a600ca6e', N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'a3281a9f-a2f0-461c-bebc-6994251a38cb', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Louise Bourgeois: The Spider, the Mistress and the Tangerine', 8, 1, 31, N'beauty department news announcement relax sports gym IT services karaoke', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.', CAST(N'2021-11-16 00:00:00.000' AS DateTime), CAST(N'2022-05-07 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Posts] ([PostID], [UserPostID], [GroupPostID], [PostTypeID], [Title], [LikesTotal], [CommentsTotal], [Views], [Tags], [PostContent], [CreatedDate], [LastModified], [Status]) VALUES (N'16e80cc6-6c19-412a-9e91-f83832462182', N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'c344843d-c8b2-437e-acbb-602f06764b11', N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'Memory of a Killer, The (Zaak Alzheimer, De)', 5, 1, 39, N'beauty department news announcement relax sports gym IT services karaoke', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', CAST(N'2021-10-01 00:00:00.000' AS DateTime), CAST(N'2022-03-04 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[PostTypes] ([PostTypeID], [PostTypeName], [Status]) VALUES (N'f0560405-3b2b-4173-bab8-ba41c2f549ed', N'News', 1)
INSERT [dbo].[PostTypes] ([PostTypeID], [PostTypeName], [Status]) VALUES (N'b7d8febc-f871-42ce-8164-f2e34e646cbf', N'Announcement', 1)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Status]) VALUES (N'4be22d4b-c9a0-4e63-be47-1ffbad769140', N'ADMIN', 1)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Status]) VALUES (N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'RESIDENT', 1)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Status]) VALUES (N'ca9a5de6-604e-488b-a0dc-55bd5a61bbb6', N'MANAGER', 1)
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (1, N'Active')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (2, N'Inactive')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (3, N'Banned')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (4, N'Pending')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (5, N'Available')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (6, N'Unavailable')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (7, N'Important')
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'c2c53dbf-de45-4d34-8841-037d1db915c9', N'4be22d4b-c9a0-4e63-be47-1ffbad769140', N'Phuong', N'Vo', N'admin', N'0971775169', N'TPHCM Viet Nam', N'admin@gmai.com', 1, N'Peter', N'https://robohash.org/veritatisexcepturiquas.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'39d2ae90-e01f-47e3-989f-066d0d67e983', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Zia', N'Shemming', N'dancu', N'252-447-7476', N'263 Memorial Parkway', N'dancu@gmail.com', 0, N'zshemming7', N'https://robohash.org/solutasedinventore.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'4c5be4ab-4b6c-413c-ad98-0ef5b0a82c1b', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Amitie', N'Pilmer', N'quanly', N'962-756-6856', N'62448 Village Hill', N'quanly@gmail.com', 1, N'apilmerm', N'https://robohash.org/estlaboreoptio.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'72e0bb60-27dc-4af1-bd7c-0f02e9f78cd7', N'ca9a5de6-604e-488b-a0dc-55bd5a61bbb6', N'Agnola', N'Nappin', N'oRCFygi', N'808-350-5906', N'126 Montana Road', N'anappin12@pagesperso-orange.fr', 1, N'anappin12', N'https://robohash.org/minusvoluptatemut.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'dd02e098-2cce-4a04-9be9-16d76e4357d2', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Taite', N'Renoden', N'qyVfTjmCwgd', N'529-499-3390', N'620 Mccormick Place', N'trenoden0@oakley.com', 0, N'trenoden0', N'https://robohash.org/reprehenderitvoluptatemmollitia.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'cb5edf18-cbc0-4c4c-85fd-1bb8fa04a8c7', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Georgeanna', N'Leas', N'ouMBvEwD', N'594-706-3508', N'8276 Westerfield Street', N'gleasi@theatlantic.com', 0, N'gleasi', N'https://robohash.org/architectoenimfacere.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'e78747da-a300-4a57-8db6-2d6789eb739a', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Jarrid', N'Kenworth', N'vQi3ni6X', N'774-107-6970', N'96 Lotheville Place', N'jkenworthq@bandcamp.com', 1, N'jkenworthq', N'https://robohash.org/autremodio.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'5ef5fa35-a3b6-4d98-b09f-3489e48ae7c5', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Trudie', N'Buten', N'OyRYTcsaOMhP', N'877-711-2298', N'182 2nd Avenue', N'tbutend@nyu.edu', 1, N'tbutend', N'https://robohash.org/rationedoloremquo.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'46dc1d02-4b93-42cd-9863-3901e09fcf33', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Marvin', N'Claricoats', N'yi14S1O2', N'152-375-7139', N'45 Meadow Vale Place', N'mclaricoats1@addtoany.com', 0, N'mclaricoats1', N'https://robohash.org/quosnonesse.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'f9c6814e-88ae-4425-a77d-3a621bb2923b', N'4be22d4b-c9a0-4e63-be47-1ffbad769140', N'Cordie', N'Vaan', N'oOLYAQyIwhgE', N'818-972-0849', N'6618 Caliangt Street', N'cvaan9@ed.gov', 0, N'cvaan9', N'https://robohash.org/quidemreprehenderitconsequatur.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'66f2807d-870d-475e-9995-453cc81f2e90', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Cindelyn', N'Aynscombe', N'Co2R6t1hzz6', N'684-211-0122', N'89 Judy Place', N'caynscombe2@marketwatch.com', 0, N'caynscombe2', N'https://robohash.org/quidemvoluptatesquia.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'3e89a21a-4554-48e7-b11f-4f70b39e43b5', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Berti', N'Teck', N'0XtYiOsSk', N'476-179-6772', N'74 Judy Crossing', N'bteckj@nature.com', 0, N'bteckj', N'https://robohash.org/sitetrem.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'61bc2175-6384-4e5b-aac3-51573bf66d5f', N'ca9a5de6-604e-488b-a0dc-55bd5a61bbb6', N'Babbette', N'Scanes', N'HdG2seZo', N'891-957-9617', N'62 Anhalt Junction', N'bscanesk@spotify.com', 0, N'bscanesk', N'https://robohash.org/abminimaomnis.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'4275dd6b-0a6a-4796-9029-52ae7e3d0f27', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Royall', N'Walaron', N'nxYWGv3', N'367-219-8347', N'256 Cascade Point', N'rwalaron6@jalbum.net', 0, N'rwalaron6', N'https://robohash.org/officiisetet.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'c3fea62d-acb8-4228-83f9-568a49fd34be', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Andreas', N'Wisdom', N'5RDynaFI1b', N'601-426-8991', N'197 Center Trail', N'awisdomh@taobao.com', 0, N'awisdomh', N'https://robohash.org/cupiditatequasquia.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'71945631-6dbb-440d-a874-5d4c41ff7e3e', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Worth', N'Sutor', N'FytvaZ', N'542-497-5708', N'98715 Hooker Junction', N'wsutor19@fotki.com', 1, N'wsutor19', N'https://robohash.org/nullaconsecteturet.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'2cc76a18-e8c6-4b95-a8cd-6020e9369ef5', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Anne-marie', N'Gilhoolie', N'laBW2vGLtbqa', N'882-932-0247', N'64238 Pearson Plaza', N'agilhoolie17@telegraph.co.uk', 0, N'agilhoolie17', N'https://robohash.org/verodoloremnihil.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'1c280b72-b425-4e43-be32-66ae8b59de6b', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Farlie', N'Headley', N'ZdoXdRv0', N'240-628-8294', N'828 Buena Vista Center', N'fheadleyv@opera.com', 1, N'fheadleyv', N'https://robohash.org/idquaeexplicabo.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'37a5d534-914d-4ebf-a25a-6e5aa2e08c0b', N'ca9a5de6-604e-488b-a0dc-55bd5a61bbb6', N'Mill', N'Cassley', N'514gdcFoOb', N'358-503-9899', N'804 International Park', N'mcassleyw@techcrunch.com', 1, N'mcassleyw', N'https://robohash.org/quiimpedittemporibus.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'39656d70-38c6-4214-8ace-76efa38ad30f', N'4be22d4b-c9a0-4e63-be47-1ffbad769140', N'Fawn', N'Lindner', N'5oAcocka6cG', N'208-714-7831', N'0599 Doe Crossing Alley', N'flindner1b@hc360.com', 0, N'flindner1b', N'https://robohash.org/similiquelaboriosamveniam.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'b696bcff-fbda-44f7-bde0-785d2bc53f02', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Tomasine', N'Pawley', N'3vgaj8B0', N'167-856-2897', N'3 Lakewood Point', N'tpawley8@printfriendly.com', 1, N'tpawley8', N'https://robohash.org/nesciuntnihildignissimos.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'b7d4b328-ac7c-44e9-a171-84fee0cb5491', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Dean', N'Boulton', N'Uh80TmQ7ubPG', N'977-820-7102', N'7 Logan Avenue', N'dboultonc@ifeng.com', 1, N'dboultonc', N'https://robohash.org/nisiblanditiisenim.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'b3de1a7c-b100-43e4-a2db-85a3b3f557a5', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Arin', N'Gulland', N'ePZRane', N'454-598-4433', N'8 Hollow Ridge Alley', N'agullandb@businesswire.com', 0, N'agullandb', N'https://robohash.org/etquoofficiis.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'55f41f81-c88d-4145-9903-912509151244', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Bee', N'Harrington', N'EHL49k', N'847-828-7797', N'88 Comanche Pass', N'bharringtonu@disqus.com', 1, N'bharringtonu', N'https://robohash.org/enimipsamplaceat.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'e6288c71-0e84-49d3-a5df-947d4d8f5b41', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Briant', N'McCarlie', N'kOpMTEZOdNo6', N'773-941-5347', N'6 Gale Pass', N'bmccarlie4@mayoclinic.com', 1, N'bmccarlie4', N'https://robohash.org/quinondolor.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'ebb2f984-93a7-4965-ae13-9c59ec839b95', N'ca9a5de6-604e-488b-a0dc-55bd5a61bbb6', N'Avril', N'Kilban', N'wfD7T2f6gYe', N'665-957-0651', N'62910 Kensington Lane', N'akilban15@wp.com', 0, N'akilban15', N'https://robohash.org/quidemquiahic.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'1c8f9668-f74f-4007-9333-a087df15231a', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Jefferson', N'Klugman', N'CJAx7i4aV46', N'153-599-1515', N'440 Kinsman Park', N'jklugman1d@wikispaces.com', 0, N'jklugman1d', N'https://robohash.org/delenitinonut.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'b70cfec7-f1de-45c1-bb7f-a0b6ef5626e7', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Addy', N'Stockney', N'jR7UCxtkOi', N'423-662-1569', N'717 Maple Street', N'astockney11@elpais.com', 0, N'astockney11', N'https://robohash.org/atquemollitiaaut.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'05054ed0-4d66-4c6f-91a1-a32833b0e181', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Fitz', N'Vallantine', N'3oiQ3IxI6', N'176-620-0098', N'2641 Monterey Center', N'fvallantines@forbes.com', 1, N'fvallantines', N'https://robohash.org/consequaturautquasi.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'bc540130-8d07-42e5-8b0c-a3d8262fb6b1', N'4be22d4b-c9a0-4e63-be47-1ffbad769140', N'Briney', N'Deare', N'2hoUhc', N'477-686-4854', N'92001 Warrior Park', N'bdearet@cnbc.com', 0, N'bdearet', N'https://robohash.org/quaealiaset.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'e3a28655-71a1-4508-8f81-adab92741a77', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Sol', N'Nys', N'WXDC1L', N'699-744-3506', N'4988 Tennessee Road', N'snysr@aboutads.info', 0, N'snysr', N'https://robohash.org/illumillosit.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'e1aa7dd7-4b61-438e-83c4-b21e29a008b8', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Wilmette', N'Handley', N'hwt5Qf9aywVy', N'148-652-7235', N'3 Fisk Place', N'whandleyx@forbes.com', 0, N'whandleyx', N'https://robohash.org/laborumestnemo.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'60f8e901-911e-4fa8-8b4c-b6a9035d27c4', N'ca9a5de6-604e-488b-a0dc-55bd5a61bbb6', N'Murdock', N'Cardow', N'n06oR2fgx', N'837-750-3252', N'433 Division Park', N'mcardow3@vimeo.com', 0, N'mcardow3', N'https://robohash.org/molestiaesolutaet.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'df2c16fb-3df9-4e22-a459-bd7890e61de7', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Ludwig', N'Mose', N'gXFOFRCU', N'313-928-7704', N'8705 Westridge Pass', N'lmosep@prweb.com', 1, N'lmosep', N'https://robohash.org/sedconsequunturfuga.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'04df31d0-3b46-4634-9c1f-bddf0d7c68af', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Aline', N'Kingswell', N'T14Z5Ok3GjrN', N'822-627-4729', N'7 Farwell Court', N'akingswell16@storify.com', 0, N'akingswell16', N'https://robohash.org/reprehenderitfugitunde.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'e6b9c744-53f1-48cd-887a-c004bae1fd28', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Sigismund', N'Greedy', N'2SLpuSjnI', N'225-309-0989', N'9946 Veith Crossing', N'sgreedy1c@issuu.com', 1, N'sgreedy1c', N'https://robohash.org/abomnisdignissimos.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'b9c41c05-7fea-4276-ad9e-c29e56d328f2', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Templeton', N'Stoney', N'vHrYowAqgH9r', N'325-127-1766', N'26027 Mosinee Avenue', N'tstoneyg@360.cn', 0, N'tstoneyg', N'https://robohash.org/optiononsuscipit.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'22c63989-b34c-4da4-9e27-c75dc9230eec', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Francis', N'Dorken', N'9kniXl', N'490-727-7951', N'170 Stuart Hill', N'fdorken5@mapy.cz', 1, N'fdorken5', N'https://robohash.org/consequaturfacilismolestias.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'eab628c8-90ec-4a32-9a56-ce60ddeacbac', N'ca9a5de6-604e-488b-a0dc-55bd5a61bbb6', N'Tarah', N'Heinzel', N'tOZtJ28iY', N'491-818-2283', N'6 Bluestem Road', N'theinzeln@theglobeandmail.com', 1, N'theinzeln', N'https://robohash.org/ipsaquiet.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'557286ea-f8b9-4c37-a462-d46d6fdd6f6e', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Aura', N'Grievson', N'hlHkYWYuOnT9', N'631-623-6259', N'0 Montana Court', N'agrievsony@mozilla.com', 0, N'agrievsony', N'https://robohash.org/solutaquasnemo.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'a9931c38-6cc9-45ab-941a-da20e3e187c3', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Grover', N'Menguy', N'tB019MwxyP', N'627-167-7585', N'4482 Monument Place', N'gmenguyl@blog.com', 0, N'gmenguyl', N'https://robohash.org/aperiamquipossimus.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'df5cd1ff-3338-40a0-aeeb-e1b01d2bc1fe', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Siusan', N'McGinlay', N'5ylxuivwz', N'972-449-6369', N'81 Ridgeview Center', N'smcginlaya@yahoo.co.jp', 0, N'smcginlaya', N'https://robohash.org/solutaquidemeos.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'3fff369c-0e73-4ba6-945a-e3e3c62b8bf1', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Ferdinand', N'Risely', N'zEOrMpqUZ', N'998-638-8410', N'76 Marquette Hill', N'frisely13@1und1.de', 1, N'frisely13', N'https://robohash.org/quoinciduntdoloremque.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'272359eb-3947-48bf-b94c-e57b803e898e', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Vinny', N'Stenson', N'NpDYAk67Llih', N'117-456-8979', N'651 Warner Drive', N'vstenson18@sina.com.cn', 1, N'vstenson18', N'https://robohash.org/saepeutid.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'2651b8f8-227a-4b71-9c1a-e888581406c7', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Anna-diana', N'Streets', N'8ShjIkULL', N'752-331-8258', N'63 Kingsford Lane', N'astreetsf@parallels.com', 1, N'astreetsf', N'https://robohash.org/eumdistinctioaperiam.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'49352801-0a32-45d3-9b05-ec6e0ec75bd9', N'ca9a5de6-604e-488b-a0dc-55bd5a61bbb6', N'Dillie', N'Strut', N'9Oxft0', N'681-194-6174', N'165 Helena Parkway', N'dstrut1a@disqus.com', 0, N'dstrut1a', N'https://robohash.org/accusamusaconsequatur.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'64b6f6f1-5356-47ef-ac1f-fa38fb9ec10b', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Dotti', N'Hardy-Piggin', N'FCZrFsU59l', N'178-610-0364', N'25507 Lighthouse Bay Point', N'dhardypigginz@google.it', 1, N'dhardypigginz', N'https://robohash.org/distinctiotemporaharum.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'9ebe5aef-4b1b-452f-b64e-fbf24dc5c1e1', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Vania', N'Mathely', N'2KE7TNLMgdF', N'701-197-0055', N'6356 Alpine Alley', N'vmathelye@ask.com', 0, N'vmathelye', N'https://robohash.org/voluptatemenimet.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'815557cc-5534-4717-91aa-fd75088c96c5', N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'Alyce', N'Cullimore', N'o2oTja3wy', N'828-595-1611', N'4 Maple Pass', N'acullimore10@illinois.edu', 1, N'acullimore10', N'https://robohash.org/voluptasquosaut.png?size=50x50&set=set1', 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FirstName], [LastName], [Password], [PhoneNumber], [Address], [Email], [Gender], [Username], [Avatar], [Status]) VALUES (N'09381d42-2027-4ed2-8151-fdc51bfbe35a', N'ca9a5de6-604e-488b-a0dc-55bd5a61bbb6', N'Bald', N'Stronach', N'V5PrALy', N'106-769-6585', N'247 Continental Junction', N'bstronacho@dell.com', 1, N'bstronacho', N'https://robohash.org/animimagniqui.png?size=50x50&set=set1', 1)
ALTER TABLE [dbo].[CommentReplies]  WITH CHECK ADD  CONSTRAINT [FK_CommentReplies_Comments] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comments] ([CommentID])
GO
ALTER TABLE [dbo].[CommentReplies] CHECK CONSTRAINT [FK_CommentReplies_Comments]
GO
ALTER TABLE [dbo].[CommentReplies]  WITH CHECK ADD  CONSTRAINT [FK_tblCommentReply_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CommentReplies] CHECK CONSTRAINT [FK_tblCommentReply_tblStatus]
GO
ALTER TABLE [dbo].[CommentReplies]  WITH CHECK ADD  CONSTRAINT [FK_tblCommentReply_tblUser] FOREIGN KEY([UserReplyID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[CommentReplies] CHECK CONSTRAINT [FK_tblCommentReply_tblUser]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_tblComment_tblStatus]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblUser] FOREIGN KEY([UserCommentID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_tblComment_tblUser]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Status] FOREIGN KEY([PublicStatus])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Status]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_tblGroup_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_tblGroup_tblStatus]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_tblGroup_tblUser] FOREIGN KEY([GroupOwnerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_tblGroup_tblUser]
GO
ALTER TABLE [dbo].[GroupUsers]  WITH CHECK ADD  CONSTRAINT [FK_GroupUsers_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[GroupUsers] CHECK CONSTRAINT [FK_GroupUsers_Groups]
GO
ALTER TABLE [dbo].[GroupUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblGroupUser_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupUsers] CHECK CONSTRAINT [FK_tblGroupUser_tblStatus]
GO
ALTER TABLE [dbo].[GroupUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblGroupUser_tblUser] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[GroupUsers] CHECK CONSTRAINT [FK_tblGroupUser_tblUser]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_Posts] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_Posts]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_tblLike_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_tblLike_tblStatus]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_tblLike_tblUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_tblLike_tblUser]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Groups] FOREIGN KEY([GroupPostID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Groups]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_PostTypes] FOREIGN KEY([PostTypeID])
REFERENCES [dbo].[PostTypes] ([PostTypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_PostTypes]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Status] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Status]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([UserPostID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
ALTER TABLE [dbo].[PostTypes]  WITH CHECK ADD  CONSTRAINT [FK_tblPostType_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostTypes] CHECK CONSTRAINT [FK_tblPostType_tblStatus]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_tblRole_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_tblRole_tblStatus]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole1] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_tblUser_tblRole1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_tblUser_tblStatus]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD CHECK  (([commentstotal]>=(0)))
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD CHECK  (([likestotal]>=(0)))
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [CK__Posts__Views__55F4C372] CHECK  (([views]>=(0)))
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [CK__Posts__Views__55F4C372]
GO
USE [master]
GO
ALTER DATABASE [department_db] SET  READ_WRITE 
GO
