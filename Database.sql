USE [GraduateProject]
GO
/****** Object:  Table [dbo].[Assembly]    Script Date: 26/12/2020 10:10:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assembly](
	[Id] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Assembly] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssemblyDetail]    Script Date: 26/12/2020 10:10:47 PM ******/
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
/****** Object:  Table [dbo].[Branch]    Script Date: 26/12/2020 10:10:47 PM ******/
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
/****** Object:  Table [dbo].[Class]    Script Date: 26/12/2020 10:10:47 PM ******/
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
	[TranningSystemId] [bigint] NOT NULL,
	[CollegeYear] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 26/12/2020 10:10:47 PM ******/
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
/****** Object:  Table [dbo].[Lecturer]    Script Date: 26/12/2020 10:10:47 PM ******/
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
	[FacultyId] [bigint] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project]    Script Date: 26/12/2020 10:10:47 PM ******/
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
/****** Object:  Table [dbo].[ProjectStage]    Script Date: 26/12/2020 10:10:47 PM ******/
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
	[Description] [ntext] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[SubmissionDate] [datetime] NULL,
	[Submission] [varchar](200) NULL,
	[Comment] [float] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Stage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectType]    Script Date: 26/12/2020 10:10:47 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 26/12/2020 10:10:47 PM ******/
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
/****** Object:  Table [dbo].[TranningSystem]    Script Date: 26/12/2020 10:10:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranningSystem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TranningSystem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Branch] ON 

INSERT [dbo].[Branch] ([Id], [Name], [FacultyId]) VALUES (3, N'Kỹ thuật phần mềm', 1)
SET IDENTITY_INSERT [dbo].[Branch] OFF
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([Id], [Name], [BranchId], [Size], [TranningSystemId], [CollegeYear]) VALUES (2, N'D17PM01', 3, 1, 1, N'2017 - 2021')
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[Faculty] ON 

INSERT [dbo].[Faculty] ([Id], [Name]) VALUES (1, N'Viện Kỹ Thuật - Công Nghệ')
SET IDENTITY_INSERT [dbo].[Faculty] OFF
SET IDENTITY_INSERT [dbo].[TranningSystem] ON 

INSERT [dbo].[TranningSystem] ([Id], [Name]) VALUES (1, N'Đại Học Chính Quy')
SET IDENTITY_INSERT [dbo].[TranningSystem] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Lecturer_Email]    Script Date: 26/12/2020 10:10:47 PM ******/
ALTER TABLE [dbo].[Lecturer] ADD  CONSTRAINT [UN_Lecturer_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Lecturer_Phone]    Script Date: 26/12/2020 10:10:47 PM ******/
ALTER TABLE [dbo].[Lecturer] ADD  CONSTRAINT [UN_Lecturer_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Lecturer_Username]    Script Date: 26/12/2020 10:10:47 PM ******/
ALTER TABLE [dbo].[Lecturer] ADD  CONSTRAINT [UN_Lecturer_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Student_Email]    Script Date: 26/12/2020 10:10:47 PM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [UN_Student_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Student_Phone]    Script Date: 26/12/2020 10:10:47 PM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [UN_Student_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_Student_Username]    Script Date: 26/12/2020 10:10:47 PM ******/
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
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_TranningSystem] FOREIGN KEY([TranningSystemId])
REFERENCES [dbo].[TranningSystem] ([Id])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_TranningSystem]
GO
ALTER TABLE [dbo].[Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_Faculty] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculty] ([Id])
GO
ALTER TABLE [dbo].[Lecturer] CHECK CONSTRAINT [FK_Lecturer_Faculty]
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
/****** Object:  StoredProcedure [dbo].[uspChangeLecturerStatus]    Script Date: 26/12/2020 10:10:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[uspChangeLecturerStatus]
	@Id bigint
AS
BEGIN
	DECLARE @Status BIT

	UPDATE Lecturer
	SET @Status = Status = Status - 1
	WHERE Id = @Id

	SELECT @Status
END
GO
/****** Object:  StoredProcedure [dbo].[uspChangeStudentStatus]    Script Date: 26/12/2020 10:10:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspChangeStudentStatus]
	@Id bigint
AS
BEGIN
	DECLARE @Status BIT

	UPDATE Student
	SET @Status = Status = Status - 1
	WHERE Id = @Id

	SELECT @Status
END
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteLecturer]    Script Date: 26/12/2020 10:10:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspDeleteLecturer]
	@Id bigint
AS
BEGIN
	DELETE FROM Lecturer
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteStudent]    Script Date: 26/12/2020 10:10:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspDeleteStudent]
	@Id bigint
AS
BEGIN
	DELETE Student
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetLecturer]    Script Date: 26/12/2020 10:10:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREate PROC [dbo].[uspGetLecturer]
	@Id bigint
AS
BEGIN
	SELECT Id, Username, Password, Avatar, FullName, Gender, CONVERT(varchar, Birthday) AS Birthday, Address, Phone, Email, FacultyId, Status
	FROM Lecturer
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetLecturers]    Script Date: 26/12/2020 10:10:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetLecturers]
	@Search nvarchar(50),
	@Status int,
	@Page int,
	@PageSize int
AS
BEGIN
	DECLARE @sqlStatus nvarchar(50)
	DECLARE @sqlSearch nvarchar(50)
	DECLARE @sql nvarchar(500)

	SET @sqlSearch = 'FullName LIKE ''%' + @Search + '%'''

	IF @Status = 2
		SET @sqlStatus = 'Status = 1 OR Status = 0'
	ELSE
		SET @sqlStatus = 'Status = ' + CONVERT(varchar, @Status)
	
	SET @sql = '
		SELECT TOP (' + CONVERT(varchar, @PageSize) + ') Id, Username, Password, Avatar,
			FullName, Gender, CONVERT(varchar, Birthday, 103) AS Birthday, Address, Phone, Email, FacultyId, Status
		FROM (	SELECT ROW_NUMBER() OVER (ORDER BY Id DESC) AS RowNum, *
				FROM Lecturer
				WHERE ' + @sqlSearch + ' AND ' + @sqlStatus + '
			 )	AS Data
		WHERE RowNum > (' + CONVERT(varchar, @Page) + ' - 1) * ' + CONVERT(varchar, @PageSize)

	exec (@sql)
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetStudent]    Script Date: 26/12/2020 10:10:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetStudent]
	@Id bigint
AS
BEGIN
	SELECT Id, Username, Password, Avatar, FullName, Gender, CONVERT(varchar, Birthday) AS Birthday, Address, Phone, Email, ClassId, Status
	FROM Student
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetStudents]    Script Date: 26/12/2020 10:10:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspGetStudents]
	@Search nvarchar(50),
	@Status int,
	@Page int,
	@PageSize int
AS
BEGIN
	DECLARE @sqlStatus nvarchar(50)
	DECLARE @sqlSearch nvarchar(50)
	DECLARE @sql nvarchar(500)

	SET @sqlSearch = 'FullName LIKE ''%' + @Search + '%'''

	IF @Status = 2
		SET @sqlStatus = 'Status = 1 OR Status = 0'
	ELSE
		SET @sqlStatus = 'Status = ' + CONVERT(varchar, @Status)
	
	SET @sql = '
		SELECT TOP (' + CONVERT(varchar, @PageSize) + ') Id, Username, Password, Avatar,
			FullName, Gender, CONVERT(varchar, Birthday, 103) AS Birthday, Address, Phone, Email, ClassId, Status
		FROM (	SELECT ROW_NUMBER() OVER (ORDER BY Id DESC) AS RowNum, *
				FROM Student
				WHERE ' + @sqlSearch + ' AND ' + @sqlStatus + '
			 )	AS Data
		WHERE RowNum > (' + CONVERT(varchar, @Page) + ' - 1) * ' + CONVERT(varchar, @PageSize)

	exec (@sql)
END
GO
/****** Object:  StoredProcedure [dbo].[uspInsertLecturer]    Script Date: 26/12/2020 10:10:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertLecturer]
	@Username varchar(13),
	@Password varchar(20),
	@Avatar varchar(200),
	@FullName nvarchar(50),
	@Gender nvarchar(5),
	@Birthday date,
	@Address nvarchar(200),
	@Phone varchar(15),
	@Email varchar(50),
	@FacultyId bigint,
	@Status bit
AS
BEGIN
	INSERT INTO Lecturer
	VALUES (@Username, @Password, @Avatar, @FullName, @Gender, @Birthday, @Address, @Phone, @Email, @FacultyId, @Status)
END
GO
/****** Object:  StoredProcedure [dbo].[uspInsertStudent]    Script Date: 26/12/2020 10:10:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertStudent]
	@Username varchar(13),
	@Password varchar(20),
	@Avatar varchar(200),
	@FullName nvarchar(50),
	@Gender nvarchar(5),
	@Birthday date,
	@Address nvarchar(200),
	@Phone varchar(15),
	@Email varchar(50),
	@ClassId bigint,
	@Status bit
AS
BEGIN
	INSERT INTO Student
	VALUES (@Username, @Password, @Avatar, @FullName, @Gender, @Birthday, @Address, @Phone, @Email, @ClassId, @Status)
END
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateLecturer]    Script Date: 26/12/2020 10:10:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[uspUpdateLecturer]
	@Id bigint,
	@Username varchar(13),
	@Password varchar(20),
	@Avatar varchar(200),
	@FullName nvarchar(50),
	@Gender nvarchar(5),
	@Birthday date,
	@Address nvarchar(200),
	@Phone varchar(15),
	@Email varchar(50),
	@FacultyId bigint,
	@Status bit
AS
BEGIN
	UPDATE Lecturer
	SET
		Username	= @Username,
		Password	= @Password,
		Avatar		= @Avatar,
		FullName	= @FullName,
		Gender		= @Gender,
		Birthday	= @Birthday,
		Address		= @Address,
		Phone		= @Phone,
		Email		= @Email,
		FacultyId	= @FacultyId,
		Status		= @Status
	WHERE
		Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateStudent]    Script Date: 26/12/2020 10:10:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspUpdateStudent]
	@Id bigint,
	@Username varchar(13),
	@Password varchar(20),
	@Avatar varchar(200),
	@FullName nvarchar(50),
	@Gender nvarchar(5),
	@Birthday date,
	@Address nvarchar(200),
	@Phone varchar(15),
	@Email varchar(50),
	@ClassId bigint,
	@Status bit
AS
BEGIN
	UPDATE Student
	SET
		Username	= @Username,
		Password	= @Password,
		Avatar		= @Avatar,
		FullName	= @FullName,
		Gender		= @Gender,
		Birthday	= @Birthday,
		Address		= @Address,
		Phone		= @Phone,
		Email		= @Email,
		ClassId		= @ClassId,
		Status		= @Status
	WHERE
		Id = @Id
END
GO
