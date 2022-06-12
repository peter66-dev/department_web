USE [master]
GO
/****** Object:  Database [department_db]    Script Date: 6/12/2022 11:26:03 PM ******/
CREATE DATABASE [department_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'department_web', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\department_web.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'department_web_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\department_web_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[tblComment]    Script Date: 6/12/2022 11:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComment](
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
/****** Object:  Table [dbo].[tblCommentReply]    Script Date: 6/12/2022 11:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCommentReply](
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
/****** Object:  Table [dbo].[tblGroup]    Script Date: 6/12/2022 11:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGroup](
	[GroupID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[GroupDescription] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[PublicStatus] [bit] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblGroup] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblGroupUser]    Script Date: 6/12/2022 11:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGroupUser](
	[GroupUserID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[GroupID] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblGroupUser] PRIMARY KEY CLUSTERED 
(
	[GroupUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLike]    Script Date: 6/12/2022 11:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLike](
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
/****** Object:  Table [dbo].[tblPost]    Script Date: 6/12/2022 11:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPost](
	[PostID] [uniqueidentifier] NOT NULL,
	[UserPostID] [uniqueidentifier] NOT NULL,
	[GroupPostID] [uniqueidentifier] NOT NULL,
	[PostTypeID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
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
/****** Object:  Table [dbo].[tblPostType]    Script Date: 6/12/2022 11:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPostType](
	[PostTypeID] [uniqueidentifier] NOT NULL,
	[PostTypeName] [nvarchar](150) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblPostType] PRIMARY KEY CLUSTERED 
(
	[PostTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 6/12/2022 11:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleID] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 6/12/2022 11:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStatus](
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
/****** Object:  Table [dbo].[tblUser]    Script Date: 6/12/2022 11:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
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
	[ActiveStatus] [bit] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblRole] ([RoleID], [RoleName], [Status]) VALUES (N'4be22d4b-c9a0-4e63-be47-1ffbad769140', N'ADMIN', 1)
INSERT [dbo].[tblRole] ([RoleID], [RoleName], [Status]) VALUES (N'4cc4c088-1456-4f80-91ba-204afe6af69c', N'RESIDENT', 1)
INSERT [dbo].[tblRole] ([RoleID], [RoleName], [Status]) VALUES (N'ca9a5de6-604e-488b-a0dc-55bd5a61bbb6', N'MANAGER', 1)
INSERT [dbo].[tblStatus] ([StatusID], [StatusName]) VALUES (1, N'Active')
INSERT [dbo].[tblStatus] ([StatusID], [StatusName]) VALUES (2, N'Inactive')
INSERT [dbo].[tblStatus] ([StatusID], [StatusName]) VALUES (3, N'Banned')
INSERT [dbo].[tblStatus] ([StatusID], [StatusName]) VALUES (4, N'Pending')
INSERT [dbo].[tblStatus] ([StatusID], [StatusName]) VALUES (5, N'Available')
INSERT [dbo].[tblStatus] ([StatusID], [StatusName]) VALUES (6, N'Unavailable')
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblPost] FOREIGN KEY([PostID])
REFERENCES [dbo].[tblPost] ([PostID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblPost]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblStatus]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblUser] FOREIGN KEY([UserCommentID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblUser]
GO
ALTER TABLE [dbo].[tblCommentReply]  WITH CHECK ADD  CONSTRAINT [FK_tblCommentReply_tblComment] FOREIGN KEY([CommentID])
REFERENCES [dbo].[tblComment] ([CommentID])
GO
ALTER TABLE [dbo].[tblCommentReply] CHECK CONSTRAINT [FK_tblCommentReply_tblComment]
GO
ALTER TABLE [dbo].[tblCommentReply]  WITH CHECK ADD  CONSTRAINT [FK_tblCommentReply_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblCommentReply] CHECK CONSTRAINT [FK_tblCommentReply_tblStatus]
GO
ALTER TABLE [dbo].[tblCommentReply]  WITH CHECK ADD  CONSTRAINT [FK_tblCommentReply_tblUser] FOREIGN KEY([UserReplyID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblCommentReply] CHECK CONSTRAINT [FK_tblCommentReply_tblUser]
GO
ALTER TABLE [dbo].[tblGroup]  WITH CHECK ADD  CONSTRAINT [FK_tblGroup_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblGroup] CHECK CONSTRAINT [FK_tblGroup_tblStatus]
GO
ALTER TABLE [dbo].[tblGroup]  WITH CHECK ADD  CONSTRAINT [FK_tblGroup_tblUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblGroup] CHECK CONSTRAINT [FK_tblGroup_tblUser]
GO
ALTER TABLE [dbo].[tblGroupUser]  WITH CHECK ADD  CONSTRAINT [FK_tblGroupUser_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblGroupUser] CHECK CONSTRAINT [FK_tblGroupUser_tblStatus]
GO
ALTER TABLE [dbo].[tblGroupUser]  WITH CHECK ADD  CONSTRAINT [FK_tblGroupUser_tblUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblGroupUser] CHECK CONSTRAINT [FK_tblGroupUser_tblUser]
GO
ALTER TABLE [dbo].[tblLike]  WITH CHECK ADD  CONSTRAINT [FK_tblLike_tblPost] FOREIGN KEY([PostID])
REFERENCES [dbo].[tblPost] ([PostID])
GO
ALTER TABLE [dbo].[tblLike] CHECK CONSTRAINT [FK_tblLike_tblPost]
GO
ALTER TABLE [dbo].[tblLike]  WITH CHECK ADD  CONSTRAINT [FK_tblLike_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblLike] CHECK CONSTRAINT [FK_tblLike_tblStatus]
GO
ALTER TABLE [dbo].[tblLike]  WITH CHECK ADD  CONSTRAINT [FK_tblLike_tblUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUser] ([UserID])
GO
ALTER TABLE [dbo].[tblLike] CHECK CONSTRAINT [FK_tblLike_tblUser]
GO
ALTER TABLE [dbo].[tblPost]  WITH CHECK ADD  CONSTRAINT [FK_tblPost_tblGroup] FOREIGN KEY([GroupPostID])
REFERENCES [dbo].[tblGroup] ([GroupID])
GO
ALTER TABLE [dbo].[tblPost] CHECK CONSTRAINT [FK_tblPost_tblGroup]
GO
ALTER TABLE [dbo].[tblPost]  WITH CHECK ADD  CONSTRAINT [FK_tblPost_tblPostType] FOREIGN KEY([PostTypeID])
REFERENCES [dbo].[tblPostType] ([PostTypeID])
GO
ALTER TABLE [dbo].[tblPost] CHECK CONSTRAINT [FK_tblPost_tblPostType]
GO
ALTER TABLE [dbo].[tblPost]  WITH CHECK ADD  CONSTRAINT [FK_tblPost_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusID])
GO
ALTER TABLE [dbo].[tblPost] CHECK CONSTRAINT [FK_tblPost_tblStatus]
GO
ALTER TABLE [dbo].[tblPost]  WITH CHECK ADD  CONSTRAINT [FK_tblPost_tblUser] FOREIGN KEY([UserPostID])
REFERENCES [dbo].[tblUser] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPost] CHECK CONSTRAINT [FK_tblPost_tblUser]
GO
ALTER TABLE [dbo].[tblPostType]  WITH CHECK ADD  CONSTRAINT [FK_tblPostType_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPostType] CHECK CONSTRAINT [FK_tblPostType_tblStatus]
GO
ALTER TABLE [dbo].[tblRole]  WITH CHECK ADD  CONSTRAINT [FK_tblRole_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblRole] CHECK CONSTRAINT [FK_tblRole_tblStatus]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole1] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblRole] ([RoleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole1]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[tblStatus] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblStatus]
GO
USE [master]
GO
ALTER DATABASE [department_db] SET  READ_WRITE 
GO
