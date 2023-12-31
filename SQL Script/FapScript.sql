USE [master]
GO
/****** Object:  Database [PRN231_Project]    Script Date: 15/11/2023 4:28:41 am ******/
CREATE DATABASE [PRN231_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRN231_Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PRN231_Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRN231_Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PRN231_Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PRN231_Project] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN231_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRN231_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRN231_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRN231_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRN231_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRN231_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRN231_Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRN231_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRN231_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRN231_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRN231_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRN231_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRN231_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRN231_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRN231_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRN231_Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRN231_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRN231_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRN231_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRN231_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRN231_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRN231_Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRN231_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRN231_Project] SET RECOVERY FULL 
GO
ALTER DATABASE [PRN231_Project] SET  MULTI_USER 
GO
ALTER DATABASE [PRN231_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRN231_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRN231_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRN231_Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRN231_Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRN231_Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRN231_Project', N'ON'
GO
ALTER DATABASE [PRN231_Project] SET QUERY_STORE = ON
GO
ALTER DATABASE [PRN231_Project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PRN231_Project]
GO
/****** Object:  Table [dbo].[Campus]    Script Date: 15/11/2023 4:28:42 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Campus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 15/11/2023 4:28:42 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nchar](10) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassStudent]    Script Date: 15/11/2023 4:28:42 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassStudent](
	[ClassId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
 CONSTRAINT [PK_ClassStudent] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 15/11/2023 4:28:42 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [nchar](10) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseTeacher]    Script Date: 15/11/2023 4:28:42 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseTeacher](
	[CourseId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_CourseTeacher] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 15/11/2023 4:28:42 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 15/11/2023 4:28:42 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 15/11/2023 4:28:42 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TimeId] [int] NULL,
	[RoomId] [int] NULL,
	[MeetURL] [nvarchar](50) NULL,
	[EduNext] [nvarchar](50) NULL,
	[CourseId] [int] NULL,
	[TeacherId] [int] NULL,
	[ClassId] [int] NULL,
	[Week] [date] NULL,
	[ValiCode] [varchar](50) NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlotTime]    Script Date: 15/11/2023 4:28:42 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotTime](
	[Id] [int] NOT NULL,
	[StartTime] [time](0) NULL,
	[EndTime] [time](0) NULL,
 CONSTRAINT [PK_SlotTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Testing]    Script Date: 15/11/2023 4:28:42 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Testing](
	[Slot] [int] NULL,
	[Room] [int] NULL,
	[Code] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15/11/2023 4:28:42 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Uid] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Code] [nchar](30) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](16) NULL,
	[Phone] [nchar](10) NULL,
	[CampusId] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Campus] ON 

INSERT [dbo].[Campus] ([Id], [Name]) VALUES (1, N'FPTU-Hola')
INSERT [dbo].[Campus] ([Id], [Name]) VALUES (2, N'FPTU-Xavalo')
INSERT [dbo].[Campus] ([Id], [Name]) VALUES (3, N'FPTU-Fuda')
INSERT [dbo].[Campus] ([Id], [Name]) VALUES (4, N'FPTU-Hovilo')
SET IDENTITY_INSERT [dbo].[Campus] OFF
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([Id], [Code]) VALUES (1, N'Se1618    ')
INSERT [dbo].[Class] ([Id], [Code]) VALUES (2, N'Se1619    ')
INSERT [dbo].[Class] ([Id], [Code]) VALUES (3, N'Se1620    ')
INSERT [dbo].[Class] ([Id], [Code]) VALUES (4, N'Gd1608    ')
INSERT [dbo].[Class] ([Id], [Code]) VALUES (5, N'Gd1609    ')
INSERT [dbo].[Class] ([Id], [Code]) VALUES (6, N'Gd1610    ')
INSERT [dbo].[Class] ([Id], [Code]) VALUES (7, N'Gd1611    ')
INSERT [dbo].[Class] ([Id], [Code]) VALUES (8, N'Se1621    ')
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (1, 5)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (1, 7)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (2, 13)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (2, 14)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (2, 15)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (3, 16)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (3, 17)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (3, 18)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (3, 19)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (4, 5)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (4, 7)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (5, 13)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (5, 14)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (5, 15)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (6, 16)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (6, 17)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (6, 18)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (6, 19)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (7, 20)
INSERT [dbo].[ClassStudent] ([ClassId], [StudentId]) VALUES (8, 20)
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Name], [Code]) VALUES (1, N'Object-Oriented Programming', N'PRO192    ')
INSERT [dbo].[Course] ([Id], [Name], [Code]) VALUES (3, N'Basic Programming With .NET', N'PRN211    ')
INSERT [dbo].[Course] ([Id], [Name], [Code]) VALUES (5, N'Building Cross-Platform Back-End With .NET', N'PRN231    ')
INSERT [dbo].[Course] ([Id], [Name], [Code]) VALUES (6, N'Political economics of Marxism – Leninism', N'MLN122    ')
INSERT [dbo].[Course] ([Id], [Name], [Code]) VALUES (7, N'Philosophy of Marxism – Leninism', N'MLN111    ')
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
INSERT [dbo].[CourseTeacher] ([CourseId], [TeacherId]) VALUES (1, 4)
INSERT [dbo].[CourseTeacher] ([CourseId], [TeacherId]) VALUES (3, 4)
INSERT [dbo].[CourseTeacher] ([CourseId], [TeacherId]) VALUES (5, 4)
INSERT [dbo].[CourseTeacher] ([CourseId], [TeacherId]) VALUES (6, 10)
INSERT [dbo].[CourseTeacher] ([CourseId], [TeacherId]) VALUES (7, 10)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Type]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Type]) VALUES (2, N'Teacher')
INSERT [dbo].[Role] ([Id], [Type]) VALUES (3, N'Student')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [Name]) VALUES (1, N'DE-201    ')
INSERT [dbo].[Room] ([Id], [Name]) VALUES (2, N'DE-202    ')
INSERT [dbo].[Room] ([Id], [Name]) VALUES (3, N'DE-203    ')
INSERT [dbo].[Room] ([Id], [Name]) VALUES (4, N'DE-204    ')
INSERT [dbo].[Room] ([Id], [Name]) VALUES (5, N'DE-205    ')
INSERT [dbo].[Room] ([Id], [Name]) VALUES (6, N'DE-206    ')
INSERT [dbo].[Room] ([Id], [Name]) VALUES (7, N'DE-207    ')
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[Slot] ON 

INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (1, 1, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-10-02' AS Date), N'S1_R1_D2_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (2, 2, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-10-04' AS Date), N'S2_R1_D4_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (3, 1, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-10-09' AS Date), N'S1_R1_D2_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (4, 2, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-10-11' AS Date), N'S2_R1_D4_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (5, 1, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-10-16' AS Date), N'S1_R1_D2_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (6, 2, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-10-18' AS Date), N'S2_R1_D4_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (7, 1, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-10-23' AS Date), N'S1_R1_D2_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (8, 2, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-10-25' AS Date), N'S2_R1_D4_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (9, 1, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-10-30' AS Date), N'S1_R1_D2_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (10, 2, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-11-01' AS Date), N'S2_R1_D4_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (11, 1, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-11-06' AS Date), N'S1_R1_D2_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (12, 2, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-11-08' AS Date), N'S2_R1_D4_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (13, 1, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-11-13' AS Date), N'S1_R1_D2_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (14, 2, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-11-15' AS Date), N'S2_R1_D4_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (15, 1, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-11-20' AS Date), N'S1_R1_D2_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (16, 2, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-11-22' AS Date), N'S2_R1_D4_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (17, 1, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-11-27' AS Date), N'S1_R1_D2_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (18, 2, 1, NULL, NULL, 6, 10, 4, CAST(N'2023-11-29' AS Date), N'S2_R1_D4_C4_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (28, 2, 1, N'', N'', 7, 10, 5, CAST(N'2023-10-02' AS Date), N'S2_R1_D2_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (29, 2, 1, N'', N'', 7, 10, 5, CAST(N'2023-10-09' AS Date), N'S2_R1_D2_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (30, 2, 1, N'', N'', 7, 10, 5, CAST(N'2023-10-16' AS Date), N'S2_R1_D2_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (31, 2, 1, N'', N'', 7, 10, 5, CAST(N'2023-10-23' AS Date), N'S2_R1_D2_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (32, 2, 1, N'', N'', 7, 10, 5, CAST(N'2023-10-30' AS Date), N'S2_R1_D2_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (33, 2, 1, N'', N'', 7, 10, 5, CAST(N'2023-11-06' AS Date), N'S2_R1_D2_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (34, 2, 1, N'', N'', 7, 10, 5, CAST(N'2023-11-13' AS Date), N'S2_R1_D2_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (35, 2, 1, N'', N'', 7, 10, 5, CAST(N'2023-11-20' AS Date), N'S2_R1_D2_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (36, 2, 1, N'', N'', 7, 10, 5, CAST(N'2023-11-27' AS Date), N'S2_R1_D2_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (37, 1, 1, N'', N'', 7, 10, 5, CAST(N'2023-10-04' AS Date), N'S1_R1_D4_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (38, 1, 1, N'', N'', 7, 10, 5, CAST(N'2023-10-11' AS Date), N'S1_R1_D4_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (39, 1, 1, N'', N'', 7, 10, 5, CAST(N'2023-10-18' AS Date), N'S1_R1_D4_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (40, 1, 1, N'', N'', 7, 10, 5, CAST(N'2023-10-25' AS Date), N'S1_R1_D4_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (41, 1, 1, N'', N'', 7, 10, 5, CAST(N'2023-11-01' AS Date), N'S1_R1_D4_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (42, 1, 1, N'', N'', 7, 10, 5, CAST(N'2023-11-08' AS Date), N'S1_R1_D4_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (43, 1, 1, N'', N'', 7, 10, 5, CAST(N'2023-11-15' AS Date), N'S1_R1_D4_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (44, 1, 1, N'', N'', 7, 10, 5, CAST(N'2023-11-22' AS Date), N'S1_R1_D4_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (45, 1, 1, N'', N'', 7, 10, 5, CAST(N'2023-11-29' AS Date), N'S1_R1_D4_C5_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (46, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-10-03' AS Date), N'S2_R2_D3_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (47, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-10-10' AS Date), N'S2_R2_D3_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (48, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-10-17' AS Date), N'S2_R2_D3_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (49, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-10-24' AS Date), N'S2_R2_D3_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (50, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-10-31' AS Date), N'S2_R2_D3_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (51, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-11-07' AS Date), N'S2_R2_D3_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (52, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-11-14' AS Date), N'S2_R2_D3_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (53, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-11-21' AS Date), N'S2_R2_D3_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (54, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-11-28' AS Date), N'S2_R2_D3_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (55, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-10-05' AS Date), N'S2_R2_D5_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (56, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-10-12' AS Date), N'S2_R2_D5_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (57, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-10-19' AS Date), N'S2_R2_D5_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (58, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-10-26' AS Date), N'S2_R2_D5_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (59, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-11-02' AS Date), N'S2_R2_D5_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (60, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-11-09' AS Date), N'S2_R2_D5_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (61, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-11-16' AS Date), N'S2_R2_D5_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (62, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-11-23' AS Date), N'S2_R2_D5_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (63, 2, 2, N'', N'', 6, 10, 6, CAST(N'2023-11-30' AS Date), N'S2_R2_D5_C6_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (64, 3, 2, N'', N'', 7, 10, 7, CAST(N'2023-10-05' AS Date), N'S3_R2_D5_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (65, 3, 2, N'', N'', 7, 10, 7, CAST(N'2023-10-12' AS Date), N'S3_R2_D5_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (66, 3, 2, N'', N'', 7, 10, 7, CAST(N'2023-10-19' AS Date), N'S3_R2_D5_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (67, 3, 2, N'', N'', 7, 10, 7, CAST(N'2023-10-26' AS Date), N'S3_R2_D5_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (68, 3, 2, N'', N'', 7, 10, 7, CAST(N'2023-11-02' AS Date), N'S3_R2_D5_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (69, 3, 2, N'', N'', 7, 10, 7, CAST(N'2023-11-09' AS Date), N'S3_R2_D5_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (70, 3, 2, N'', N'', 7, 10, 7, CAST(N'2023-11-16' AS Date), N'S3_R2_D5_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (71, 3, 2, N'', N'', 7, 10, 7, CAST(N'2023-11-23' AS Date), N'S3_R2_D5_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (72, 3, 2, N'', N'', 7, 10, 7, CAST(N'2023-11-30' AS Date), N'S3_R2_D5_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (73, 1, 2, N'', N'', 7, 10, 7, CAST(N'2023-10-06' AS Date), N'S1_R2_D6_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (74, 1, 2, N'', N'', 7, 10, 7, CAST(N'2023-10-13' AS Date), N'S1_R2_D6_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (75, 1, 2, N'', N'', 7, 10, 7, CAST(N'2023-10-20' AS Date), N'S1_R2_D6_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (76, 1, 2, N'', N'', 7, 10, 7, CAST(N'2023-10-27' AS Date), N'S1_R2_D6_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (77, 1, 2, N'', N'', 7, 10, 7, CAST(N'2023-11-03' AS Date), N'S1_R2_D6_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (78, 1, 2, N'', N'', 7, 10, 7, CAST(N'2023-11-10' AS Date), N'S1_R2_D6_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (79, 1, 2, N'', N'', 7, 10, 7, CAST(N'2023-11-17' AS Date), N'S1_R2_D6_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (80, 1, 2, N'', N'', 7, 10, 7, CAST(N'2023-11-24' AS Date), N'S1_R2_D6_C7_T10')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (81, 1, 3, N'', N'', 1, 4, 3, CAST(N'2023-10-02' AS Date), N'S1_R3_D2_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (82, 1, 3, N'', N'', 1, 4, 3, CAST(N'2023-10-09' AS Date), N'S1_R3_D2_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (83, 1, 3, N'', N'', 1, 4, 3, CAST(N'2023-10-16' AS Date), N'S1_R3_D2_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (84, 1, 3, N'', N'', 1, 4, 3, CAST(N'2023-10-23' AS Date), N'S1_R3_D2_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (85, 1, 3, N'', N'', 1, 4, 3, CAST(N'2023-10-30' AS Date), N'S1_R3_D2_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (86, 1, 3, N'', N'', 1, 4, 3, CAST(N'2023-11-06' AS Date), N'S1_R3_D2_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (87, 1, 3, N'', N'', 1, 4, 3, CAST(N'2023-11-13' AS Date), N'S1_R3_D2_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (88, 1, 3, N'', N'', 1, 4, 3, CAST(N'2023-11-20' AS Date), N'S1_R3_D2_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (89, 1, 3, N'', N'', 1, 4, 3, CAST(N'2023-11-27' AS Date), N'S1_R3_D2_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (90, 2, 3, N'', N'', 1, 4, 3, CAST(N'2023-10-04' AS Date), N'S2_R3_D4_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (91, 2, 3, N'', N'', 1, 4, 3, CAST(N'2023-10-11' AS Date), N'S2_R3_D4_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (92, 2, 3, N'', N'', 1, 4, 3, CAST(N'2023-10-18' AS Date), N'S2_R3_D4_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (93, 2, 3, N'', N'', 1, 4, 3, CAST(N'2023-10-25' AS Date), N'S2_R3_D4_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (94, 2, 3, N'', N'', 1, 4, 3, CAST(N'2023-11-01' AS Date), N'S2_R3_D4_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (95, 2, 3, N'', N'', 1, 4, 3, CAST(N'2023-11-08' AS Date), N'S2_R3_D4_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (96, 2, 3, N'', N'', 1, 4, 3, CAST(N'2023-11-15' AS Date), N'S2_R3_D4_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (97, 2, 3, N'', N'', 1, 4, 3, CAST(N'2023-11-22' AS Date), N'S2_R3_D4_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (98, 2, 3, N'', N'', 1, 4, 3, CAST(N'2023-11-29' AS Date), N'S2_R3_D4_C3_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (99, 2, 4, N'', N'', 5, 4, 1, CAST(N'2023-10-02' AS Date), N'S2_R4_D2_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (100, 2, 4, N'', N'', 5, 4, 1, CAST(N'2023-10-09' AS Date), N'S2_R4_D2_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (101, 2, 4, N'', N'', 5, 4, 1, CAST(N'2023-10-16' AS Date), N'S2_R4_D2_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (102, 2, 4, N'', N'', 5, 4, 1, CAST(N'2023-10-23' AS Date), N'S2_R4_D2_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (103, 2, 4, N'', N'', 5, 4, 1, CAST(N'2023-10-30' AS Date), N'S2_R4_D2_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (104, 2, 4, N'', N'', 5, 4, 1, CAST(N'2023-11-06' AS Date), N'S2_R4_D2_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (105, 2, 4, N'', N'', 5, 4, 1, CAST(N'2023-11-13' AS Date), N'S2_R4_D2_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (106, 2, 4, N'', N'', 5, 4, 1, CAST(N'2023-11-20' AS Date), N'S2_R4_D2_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (107, 2, 4, N'', N'', 5, 4, 1, CAST(N'2023-11-27' AS Date), N'S2_R4_D2_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (108, 1, 4, N'', N'', 5, 4, 1, CAST(N'2023-10-04' AS Date), N'S1_R4_D4_C1_T4')
GO
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (109, 1, 4, N'', N'', 5, 4, 1, CAST(N'2023-10-11' AS Date), N'S1_R4_D4_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (110, 1, 4, N'', N'', 5, 4, 1, CAST(N'2023-10-18' AS Date), N'S1_R4_D4_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (111, 1, 4, N'', N'', 5, 4, 1, CAST(N'2023-10-25' AS Date), N'S1_R4_D4_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (112, 1, 4, N'', N'', 5, 4, 1, CAST(N'2023-11-01' AS Date), N'S1_R4_D4_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (113, 1, 4, N'', N'', 5, 4, 1, CAST(N'2023-11-08' AS Date), N'S1_R4_D4_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (114, 1, 4, N'', N'', 5, 4, 1, CAST(N'2023-11-15' AS Date), N'S1_R4_D4_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (115, 1, 4, N'', N'', 5, 4, 1, CAST(N'2023-11-22' AS Date), N'S1_R4_D4_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (116, 1, 4, N'', N'', 5, 4, 1, CAST(N'2023-11-29' AS Date), N'S1_R4_D4_C1_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (117, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-10-03' AS Date), N'S1_R3_D3_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (118, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-10-10' AS Date), N'S1_R3_D3_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (119, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-10-17' AS Date), N'S1_R3_D3_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (120, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-10-24' AS Date), N'S1_R3_D3_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (121, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-10-31' AS Date), N'S1_R3_D3_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (122, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-11-07' AS Date), N'S1_R3_D3_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (123, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-11-14' AS Date), N'S1_R3_D3_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (124, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-11-21' AS Date), N'S1_R3_D3_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (125, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-11-28' AS Date), N'S1_R3_D3_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (126, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-10-05' AS Date), N'S1_R3_D5_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (127, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-10-12' AS Date), N'S1_R3_D5_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (128, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-10-19' AS Date), N'S1_R3_D5_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (129, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-10-26' AS Date), N'S1_R3_D5_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (130, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-11-02' AS Date), N'S1_R3_D5_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (131, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-11-09' AS Date), N'S1_R3_D5_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (132, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-11-16' AS Date), N'S1_R3_D5_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (133, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-11-23' AS Date), N'S1_R3_D5_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (134, 1, 3, N'', N'', 3, 4, 2, CAST(N'2023-11-30' AS Date), N'S1_R3_D5_C2_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (135, 3, 4, N'', N'', 1, 4, 8, CAST(N'2023-10-03' AS Date), N'S3_R4_D3_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (136, 3, 4, N'', N'', 1, 4, 8, CAST(N'2023-10-10' AS Date), N'S3_R4_D3_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (137, 3, 4, N'', N'', 1, 4, 8, CAST(N'2023-10-17' AS Date), N'S3_R4_D3_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (138, 3, 4, N'', N'', 1, 4, 8, CAST(N'2023-10-24' AS Date), N'S3_R4_D3_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (139, 3, 4, N'', N'', 1, 4, 8, CAST(N'2023-10-31' AS Date), N'S3_R4_D3_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (140, 3, 4, N'', N'', 1, 4, 8, CAST(N'2023-11-07' AS Date), N'S3_R4_D3_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (141, 3, 4, N'', N'', 1, 4, 8, CAST(N'2023-11-14' AS Date), N'S3_R4_D3_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (142, 3, 4, N'', N'', 1, 4, 8, CAST(N'2023-11-21' AS Date), N'S3_R4_D3_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (143, 3, 4, N'', N'', 1, 4, 8, CAST(N'2023-11-28' AS Date), N'S3_R4_D3_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (144, 2, 4, N'', N'', 1, 4, 8, CAST(N'2023-10-06' AS Date), N'S2_R4_D6_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (145, 2, 4, N'', N'', 1, 4, 8, CAST(N'2023-10-13' AS Date), N'S2_R4_D6_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (146, 2, 4, N'', N'', 1, 4, 8, CAST(N'2023-10-20' AS Date), N'S2_R4_D6_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (147, 2, 4, N'', N'', 1, 4, 8, CAST(N'2023-10-27' AS Date), N'S2_R4_D6_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (148, 2, 4, N'', N'', 1, 4, 8, CAST(N'2023-11-03' AS Date), N'S2_R4_D6_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (149, 2, 4, N'', N'', 1, 4, 8, CAST(N'2023-11-10' AS Date), N'S2_R4_D6_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (150, 2, 4, N'', N'', 1, 4, 8, CAST(N'2023-11-17' AS Date), N'S2_R4_D6_C8_T4')
INSERT [dbo].[Slot] ([Id], [TimeId], [RoomId], [MeetURL], [EduNext], [CourseId], [TeacherId], [ClassId], [Week], [ValiCode]) VALUES (151, 2, 4, N'', N'', 1, 4, 8, CAST(N'2023-11-24' AS Date), N'S2_R4_D6_C8_T4')
SET IDENTITY_INSERT [dbo].[Slot] OFF
GO
INSERT [dbo].[SlotTime] ([Id], [StartTime], [EndTime]) VALUES (1, CAST(N'07:30:00' AS Time), CAST(N'09:50:00' AS Time))
INSERT [dbo].[SlotTime] ([Id], [StartTime], [EndTime]) VALUES (2, CAST(N'10:00:00' AS Time), CAST(N'12:20:00' AS Time))
INSERT [dbo].[SlotTime] ([Id], [StartTime], [EndTime]) VALUES (3, CAST(N'12:50:00' AS Time), CAST(N'15:10:00' AS Time))
INSERT [dbo].[SlotTime] ([Id], [StartTime], [EndTime]) VALUES (4, CAST(N'15:20:00' AS Time), CAST(N'17:40:00' AS Time))
INSERT [dbo].[SlotTime] ([Id], [StartTime], [EndTime]) VALUES (5, NULL, NULL)
INSERT [dbo].[SlotTime] ([Id], [StartTime], [EndTime]) VALUES (6, NULL, NULL)
GO
INSERT [dbo].[Testing] ([Slot], [Room], [Code]) VALUES (1, 2, N'1,2')
INSERT [dbo].[Testing] ([Slot], [Room], [Code]) VALUES (2, 2, N'2 , 2')
INSERT [dbo].[Testing] ([Slot], [Room], [Code]) VALUES (1, 3, N'1 , 3')
INSERT [dbo].[Testing] ([Slot], [Room], [Code]) VALUES (2, 3, N'2 , 3')
INSERT [dbo].[Testing] ([Slot], [Room], [Code]) VALUES (1, 4, N'1 , 4')
INSERT [dbo].[Testing] ([Slot], [Room], [Code]) VALUES (2, 4, N'2 , 4')
INSERT [dbo].[Testing] ([Slot], [Room], [Code]) VALUES (3, 4, N'3 , 4')
INSERT [dbo].[Testing] ([Slot], [Room], [Code]) VALUES (4, 4, N'4 , 4')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Uid], [FullName], [Code], [Email], [Password], [Phone], [CampusId], [Image], [RoleId]) VALUES (2, N'Le Tuan Dung', N'admin1                        ', N'dung2002ss@gmail.com', N'111111', N'0964110602', 1, NULL, 1)
INSERT [dbo].[User] ([Uid], [FullName], [Code], [Email], [Password], [Phone], [CampusId], [Image], [RoleId]) VALUES (4, N'Ta Dinh Tien', N'tientd17                      ', N'abc@gmail.com', N'111111', N'0123456789', 1, NULL, 2)
INSERT [dbo].[User] ([Uid], [FullName], [Code], [Email], [Password], [Phone], [CampusId], [Image], [RoleId]) VALUES (5, N'Le Tuan Dung', N'dunglthe163788                ', N'dunglthe163788@fpt.edu.vn', N'111111', N'0123456789', 1, NULL, 3)
INSERT [dbo].[User] ([Uid], [FullName], [Code], [Email], [Password], [Phone], [CampusId], [Image], [RoleId]) VALUES (6, N'Pham Chu Duong', N'duongpche163153               ', N'duongpche163153@fpt.edu.vn', N'111111', N'0123456789', 2, NULL, 3)
INSERT [dbo].[User] ([Uid], [FullName], [Code], [Email], [Password], [Phone], [CampusId], [Image], [RoleId]) VALUES (7, N'Nguyen Hung Phong', N'phongnhhe163436               ', N'phongnhhe163436@fpt.edu.vn', N'111111', N'0123456789', 1, NULL, 3)
INSERT [dbo].[User] ([Uid], [FullName], [Code], [Email], [Password], [Phone], [CampusId], [Image], [RoleId]) VALUES (10, N'Le Trung Kien', N'kienlt10                      ', N'abc223@gmail.com', N'111111', N'0123456789', 1, NULL, 2)
INSERT [dbo].[User] ([Uid], [FullName], [Code], [Email], [Password], [Phone], [CampusId], [Image], [RoleId]) VALUES (13, N'Nguyen Hoai Giang', N'giangnhhe160432               ', N'giangnhhe160432@fpt.edu.vn', N'111111', N'0123456789', 1, NULL, 3)
INSERT [dbo].[User] ([Uid], [FullName], [Code], [Email], [Password], [Phone], [CampusId], [Image], [RoleId]) VALUES (14, N'Hoang Dinh Nghia', N'nghiahdhe163225               ', N'nghiahdhe163225@fpt.edu.vn', N'111111', N'0123456789', 1, NULL, 3)
INSERT [dbo].[User] ([Uid], [FullName], [Code], [Email], [Password], [Phone], [CampusId], [Image], [RoleId]) VALUES (15, N'Dao Nhat Cuong', N'cuongdnhe163999               ', N'cuongdnhe163999@fpt.edu.vn', N'111111', N'0123456789', 1, NULL, 3)
INSERT [dbo].[User] ([Uid], [FullName], [Code], [Email], [Password], [Phone], [CampusId], [Image], [RoleId]) VALUES (16, N'Hua Hoai Linh', N'linhhhhs150072                ', N'linhhhhs150072@fpt.edu.vn', N'111111', N'0123456789', 1, NULL, 3)
INSERT [dbo].[User] ([Uid], [FullName], [Code], [Email], [Password], [Phone], [CampusId], [Image], [RoleId]) VALUES (17, N'Nguyen Dieu Linh', N'linhndhs150353                ', N'linhndhs150353@fpt.edu.vn', N'111111', N'0123456789', 1, NULL, 3)
INSERT [dbo].[User] ([Uid], [FullName], [Code], [Email], [Password], [Phone], [CampusId], [Image], [RoleId]) VALUES (18, N'Truong Thi Khanh', N'khanhtths150606               ', N'khanhtths150606@fpt.edu.vn', N'111111', N'0123456789', 1, NULL, 3)
INSERT [dbo].[User] ([Uid], [FullName], [Code], [Email], [Password], [Phone], [CampusId], [Image], [RoleId]) VALUES (19, N'Pham Quynh Anh', N'anhpqhs150671                 ', N'anhpqhs150671@fpt.edu.vn', N'111111', N'0123456789', 1, NULL, 3)
INSERT [dbo].[User] ([Uid], [FullName], [Code], [Email], [Password], [Phone], [CampusId], [Image], [RoleId]) VALUES (20, N'Nguyen Tung Minh', N'minhnths153171                ', N'minhnths153171@fpt.edu.vn', N'111111', N'0123456789', 1, NULL, 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[ClassStudent]  WITH CHECK ADD  CONSTRAINT [FK_ClassStudent_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[ClassStudent] CHECK CONSTRAINT [FK_ClassStudent_Class]
GO
ALTER TABLE [dbo].[ClassStudent]  WITH CHECK ADD  CONSTRAINT [FK_ClassStudent_User] FOREIGN KEY([StudentId])
REFERENCES [dbo].[User] ([Uid])
GO
ALTER TABLE [dbo].[ClassStudent] CHECK CONSTRAINT [FK_ClassStudent_User]
GO
ALTER TABLE [dbo].[CourseTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseTeacher_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[CourseTeacher] CHECK CONSTRAINT [FK_CourseTeacher_Course]
GO
ALTER TABLE [dbo].[CourseTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseTeacher_User] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[User] ([Uid])
GO
ALTER TABLE [dbo].[CourseTeacher] CHECK CONSTRAINT [FK_CourseTeacher_User]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_Class]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_Course]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_Room]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_SlotTime] FOREIGN KEY([TimeId])
REFERENCES [dbo].[SlotTime] ([Id])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_SlotTime]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD  CONSTRAINT [FK_Slot_User] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[User] ([Uid])
GO
ALTER TABLE [dbo].[Slot] CHECK CONSTRAINT [FK_Slot_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Campus] FOREIGN KEY([CampusId])
REFERENCES [dbo].[Campus] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Campus]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [PRN231_Project] SET  READ_WRITE 
GO
