USE [master]
GO
/****** Object:  Database [department_db_v1]    Script Date: 7/12/2022 9:05:15 AM ******/
CREATE DATABASE [department_db_v1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'department_db_v1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\department_db_v1.mdf' , SIZE = 8384KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'department_db_v1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\department_db_v1_log.ldf' , SIZE = 6400KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [department_db_v1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [department_db_v1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [department_db_v1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [department_db_v1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [department_db_v1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [department_db_v1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [department_db_v1] SET ARITHABORT OFF 
GO
ALTER DATABASE [department_db_v1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [department_db_v1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [department_db_v1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [department_db_v1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [department_db_v1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [department_db_v1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [department_db_v1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [department_db_v1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [department_db_v1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [department_db_v1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [department_db_v1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [department_db_v1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [department_db_v1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [department_db_v1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [department_db_v1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [department_db_v1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [department_db_v1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [department_db_v1] SET RECOVERY FULL 
GO
ALTER DATABASE [department_db_v1] SET  MULTI_USER 
GO
ALTER DATABASE [department_db_v1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [department_db_v1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [department_db_v1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [department_db_v1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [department_db_v1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'department_db_v1', N'ON'
GO
USE [department_db_v1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/12/2022 9:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CommentReplies]    Script Date: 7/12/2022 9:05:15 AM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 7/12/2022 9:05:15 AM ******/
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
/****** Object:  Table [dbo].[Groups]    Script Date: 7/12/2022 9:05:15 AM ******/
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
/****** Object:  Table [dbo].[GroupUsers]    Script Date: 7/12/2022 9:05:15 AM ******/
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
/****** Object:  Table [dbo].[Likes]    Script Date: 7/12/2022 9:05:15 AM ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 7/12/2022 9:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [uniqueidentifier] NOT NULL,
	[UserPostID] [uniqueidentifier] NOT NULL,
	[GroupPostID] [uniqueidentifier] NULL,
	[PostTypeID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[LikesTotal] [int] NOT NULL CONSTRAINT [default_LikesTotal]  DEFAULT ((0)),
	[CommentsTotal] [int] NOT NULL CONSTRAINT [default_CommentsTotal]  DEFAULT ((0)),
	[Views] [int] NOT NULL,
	[Tags] [nvarchar](100) NOT NULL,
	[PostContent] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModified] [datetime] NULL,
	[ApprovedDate] [datetime] NULL,
	[Reason] [nvarchar](250) NULL,
	[NewContent] [nvarchar](max) NULL,
	[NewTitle] [nvarchar](200) NULL,
	[NewTags] [nvarchar](100) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_tblPost] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostTypes]    Script Date: 7/12/2022 9:05:15 AM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 7/12/2022 9:05:15 AM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 7/12/2022 9:05:15 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 7/12/2022 9:05:15 AM ******/
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
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [CK__Posts__CommentsT__6DCC4D03] CHECK  (([commentstotal]>=(0)))
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [CK__Posts__CommentsT__6DCC4D03]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [CK__Posts__LikesTota__6CD828CA] CHECK  (([likestotal]>=(0)))
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [CK__Posts__LikesTota__6CD828CA]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [CK__Posts__Views__55F4C372] CHECK  (([views]>=(0)))
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [CK__Posts__Views__55F4C372]
GO
USE [master]
GO
ALTER DATABASE [department_db_v1] SET  READ_WRITE 
GO
