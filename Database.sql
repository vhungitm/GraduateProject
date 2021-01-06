USE [GraduateProject]
GO
/****** Object:  Table [dbo].[Assembly]    Script Date: 01/01/2021 8:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assembly](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Assembly] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssemblyDetail]    Script Date: 01/01/2021 8:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssemblyDetail](
	[AssemblyId] [bigint] NOT NULL,
	[LecturerId] [bigint] NOT NULL,
	[Comment] [ntext] NULL,
	[Point] [float] NULL,
 CONSTRAINT [PK_AssemblyDetail] PRIMARY KEY CLUSTERED 
(
	[AssemblyId] ASC,
	[LecturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Branch]    Script Date: 01/01/2021 8:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FacultyId] [bigint] NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 01/01/2021 8:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Class](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Size] [int] NOT NULL,
	[TrainingSystemId] [bigint] NOT NULL,
	[CollegeYear] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 01/01/2021 8:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Falcuty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 01/01/2021 8:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lecturer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [char](13) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Avatar] [varchar](200) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[BranchId] [bigint] NOT NULL,
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
/****** Object:  Table [dbo].[Project]    Script Date: 01/01/2021 8:43:04 PM ******/
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
	[StudentId] [bigint] NOT NULL,
	[LecturerId] [bigint] NOT NULL,
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
/****** Object:  Table [dbo].[ProjectStage]    Script Date: 01/01/2021 8:43:04 PM ******/
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
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NOT NULL,
	[Intent] [ntext] NULL,
	[Request] [ntext] NULL,
	[SubmissionDate] [datetime] NULL,
	[Submission] [varchar](200) NULL,
	[Comment] [ntext] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Stage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectType]    Script Date: 01/01/2021 8:43:04 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 01/01/2021 8:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [char](13) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Avatar] [varchar](200) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](5) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ClassId] [bigint] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrainingSystem]    Script Date: 01/01/2021 8:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingSystem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TranningSystem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 01/01/2021 8:43:04 PM ******/
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
SET IDENTITY_INSERT [dbo].[Branch] ON 

INSERT [dbo].[Branch] ([Id], [Name], [FacultyId]) VALUES (3, N'Kỹ thuật phần mềm', 1)
INSERT [dbo].[Branch] ([Id], [Name], [FacultyId]) VALUES (4, N'Hệ thống thông tin', 1)
INSERT [dbo].[Branch] ([Id], [Name], [FacultyId]) VALUES (6, N'Giáo dục mầm non', 2)
INSERT [dbo].[Branch] ([Id], [Name], [FacultyId]) VALUES (7, N'Giáo dục tiểu học', 2)
SET IDENTITY_INSERT [dbo].[Branch] OFF
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([Id], [Name], [BranchId], [Size], [TrainingSystemId], [CollegeYear]) VALUES (2, N'D17PM01', 3, 1, 1, N'2017 - 2021')
INSERT [dbo].[Class] ([Id], [Name], [BranchId], [Size], [TrainingSystemId], [CollegeYear]) VALUES (3, N'D17PM02', 3, 1, 1, N'2017 - 2021')
INSERT [dbo].[Class] ([Id], [Name], [BranchId], [Size], [TrainingSystemId], [CollegeYear]) VALUES (4, N'D18HT01', 4, 1, 1, N'2018 - 2022')
INSERT [dbo].[Class] ([Id], [Name], [BranchId], [Size], [TrainingSystemId], [CollegeYear]) VALUES (5, N'D15TH01', 7, 1, 1, N'2019 - 2023')
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[Faculty] ON 

INSERT [dbo].[Faculty] ([Id], [Name]) VALUES (1, N'Viện Kỹ Thuật - Công Nghệ')
INSERT [dbo].[Faculty] ([Id], [Name]) VALUES (2, N'Sư Phạm')
SET IDENTITY_INSERT [dbo].[Faculty] OFF
SET IDENTITY_INSERT [dbo].[Lecturer] ON 

INSERT [dbo].[Lecturer] ([Id], [Username], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [BranchId], [GroupId], [Status]) VALUES (1, N'GV74801030126', N'123', N'/', N'Võ Quốc Lương', N'Nam', CAST(N'1980-01-01' AS Date), N'Bình Dương', N'0386450684', N'voquocluong@gmail.com', 3, 1, 1)
INSERT [dbo].[Lecturer] ([Id], [Username], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [BranchId], [GroupId], [Status]) VALUES (3, N'GV74801030001', N'123', N'/', N'Lê Văn A', N'Nam', CAST(N'1980-01-01' AS Date), N'Bình Dương', N'0386450685', N'levana@gmail.com', 7, 1, 1)
SET IDENTITY_INSERT [dbo].[Lecturer] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Id], [Name], [TypeId], [StudentId], [LecturerId], [CreatedDate], [StartDate], [EndDate], [SubmissionDate], [Submission], [Point]) VALUES (1, N'Xây dựng thư viện điện tử cho Đại học Thủ Dầu Một', 1, 35, 1, CAST(N'2020-01-01 00:00:00.000' AS DateTime), CAST(N'2020-01-01 00:00:00.000' AS DateTime), CAST(N'2020-06-01 00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [Name], [TypeId], [StudentId], [LecturerId], [CreatedDate], [StartDate], [EndDate], [SubmissionDate], [Submission], [Point]) VALUES (2, N'Xây dựng website bán điện thoại cho cửa hàng Smart', 1, 36, 1, CAST(N'2020-03-01 00:00:00.000' AS DateTime), CAST(N'2021-01-01 19:01:00.000' AS DateTime), CAST(N'2021-01-01 01:01:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Project] ([Id], [Name], [TypeId], [StudentId], [LecturerId], [CreatedDate], [StartDate], [EndDate], [SubmissionDate], [Submission], [Point]) VALUES (5, N'Đồ án abc', 1, 46, 3, CAST(N'2018-01-01 00:00:00.000' AS DateTime), CAST(N'2020-02-01 00:00:00.000' AS DateTime), CAST(N'2020-07-01 00:00:00.000' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[ProjectStage] ON 

INSERT [dbo].[ProjectStage] ([Id], [ProjectId], [Name], [StartDate], [EndDate], [Intent], [Request], [SubmissionDate], [Submission], [Comment], [Status]) VALUES (3, 2, N'Chương 1: Phân tích thiết kế hệ thống', CAST(N'2020-01-01 00:00:00.000' AS DateTime), CAST(N'2020-01-08 00:00:00.000' AS DateTime), N'Phân tích mục đích thực hiện đồ án và những chức năng mà đồ án cần đáp ứng', N'1. Trình bày mục đích thực hiện đồ án<br/>2. Trình bày những chức năng mà hệ thống cần có', NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ProjectStage] OFF
SET IDENTITY_INSERT [dbo].[ProjectType] ON 

INSERT [dbo].[ProjectType] ([Id], [Name]) VALUES (1, N'Đồ án tốt nghiệp')
INSERT [dbo].[ProjectType] ([Id], [Name]) VALUES (2, N'Khóa luận tốt nghiệp')
SET IDENTITY_INSERT [dbo].[ProjectType] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Username], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [ClassId], [Status]) VALUES (35, N'1724801030055', N'123', N'https://upload.wikimedia.org/wikipedia/vi/1/1d/N%C6%A1i_n%C3%A0y_c%C3%B3_anh_-_Single_Cover.jpg', N'Trần Văn Hùng', N'Nam', CAST(N'1998-01-02' AS Date), N'Bình Dương', N'0385968198', N'vhungitm@gmail.com', 2, 0)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [ClassId], [Status]) VALUES (36, N'1724801030126', N'123', N'https://upload.wikimedia.org/wikipedia/vi/1/1d/N%C6%A1i_n%C3%A0y_c%C3%B3_anh_-_Single_Cover.jpg', N'Trương Văn Toàn', N'Nam', CAST(N'1999-03-01' AS Date), N'Bình Dương', N'0385968197', N'toansiro13@gmail.com', 3, 1)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Avatar], [FullName], [Gender], [Birthday], [Address], [Phone], [Email], [ClassId], [Status]) VALUES (46, N'1521402020001', N'123', N'/', N'Nguyễn Thị Quỳnh', N'Nữ', CAST(N'1996-01-01' AS Date), N'Bình Dương', N'0386521654', N'nguyenthiquynh@gmail.com', 5, 1)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[TrainingSystem] ON 

INSERT [dbo].[TrainingSystem] ([Id], [Name]) VALUES (1, N'Đại Học Chính Quy')
SET IDENTITY_INSERT [dbo].[TrainingSystem] OFF
SET IDENTITY_INSERT [dbo].[UserGroup] ON 

INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (1, N'Giảng viên')
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (2, N'Thư ký chương trình')
SET IDENTITY_INSERT [dbo].[UserGroup] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Lecturer_Email]    Script Date: 01/01/2021 8:43:04 PM ******/
ALTER TABLE [dbo].[Lecturer] ADD  CONSTRAINT [UN_Lecturer_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Lecturer_Phone]    Script Date: 01/01/2021 8:43:04 PM ******/
ALTER TABLE [dbo].[Lecturer] ADD  CONSTRAINT [UN_Lecturer_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Lecturer_Username]    Script Date: 01/01/2021 8:43:04 PM ******/
ALTER TABLE [dbo].[Lecturer] ADD  CONSTRAINT [UN_Lecturer_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Student_Email]    Script Date: 01/01/2021 8:43:04 PM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [UN_Student_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Student_Phone]    Script Date: 01/01/2021 8:43:04 PM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [UN_Student_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Student_Username]    Script Date: 01/01/2021 8:43:04 PM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [UN_Student_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assembly]  WITH CHECK ADD  CONSTRAINT [FK_Assembly_Project] FOREIGN KEY([Id])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[Assembly] CHECK CONSTRAINT [FK_Assembly_Project]
GO
ALTER TABLE [dbo].[AssemblyDetail]  WITH CHECK ADD  CONSTRAINT [FK_AssemblyDetail_Assembly] FOREIGN KEY([AssemblyId])
REFERENCES [dbo].[Assembly] ([Id])
GO
ALTER TABLE [dbo].[AssemblyDetail] CHECK CONSTRAINT [FK_AssemblyDetail_Assembly]
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
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_TranningSystem] FOREIGN KEY([TrainingSystemId])
REFERENCES [dbo].[TrainingSystem] ([Id])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_TranningSystem]
GO
ALTER TABLE [dbo].[Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO
ALTER TABLE [dbo].[Lecturer] CHECK CONSTRAINT [FK_Lecturer_Branch]
GO
ALTER TABLE [dbo].[Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_Role] FOREIGN KEY([GroupId])
REFERENCES [dbo].[UserGroup] ([Id])
GO
ALTER TABLE [dbo].[Lecturer] CHECK CONSTRAINT [FK_Lecturer_Role]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Lecturer] FOREIGN KEY([LecturerId])
REFERENCES [dbo].[Lecturer] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Lecturer]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_ProjectType1] FOREIGN KEY([TypeId])
REFERENCES [dbo].[ProjectType] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_ProjectType1]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Student]
GO
ALTER TABLE [dbo].[ProjectStage]  WITH CHECK ADD  CONSTRAINT [FK_Stage_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[ProjectStage] CHECK CONSTRAINT [FK_Stage_Project]
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
/****** Object:  StoredProcedure [dbo].[uspCountProject]    Script Date: 01/01/2021 8:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCountProject]
	@Name nvarchar(50),
	@Student nvarchar(50),
	@Lecturer nvarchar(50),
	@ProjectTypeId int,
	@Year int,
	@FacultyId int,
	@BranchId int,
	@ClassId int
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
			Project AS a,
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
			a.Name LIKE '%' + @Name + '%' AND
			(b.Username LIKE '%' + @Student + '%' OR b.FullName LIKE '%' + @Student + '%') AND
			(f.Username LIKE '%' + @Lecturer + '%' OR f.FullName LIKE '%' + @Lecturer + '%') AND
			@Year = (CASE WHEN @Year > 0 THEN YEAR(a.CreatedDate) ELSE @Year END) AND
			@FacultyId = (CASE WHEN @FacultyId > 0 THEN e.Id ELSE @FacultyId END) AND
			@BranchId = (CASE WHEN @BranchId > 0 THEN d.Id ELSE @BranchId END) AND
			@ClassId = (CASE WHEN @ClassId > 0 THEN c.Id ELSE @ClassId END) AND
			@ProjectTypeId = (CASE WHEN @ProjectTypeId > 0 THEN g.Id ELSE @ProjectTypeId END)
	) AS data
END
	
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteProject]    Script Date: 01/01/2021 8:43:04 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspGetProject]    Script Date: 01/01/2021 8:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetProject]
	@Id bigint
AS
BEGIN
	SELECT
		a.Id, a.Name, a.TypeId, g.Name AS Type,
		a.StudentId, b.FullName AS Student,
		a.LecturerId, f.FullName AS Lecturer,
		CONVERT(varchar, a.CreatedDate, 103) AS CreatedDate,
		CONVERT(varchar, a.StartDate, 103) AS StartDate,
		CONVERT(varchar, a.EndDate, 103) AS EndDate,
		CONVERT(varchar, a.SubmissionDate, 103) AS SubmissionDate,
		a.Submission, a.Point
	FROM
		Project AS a,
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
		a.Id = @Id
END
	
GO
/****** Object:  StoredProcedure [dbo].[uspGetProjects]    Script Date: 01/01/2021 8:43:04 PM ******/
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
	@FacultyId int,
	@BranchId int,
	@ClassId int,
	@Page int,
	@PageSize int
AS
BEGIN
	SELECT *
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
			Project AS a,
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
			a.Name LIKE '%' + @Name + '%' AND
			@Id = (CASE WHEN @Id > 0 THEN a.Id ELSE @Id END) AND
			(b.Username LIKE '%' + @Student + '%' OR b.FullName LIKE '%' + @Student + '%') AND
			(f.Username LIKE '%' + @Lecturer + '%' OR f.FullName LIKE '%' + @Lecturer + '%') AND
			@Year = (CASE WHEN @Year > 0 THEN YEAR(a.CreatedDate) ELSE @Year END) AND
			@FacultyId = (CASE WHEN @FacultyId > 0 THEN e.Id ELSE @FacultyId END) AND
			@BranchId = (CASE WHEN @BranchId > 0 THEN d.Id ELSE @BranchId END) AND
			@ClassId = (CASE WHEN @ClassId > 0 THEN c.Id ELSE @ClassId END) AND
			@ProjectTypeId = (CASE WHEN @ProjectTypeId > 0 THEN g.Id ELSE @ProjectTypeId END)
	) AS data
	WHERE
		RowNum > ( CASE WHEN @Page > 0 THEN ((@Page - 1) * @PageSize) ELSE (RowNum - 1) END) AND
		RowNum <= ( CASE WHEN @Page > 0 THEN (@Page * @PageSize)  ELSE (RowNum + 1) END)
END
	
GO
/****** Object:  StoredProcedure [dbo].[uspGetProjectStages]    Script Date: 01/01/2021 8:43:04 PM ******/
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
		CONVERT(varchar, StartDate, 103) AS StartDate,
		CONVERT(varchar, EndDate, 103) AS EndDate,
		Intent, Request,
		CONVERT(varchar, SubmissionDate, 103) AS SubmissionDate,
		Submission, Comment, Status
	FROM
		ProjectStage
	WHERE
		@Id = (CASE WHEN @Id > 0 THEN Id ELSE @Id END) AND
		ProjectId = @ProjectId AND
		Name LIKE '%' + @Name + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetStudent]    Script Date: 01/01/2021 8:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[uspGetStudent]
	@Username nvarchar(50)
AS
BEGIN
	SELECT
		a.Id, a.Username, a.Password, a.Avatar, a.FullName, a.Gender,
		CONVERT(varchar, a.Birthday, 103) AS Birthday, a.Address,
		a.Phone, a.Email, a.ClassId, b.Name AS Class,
		b.BranchId, c.Name AS Branch, c.FacultyId, d.Name AS Faculty,
		b.TrainingSystemId, e.Name AS TrainingSystem, a.Status
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
		a.Username = @Username
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetStudents]    Script Date: 01/01/2021 8:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetStudents]
	@FullName nvarchar(50),
	@Username varchar(50),
	@FacultyId bigint,
	@BranchId bigint,
	@ClassId bigint,
	@TrainingSystemId bigint,
	@Page int,
	@PageSize int
AS
BEGIN
	SELECT *
	FROM (
		SELECT
			ROW_NUMBER() OVER ( ORDER BY a.Id DESC) AS RowNum,
			a.Id, a.Username, a.Password, a.Avatar, a.FullName, a.Gender,
			CONVERT(varchar, a.Birthday, 103) AS Birthday, a.Address,
			a.Phone, a.Email, a.ClassId, b.Name AS Class,
			b.BranchId, c.Name AS Branch, c.FacultyId, d.Name AS Faculty,
			b.TrainingSystemId, e.Name AS TrainingSystem, a.Status
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
			a.Username = @Username AND
			a.FullName LIKE '%' + @FullName + '%' AND
			@FacultyId = ( CASE WHEN @FacultyId > 0 THEN d.Id ELSE @FacultyId END) AND
			@BranchId = ( CASE WHEN @BranchId > 0 THEN c.Id ELSE @BranchId END) AND
			@ClassId = ( CASE WHEN @ClassId > 0 THEN b.Id ELSE @ClassId END) AND
			@TrainingSystemId = ( CASE WHEN @TrainingSystemId > 0 THEN e.Id ELSE @TrainingSystemId END)
		) AS data
	WHERE
		RowNum > ( CASE WHEN @Page > 0 THEN ((@Page - 1) * @PageSize) ELSE (RowNum - 1) END) AND
		RowNum <= ( CASE WHEN @Page > 0 THEN (@Page * @PageSize)  ELSE (RowNum + 1) END)
END
GO
/****** Object:  StoredProcedure [dbo].[uspInsertProject]    Script Date: 01/01/2021 8:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertProject]
	@Name nvarchar(50),
	@TypeId bigint,
	@StudentId bigint,
	@LecturerId bigint,
	@StartDate datetime,
	@EndDate datetime
AS
BEGIN
	INSERT INTO Project
	VALUES (@Name, @TypeId, @StudentId, @LecturerId, GETDATE(), @StartDate, @EndDate, NULL, NULL, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateProject]    Script Date: 01/01/2021 8:43:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspUpdateProject]
	@Id bigint,
	@Name nvarchar(50),
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
		TypeId = (CASE WHEN @TypeId > 0 THEN @TypeId ELSE Id END),
		StudentId = (CASE WHEN @StudentId > 0 THEN @StudentId ELSE StudentId END),
		StartDate = (CASE WHEN @StartDate != '' THEN @StartDate ELSE StartDate END),
		EndDate = (CASE WHEN @EndDate != '' THEN @EndDate ELSE EndDate END),
		SubmissionDate = (CASE WHEN @Submission != '' THEN GETDATE() ELSE SubmissionDate END),
		Submission = (CASE WHEN @Submission != '' THEN @Submission ELSE Submission END),
		Point = (CASE WHEN @Point > 0 THEN @Point ELSE Point END)
	WHERE
		Id = @Id
END
GO
