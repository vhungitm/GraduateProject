USE [GraduateProject]
GO
/****** Object:  Table [dbo].[Assembly]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assembly](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Assembly] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssemblyDetail]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssemblyDetail](
	[AssemblyId] [bigint] NOT NULL,
	[LecturerId] [char](10) NOT NULL,
	[Permission] [int] NULL,
	[Point] [float] NULL,
 CONSTRAINT [PK_AssemblyDetail] PRIMARY KEY CLUSTERED 
(
	[AssemblyId] ASC,
	[LecturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branch](
	[Id] [char](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FacultyId] [char](10) NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Class]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Class](
	[Id] [char](10) NOT NULL,
	[BranchId] [char](10) NOT NULL,
	[Size] [int] NOT NULL,
	[TrainingSystemId] [char](4) NOT NULL,
	[CollegeYear] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Faculty](
	[Id] [char](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Falcuty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lecturer](
	[Id] [char](10) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Avatar] [varchar](200) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[BranchId] [char](10) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[TypeId] [bigint] NOT NULL,
	[StudentId] [char](13) NOT NULL,
	[LecturerId] [char](10) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[SubmissionDate] [datetime] NULL,
	[Submission] [varchar](200) NULL,
	[Point] [float] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectStage]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectStage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Intent] [ntext] NOT NULL,
	[Request] [ntext] NOT NULL,
	[SubmissionDate] [datetime] NULL,
	[Submission] [varchar](200) NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK_Stage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectType]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeProject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [char](13) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Avatar] [varchar](200) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](5) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ClassId] [char](10) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrainingSystem]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrainingSystem](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TranningSystem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Assembly] ([Id], [Name], [CreatedDate]) VALUES (126, N'Hội Đồng KTPM 2021', CAST(N'2021-04-07 00:02:15.853' AS DateTime))
INSERT [dbo].[Assembly] ([Id], [Name], [CreatedDate]) VALUES (127, N'Hội Đồng KTPM 2021', CAST(N'2021-04-06 23:32:46.030' AS DateTime))
INSERT [dbo].[Assembly] ([Id], [Name], [CreatedDate]) VALUES (128, N'Hội Đồng KTPM 2021', CAST(N'2021-04-07 00:05:25.160' AS DateTime))
INSERT [dbo].[Assembly] ([Id], [Name], [CreatedDate]) VALUES (134, N'Hội Đồng KTPM 2021', CAST(N'2021-04-07 14:22:38.720' AS DateTime))
INSERT [dbo].[AssemblyDetail] ([AssemblyId], [LecturerId], [Permission], [Point]) VALUES (126, N'CNTT001   ', 1, NULL)
INSERT [dbo].[AssemblyDetail] ([AssemblyId], [LecturerId], [Permission], [Point]) VALUES (126, N'CNTT002   ', 2, NULL)
INSERT [dbo].[AssemblyDetail] ([AssemblyId], [LecturerId], [Permission], [Point]) VALUES (126, N'CNTT003   ', 0, NULL)
INSERT [dbo].[AssemblyDetail] ([AssemblyId], [LecturerId], [Permission], [Point]) VALUES (127, N'CNTT001   ', 1, 9)
INSERT [dbo].[AssemblyDetail] ([AssemblyId], [LecturerId], [Permission], [Point]) VALUES (127, N'CNTT002   ', 2, 9)
INSERT [dbo].[AssemblyDetail] ([AssemblyId], [LecturerId], [Permission], [Point]) VALUES (127, N'CNTT003   ', 0, 8)
INSERT [dbo].[AssemblyDetail] ([AssemblyId], [LecturerId], [Permission], [Point]) VALUES (128, N'CNTT001   ', 1, NULL)
INSERT [dbo].[AssemblyDetail] ([AssemblyId], [LecturerId], [Permission], [Point]) VALUES (128, N'CNTT002   ', 2, NULL)
INSERT [dbo].[AssemblyDetail] ([AssemblyId], [LecturerId], [Permission], [Point]) VALUES (128, N'CNTT003   ', 0, NULL)
INSERT [dbo].[AssemblyDetail] ([AssemblyId], [LecturerId], [Permission], [Point]) VALUES (134, N'CNTT001   ', 1, NULL)
INSERT [dbo].[AssemblyDetail] ([AssemblyId], [LecturerId], [Permission], [Point]) VALUES (134, N'CNTT002   ', 2, NULL)
INSERT [dbo].[AssemblyDetail] ([AssemblyId], [LecturerId], [Permission], [Point]) VALUES (134, N'CNTT003   ', 0, NULL)
INSERT [dbo].[Branch] ([Id], [Name], [FacultyId]) VALUES (N'GDMN      ', N'Giáo dục mầm non', N'SP        ')
INSERT [dbo].[Branch] ([Id], [Name], [FacultyId]) VALUES (N'GDTT      ', N'Giáo dục tiểu học', N'SP        ')
INSERT [dbo].[Branch] ([Id], [Name], [FacultyId]) VALUES (N'HTTT      ', N'Hệ thống thông tin', N'KTCN      ')
INSERT [dbo].[Branch] ([Id], [Name], [FacultyId]) VALUES (N'KTPM      ', N'Kỹ thuật phần mềm', N'KTCN      ')
INSERT [dbo].[Branch] ([Id], [Name], [FacultyId]) VALUES (N'QLNN      ', N'Quản lý nhà nước', N'KHQL      ')
INSERT [dbo].[Class] ([Id], [BranchId], [Size], [TrainingSystemId], [CollegeYear]) VALUES (N'D15QN01   ', N'QLNN      ', 1, N'DHCQ', N'2015 - 2019')
INSERT [dbo].[Class] ([Id], [BranchId], [Size], [TrainingSystemId], [CollegeYear]) VALUES (N'D15QN02   ', N'QLNN      ', 1, N'DHCQ', N'2015 - 2019')
INSERT [dbo].[Class] ([Id], [BranchId], [Size], [TrainingSystemId], [CollegeYear]) VALUES (N'D17HT01   ', N'HTTT      ', 1, N'DHCQ', N'2017 - 2021')
INSERT [dbo].[Class] ([Id], [BranchId], [Size], [TrainingSystemId], [CollegeYear]) VALUES (N'D17HT02   ', N'HTTT      ', 1, N'DHCQ', N'2017 - 2021')
INSERT [dbo].[Class] ([Id], [BranchId], [Size], [TrainingSystemId], [CollegeYear]) VALUES (N'D17PM01   ', N'KTPM      ', 1, N'DHCQ', N'2017 - 2021')
INSERT [dbo].[Class] ([Id], [BranchId], [Size], [TrainingSystemId], [CollegeYear]) VALUES (N'D17PM02   ', N'KTPM      ', 1, N'DHCQ', N'2017 - 2021')
INSERT [dbo].[Class] ([Id], [BranchId], [Size], [TrainingSystemId], [CollegeYear]) VALUES (N'D17PM03   ', N'KTPM      ', 1, N'DHCQ', N'2017 - 2021')
INSERT [dbo].[Faculty] ([Id], [Name]) VALUES (N'KHQL      ', N'Khoa Học - Quản Lý')
INSERT [dbo].[Faculty] ([Id], [Name]) VALUES (N'KT        ', N'Kinh Tế')
INSERT [dbo].[Faculty] ([Id], [Name]) VALUES (N'KTCN      ', N'Viện Kỹ Thuật - Công Nghệ')
INSERT [dbo].[Faculty] ([Id], [Name]) VALUES (N'MTAN      ', N'Mỹ Thuật - Âm Nhạc')
INSERT [dbo].[Faculty] ([Id], [Name]) VALUES (N'NN        ', N'Ngoại Ngữ')
INSERT [dbo].[Faculty] ([Id], [Name]) VALUES (N'SP        ', N'Sư Phạm')
INSERT [dbo].[Lecturer] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [BranchId], [GroupId], [Status]) VALUES (N'CNTT000   ', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Nguyễn Thị Diễm Hương', N'Nữ', CAST(N'1980-01-01' AS Date), N'Bình Dương', N'0325668956', N'huong@gmail.com', N'KTPM      ', 3, 1)
INSERT [dbo].[Lecturer] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [BranchId], [GroupId], [Status]) VALUES (N'CNTT001   ', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Võ Quốc Lương', N'Nam', CAST(N'1980-01-01' AS Date), N'Bình Dương', N'0386450684', N'voquocluong@gmail.com', N'KTPM      ', 2, 1)
INSERT [dbo].[Lecturer] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [BranchId], [GroupId], [Status]) VALUES (N'CNTT002   ', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Trần Văn Tài', N'Nam', CAST(N'1980-01-01' AS Date), N'Bình Dương', N'0359966558', N'tranvantai@gmai.com', N'KTPM      ', 2, 1)
INSERT [dbo].[Lecturer] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [BranchId], [GroupId], [Status]) VALUES (N'CNTT003   ', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Hồ Đắc Hưng', N'Nam', CAST(N'1980-01-01' AS Date), N'Bình Dương', N'0359966557', N'hodachung@gmail.com', N'KTPM      ', 2, 1)
INSERT [dbo].[Lecturer] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [BranchId], [GroupId], [Status]) VALUES (N'CNTT004   ', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Lê Từ Minh Trí', N'Nam', CAST(N'1980-01-01' AS Date), N'Bình Dương', N'0386450689', N'letuminhtri@gmail.com', N'KTPM      ', 2, 1)
INSERT [dbo].[Lecturer] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [BranchId], [GroupId], [Status]) VALUES (N'QLNN001   ', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Lê Văn A', N'Nam', CAST(N'1980-01-01' AS Date), N'Bình Dương', N'0386450685', N'levana@gmail.com', N'QLNN      ', 2, 1)
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Id], [Name], [TypeId], [StudentId], [LecturerId], [CreatedDate], [StartDate], [EndDate], [SubmissionDate], [Submission], [Point]) VALUES (126, N'Xây dựng hệ thống thư viện điện tử cho trường Đại học Thủ Dầu Một', 1, N'1724801030055', N'CNTT003   ', CAST(N'2021-04-06 23:25:46.803' AS DateTime), CAST(N'2021-04-06 00:00:00.000' AS DateTime), CAST(N'2021-09-06 00:00:00.000' AS DateTime), CAST(N'2021-04-07 00:03:37.463' AS DateTime), N'https://github.com', NULL)
INSERT [dbo].[Project] ([Id], [Name], [TypeId], [StudentId], [LecturerId], [CreatedDate], [StartDate], [EndDate], [SubmissionDate], [Submission], [Point]) VALUES (127, N'Xây dựng hệ thống bán điện thoại online cho cửa hàng SmartShop', 1, N'1724801030126', N'CNTT003   ', CAST(N'2021-04-06 23:26:54.773' AS DateTime), CAST(N'2021-04-06 00:00:00.000' AS DateTime), CAST(N'2021-09-06 00:00:00.000' AS DateTime), NULL, NULL, 8.6666666666666661)
INSERT [dbo].[Project] ([Id], [Name], [TypeId], [StudentId], [LecturerId], [CreatedDate], [StartDate], [EndDate], [SubmissionDate], [Submission], [Point]) VALUES (128, N'Xây dựng hệ thống đọc sách online', 1, N'1724801030057', N'CNTT003   ', CAST(N'2021-04-06 23:38:49.053' AS DateTime), CAST(N'2021-04-06 00:00:00.000' AS DateTime), CAST(N'2021-09-06 00:00:00.000' AS DateTime), CAST(N'2021-04-07 00:04:38.577' AS DateTime), N'https://fb.com', NULL)
INSERT [dbo].[Project] ([Id], [Name], [TypeId], [StudentId], [LecturerId], [CreatedDate], [StartDate], [EndDate], [SubmissionDate], [Submission], [Point]) VALUES (134, N'Xây dựng website bán đồ ăn', 1, N'1724801030001', N'CNTT003   ', CAST(N'2021-04-07 14:21:57.680' AS DateTime), CAST(N'2021-04-07 00:00:00.000' AS DateTime), CAST(N'2021-09-07 00:00:00.000' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[ProjectStage] ON 

INSERT [dbo].[ProjectStage] ([Id], [ProjectId], [Name], [StartDate], [EndDate], [Intent], [Request], [SubmissionDate], [Submission], [Comment]) VALUES (26, 128, N'Giai đoạn 1: Phân tích thiết kế hệ thống', CAST(N'2021-04-06 00:00:00.000' AS DateTime), CAST(N'2021-04-06 00:00:00.000' AS DateTime), N'<p>Sinh vi&ecirc;n nắm r&otilde; được:</p>

<p>1. Mục đ&iacute;ch thực hiện đề t&agrave;i l&agrave; g&igrave;?</p>

<p>2. C&aacute;c chức năng m&agrave; đề t&agrave;i cần đ&aacute;p ứng?</p>
', N'<p>Sinh vi&ecirc;n nộp c&aacute;c file word ph&acirc;n t&iacute;ch:</p>

<p>1. Mục đ&iacute;ch thực hiện đề t&agrave;i</p>

<p>2. C&aacute;c chức năng m&agrave; đề t&agrave;i cần đ&aacute;p ứng</p>
', NULL, NULL, NULL)
INSERT [dbo].[ProjectStage] ([Id], [ProjectId], [Name], [StartDate], [EndDate], [Intent], [Request], [SubmissionDate], [Submission], [Comment]) VALUES (27, 126, N'Giai đoạn 1: Phân tích thiết kế hệ thống', CAST(N'2021-04-07 00:00:00.000' AS DateTime), CAST(N'2021-04-13 00:00:00.000' AS DateTime), N'<p>Sinh vi&ecirc;n nắm r&otilde;:</p>

<p>1. Mục đ&iacute;ch thực hiện đề t&agrave;i l&agrave; g&igrave;?</p>

<p>2. Những chức năng m&agrave; hệ thống cần c&oacute;?</p>
', N'<p>Sinh vi&ecirc;n nộp c&aacute;c file word:</p>

<p>1. Mục đ&iacute;ch thực hiện đề tai</p>

<p>2. Những chức năng m&agrave; hệ thống cần c&oacute;</p>
', CAST(N'2021-04-07 00:14:17.567' AS DateTime), N'https://fb.com', N'<p><span style="color:#3498db">B&agrave;i l&agrave;m tốt rồi em</span></p>
')
INSERT [dbo].[ProjectStage] ([Id], [ProjectId], [Name], [StartDate], [EndDate], [Intent], [Request], [SubmissionDate], [Submission], [Comment]) VALUES (29, 134, N'Giai đoạn 1: Phân tích thiết kế hệ thống', CAST(N'2021-04-07 00:00:00.000' AS DateTime), CAST(N'2021-04-14 00:00:00.000' AS DateTime), N'<p>X&aacute;c định chức năng đề t&agrave;i</p>
', N'<p>Nộp file word b&aacute;o c&aacute;o</p>
', CAST(N'2021-04-07 14:27:04.130' AS DateTime), N'https://github.com/vhungitm/GraduateProject.git', N'<p><span style="color:#3498db">L&agrave;m tốt</span></p>
')
SET IDENTITY_INSERT [dbo].[ProjectStage] OFF
SET IDENTITY_INSERT [dbo].[ProjectType] ON 

INSERT [dbo].[ProjectType] ([Id], [Name]) VALUES (1, N'Đồ án tốt nghiệp')
INSERT [dbo].[ProjectType] ([Id], [Name]) VALUES (2, N'Khóa luận tốt nghiệp')
SET IDENTITY_INSERT [dbo].[ProjectType] OFF
INSERT [dbo].[Student] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [ClassId], [Status]) VALUES (N'1723102050001', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Nguyễn Thị Quỳnh', N'Nữ', CAST(N'1996-01-01' AS Date), N'Bình Dương', N'0386521654', N'nguyenthiquynh@gmail.com', N'D15QN01   ', 1)
INSERT [dbo].[Student] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [ClassId], [Status]) VALUES (N'1724801030001', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Phạm Thị Thu An', N'Nữ', CAST(N'1997-01-01' AS Date), N'Bình Dương', N'0356689452', N'an@gmail.com', N'D17PM01   ', 1)
INSERT [dbo].[Student] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [ClassId], [Status]) VALUES (N'1724801030055', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Trần Văn Hùng', N'Nam', CAST(N'1998-01-02' AS Date), N'Bình Dương', N'0385968198', N'vhungitm@gmail.com', N'D17PM01   ', 1)
INSERT [dbo].[Student] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [ClassId], [Status]) VALUES (N'1724801030056', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Phạm Thị Thảo', N'Nữ', CAST(N'1999-01-01' AS Date), N'Bình Dương', N'0352863245', N'thao@gmail.com', N'D17PM02   ', 1)
INSERT [dbo].[Student] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [ClassId], [Status]) VALUES (N'1724801030057', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Nguyễn Lê Huy', N'Nam', CAST(N'1999-03-01' AS Date), N'Bình Dương', N'0385968192', N'huy@gmail.com', N'D17PM01   ', 1)
INSERT [dbo].[Student] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [ClassId], [Status]) VALUES (N'1724801030058', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Nguyễn Thành Nam', N'Nam', CAST(N'1999-03-01' AS Date), N'Bình Dương', N'0356826899', N'nam@gmail.com', N'D17PM02   ', 1)
INSERT [dbo].[Student] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [ClassId], [Status]) VALUES (N'1724801030059', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Nguyễn Văn Đức', N'Nam', CAST(N'1999-03-01' AS Date), N'Bình Dương', N'0365992546', N'duc@gmail.com', N'D17PM03   ', 1)
INSERT [dbo].[Student] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [ClassId], [Status]) VALUES (N'1724801030060', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Phí Phương Anh', N'Nữ', CAST(N'1999-01-01' AS Date), N'Bình Dương', N'0357626526', N'anh@gmail.com', N'D17PM01   ', 1)
INSERT [dbo].[Student] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [ClassId], [Status]) VALUES (N'1724801030061', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Lê Văn Bình', N'Nam', CAST(N'1999-01-01' AS Date), N'Bình Dương', N'0386246682', N'binh@gmail.com', N'D17PM01   ', 1)
INSERT [dbo].[Student] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [ClassId], [Status]) VALUES (N'1724801030062', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Phan Văn Hưng', N'Nam', CAST(N'1999-01-01' AS Date), N'Bình Dương', N'0369856246', N'hung@gmail.com', N'D17PM01   ', 1)
INSERT [dbo].[Student] ([Id], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [ClassId], [Status]) VALUES (N'1724801030126', N'81c7581e45ebb212980031ae3c8b9188', N'/Images/no-avatar.png', N'Trương Văn Toàn', N'Nam', CAST(N'1999-03-01' AS Date), N'Bình Dương', N'0385968197', N'toansiro13@gmail.com', N'D17PM03   ', 1)
INSERT [dbo].[TrainingSystem] ([Id], [Name]) VALUES (N'DHCQ', N'Đại Học Chính Quy')
SET IDENTITY_INSERT [dbo].[UserGroup] ON 

INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (2, N'Giảng viên')
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (3, N'Thư ký chương trình')
SET IDENTITY_INSERT [dbo].[UserGroup] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Lecturer_Email]    Script Date: 08/04/2021 12:09:28 AM ******/
ALTER TABLE [dbo].[Lecturer] ADD  CONSTRAINT [UN_Lecturer_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Lecturer_Phone]    Script Date: 08/04/2021 12:09:28 AM ******/
ALTER TABLE [dbo].[Lecturer] ADD  CONSTRAINT [UN_Lecturer_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Student_Email]    Script Date: 08/04/2021 12:09:28 AM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [UN_Student_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Student_Phone]    Script Date: 08/04/2021 12:09:28 AM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [UN_Student_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assembly]  WITH CHECK ADD  CONSTRAINT [FK_Assembly_Project_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Project] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Assembly] CHECK CONSTRAINT [FK_Assembly_Project_Id]
GO
ALTER TABLE [dbo].[AssemblyDetail]  WITH CHECK ADD  CONSTRAINT [FK_AssemblyDetail_Assembly_AssemblyId] FOREIGN KEY([AssemblyId])
REFERENCES [dbo].[Assembly] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AssemblyDetail] CHECK CONSTRAINT [FK_AssemblyDetail_Assembly_AssemblyId]
GO
ALTER TABLE [dbo].[AssemblyDetail]  WITH CHECK ADD  CONSTRAINT [FK_AssemblyDetail_Lecturer] FOREIGN KEY([LecturerId])
REFERENCES [dbo].[Lecturer] ([Id])
GO
ALTER TABLE [dbo].[AssemblyDetail] CHECK CONSTRAINT [FK_AssemblyDetail_Lecturer]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Faculty] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculty] ([Id])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_Faculty]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Branch]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_TrainingSystem] FOREIGN KEY([TrainingSystemId])
REFERENCES [dbo].[TrainingSystem] ([Id])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_TrainingSystem]
GO
ALTER TABLE [dbo].[Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO
ALTER TABLE [dbo].[Lecturer] CHECK CONSTRAINT [FK_Lecturer_Branch]
GO
ALTER TABLE [dbo].[Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_UserGroup] FOREIGN KEY([GroupId])
REFERENCES [dbo].[UserGroup] ([Id])
GO
ALTER TABLE [dbo].[Lecturer] CHECK CONSTRAINT [FK_Lecturer_UserGroup]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Lecturer] FOREIGN KEY([LecturerId])
REFERENCES [dbo].[Lecturer] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Lecturer]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_ProjectType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[ProjectType] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_ProjectType]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Student]
GO
ALTER TABLE [dbo].[ProjectStage]  WITH CHECK ADD  CONSTRAINT [FK_ProjectStage_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProjectStage] CHECK CONSTRAINT [FK_ProjectStage_Project]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
ALTER TABLE [dbo].[Lecturer]  WITH CHECK ADD  CONSTRAINT [CK_Lecturer_Gender] CHECK  (([Gender]='Nam' OR [Gender]=N'Nữ'))
GO
ALTER TABLE [dbo].[Lecturer] CHECK CONSTRAINT [CK_Lecturer_Gender]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [CK_Student_Gender] CHECK  (([Gender]='Nam' OR [Gender]=N'Nữ'))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [CK_Student_Gender]
GO
/****** Object:  StoredProcedure [dbo].[uspCountProject]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCountProject]
	@Id bigint,
	@Name nvarchar(50),
	@Student nvarchar(50),
	@Lecturer nvarchar(50),
	@ProjectTypeId int,
	@Year int,
	@FacultyId char(10),
	@BranchId char(10),
	@ClassId char(10),
	@PointStatus int
AS
BEGIN
	SELECT COUNT(Id)
	FROM
	(	SELECT
			ROW_NUMBER() OVER ( ORDER BY a.Id DESC) AS RowNum,
			a.Id, a.Name, a.TypeId, g.Name AS Type,
			a.StudentId, b.FullName AS Student,
			a.LecturerId, f.FullName AS Lecturer,
			CONVERT(varchar, a.CreatedDate, 103) AS CreatedDate,
			CONVERT(varchar, a.StartDate, 103) AS StartDate,
			CONVERT(varchar, a.EndDate, 103) AS EndDate,
			CONVERT(varchar, a.SubmissionDate, 103) AS SubmissionDate,
			a.Submission, a.Point
		FROM
			Project AS a left join Assembly AS h on a.Id = h.Id,
			Student AS b,
			Class AS c,
			Branch AS d,
			Faculty AS e,
			Lecturer AS f,
			ProjectType AS g
			
		WHERE
			a.TypeId = g.Id AND
			a.StudentId = b.Id AND
			b.ClassId = c.Id AND
			c.BranchId = d.Id AND
			d.FacultyId = e.Id AND
			a.LecturerId = f.Id AND
			@Id = (CASE WHEN @Id > 0 then a.Id ELSE @Id END) AND
			a.Name LIKE '%' + @Name + '%' AND
			(b.Id = @Student OR b.FullName LIKE '%' + @Student + '%') AND
			(f.Id = @Lecturer OR f.FullName LIKE '%' + @Lecturer + '%') AND
			@Year = (CASE WHEN @Year > 0 THEN YEAR(a.CreatedDate) ELSE @Year END) AND
			@FacultyId = (CASE WHEN @FacultyId != '' THEN e.Id ELSE @FacultyId END) AND
			@BranchId = (CASE WHEN @BranchId != '' THEN d.Id ELSE @BranchId END) AND
			@ClassId = (CASE WHEN @ClassId != '' THEN c.Id ELSE @ClassId END) AND
			@ProjectTypeId = (CASE WHEN @ProjectTypeId > 0 THEN g.Id ELSE @ProjectTypeId END) AND
			@PointStatus = (CASE WHEN @PointStatus = 2 THEN @PointStatus ELSE (CASE WHEN ISNULL(Point, -1) > 0 THEN 1 ELSE 0 END) END)
	) AS data
END
	
GO
/****** Object:  StoredProcedure [dbo].[uspCountStudent]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCountStudent]
	@Id char(50),
	@FullName nvarchar(50),
	@FacultyId bigint,
	@BranchId bigint,
	@ClassId bigint,
	@TrainingSystemId bigint
AS
BEGIN
	SELECT COUNT(Id)
	FROM (
		SELECT
			ROW_NUMBER() OVER ( ORDER BY a.Id DESC) AS RowNum,
			a.Id, a.Password, a.Avatar, a.FullName, a.Gender,
			CONVERT(varchar, a.Birthday, 103) AS Birthday, a.Address,
			a.Phone, a.Email, a.ClassId,
			b.BranchId, c.Name AS BranchName, c.FacultyId, d.Name AS FacultyName,
			b.TrainingSystemId, e.Name AS TrainingSystemName, a.Status
		FROM
			Student AS a,
			Class AS b,
			Branch AS c,
			Faculty AS d,
			TrainingSystem AS e
		WHERE
			a.ClassId = b.Id AND
			b.BranchId = c.Id AND
			c.FacultyId = d.Id AND
			b.TrainingSystemId = e.Id AND
			@Id = (CASE WHEN @Id != '' THEN a.Id ELSE @Id END) AND
			a.FullName LIKE '%' + @FullName + '%' AND
			@FacultyId = ( CASE WHEN @FacultyId > 0 THEN d.Id ELSE @FacultyId END) AND
			@BranchId = ( CASE WHEN @BranchId > 0 THEN c.Id ELSE @BranchId END) AND
			@ClassId = ( CASE WHEN @ClassId > 0 THEN b.Id ELSE @ClassId END) AND
			@TrainingSystemId = ( CASE WHEN @TrainingSystemId > 0 THEN e.Id ELSE @TrainingSystemId END)
		) AS data
END
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteAssembly]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspDeleteAssembly]
	@Id bigint
AS
BEGIN
	DELETE Assembly
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteProject]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspDeleteProject]
	@Id bigint
AS
BEGIN
	DELETE
	FROM Project
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteProjectStage]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspDeleteProjectStage]
	@Id bigint
AS
BEGIN
	DELETE ProjectStage
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetAssembly]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetAssembly]
	@Id bigint
AS
BEGIN
	SELECT Id, Name, CONVERT(varchar, CreatedDate, 103) AS CreatedDate
	FROM Assembly
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetAssemblyDetails]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetAssemblyDetails]
	@Id bigint
AS
BEGIN
	SELECT
		a.AssemblyId, a.LecturerId, b.FullName AS LecturerName, Point
	FROM
		AssemblyDetail AS a,
		Lecturer AS b
	WHERE
		a.LecturerId = b.Id AND
		AssemblyId = @Id
	ORDER BY Permission
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetClasses]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetClasses]
	@Id varchar(50),
	@FacultyId varchar(50),
	@BranchId varchar(50),
	@Page int,
	@PageSize int
AS
BEGIN
	SELECT *
	FROM (
		SELECT
			ROW_NUMBER() OVER ( ORDER BY a.Id DESC) AS RowNum,
			a.Id, a.BranchId, b.Name AS BranchName,
			b.FacultyId, c.Name AS FacultyName
		FROM
			Class AS a,
			Branch AS b,
			Faculty AS c
		WHERE
			a.BranchId = b.Id AND
			b.FacultyId = c.Id AND
			@Id = (CASE WHEN @Id != '' THEN a.Id ELSE @Id END) AND
			@FacultyId = ( CASE WHEN @FacultyId != '' THEN c.Id ELSE @FacultyId END) AND
			@BranchId = ( CASE WHEN @BranchId != '' THEN b.Id ELSE @BranchId END)
		) AS data
	WHERE
		RowNum > ( CASE WHEN @Page > 0 THEN ((@Page - 1) * @PageSize) ELSE (RowNum - 1) END) AND
		RowNum <= ( CASE WHEN @Page > 0 THEN (@Page * @PageSize)  ELSE (RowNum + 1) END)
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetLecturers]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetLecturers]
	@Id varchar(50),
	@FullName nvarchar(50),
	@FacultyId varchar(50),
	@BranchId varchar(50),
	@Page int,
	@PageSize int
AS
BEGIN
	SELECT *
	FROM (
		SELECT
			ROW_NUMBER() OVER ( ORDER BY a.Id DESC) AS RowNum,
			a.Id, a.Password, a.Avatar, a.FullName, a.Gender,
			CONVERT(varchar, a.Birthday, 103) AS Birthday, a.Address,
			a.Phone, a.Email, a.BranchId, b.Name AS BranchName,
			b.FacultyId, c.Name AS FacultyName, a.GroupId, a.Status
		FROM
			Lecturer AS a,
			Branch AS b,
			Faculty AS c
		WHERE
			a.BranchId = b.Id AND
			b.FacultyId = c.Id AND
			@Id = (CASE WHEN @Id != '' THEN a.Id ELSE @Id END) AND
			a.FullName LIKE '%' + @FullName + '%' AND
			@FacultyId = ( CASE WHEN @FacultyId != '' THEN c.Id ELSE @FacultyId END) AND
			@BranchId = ( CASE WHEN @BranchId != '' THEN b.Id ELSE @BranchId END)
		) AS data
	WHERE
		RowNum > ( CASE WHEN @Page > 0 THEN ((@Page - 1) * @PageSize) ELSE (RowNum - 1) END) AND
		RowNum <= ( CASE WHEN @Page > 0 THEN (@Page * @PageSize)  ELSE (RowNum + 1) END)
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetProjects]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetProjects]
	@Id bigint,
	@Name nvarchar(50),
	@Student nvarchar(50),
	@Lecturer nvarchar(50),
	@ProjectTypeId int,
	@Year int,
	@FacultyId char(10),
	@BranchId char(10),
	@ClassId char(10),
	@PointStatus int,
	@Page int,
	@PageSize int
AS
BEGIN
	SELECT *
	FROM
	(	SELECT
			ROW_NUMBER() OVER ( ORDER BY a.Id DESC) AS RowNum,
			a.Id, a.Name, a.TypeId, g.Name AS TypeName,
			a.StudentId, b.FullName AS StudentName, c.Id as ClassID,
			a.LecturerId, f.FullName AS LecturerName,
			CONVERT(varchar, a.CreatedDate, 103) + ' ' + CONVERT(varchar, a.CreatedDate, 108) AS CreatedDate,
			CONVERT(varchar, a.StartDate, 103) + ' ' + CONVERT(varchar, a.StartDate, 108) AS StartDate,
			CONVERT(varchar, a.EndDate, 103) + ' ' + CONVERT(varchar, a.EndDate, 108)AS EndDate,
			h.Name AS AssemblyName, CONVERT(varchar, h.CreatedDate, 103) AS AssemblyCreatedDate,
			CONVERT(varchar, a.SubmissionDate, 103) + ' ' + CONVERT(varchar, a.SubmissionDate, 108)AS SubmissionDate,
			a.Submission, a.Point
		FROM
			Project AS a left join Assembly AS h on a.Id = h.Id,
			Student AS b,
			Class AS c,
			Branch AS d,
			Faculty AS e,
			Lecturer AS f,
			ProjectType AS g
		WHERE
			a.TypeId = g.Id AND
			a.StudentId = b.Id AND
			b.ClassId = c.Id AND
			c.BranchId = d.Id AND
			d.FacultyId = e.Id AND
			a.LecturerId = f.Id AND
			@Id = (CASE WHEN @Id > 0 THEN a.Id ELSE @Id END) AND
			a.Name LIKE '%' + @Name + '%' AND
			(b.Id = @Student OR b.FullName LIKE '%' + @Student + '%') AND
			(f.Id = @Lecturer OR f.FullName LIKE '%' + @Lecturer + '%') AND
			@Year = (CASE WHEN @Year > 0 THEN YEAR(a.CreatedDate) ELSE @Year END) AND
			@FacultyId = (CASE WHEN @FacultyId != '' THEN e.Id ELSE @FacultyId END) AND
			@BranchId = (CASE WHEN @BranchId != '' THEN d.Id ELSE @BranchId END) AND
			@ClassId = (CASE WHEN @ClassId != '' THEN c.Id ELSE @ClassId END) AND
			@PointStatus = (CASE WHEN @PointStatus = 2 THEN @PointStatus ELSE (CASE WHEN ISNULL(Point, -1) > 0 THEN 1 ELSE 0 END) END) AND 
			@ProjectTypeId = (CASE WHEN @ProjectTypeId > 0 THEN g.Id ELSE @ProjectTypeId END)
	) AS data
	WHERE
		RowNum > ( CASE WHEN @Page > 0 THEN ((@Page - 1) * @PageSize) ELSE (RowNum - 1) END) AND
		RowNum <= ( CASE WHEN @Page > 0 THEN (@Page * @PageSize)  ELSE (RowNum + 1) END)
END
	
GO
/****** Object:  StoredProcedure [dbo].[uspGetProjectStages]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|0|0|C:\Users\Hung\AppData\Local\Temp\~vs99B8.sql
CREATE PROC [dbo].[uspGetProjectStages]
	@Id bigint,
	@ProjectId bigint,
	@Name nvarchar(50)
AS
BEGIN
	SELECT
		Id, ProjectId, Name,
		CONVERT(varchar, StartDate, 103) + ' ' + CONVERT(varchar, StartDate, 108) AS StartDate,
		CONVERT(varchar, EndDate, 103) + ' ' + CONVERT(varchar, EndDate, 108) AS EndDate,
		Intent, Request,
		CONVERT(varchar, SubmissionDate, 103) + ' ' + CONVERT(varchar, SubmissionDate, 108) AS SubmissionDate,
		Submission, Comment
	FROM
		ProjectStage
	WHERE
		@Id = (CASE WHEN @Id > 0 THEN Id ELSE @Id END) AND
		@ProjectId = (CASE WHEN @ProjectId > 0 THEN ProjectId ELSE @ProjectId END) AND
		Name LIKE '%' + @Name + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetProjectType]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetProjectType]
AS
BEGIN
	SELECT *
	FROM ProjectType
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetStudents]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetStudents]
	@Id varchar(50),
	@FullName nvarchar(50),
	@FacultyId varchar(50),
	@BranchId varchar(50),
	@ClassId varchar(50),
	@TrainingSystemId varchar(50),
	@Page int,
	@PageSize int
AS
BEGIN
	SELECT *
	FROM (
		SELECT
			ROW_NUMBER() OVER ( ORDER BY a.Id DESC) AS RowNum,
			a.Id, a.Password, a.Avatar, a.FullName, a.Gender,
			CONVERT(varchar, a.Birthday, 103) AS Birthday, a.Address,
			a.Phone, a.Email, a.ClassId,
			b.BranchId, c.Name AS BranchName, c.FacultyId, d.Name AS FacultyName,
			b.TrainingSystemId, e.Name AS TrainingSystemName, a.Status
		FROM
			Student AS a,
			Class AS b,
			Branch AS c,
			Faculty AS d,
			TrainingSystem AS e
		WHERE
			a.ClassId = b.Id AND
			b.BranchId = c.Id AND
			c.FacultyId = d.Id AND
			b.TrainingSystemId = e.Id AND
			@Id = (CASE WHEN @Id != '' THEN a.Id ELSE @Id END) AND
			a.FullName LIKE '%' + @FullName + '%' AND
			@FacultyId = ( CASE WHEN @FacultyId != '' THEN d.Id ELSE @FacultyId END) AND
			@BranchId = ( CASE WHEN @BranchId != '' THEN c.Id ELSE @BranchId END) AND
			@ClassId = ( CASE WHEN @ClassId != '' THEN b.Id ELSE @ClassId END) AND
			@TrainingSystemId = ( CASE WHEN @TrainingSystemId != '' THEN e.Id ELSE @TrainingSystemId END)
		) AS data
	WHERE
		RowNum > ( CASE WHEN @Page > 0 THEN ((@Page - 1) * @PageSize) ELSE (RowNum - 1) END) AND
		RowNum <= ( CASE WHEN @Page > 0 THEN (@Page * @PageSize)  ELSE (RowNum + 1) END)
END
GO
/****** Object:  StoredProcedure [dbo].[uspInsertAssembly]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertAssembly]
	@Id bigint,
	@Name nvarchar(100),
	@LecturerId1 varchar(20),
	@LecturerId2 varchar(20)
AS
BEGIN TRAN
	BEGIN TRY
		DECLARE @LecturerId NVARCHAR(10)

		-- Lấy mã chủ tọa --
		SELECT @LecturerId = LecturerId
		FROM Project
		WHERE Id = @Id

		IF (@LecturerId = @LecturerId1 OR @LecturerId = @LecturerId2 OR @LecturerId1 = @LecturerId2)
		BEGIN
			SELECT -1
		END
		ELSE
		BEGIN
			-- Lập hội đồng --
			INSERT INTO Assembly
			VALUES (@Id, @Name, GETDATE())

			-- Thêm thành viên hội đồng --
			INSERT INTO AssemblyDetail
			VALUES (@Id, @LecturerId, 0, NULL)

			INSERT INTO AssemblyDetail
			VALUES (@Id, @LecturerId1, 1, NULL)

			INSERT INTO AssemblyDetail
			VALUES (@Id, @LecturerId2, 2, NULL)

			SELECT 1
		END
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT 0
	END CATCH
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[uspInsertProject]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertProject]
	@Name nvarchar(100),
	@TypeId bigint,
	@StudentId char(15),
	@LecturerId char(10),
	@StartDate datetime,
	@EndDate datetime
AS
BEGIN
	DECLARE @Count int = 0

	SELECT @Count = COUNT(StudentId)
	FROM Project
	WHERE
		StudentId = @StudentId AND
		( ISNULL(Point, 5) >= 5 )

	IF @Count > 0
	BEGIN
		SELECT -2
	END
	ELSE
	BEGIN
		INSERT INTO Project
		VALUES (@Name, @TypeId, @StudentId, @LecturerId, GETDATE(), @StartDate, @EndDate, NULL, NULL, NULL)
		
		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[uspInsertProjectStage]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertProjectStage]
	@ProjectId bigint,
	@Name nvarchar(50),
	@StartDate datetime,
	@EndDate datetime,
	@Intent nvarchar(500),
	@Request nvarchar(500)
AS
BEGIN
	INSERT INTO ProjectStage
	VALUES(@ProjectId, @Name, @StartDate, @EndDate, @Intent, @Request, NULL, NULL, NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[uspLogin]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspLogin]
	@Username varchar(50),
	@Passwrod varchar(50),
	@Type int
AS
BEGIN
	DECLARE @CountStudent int
	DECLARE @CountLecturer int

	-- Kiem tra tai khoan, mat khau --
	SELECT @CountStudent = COUNT(Id)
	FROM Student
	WHERE 
		Id = @Username AND
		Password = @Passwrod

	SELECT @CountLecturer = COUNT(Id)
	FROM Lecturer
	WHERE
		Id = @Username AND
		Password = @Passwrod

	IF (@CountStudent = 0 AND @CountLecturer = 0)
		SELECT 0
	ELSE
	BEGIN
		IF @CountStudent > 0
		BEGIN
			SELECT @CountStudent = COUNT(Id)
			FROM Student
			WHERE
				Id = @Username AND
				Status = 1
			
			IF @CountStudent > 0
				SELECT 1
			ELSE
				SELECT -1
		END
		ELSE
		BEGIN
			SET @CountLecturer = 0

			SELECT @CountLecturer = GroupId
			FROM Lecturer
			WHERE
				Id = @Username AND
				Status = 1
			
			IF @CountLecturer > 0
				SELECT @CountLecturer
			ELSE
				SELECT -1
		END
	END

END
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateAssembly]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspUpdateAssembly]
	@Id bigint,
	@Name nvarchar(100),
	@Point float,
	@LecturerId1 varchar(20),
	@Point1 float,
	@LecturerId2 varchar(20),
	@Point2 float
AS
BEGIN TRAN
	BEGIN TRY
		DECLARE @LecturerId NVARCHAR(10)

		-- Cập nhật tên hội đồng --
		UPDATE Assembly
		SET	Name = (CASE WHEN @Name = '' THEN Name ELSE @Name END)
		WHERE Id = @Id

		-- Cập nhật thành viên, điểm hội đồng --

		UPDATE AssemblyDetail
		SET
			Point = (CASE WHEN @Point = -1 THEN Point ELSE @Point END)
		WHERE
			AssemblyId = @Id AND
			Permission = 0

		UPDATE AssemblyDetail
		SET
			LecturerId = (CASE WHEN @LecturerId1 = '' THEN LecturerId ELSE @LecturerId1 END),
			Point = (CASE WHEN @Point1 = -1 THEN Point ELSE @Point1 END)
		WHERE
			AssemblyId = @Id AND
			Permission = 1

		UPDATE AssemblyDetail
		SET
			LecturerId = (CASE WHEN @LecturerId2 = '' THEN LecturerId ELSE @LecturerId2 END),
			Point = (CASE WHEN @Point2 = -1 THEN Point ELSE @Point2 END)
		WHERE
			AssemblyId = @Id AND
			Permission = 2

		UPDATE Project
		SET
			Point = ((@Point + @Point1 + @Point2) / 3)
		WHERE
			Id = @Id

		SELECT 1
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT 0
	END CATCH
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateProject]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspUpdateProject]
	@Id bigint,
	@Name nvarchar(100),
	@TypeId bigint,
	@StudentId bigint,
	@StartDate datetime,
	@EndDate datetime,
	@Submission varchar(50),
	@Point float
AS
BEGIN
	UPDATE Project
	SET
		Name = (CASE WHEN @Name != '' THEN @Name ELSE Name END),
		TypeId = (CASE WHEN @TypeId > 0 THEN @TypeId ELSE TypeId END),
		StudentId = (CASE WHEN @StudentId > 0 THEN @StudentId ELSE StudentId END),
		StartDate = (CASE WHEN @StartDate != '' THEN @StartDate ELSE StartDate END),
		EndDate = (CASE WHEN @EndDate != '' THEN @EndDate ELSE EndDate END),
		SubmissionDate = (CASE WHEN @Submission != '' THEN GETDATE() ELSE SubmissionDate END),
		Submission = (CASE WHEN @Submission = '' THEN Submission ELSE ( CASE WHEN @Submission = 'Delete' THEN NULL ELSE @Submission END) END),
		Point = (CASE WHEN @Point > 0 THEN @Point ELSE Point END)
	WHERE
		Id = @Id

	SELECT 1
END
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateProjectStage]    Script Date: 08/04/2021 12:09:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspUpdateProjectStage]
	@Id bigint,
	@Name nvarchar(50),
	@StartDate datetime,
	@EndDate datetime,
	@Intent nvarchar(500),
	@Request nvarchar(500),
	@Submission varchar(200),
	@Comment nvarchar(500)
AS
BEGIN
	UPDATE ProjectStage
	SET
		Name = (CASE WHEN @Name != '' THEN @Name ELSE Name END),
		StartDate = (CASE WHEN @StartDate != '' THEN @StartDate ELSE StartDate END),
		EndDate = (CASE WHEN @EndDate != '' THEN @EndDate ELSE EndDate END),
		Intent = (CASE WHEN @Intent != '' THEN @Intent ELSE Intent END),
		Request = (CASE WHEN @Request != '' THEN @Request ELSE Request END),
		SubmissionDate = (CASE WHEN @Submission != '' THEN GETDATE() ELSE SubmissionDate END),
		Submission = (CASE WHEN @Submission = '' THEN Submission ELSE (CASE WHEN @Submission = 'Delete' THEN NULL ELSE @Submission END) END),
		Comment = (CASE WHEN @Comment = '' THEN Comment ELSE (CASE WHEN @Comment = 'Delete' THEN NULL ELSE @Comment END) END)
	WHERE
		Id = @Id
END
GO
