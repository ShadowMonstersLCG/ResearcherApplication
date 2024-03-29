USE [master]
GO
/****** Object:  Database [ScheduleEx]    Script Date: 12/19/2019 2:21:51 PM ******/
CREATE DATABASE [ScheduleEx]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ScheduleEx', FILENAME = N'D:\rdsdbdata\DATA\ScheduleEx.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'ScheduleEx_log', FILENAME = N'D:\rdsdbdata\DATA\ScheduleEx_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ScheduleEx] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ScheduleEx].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ScheduleEx] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ScheduleEx] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ScheduleEx] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ScheduleEx] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ScheduleEx] SET ARITHABORT OFF 
GO
ALTER DATABASE [ScheduleEx] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ScheduleEx] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ScheduleEx] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ScheduleEx] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ScheduleEx] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ScheduleEx] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ScheduleEx] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ScheduleEx] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ScheduleEx] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ScheduleEx] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ScheduleEx] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ScheduleEx] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ScheduleEx] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ScheduleEx] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ScheduleEx] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ScheduleEx] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ScheduleEx] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ScheduleEx] SET RECOVERY FULL 
GO
ALTER DATABASE [ScheduleEx] SET  MULTI_USER 
GO
ALTER DATABASE [ScheduleEx] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ScheduleEx] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ScheduleEx] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ScheduleEx] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ScheduleEx] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ScheduleEx] SET QUERY_STORE = OFF
GO
USE [ScheduleEx]
GO
/****** Object:  User [admin]    Script Date: 12/19/2019 2:21:52 PM ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[ApprovalStatuses]    Script Date: 12/19/2019 2:21:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApprovalStatuses](
	[ApprovalStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](1000) NULL,
 CONSTRAINT [PK_ApprovalStatuses] PRIMARY KEY CLUSTERED 
(
	[ApprovalStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expertises]    Script Date: 12/19/2019 2:21:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expertises](
	[ExpertiseId] [int] IDENTITY(1,1) NOT NULL,
	[ExpertiseName] [varchar](1000) NULL,
 CONSTRAINT [PK_Expertises] PRIMARY KEY CLUSTERED 
(
	[ExpertiseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectExpertises]    Script Date: 12/19/2019 2:21:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectExpertises](
	[ProjectId] [int] NOT NULL,
	[ExpertiseId] [int] NOT NULL,
 CONSTRAINT [PK_ProjectExpertises] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC,
	[ExpertiseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 12/19/2019 2:21:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](300) NULL,
	[Description] [varchar](1000) NULL,
	[Approved] [bit] NOT NULL,
	[ApprovedDate] [datetime] NULL,
	[ApprovedBy] [varchar](100) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsPublished] [bit] NULL,
	[State] [char](2) NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects1]    Script Date: 12/19/2019 2:21:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects1](
	[Legal Name] [varchar](50) NULL,
	[Project Title] [varchar](50) NULL,
	[Approved] [varchar](50) NULL,
	[Approved Date] [varchar](50) NULL,
	[Approved By] [varchar](50) NULL,
	[Start Date] [varchar](50) NULL,
	[End Date] [varchar](50) NULL,
	[Is Published] [varchar](50) NULL,
	[State] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResearcherApprovals]    Script Date: 12/19/2019 2:21:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResearcherApprovals](
	[ProjectId] [int] NOT NULL,
	[ResearcherId] [int] NOT NULL,
	[ApprovalStatusId] [int] NOT NULL,
	[InfoRequested] [varchar](5000) NULL,
	[ApproverId] [int] NULL,
	[HasResearcherApplied] [bit] NOT NULL,
	[ExpertiseMatchScore] [varchar](25) NULL,
 CONSTRAINT [PK_ResearcherApprovals_1] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC,
	[ResearcherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResearcherAvailabilities]    Script Date: 12/19/2019 2:21:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResearcherAvailabilities](
	[AvailabilityId] [int] IDENTITY(1,1) NOT NULL,
	[ResearcherId] [int] NOT NULL,
	[Month] [int] NOT NULL,
 CONSTRAINT [PK_ResearcherAvailabilities] PRIMARY KEY CLUSTERED 
(
	[AvailabilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResearcherExpertises]    Script Date: 12/19/2019 2:21:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResearcherExpertises](
	[ResearchExpertiseId] [int] IDENTITY(1,1) NOT NULL,
	[ResearcherId] [int] NOT NULL,
	[ExpertiseId] [int] NOT NULL,
 CONSTRAINT [PK_ResearcherExpertises] PRIMARY KEY CLUSTERED 
(
	[ResearchExpertiseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Researchers]    Script Date: 12/19/2019 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Researchers](
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[HashPwd] [varchar](50) NULL,
	[RoleID] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Organization] [varchar](50) NULL,
	[AlmaMater] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Researchers1]    Script Date: 12/19/2019 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Researchers1](
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[HashPwd] [varchar](50) NULL,
	[RoleID] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Organization] [varchar](50) NULL,
	[AlmaMater] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/19/2019 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/19/2019 2:21:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Email] [varchar](300) NOT NULL,
	[HashPwd] [varchar](max) NOT NULL,
	[RoleId] [int] NOT NULL,
	[PhoneNumber] [bigint] NOT NULL,
	[City] [varchar](500) NULL,
	[State] [char](2) NOT NULL,
	[Organization] [varchar](1000) NULL,
	[AlmaMater] [varchar](3000) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ApprovalStatuses] ON 

INSERT [dbo].[ApprovalStatuses] ([ApprovalStatusId], [Status]) VALUES (1, N'Applied')
INSERT [dbo].[ApprovalStatuses] ([ApprovalStatusId], [Status]) VALUES (2, N'Approved')
INSERT [dbo].[ApprovalStatuses] ([ApprovalStatusId], [Status]) VALUES (3, N'Denied')
INSERT [dbo].[ApprovalStatuses] ([ApprovalStatusId], [Status]) VALUES (4, N'InformationRequested')
SET IDENTITY_INSERT [dbo].[ApprovalStatuses] OFF
SET IDENTITY_INSERT [dbo].[Expertises] ON 

INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (1, N'Disease and tissue physiology')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (2, N'3D biofabrication technologies')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (3, N'Developmental neuroimaging')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (4, N'Substance use')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (5, N'Recruitment and retention of vulnerable populations')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (6, N'Pregnancy and maternal health')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (7, N'Neonatal and early childhood cognitive')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (8, N'Behavioral, social, and emotional development')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (9, N'Longitudinal cohort studies')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (10, N'Epidemiology and statistics')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (11, N'Reproductive Health')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (12, N'Family Planning')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (13, N'Opiod Addiction')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (14, N'Adolescent Health')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (15, N'Women''s Health')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (16, N'Health Care')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (17, N'Public Health')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (18, N'Access to Care')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (19, N'Disparities')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (20, N'Mental Health')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (21, N'Preventive Health')
INSERT [dbo].[Expertises] ([ExpertiseId], [ExpertiseName]) VALUES (22, N'Research')
SET IDENTITY_INSERT [dbo].[Expertises] OFF
INSERT [dbo].[ProjectExpertises] ([ProjectId], [ExpertiseId]) VALUES (1, 2)
INSERT [dbo].[ProjectExpertises] ([ProjectId], [ExpertiseId]) VALUES (1, 3)
INSERT [dbo].[ProjectExpertises] ([ProjectId], [ExpertiseId]) VALUES (1, 5)
INSERT [dbo].[ProjectExpertises] ([ProjectId], [ExpertiseId]) VALUES (2, 4)
INSERT [dbo].[ProjectExpertises] ([ProjectId], [ExpertiseId]) VALUES (2, 6)
INSERT [dbo].[ProjectExpertises] ([ProjectId], [ExpertiseId]) VALUES (3, 5)
INSERT [dbo].[ProjectExpertises] ([ProjectId], [ExpertiseId]) VALUES (3, 8)
INSERT [dbo].[ProjectExpertises] ([ProjectId], [ExpertiseId]) VALUES (3, 10)
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (1, N'HEALthy Brain and Child Development Study', N'https://grants.nih.gov/grants/guide/rfa-files/RFA-DA-19-029.html', 1, CAST(N'2019-12-14T18:06:18.797' AS DateTime), N'Richard Donald', CAST(N'2020-01-02T00:00:00.000' AS DateTime), CAST(N'2020-01-02T00:00:00.000' AS DateTime), 1, N'MD')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (2, N'Biofabricated 3D Tissue Models of Nociception, Opioid Use Disorder and Overdose for Drug Screening', N'https://grants.nih.gov/grants/guide/rfa-files/RFA-TR-19-005.html', 1, CAST(N'2019-12-14T18:06:18.797' AS DateTime), N'Christopher Wellington', CAST(N'2020-04-12T00:00:00.000' AS DateTime), CAST(N'2020-04-12T00:00:00.000' AS DateTime), 1, N'VA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (3, N'Early Phase Pain Investigation Clinical Network', N'https://grants.nih.gov/grants/guide/rfa-files/RFA-NS-19-025.html', 1, CAST(N'2019-12-14T18:06:18.797' AS DateTime), N'George Maxwell', CAST(N'2020-05-08T00:00:00.000' AS DateTime), CAST(N'2020-05-08T00:00:00.000' AS DateTime), 0, N'NC')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (5, N'Indiana Family and Social Services Administration', N'Opioid Misuse Indiana Initiative (MOMII)', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Vermeulen', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-31T00:00:00.000' AS DateTime), 1, N'IN')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (6, N'Maryland Department of Health', N'Maternal Opioid Misuse Model', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Loizias', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 1, N'MD')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (7, N'Texas Health and Human Services Commission', N'MOM Model - Texas Medicaid', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Phillips', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 1, N'TX')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (8, N'State of Maine', N'Model Maine Maternal Opioid Model (MaineMOM)', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Hamm', CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), 0, N'ME')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (9, N'Michigan Department of Health and Human Services', N'State of Michigan MOM Model', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-10-01T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), 1, N'MI')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (10, N'Tennessee Bureau of TennCare', N'Tennessee Opioid Misuse Model', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Aaron', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 1, N'TN')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (11, N'Colorado Health Care Policy and Financing', N'Colorado Maternal Opioid Misuse - ICCO-MOM', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Bimestefer', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 1, N'CO')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (12, N'Louisiana Department of Health and Hospitals', N'Maternal Opioid Misuse Model', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Orr White', CAST(N'2020-05-01T00:00:00.000' AS DateTime), CAST(N'2020-05-31T00:00:00.000' AS DateTime), 0, N'LA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (13, N'Michigan Department of Health and Human Services', N'State of Michigan MOM Model', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-06-01T00:00:00.000' AS DateTime), CAST(N'2020-06-30T00:00:00.000' AS DateTime), 1, N'MI')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (14, N'Missouri Social Services HealthNet', N'Missouri Healing from Opioids', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Corsi', CAST(N'2020-07-01T00:00:00.000' AS DateTime), CAST(N'2020-07-31T00:00:00.000' AS DateTime), 0, N'MO')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (15, N'State of New Hampshire', N'Maternal Opioid Misuse Model', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Beckman', CAST(N'2020-08-01T00:00:00.000' AS DateTime), CAST(N'2020-08-31T00:00:00.000' AS DateTime), 1, N'NH')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (16, N'Bureau for Medical Services', N'Maternal Opioid Misuse (MOM) Model', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Buckner', CAST(N'2020-09-01T00:00:00.000' AS DateTime), CAST(N'2020-09-30T00:00:00.000' AS DateTime), 1, N'WV')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (17, N'CHFS DEPT FOR MEDICAID SERVICES', N'Maternal Opioid Misuse', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Guice', CAST(N'2020-12-01T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 0, N'KY')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (18, N'Michigan Department of Health and Human Services', N'Outcomes Children Exposed to Opioids', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Vermeulen', CAST(N'2020-07-01T00:00:00.000' AS DateTime), CAST(N'2020-07-31T00:00:00.000' AS DateTime), 0, N'MI')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (19, N'"Spates Contracting and Development, Inc."', N'Outcomes Children Exposed to Opioids', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Loizias', CAST(N'2020-08-01T00:00:00.000' AS DateTime), CAST(N'2020-08-31T00:00:00.000' AS DateTime), 0, N'AL')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (20, N'Wisconsin Department of Health Services', N'Outcomes Children Exposed to Opioids', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Phillips', CAST(N'2020-09-01T00:00:00.000' AS DateTime), CAST(N'2020-09-30T00:00:00.000' AS DateTime), 1, N'WI')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (21, N'Reducing Opiod Use Council of Iowa', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Hamm', CAST(N'2020-12-01T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 1, N'IA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (22, N'Florida Department of Health', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-07-01T00:00:00.000' AS DateTime), CAST(N'2020-07-31T00:00:00.000' AS DateTime), 0, N'FL')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (23, N'"State of Hawaii, Department of Health"', N'Outcomes Children Exposed to Opioids', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Aaron', CAST(N'2020-08-01T00:00:00.000' AS DateTime), CAST(N'2020-08-31T00:00:00.000' AS DateTime), 1, N'HI')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (24, N'Public Health Soutions', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Bimestefer', CAST(N'2020-09-01T00:00:00.000' AS DateTime), CAST(N'2020-09-30T00:00:00.000' AS DateTime), 0, N'NY')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (25, N'Carson City Health and Human Service', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Orr White', CAST(N'2020-12-01T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 0, N'NV')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (26, N'Iowa Department of Public Health', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-07-01T00:00:00.000' AS DateTime), CAST(N'2020-07-31T00:00:00.000' AS DateTime), 1, N'IA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (27, N'Montana Public Health and Human Services', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Corsi', CAST(N'2020-08-01T00:00:00.000' AS DateTime), CAST(N'2020-08-31T00:00:00.000' AS DateTime), 1, N'MT')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (28, N'"Primary Care Medical Services of Poinciana, Inc."', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Beckman', CAST(N'2020-09-01T00:00:00.000' AS DateTime), CAST(N'2020-09-30T00:00:00.000' AS DateTime), 1, N'FL')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (29, N'North Carolina Health and Human Services', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Buckner', CAST(N'2020-12-01T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 0, N'NC')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (30, N'"Health Imperatives, Inc."', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Guice', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-31T00:00:00.000' AS DateTime), 1, N'MA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (31, N'State of Nevada', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Vermeulen', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 0, N'NV')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (32, N'AMERICAN SAMOA MEDICAL CENTER AUTHORITY', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Loizias', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 1, N'AS')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (33, N'City of El Paso', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Phillips', CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), 1, N'TX')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (34, N'Federated States of Micronesia', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Hamm', CAST(N'2020-10-01T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), 0, N'NY')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (35, N'Delaware Health & Social Services', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 0, N'DE')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (36, N'Alabama Department of Public Health', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Aaron', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 1, N'AL')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (37, N'"Reducing Opiod Use Association of Maine, Inc."', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Bimestefer', CAST(N'2020-05-01T00:00:00.000' AS DateTime), CAST(N'2020-05-31T00:00:00.000' AS DateTime), 0, N'ME')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (38, N'Washoe County Health District', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Orr White', CAST(N'2020-06-01T00:00:00.000' AS DateTime), CAST(N'2020-06-30T00:00:00.000' AS DateTime), 0, N'NV')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (39, N'Oregon Health Authroity', N'Clinical Research in Pain Management', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-31T00:00:00.000' AS DateTime), 0, N'OR')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (40, N'Arkansas Department of Health', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Corsi', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 1, N'AR')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (41, N'Colorado Health Care Policy and Financing', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Beckman', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 1, N'NY')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (42, N'Adagio Health Inc', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Buckner', CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), 1, N'PA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (43, N'Virgin Islands Department of Health Group', N'Outcomes Children Exposed to Opioids', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Guice', CAST(N'2020-10-01T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), 1, N'VI')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (44, N'Arizona Family Health Partnership', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Vermeulen', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 0, N'AZ')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (45, N'South Dakota Department of Health', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Loizias', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 0, N'SD')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (46, N'Essential Access Health', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Phillips', CAST(N'2020-05-01T00:00:00.000' AS DateTime), CAST(N'2020-05-31T00:00:00.000' AS DateTime), 0, N'CA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (47, N'North Dakota Department of Health', N'Preclinical Research in Pain Management', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Hamm', CAST(N'2020-06-01T00:00:00.000' AS DateTime), CAST(N'2020-06-30T00:00:00.000' AS DateTime), 1, N'ND')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (48, N'State of Missouri', N'Preclinical Research in Pain Management', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-31T00:00:00.000' AS DateTime), 1, N'MO')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (49, N'New Mexico Department of Health', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Aaron', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 0, N'NM')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (50, N'PLANNED PARENTHOOD OF SOUTHERN', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Bimestefer', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 0, N'CT')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (51, N'Palau Ministry of Health', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Orr White', CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), 1, N'PW')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (52, N'Planned Parenthood Southwest Ohio Region', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-10-01T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), 1, N'OH')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (53, N'Planned Parenthood of Illinois', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Corsi', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 1, N'IL')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (54, N'Planned Parenthood of Wisconsin', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Beckman', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 0, N'WI')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (55, N'Idaho Department of Health and Welfare', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Buckner', CAST(N'2020-05-01T00:00:00.000' AS DateTime), CAST(N'2020-05-31T00:00:00.000' AS DateTime), 0, N'ID')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (56, N'Planned Parenthood Minnesota', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Guice', CAST(N'2020-06-01T00:00:00.000' AS DateTime), CAST(N'2020-06-30T00:00:00.000' AS DateTime), 1, N'MN')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (57, N'"Community Health Centers of Pinellas, Inc."', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Vermeulen', CAST(N'2020-06-01T00:00:00.000' AS DateTime), CAST(N'2020-06-30T00:00:00.000' AS DateTime), 0, N'FL')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (58, N'Vermont Agency of Human Services', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Loizias', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-31T00:00:00.000' AS DateTime), 0, N'VT')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (59, N'"Health, Mississippi State Department of"', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Phillips', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 0, N'MS')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (60, N'Reducing Opiod Use Association of Texas', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Hamm', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 1, N'TX')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (61, N'PLANNED PARENTHOOD ASSOCIATION OF UTAH', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), 1, N'UT')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (62, N'Illinois Department of Public Health', N'Preclinical Research in Pain Management', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Aaron', CAST(N'2020-10-01T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), 0, N'IL')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (63, N'Massachusetts Department of Public Health', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Bimestefer', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 0, N'MA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (64, N'South Carolina Environmental Control', N'Outcomes Children Exposed to Opioids', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Orr White', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 1, N'SC')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (65, N'Maternal and Family Health Services Inc', N'Preclinical Research in Pain Management', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-06-01T00:00:00.000' AS DateTime), CAST(N'2020-06-30T00:00:00.000' AS DateTime), 1, N'PA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (66, N'Oklahoma State Department of Health', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Corsi', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-31T00:00:00.000' AS DateTime), 0, N'OK')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (67, N'Covenant House New York/Under 21', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Beckman', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 1, N'NY')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (68, N'Planned Parenthood South Atlantic', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Buckner', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 0, N'NC')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (69, N'New York State Department of Health', N'Clinical Research in Pain Management', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Guice', CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), 1, N'NY')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (70, N'University of Puerto Rico Medical Sciences Campus', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Vermeulen', CAST(N'2020-10-01T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), 0, N'PR')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (71, N'Family Health Council of Central Pennsylvania', N'Clinical Research in Pain Management', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Loizias', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 0, N'PA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (72, N'"Missouri Family Health Council, Inc."', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Phillips', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 1, N'MO')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (73, N'Reducing Opiod Use Association of Puerto Rico', N'Preclinical Research in Pain Management', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Hamm', CAST(N'2020-06-01T00:00:00.000' AS DateTime), CAST(N'2020-06-30T00:00:00.000' AS DateTime), 1, N'PR')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (74, N'Maryland Department of Health', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-31T00:00:00.000' AS DateTime), 0, N'MD')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (75, N'Virginia Department of Health', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Aaron', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 0, N'VA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (76, N'Reducing Opiod Use Council of Nebraska', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Bimestefer', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 1, N'NE')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (77, N'Ohio Department of Health', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Orr White', CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), 1, N'OH')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (78, N'Ramsey County', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-10-01T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), 0, N'MN')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (79, N'Louisiana Department of Health', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Corsi', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 0, N'LA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (80, N'Alaska Dept. of Health & Social Services', N'Clinical Research in Pain Management', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Beckman', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 1, N'AK')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (81, N'"Health and Human Services Commission, Texas"', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Buckner', CAST(N'2020-06-01T00:00:00.000' AS DateTime), CAST(N'2020-06-30T00:00:00.000' AS DateTime), 0, N'TX')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (82, N'Commonwealth Healthcare Corporation', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Guice', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-31T00:00:00.000' AS DateTime), 0, N'MP')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (83, N'Wyoming Health Council', N'Preclinical Research in Pain Management', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Vermeulen', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 1, N'WY')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (84, N'"Caring Hands Healthcare Centers, Inc."', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Loizias', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 1, N'OK')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (85, N'New Hampshire Health & Human Services', N'Preclinical Research in Pain Management', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Phillips', CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), 1, N'NH')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (86, N'Caring To Love Ministries', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Hamm', CAST(N'2020-10-01T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), 1, N'LA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (87, N'Community Clinic Inc.', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 0, N'MD')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (88, N'"Unity Health Care, Inc."', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Aaron', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 0, N'DC')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (89, N'WEST VIRGINIA HUMAN RESOURCES', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Bimestefer', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-31T00:00:00.000' AS DateTime), 1, N'WV')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (90, N'Beacon Christian Community Health Center', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Orr White', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 0, N'NY')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (91, N'"New Jersey Reducing Opiod Use League, Inc."', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 0, N'NJ')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (92, N'Cornell Scott-Hill Health Corporation', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Corsi', CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), 1, N'CT')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (93, N'"Community Health Connection, Inc."', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Beckman', CAST(N'2020-10-01T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), 1, N'OK')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (94, N'Washington State Department of Health', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Buckner', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-31T00:00:00.000' AS DateTime), 0, N'WA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (95, N'"Indiana Family Health Council, Inc."', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Guice', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 0, N'IN')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (96, N'"The Family Health Centers of Georgia, Inc."', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Vermeulen', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 1, N'GA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (97, N'Planned Parenthood of Greater Ohio', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Loizias', CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), 1, N'OH')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (98, N'"The Floating Hospital, Inc."', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Phillips', CAST(N'2020-10-01T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), 0, N'NY')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (99, N'Kansas Department of Health and Environment', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Hamm', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-31T00:00:00.000' AS DateTime), 1, N'KS')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (100, N'Aunt Martha''s Health and Wellness', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 1, N'IL')
GO
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (101, N'"Action for Boston Community Development, Inc"', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Aaron', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 0, N'MA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (102, N'Nebraska Dept of Health and Human Services', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Bimestefer', CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), 1, N'NE')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (103, N'The College of New Jersey', N'Clinical Research in Pain Management', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Orr White', CAST(N'2020-10-01T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), 1, N'NJ')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (104, N'AccessMatters', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 1, N'PA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (105, N'Tennessee Department of Health', N'Preclinical Research in Pain Management', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Corsi', CAST(N'2020-06-01T00:00:00.000' AS DateTime), CAST(N'2020-06-30T00:00:00.000' AS DateTime), 0, N'TN')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (106, N'INNOVATION CENTER CORPORATION', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Beckman', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-31T00:00:00.000' AS DateTime), 0, N'MA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (107, N'"Neighborhood Improvement Project, Inc."', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Buckner', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 1, N'GA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (108, N'Planned Parenthood of Northern NE', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Guice', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 0, N'VT')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (109, N'Southern Nevada Health District', N'Research for the Treatment of Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Vermeulen', CAST(N'2020-11-01T00:00:00.000' AS DateTime), CAST(N'2020-11-30T00:00:00.000' AS DateTime), 1, N'NV')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (110, N'"Park DuValle Community Health Center, Inc."', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Loizias', CAST(N'2020-06-01T00:00:00.000' AS DateTime), CAST(N'2020-06-30T00:00:00.000' AS DateTime), 0, N'KY')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (111, N'Planned Parenthood of the Hawaiian Islands', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Phillips', CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-31T00:00:00.000' AS DateTime), 1, N'WA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (112, N'Guam Department of Public Health', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Hamm', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 1, N'GU')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (113, N'Nevada Primary Care Association', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 0, N'NV')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (114, N'Planned Parenthood of Great Northwest', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Aaron', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 0, N'WA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (115, N'Rhode Island Department of Health', N'Preclinical Research in Pain Management', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Bimestefer', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 0, N'RI')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (116, N'"Family Values Resource Institute, Inc."', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Orr White', CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), 1, N'LA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (117, N'KY Cabinet for Health and Family Services', N'Research to Prevent and Treat Opioid Addiction', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Stickney', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 1, N'KY')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (118, N'RMI Reducing Opiod Use Services', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Corsi', CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-02-27T00:00:00.000' AS DateTime), 1, N'MH')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (119, N'"The Obria Group, Inc."', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Beckman', CAST(N'2020-03-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 0, N'CA')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName], [Description], [Approved], [ApprovedDate], [ApprovedBy], [StartDate], [EndDate], [IsPublished], [State]) VALUES (120, N'Arizona Department of Health Services', N'Options for Opioid Use Disorder and Overdose', 1, CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Buckner', CAST(N'2020-04-01T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), 1, N'CA')
SET IDENTITY_INSERT [dbo].[Projects] OFF
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Indiana Family and Social Services Administration', N'Opioid Misuse Indiana Initiative (MOMII)', N'TRUE', N'12/14/2019', N'Vermeulen', N'1/1/2020', N'1/31/2020', N'FALSE', N'IN')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Maryland Department of Health', N'Maternal Opioid Misuse Model', N'TRUE', N'12/14/2019', N'Loizias', N'2/1/2020', N'2/27/2020', N'FALSE', N'MD')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Texas Health and Human Services Commission', N'MOM Model - Texas Medicaid', N'TRUE', N'12/14/2019', N'Phillips', N'3/1/2020', N'3/31/2020', N'FALSE', N'TX')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'State of Maine', N'Model Maine Maternal Opioid Model (MaineMOM)', N'TRUE', N'12/14/2019', N'Hamm', N'4/1/2020', N'4/30/2020', N'FALSE', N'ME')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Michigan Department of Health and Human Services', N'State of Michigan MOM Model', N'TRUE', N'12/14/2019', N'Stickney', N'10/1/2020', N'10/31/2020', N'FALSE', N'MI')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Tennessee Bureau of TennCare', N'Tennessee Opioid Misuse Model', N'TRUE', N'12/14/2019', N'Aaron', N'11/1/2020', N'11/30/2020', N'FALSE', N'TN')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Colorado Health Care Policy and Financing', N'Colorado Maternal Opioid Misuse - ICCO-MOM', N'TRUE', N'12/14/2019', N'Bimestefer', N'11/1/2020', N'11/30/2020', N'FALSE', N'CO')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Louisiana Department of Health and Hospitals', N'Maternal Opioid Misuse Model', N'TRUE', N'12/14/2019', N'Orr White', N'5/1/2020', N'5/31/2020', N'FALSE', N'LA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Michigan Department of Health and Human Services', N'State of Michigan MOM Model', N'TRUE', N'12/14/2019', N'Stickney', N'6/1/2020', N'6/30/2020', N'FALSE', N'MI')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Missouri Social Services HealthNet', N'Missouri Healing from Opioids', N'TRUE', N'12/14/2019', N'Corsi', N'7/1/2020', N'7/31/2020', N'FALSE', N'MO')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'State of New Hampshire', N'Maternal Opioid Misuse Model', N'TRUE', N'12/14/2019', N'Beckman', N'8/1/2020', N'8/31/2020', N'FALSE', N'NH')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Bureau for Medical Services', N'Maternal Opioid Misuse (MOM) Model', N'TRUE', N'12/14/2019', N'Buckner', N'9/1/2020', N'9/30/2020', N'FALSE', N'WV')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'CHFS DEPT FOR MEDICAID SERVICES', N'Maternal Opioid Misuse', N'TRUE', N'12/14/2019', N'Guice', N'12/1/2020', N'12/31/2020', N'FALSE', N'KY')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Michigan Department of Health and Human Services', N'Outcomes Children Exposed to Opioids', N'TRUE', N'12/14/2019', N'Vermeulen', N'7/1/2020', N'7/31/2020', N'FALSE', N'MI')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Spates Contracting and Development, Inc."', N'Outcomes Children Exposed to Opioids', N'TRUE', N'12/14/2019', N'Loizias', N'8/1/2020', N'8/31/2020', N'FALSE', N'AL')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Wisconsin Department of Health Services', N'Outcomes Children Exposed to Opioids', N'TRUE', N'12/14/2019', N'Phillips', N'9/1/2020', N'9/30/2020', N'FALSE', N'WI')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Reducing Opiod Use Council of Iowa', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Hamm', N'12/1/2020', N'12/31/2020', N'FALSE', N'IA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Florida Department of Health', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Stickney', N'7/1/2020', N'7/31/2020', N'FALSE', N'FL')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"State of Hawaii, Department of Health"', N'Outcomes Children Exposed to Opioids', N'TRUE', N'12/14/2019', N'Aaron', N'8/1/2020', N'8/31/2020', N'FALSE', N'HI')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Public Health Soutions', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Bimestefer', N'9/1/2020', N'9/30/2020', N'FALSE', N'NY')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Carson City Health and Human Service', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Orr White', N'12/1/2020', N'12/31/2020', N'FALSE', N'NV')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Iowa Department of Public Health', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Stickney', N'7/1/2020', N'7/31/2020', N'FALSE', N'IA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Montana Public Health and Human Services', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Corsi', N'8/1/2020', N'8/31/2020', N'FALSE', N'MT')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Primary Care Medical Services of Poinciana, Inc."', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Beckman', N'9/1/2020', N'9/30/2020', N'FALSE', N'FL')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'North Carolina Health and Human Services', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Buckner', N'12/1/2020', N'12/31/2020', N'FALSE', N'NC')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Health Imperatives, Inc."', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Guice', N'1/1/2020', N'1/31/2020', N'FALSE', N'MA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'State of Nevada', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Vermeulen', N'2/1/2020', N'2/27/2020', N'FALSE', N'NV')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'AMERICAN SAMOA MEDICAL CENTER AUTHORITY', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Loizias', N'3/1/2020', N'3/31/2020', N'FALSE', N'AS')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'City of El Paso', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Phillips', N'4/1/2020', N'4/30/2020', N'FALSE', N'TX')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Federated States of Micronesia', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Hamm', N'10/1/2020', N'10/31/2020', N'FALSE', N'NY')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Delaware Health & Social Services', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Stickney', N'11/1/2020', N'11/30/2020', N'FALSE', N'DE')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Alabama Department of Public Health', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Aaron', N'11/1/2020', N'11/30/2020', N'FALSE', N'AL')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Reducing Opiod Use Association of Maine, Inc."', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Bimestefer', N'5/1/2020', N'5/31/2020', N'FALSE', N'ME')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Washoe County Health District', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Orr White', N'6/1/2020', N'6/30/2020', N'FALSE', N'NV')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Oregon Health Authroity', N'Clinical Research in Pain Management', N'TRUE', N'12/14/2019', N'Stickney', N'1/1/2020', N'1/31/2020', N'FALSE', N'OR')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Arkansas Department of Health', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Corsi', N'2/1/2020', N'2/27/2020', N'FALSE', N'AR')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Colorado Health Care Policy and Financing', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Beckman', N'3/1/2020', N'3/31/2020', N'FALSE', N'NY')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Adagio Health Inc', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Buckner', N'4/1/2020', N'4/30/2020', N'FALSE', N'PA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Virgin Islands Department of Health Group', N'Outcomes Children Exposed to Opioids', N'TRUE', N'12/14/2019', N'Guice', N'10/1/2020', N'10/31/2020', N'FALSE', N'VI')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Arizona Family Health Partnership', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Vermeulen', N'11/1/2020', N'11/30/2020', N'FALSE', N'AZ')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'South Dakota Department of Health', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Loizias', N'11/1/2020', N'11/30/2020', N'FALSE', N'SD')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Essential Access Health', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Phillips', N'5/1/2020', N'5/31/2020', N'FALSE', N'CA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'North Dakota Department of Health', N'Preclinical Research in Pain Management', N'TRUE', N'12/14/2019', N'Hamm', N'6/1/2020', N'6/30/2020', N'FALSE', N'ND')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'State of Missouri', N'Preclinical Research in Pain Management', N'TRUE', N'12/14/2019', N'Stickney', N'1/1/2020', N'1/31/2020', N'FALSE', N'MO')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'New Mexico Department of Health', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Aaron', N'2/1/2020', N'2/27/2020', N'FALSE', N'NM')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'PLANNED PARENTHOOD OF SOUTHERN', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Bimestefer', N'3/1/2020', N'3/31/2020', N'FALSE', N'CT')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Palau Ministry of Health', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Orr White', N'4/1/2020', N'4/30/2020', N'FALSE', N'PW')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Planned Parenthood Southwest Ohio Region', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Stickney', N'10/1/2020', N'10/31/2020', N'FALSE', N'OH')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Planned Parenthood of Illinois', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Corsi', N'11/1/2020', N'11/30/2020', N'FALSE', N'IL')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Planned Parenthood of Wisconsin', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Beckman', N'11/1/2020', N'11/30/2020', N'FALSE', N'WI')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Idaho Department of Health and Welfare', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Buckner', N'5/1/2020', N'5/31/2020', N'FALSE', N'ID')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Planned Parenthood Minnesota', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Guice', N'6/1/2020', N'6/30/2020', N'FALSE', N'MN')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Community Health Centers of Pinellas, Inc."', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Vermeulen', N'6/1/2020', N'6/30/2020', N'FALSE', N'FL')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Vermont Agency of Human Services', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Loizias', N'1/1/2020', N'1/31/2020', N'FALSE', N'VT')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Health, Mississippi State Department of"', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Phillips', N'2/1/2020', N'2/27/2020', N'FALSE', N'MS')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Reducing Opiod Use Association of Texas', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Hamm', N'3/1/2020', N'3/31/2020', N'FALSE', N'TX')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'PLANNED PARENTHOOD ASSOCIATION OF UTAH', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Stickney', N'4/1/2020', N'4/30/2020', N'FALSE', N'UT')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Illinois Department of Public Health', N'Preclinical Research in Pain Management', N'TRUE', N'12/14/2019', N'Aaron', N'10/1/2020', N'10/31/2020', N'FALSE', N'IL')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Massachusetts Department of Public Health', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Bimestefer', N'11/1/2020', N'11/30/2020', N'FALSE', N'MA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'South Carolina Environmental Control', N'Outcomes Children Exposed to Opioids', N'TRUE', N'12/14/2019', N'Orr White', N'11/1/2020', N'11/30/2020', N'FALSE', N'SC')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Maternal and Family Health Services Inc', N'Preclinical Research in Pain Management', N'TRUE', N'12/14/2019', N'Stickney', N'6/1/2020', N'6/30/2020', N'FALSE', N'PA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Oklahoma State Department of Health', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Corsi', N'1/1/2020', N'1/31/2020', N'FALSE', N'OK')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Covenant House New York/Under 21', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Beckman', N'2/1/2020', N'2/27/2020', N'FALSE', N'NY')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Planned Parenthood South Atlantic', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Buckner', N'3/1/2020', N'3/31/2020', N'FALSE', N'NC')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'New York State Department of Health', N'Clinical Research in Pain Management', N'TRUE', N'12/14/2019', N'Guice', N'4/1/2020', N'4/30/2020', N'FALSE', N'NY')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'University of Puerto Rico Medical Sciences Campus', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Vermeulen', N'10/1/2020', N'10/31/2020', N'FALSE', N'PR')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Family Health Council of Central Pennsylvania', N'Clinical Research in Pain Management', N'TRUE', N'12/14/2019', N'Loizias', N'11/1/2020', N'11/30/2020', N'FALSE', N'PA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Missouri Family Health Council, Inc."', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Phillips', N'11/1/2020', N'11/30/2020', N'FALSE', N'MO')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Reducing Opiod Use Association of Puerto Rico', N'Preclinical Research in Pain Management', N'TRUE', N'12/14/2019', N'Hamm', N'6/1/2020', N'6/30/2020', N'FALSE', N'PR')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Maryland Department of Health', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Stickney', N'1/1/2020', N'1/31/2020', N'FALSE', N'MD')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Virginia Department of Health', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Aaron', N'2/1/2020', N'2/27/2020', N'FALSE', N'VA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Reducing Opiod Use Council of Nebraska', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Bimestefer', N'3/1/2020', N'3/31/2020', N'FALSE', N'NE')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Ohio Department of Health', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Orr White', N'4/1/2020', N'4/30/2020', N'FALSE', N'OH')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Ramsey County', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Stickney', N'10/1/2020', N'10/31/2020', N'FALSE', N'MN')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Louisiana Department of Health', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Corsi', N'11/1/2020', N'11/30/2020', N'FALSE', N'LA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Alaska Dept. of Health & Social Services', N'Clinical Research in Pain Management', N'TRUE', N'12/14/2019', N'Beckman', N'11/1/2020', N'11/30/2020', N'FALSE', N'AK')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Health and Human Services Commission, Texas"', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Buckner', N'6/1/2020', N'6/30/2020', N'FALSE', N'TX')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Commonwealth Healthcare Corporation', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Guice', N'1/1/2020', N'1/31/2020', N'FALSE', N'MP')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Wyoming Health Council', N'Preclinical Research in Pain Management', N'TRUE', N'12/14/2019', N'Vermeulen', N'2/1/2020', N'2/27/2020', N'FALSE', N'WY')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Caring Hands Healthcare Centers, Inc."', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Loizias', N'3/1/2020', N'3/31/2020', N'FALSE', N'OK')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'New Hampshire Health & Human Services', N'Preclinical Research in Pain Management', N'TRUE', N'12/14/2019', N'Phillips', N'4/1/2020', N'4/30/2020', N'FALSE', N'NH')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Caring To Love Ministries', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Hamm', N'10/1/2020', N'10/31/2020', N'FALSE', N'LA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Community Clinic Inc.', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Stickney', N'11/1/2020', N'11/30/2020', N'FALSE', N'MD')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Unity Health Care, Inc."', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Aaron', N'11/1/2020', N'11/30/2020', N'FALSE', N'DC')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'WEST VIRGINIA HUMAN RESOURCES', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Bimestefer', N'1/1/2020', N'1/31/2020', N'FALSE', N'WV')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Beacon Christian Community Health Center', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Orr White', N'2/1/2020', N'2/27/2020', N'FALSE', N'NY')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"New Jersey Reducing Opiod Use League, Inc."', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Stickney', N'3/1/2020', N'3/31/2020', N'FALSE', N'NJ')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Cornell Scott-Hill Health Corporation', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Corsi', N'4/1/2020', N'4/30/2020', N'FALSE', N'CT')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Community Health Connection, Inc."', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Beckman', N'10/1/2020', N'10/31/2020', N'FALSE', N'OK')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Washington State Department of Health', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Buckner', N'1/1/2020', N'1/31/2020', N'FALSE', N'WA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Indiana Family Health Council, Inc."', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Guice', N'2/1/2020', N'2/27/2020', N'FALSE', N'IN')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"The Family Health Centers of Georgia, Inc."', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Vermeulen', N'3/1/2020', N'3/31/2020', N'FALSE', N'GA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Planned Parenthood of Greater Ohio', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Loizias', N'4/1/2020', N'4/30/2020', N'FALSE', N'OH')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"The Floating Hospital, Inc."', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Phillips', N'10/1/2020', N'10/31/2020', N'FALSE', N'NY')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Kansas Department of Health and Environment', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Hamm', N'1/1/2020', N'1/31/2020', N'FALSE', N'KS')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Aunt Martha''s Health and Wellness', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Stickney', N'2/1/2020', N'2/27/2020', N'FALSE', N'IL')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Action for Boston Community Development, Inc"', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Aaron', N'3/1/2020', N'3/31/2020', N'FALSE', N'MA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Nebraska Dept of Health and Human Services', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Bimestefer', N'4/1/2020', N'4/30/2020', N'FALSE', N'NE')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'The College of New Jersey', N'Clinical Research in Pain Management', N'TRUE', N'12/14/2019', N'Orr White', N'10/1/2020', N'10/31/2020', N'FALSE', N'NJ')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'AccessMatters', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Stickney', N'11/1/2020', N'11/30/2020', N'FALSE', N'PA')
GO
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Tennessee Department of Health', N'Preclinical Research in Pain Management', N'TRUE', N'12/14/2019', N'Corsi', N'6/1/2020', N'6/30/2020', N'FALSE', N'TN')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'INNOVATION CENTER CORPORATION', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Beckman', N'1/1/2020', N'1/31/2020', N'FALSE', N'MA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Neighborhood Improvement Project, Inc."', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Buckner', N'2/1/2020', N'2/27/2020', N'FALSE', N'GA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Planned Parenthood of Northern NE', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Guice', N'3/1/2020', N'3/31/2020', N'FALSE', N'VT')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Southern Nevada Health District', N'Research for the Treatment of Opioid Addiction', N'TRUE', N'12/14/2019', N'Vermeulen', N'11/1/2020', N'11/30/2020', N'FALSE', N'NV')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Park DuValle Community Health Center, Inc."', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Loizias', N'6/1/2020', N'6/30/2020', N'FALSE', N'KY')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Planned Parenthood of the Hawaiian Islands', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Phillips', N'1/1/2020', N'1/31/2020', N'FALSE', N'WA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Guam Department of Public Health', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Hamm', N'2/1/2020', N'2/27/2020', N'FALSE', N'GU')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Nevada Primary Care Association', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Stickney', N'3/1/2020', N'3/31/2020', N'FALSE', N'NV')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Planned Parenthood of Great Northwest', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Aaron', N'2/1/2020', N'2/27/2020', N'FALSE', N'WA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Rhode Island Department of Health', N'Preclinical Research in Pain Management', N'TRUE', N'12/14/2019', N'Bimestefer', N'3/1/2020', N'3/31/2020', N'FALSE', N'RI')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"Family Values Resource Institute, Inc."', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Orr White', N'4/1/2020', N'4/30/2020', N'FALSE', N'LA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'KY Cabinet for Health and Family Services', N'Research to Prevent and Treat Opioid Addiction', N'TRUE', N'12/14/2019', N'Stickney', N'2/1/2020', N'2/27/2020', N'FALSE', N'KY')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'RMI Reducing Opiod Use Services', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Corsi', N'2/1/2020', N'2/27/2020', N'FALSE', N'MH')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'"The Obria Group, Inc."', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Beckman', N'3/1/2020', N'3/31/2020', N'FALSE', N'CA')
INSERT [dbo].[Projects1] ([Legal Name], [Project Title], [Approved], [Approved Date], [Approved By], [Start Date], [End Date], [Is Published], [State]) VALUES (N'Arizona Department of Health Services', N'Options for Opioid Use Disorder and Overdose', N'TRUE', N'12/14/2019', N'Buckner', N'4/1/2020', N'4/30/2020', N'FALSE', N'CA')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (2, 4, 1, N'AAA', 5, 1, NULL)
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (2, 20, 1, NULL, NULL, 1, N'1/2')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (2, 21, 4, NULL, NULL, 1, N'1/2')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (7, 5, 1, N'test', NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (26, 21, 2, NULL, NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (30, 21, 1, NULL, NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (32, 5, 1, NULL, NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (33, 21, 3, NULL, NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (41, 5, 2, NULL, NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (42, 21, 4, NULL, NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (48, 22, 1, NULL, NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (51, 21, 3, NULL, NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (60, 5, 3, NULL, NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (76, 5, 4, NULL, NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (83, 22, 1, NULL, NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (85, 21, 1, NULL, NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (96, 5, 4, NULL, NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (112, 22, 1, NULL, NULL, 1, N'0/0')
INSERT [dbo].[ResearcherApprovals] ([ProjectId], [ResearcherId], [ApprovalStatusId], [InfoRequested], [ApproverId], [HasResearcherApplied], [ExpertiseMatchScore]) VALUES (118, 22, 1, NULL, NULL, 1, N'0/0')
SET IDENTITY_INSERT [dbo].[ResearcherAvailabilities] ON 

INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (2, 4, 3)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (3, 5, 3)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (4, 13, 2)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (5, 13, 3)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (6, 13, 4)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (7, 13, 9)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (8, 13, 12)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (9, 14, 2)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (10, 14, 3)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (11, 14, 4)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (12, 15, 1)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (13, 15, 2)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (14, 15, 3)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (15, 15, 4)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (16, 15, 5)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (17, 15, 6)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (18, 16, 1)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (19, 16, 2)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (20, 16, 3)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (21, 17, 1)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (22, 17, 2)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (23, 18, 2)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (24, 18, 3)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (25, 19, 1)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (26, 19, 2)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (27, 19, 5)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (28, 20, 1)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (29, 20, 2)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (30, 20, 3)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (31, 20, 4)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (32, 21, 1)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (33, 21, 4)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (34, 21, 7)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (35, 22, 1)
INSERT [dbo].[ResearcherAvailabilities] ([AvailabilityId], [ResearcherId], [Month]) VALUES (36, 22, 2)
SET IDENTITY_INSERT [dbo].[ResearcherAvailabilities] OFF
SET IDENTITY_INSERT [dbo].[ResearcherExpertises] ON 

INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (2, 3, 5)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (3, 13, 17)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (4, 13, 18)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (5, 13, 19)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (6, 14, 13)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (7, 14, 14)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (8, 14, 15)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (9, 15, 13)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (10, 15, 14)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (11, 15, 15)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (12, 15, 16)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (13, 16, 2)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (14, 16, 3)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (15, 16, 14)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (16, 16, 15)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (17, 16, 16)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (18, 17, 13)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (19, 17, 15)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (20, 18, 4)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (21, 18, 13)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (22, 18, 16)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (23, 19, 12)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (24, 19, 13)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (25, 19, 14)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (26, 20, 6)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (27, 20, 7)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (28, 20, 8)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (29, 20, 10)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (30, 20, 12)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (31, 21, 4)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (32, 21, 13)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (33, 21, 17)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (34, 22, 2)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (35, 22, 3)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (36, 22, 14)
INSERT [dbo].[ResearcherExpertises] ([ResearchExpertiseId], [ResearcherId], [ExpertiseId]) VALUES (37, 22, 22)
SET IDENTITY_INSERT [dbo].[ResearcherExpertises] OFF
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Joseph', N'Lapp', N'joseph.lapp@gmail.test', N'123', N'2', N'12763838423', N'2763838423', N'AK', N'Whiteville City Schools', N'University of Illinois Urbana-Champion')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Ana', N'Delgado', N'ana.delgado@ucsf.test', N'123', N'2', N'12763838423', N'San Francisco', N'CA', N'BYC Consulting', N'Rhodes College')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'DeAnne', N'Blankenship', N'dblankenship@healthcollaborative.test', N'123', N'2', N'12763838423', N'Chico', N'CA', N'Spring ISD', N'Lees McRae College')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Denise', N'Johnston', N'johnstondenise@hotmail.test', N'123', N'2', N'12763838423', N'Los Angeles', N'CA', N'Self-employed', N'Prairie View A & M')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Eleanor', N'Schwarz', N'ebschwarz@ucdavis.test', N'123', N'2', N'12763838423', N'Sacramento', N'CA', N'South Holland School District 151', N'University of Louisville')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kristyn', N'Brandi', N'kristyn.brandi@gmail.test', N'123', N'2', N'12763838423', N'Los Angeles', N'CA', N'Self', N'Rutgers')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Marsha', N'Ellis', N'marshaellis1984@gmail.test', N'123', N'2', N'12763838423', N'Los Angeles', N'CA', N'Franklin University', N'Barnard College')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Nancy', N'Githere', N'wanjirugithere@gmail.test', N'123', N'2', N'12763838423', N'San Leandro', N'CA', N'California State University Monterey Bay', N'Stanford University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Rebecca', N'Jones Munger', N'randmunger@gmail.test', N'123', N'2', N'12763838423', N'Sebastopol', N'CA', N'Army National Guard', N'Ohio State University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Sally', N'Rafie', N'srafie@ucsd.test', N'123', N'2', N'12763838423', N'San Diego', N'CA', N'St. Lawrence University', N'Ashland University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Stephen', N'Purser', N'slpurser@msn.test', N'123', N'2', N'12763838423', N'Richmond', N'CA', N'St. Lawrence University', N'University Of Arkansas')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Wilynda', N'Leonard', N'wilpowar@icloud.test', N'123', N'2', N'12763838423', N'Los Angeles', N'CA', N'Leonard&Associates', N'UC Berkeley')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Adjoa', N'Jones', N'adjones@dhs.lacounty.test', N'123', N'2', N'12763838423', N'Los Angeles', N'CA', N'L.A. County Department of Health Services', N'Northern Arizona University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Rachelle', N'Woods', N'rnclcicce@hotmail.test', N'123', N'2', N'12763838423', N'Littleton', N'CO', N'St. Lawrence University', N'Loyola Marymount University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Tara', N'Thomas-Gale', N'tara.thomas-gale@dhha.test', N'123', N'2', N'12763838423', N'Denver', N'CO', N'Denver Health', N'Hampton University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Brenda', N'Leath', N'leathbrenda2@gmail.test', N'123', N'2', N'12763838423', N'Washington', N'DC', N'Township High School District 214', N'West Chester University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Elizabeth', N'Wieand', N'efwieand@gmail.test', N'123', N'2', N'12763838423', N'Washington', N'DC', N'DC international high school dcpcs', N'University of Maryland')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Evelyn', N'Coronado Guillaumet', N'ecguillaumet@acog.test', N'123', N'2', N'12763838423', N'"Washington, DC"', N'DC', N'Greene County Schools', N'University of Kentucky')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jermane', N'Bond', N'jbond@nationalcollaborative.test', N'123', N'2', N'12763838423', N'Washington', N'DC', N'New Jersey Department of Education', N'University of Connecticut')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'John', N'Davitt', N'johnmdavitt@gmail.test', N'123', N'2', N'12763838423', N'Washington', N'DC', N'AISD', N'Abilene Christian University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Rennetta', N'Mulkey', N'rennettamulkey@gmail.test', N'123', N'2', N'12763838423', N'Washington', N'DC', N'Girl Scouts', N'Trevecca Nazarene Univ.')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Rosario', N'Falero', N'rosario.falero@va.test', N'123', N'2', N'12763838423', N'Tampa', N'FL', N'Retired from SREB', N'Dartmouth College')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Alexandra', N'Sherman', N'Alexandra.a.sherman@gmail.test', N'123', N'2', N'12763838423', N'New York', N'GA', N'UMUC', N'Tulane University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Cheryl', N'Prince', N'cbprince@icloud.test', N'123', N'2', N'12763838423', N'Decatur', N'GA', N'Evaluation Partners', N'Florida State University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Cynthia', N'Loftin', N'ckloftin3@gmail.test', N'123', N'2', N'12763838423', N'Decatur', N'GA', N'National Network of State Teachers of the Year', N'University of South Carolina')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Helen', N'Durrence', N'diane.durrence@dph.ga.test', N'123', N'2', N'12763838423', N'Smyrna', N'GA', N'UCLA Center X', N'Ohio state')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jenie', N'Christopher', N'jeniechristopher@gmail.test', N'123', N'2', N'12763838423', N'Kennesaw', N'GA', N'Round Rock ISD', N'Illinois State University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Lynn', N'Flen', N'lynnflen@yahoo.test', N'123', N'2', N'12763838423', N'Atlanta', N'GA', N'Adjunct Faculty at Marygrove College', N'East Carolina University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Sherri', N'Livingstone', N'sghancel@gmail.test', N'123', N'2', N'12763838423', N'Buford', N'GA', N'St. Lawrence University', N'Duquesne University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kimberley', N'Schorr', N'publichealthwahine@gmail.test', N'123', N'2', N'12763838423', N'Pahoa', N'HI', N'Retired', N'Wayne State University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Glendean', N'Burton', N'glendeanburton@hotmail.test', N'123', N'2', N'12763838423', N'Yorkville', N'IL', N'Oak Ridge Associated Universities', N'University of Houston-Clear Lake')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Hope', N'Barrett', N'hbarrett@aap.test', N'123', N'2', N'12763838423', N'Itasca', N'IL', N'"Semi-retired, Marygrove College and AdvancED"', N'Nova Southeastern University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kairsten', N'Thies', N'kairsten.thies@gmail.test', N'123', N'2', N'12763838423', N'Chicago', N'IL', N'East Orange Board of Education', N'East Carolina University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Karla', N'Palmer', N'karlitapalmer@gmail.test', N'123', N'2', N'12763838423', N'Chicago', N'IL', N'Montclair State University', N'University of Massachusetts')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kelly', N'Vrablic', N'Kelly.Vrablic@illinois.test', N'123', N'2', N'12763838423', N'Evergreen Park', N'IL', N'UNLV', N'Baylor University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kera', N'Beskin', N'kerabeskin@gmail.test', N'123', N'2', N'12763838423', N'Chicago', N'IL', N'Self', N'University of California')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Mary', N'Curry', N'marycurrynd@gmail.test', N'123', N'2', N'12763838423', N'Chicago', N'IL', N'Metropolitan Nashville Public Schools', N'Leyte Normal University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Mulubrhan', N'Mogos', N'mmogos@uic.test', N'123', N'2', N'12763838423', N'Chicago', N'IL', N'Metropolitan Nashville Public Schools', N'The Ohio State University (B.S. Edu)')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Pamela', N'Roesch', N'pamela.roesch@sinai.test', N'123', N'2', N'12763838423', N'Chicago', N'IL', N'Capitol Region Education Council', N'University of Massachusetts')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Casandra', N'Cashman', N'casandra.cashman@yahoo.test', N'123', N'2', N'12763838423', N'indianapolis', N'IN', N'University of Houston', N'University of Pittsburgh')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Gina', N'Forrest', N'gforrest@indiana.test', N'123', N'2', N'12763838423', N'Bloomington', N'IN', N'Fort Valley State University', N'University of Houston')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Mary', N'Abernathy', N'mabernat@iupui.test', N'123', N'2', N'12763838423', N'Indianapolis', N'IN', N'HEDGE Co', N'Kent State University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Denise', N'Wheeler', N'bittycat3@yahoo.test', N'123', N'2', N'12763838423', N'Ankeny', N'IA', N'EVSC', N'Grambling')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Carina', N'Ryder', N'crydercnm@districtgyn.test', N'123', N'2', N'12763838423', N'Takoma Park', N'MD', N'Ohio State University', N'Claremont Graduate School')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Garrette', N'Martin-Yeboah', N'garrette.martin-yeboah@hhs.test', N'123', N'2', N'12763838423', N'Cockeysville', N'MD', N'Military Child Education Coalition', N'Stanford University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jaida', N'Carter', N'jaidacarter86@gmail.test', N'123', N'2', N'12763838423', N'Fort Washington', N'MD', N'Montgomery Township Board of Education', N'Iowa State University (BS')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jasmin', N'Saville', N'saville814@gmail.test', N'123', N'2', N'12763838423', N'Wilmington', N'MD', N'The Learning Partnership', N'University of Illinois')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Joy', N'Nanda', N'joypnanda@gmail.test', N'123', N'2', N'12763838423', N'Baltimore', N'MD', N'SOUTH CAROLINA ASSOCIATION FOR ACHIEVEMENT NOW', N'University of Southern')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'KENNETH', N'SIMIYU', N'ksimiyu@gmail.test', N'123', N'2', N'12763838423', N'ELKRIDGE', N'MD', N'Retired educator from Ohio University', N'Penn State')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Pat', N'Paluzzi', N'pat@healthyteennetwork.test', N'123', N'2', N'12763838423', N'Baltimore', N'MD', N'Brigham Young University Idaho', N'University of Toledo')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Wendy', N'Frosh', N'wjfrosh@wendyfrosh.test', N'123', N'2', N'12763838423', N'North Bethesda', N'MD', N'Healthcare Management Strategies/self', N'University of Florida')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Barbara', N'Tausey', N'taus1717@norwoodlight.test', N'123', N'2', N'12763838423', N'New York', N'MA', N'Manhattan Strategy Group', N'American InterContinental university')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Heather', N'Sankey', N'Heather.Sankey@baystatehealth.test', N'123', N'2', N'12763838423', N'Springfield', N'MA', N'Johnson C. Smith University', N'Ohio state')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Karen', N'Edlund', N'kedlund3@gmail.test', N'123', N'2', N'12763838423', N'Somerville', N'MA', N'KIPP Texas', N'UMass Dartmouth')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Maisha', N'DouyonCover', N'mdouyon@bwh.harvard.test', N'123', N'2', N'12763838423', N'West Roxbury', N'MA', N'St. Francis de Sales School', N'Seton Hall University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Melanie', N'Zurek', N'mz@providecare.test', N'123', N'2', N'12763838423', N'Cambridge', N'MA', N'UPMC Health Plan', N'University of Maryland Eastern Shore')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kiddada', N'Green', N'Kiddadag@bmbfa.test', N'123', N'2', N'12763838423', N'Southfield', N'MI', N'Texas Southern University', N'University of Texas at Austin')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jill', N'Farris', N'farrisj@umn.test', N'123', N'2', N'12763838423', N'Minneapolis', N'MN', N'Nyssa School District', N'West Craven High School')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Dr. Melinda', N'Todd', N'melinda.g.todd@jsums.test', N'123', N'2', N'12763838423', N'Jackson', N'MS', N'Guilford County Schools', N'NA')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Holly', N'Jordt', N'hjordt@flathead.mt.test', N'123', N'2', N'12763838423', N'Kalispell', N'MO', N'Grand Canyon University', N'Oakland U and Wayne State')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kathleen', N'Mullen', N'kmmullen@comcast.net', N'123', N'2', N'12763838423', N'Brick', N'NJ', N'Bina Bangsa School', N'Grand Valley State University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Bibi', N'Alladin', N'noorie@mail.test', N'123', N'2', N'12763838423', N'New York', N'NY', N'SRI International', N'Harvard Graduate School of Education')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Dionne', N'Durant', N'dionneadurant@aol.test', N'123', N'2', N'12763838423', N'Jamaica', N'NY', N'Yorkville High School', N'Tech')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Mildred', N'Hall', N'mkh@bppn.test', N'123', N'2', N'12763838423', N'Buffalo', N'NY', N'Kentucky Department of Education', N'Ed.D. Texas A& M University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Cherish', N'Stewart', N'cstewa15@eagles.nccu.test', N'123', N'2', N'12763838423', N'Charlotte', N'NC', N'College of the Mainland', N'Loyola University Chicago')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Eleanor', N'Stevenson', N'eleanor.stevenson@duke.test', N'123', N'2', N'12763838423', N'Durham', N'NC', N'North Broward Preparatory School', N'University of Colorado at Boulder')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Janis', N'Blanchard', N'recap7314@mypacks.net', N'123', N'2', N'12763838423', N'Wilmington', N'NC', N'semi-retired', N'UC Berkeley')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'John', N'Thorp (USA)', N'thorp@med.unc.test', N'123', N'2', N'12763838423', N'Chapel Hill', N'NC', N'Portland Public Schools', N'Oakland University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kathryn', N'Trotter', N'kathy.trotter@duke.test', N'123', N'2', N'12763838423', N'Hillsborough', N'NC', N'Cornell Tech', N'University of Minnesota')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Mary', N'Vance', N'mary.m.vance@gmail.test', N'123', N'2', N'12763838423', N'Durham', N'NC', N'UnboundEd', N'UNLV')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Frederick', N'Eruo', N'feruo@yahoo.test', N'123', N'2', N'12763838423', N'North Canton', N'OH', N'Humble ISD', N'Ohio State University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Zyishia', N'Bailey', N'zyishia.bailey@yahoo.test', N'123', N'2', N'12763838423', N'Toledo', N'OH', N'Toledo-Lucas County Health Department', N'Brigham Young University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Ayesha', N'Lampkins', N'ayeshal@health.ok.test', N'123', N'2', N'12763838423', N'New York', N'OK', N'Utah State Board of Education', N'Grinnell College')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Diana', N'Smith', N'dslouise@gmail.test', N'123', N'2', N'12763838423', N'Portland', N'OR', N'Retired', N'Illinois Institute of Technology')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Lynn', N'Shay', N'crnplynn@gmail.test', N'123', N'2', N'12763838423', N'Barto', N'PA', N'Eastern Michigan University', N'HOFSTRA UNIVERSITY')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Paul', N'Whittaker', N'paulwhit@pennmedicine.upenn.test', N'123', N'2', N'12763838423', N'Wyncote', N'PA', N'Northern Arizona University Center', N'Marygrove College')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Snigdha', N'Mukherjee', N'snigdhamukherjee@yahoo.test', N'123', N'2', N'12763838423', N'Philadelphia', N'PA', N'Foundation for Advancement', N'University of Louisville')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Villar-Robles', N'Fernando', N'fvillar@salud.pr.test', N'123', N'2', N'12763838423', N'Carolina', N'PR', N'MCH DHPR', N'UCLA')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jami', N'Star', N'jstar126@gmail.test', N'123', N'2', N'12763838423', N'Barrington', N'RI', N'University of Wisconsin Superior', N'Florida State University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jennifer Hosmer', N'MPH', N'jjhosmer@cox.net', N'123', N'2', N'12763838423', N'Cranston', N'RI', N'University of Michigan', N'Nova Southeastern University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Katherine', N'Larsen', N'katherine.larsen@knoxcounty.test', N'123', N'2', N'12763838423', N'Knoxville', N'TN', N'Canton City School District', N'University of Toledo')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Loraine', N'Lucinski', N'loraine.lucinski@gmail.test', N'123', N'2', N'12763838423', N'Nashville', N'TN', N'Marshall Public Schools', N'Pomona College')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Nikki', N'Zite', N'nzite@utmck.test', N'123', N'2', N'12763838423', N'Knoxville', N'TN', N'Portsmouth Public Schools (Virginia)', N'Hampton University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Olukayode', N'Akinlaja', N'Kayakins72@yahoo.test', N'123', N'2', N'12763838423', N'Chattanooga', N'TN', N'"Education Design, INC"', N'Oakland University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Revlon', N'Briggs', N'rbriggs@tnstate.test', N'123', N'2', N'12763838423', N'Nashville', N'TN', N'"Clark County School District - Las Vegas, NV"', N'University of Scranton')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Carla', N'Crider', N'carla.crider@tccd.test', N'123', N'2', N'12763838423', N'Lipan', N'TX', N'Griffin Center for Inspired Instruction', N'UC Berkeley')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Erica', N'Asante', N'edanquah@gmail.test', N'123', N'2', N'12763838423', N'Dallas', N'TX', N'Ignited (igniteducation.org)', N'Arizona State University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Lauren', N'Thaxton', N'lauren.thaxton@austin.utexas.test', N'123', N'2', N'12763838423', N'Austin', N'TX', N'Detroit Public School Community District', N'Eastern Oregon University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Mary Ann', N'Faucher', N'maryann_faucher@baylor.test', N'123', N'2', N'12763838423', N'Dallas', N'TX', N'Ohio Department of Education', N'Ohio University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Rahmatu', N'Kassimu', N'Tkass87@gmail.test', N'123', N'2', N'12763838423', N'Arlington', N'TX', N'DC Public Schools', N'Universit y of Colorado')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Rebecca', N'Teng', N'rtengmd@gmail.test', N'123', N'2', N'12763838423', N'Round Rock', N'TX', N'Sauk Prairie School District', N'Union College (NY)')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Susan', N'Wolfe', N'susan@susanwolfeandassociates.test', N'123', N'2', N'12763838423', N'Cedar Hill', N'TX', N'"Susan Wolfe and Associates, LLC"', N'University of Virginia')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Abigail', N'Aiken', N'araa2@utexas.test', N'123', N'2', N'12763838423', N'Austin', N'TX', N'Manor ISD', N'Pennsylvania State University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Pascale', N'de Rozario', N'p.derozario@gmail.test', N'123', N'2', N'12763838423', N'Salt Lake City', N'UT', N'The School of Arts & Enterprise', N'Western Michigan University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Cornelia', N'Deagle', N'cornelia.deagle@vdh.virginia.test', N'123', N'2', N'12763838423', N'Richmond', N'VA', N'DCPS', N'Tennessee State University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jeanne', N'Murphy-Stone', N'jeannemurphy@gwu.test', N'123', N'2', N'12763838423', N'Ashburn', N'VA', N'Boston College', N'CSU Fullerton')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Lemlem', N'Ejo', N'lemerk@gmail.test', N'123', N'2', N'12763838423', N'Ashburn', N'VA', N'Grand Canyon University', N'St. Edward''s University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Marilyn', N'Lewis', N'mwlewis@nsu.test', N'123', N'2', N'12763838423', N'Norfolk', N'VA', N'Arizona State University', N'Boston University')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Laura', N'Hart', N'richlaura2@comcast.net', N'123', N'2', N'12763838423', N'Seattle', N'WA', N'Florida State University', N'University of Idaho')
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jill', N'Denson', N'jillddenson@gmail.test', N'123', N'2', N'12763838423', N'Brown Deer', N'WI', N'Billings Public Schools', N'California Academy of Sciences')
GO
INSERT [dbo].[Researchers] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Mary', N'Homan', N'mhoman@mcw.test', N'123', N'2', N'12763838423', N'Milwaukee', N'WI', N'KIPP ENC College Prep', N'University of Washington')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Joseph', N'Lapp', N'joseph.lapp@gmail.test', N'', N'2', N'12763838423', N'2763838423', N'AK', N'Whiteville City Schools', N'University of Illinois Urbana-Champion')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Ana', N'Delgado', N'ana.delgado@ucsf.test', N'', N'2', N'12763838423', N'San Francisco', N'CA', N'BYC Consulting', N'Rhodes College')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'DeAnne', N'Blankenship', N'dblankenship@healthcollaborative.test', N'', N'2', N'12763838423', N'Chico', N'CA', N'Spring ISD', N'Lees McRae College')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Denise', N'Johnston', N'johnstondenise@hotmail.test', N'', N'2', N'12763838423', N'Los Angeles', N'CA', N'Self-employed', N'Prairie View A & M')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Eleanor', N'Schwarz', N'ebschwarz@ucdavis.test', N'', N'2', N'12763838423', N'Sacramento', N'CA', N'South Holland School District 151', N'University of Louisville')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kristyn', N'Brandi', N'kristyn.brandi@gmail.test', N'', N'2', N'12763838423', N'Los Angeles', N'CA', N'Self', N'Rutgers')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Marsha', N'Ellis', N'marshaellis1984@gmail.test', N'', N'2', N'12763838423', N'Los Angeles', N'CA', N'Franklin University', N'Barnard College')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Nancy', N'Githere', N'wanjirugithere@gmail.test', N'', N'2', N'12763838423', N'San Leandro', N'CA', N'California State University Monterey Bay', N'Stanford University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Rebecca', N'Jones Munger', N'randmunger@gmail.test', N'', N'2', N'12763838423', N'Sebastopol', N'CA', N'Army National Guard', N'Ohio State University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Sally', N'Rafie', N'srafie@ucsd.test', N'', N'2', N'12763838423', N'San Diego', N'CA', N'St. Lawrence University', N'Ashland University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Stephen', N'Purser', N'slpurser@msn.test', N'', N'2', N'12763838423', N'Richmond', N'CA', N'St. Lawrence University', N'University Of Arkansas')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Wilynda', N'Leonard', N'wilpowar@icloud.test', N'', N'2', N'12763838423', N'Los Angeles', N'CA', N'Leonard&Associates', N'UC Berkeley')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Adjoa', N'Jones', N'adjones@dhs.lacounty.test', N'', N'2', N'12763838423', N'Los Angeles', N'CA', N'L.A. County Department of Health Services', N'Northern Arizona University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Rachelle', N'Woods', N'rnclcicce@hotmail.test', N'', N'2', N'12763838423', N'Littleton', N'CO', N'St. Lawrence University', N'Loyola Marymount University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Tara', N'Thomas-Gale', N'tara.thomas-gale@dhha.test', N'', N'2', N'12763838423', N'Denver', N'CO', N'Denver Health', N'Hampton University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Brenda', N'Leath', N'leathbrenda2@gmail.test', N'', N'2', N'12763838423', N'Washington', N'DC', N'Township High School District 214', N'West Chester University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Elizabeth', N'Wieand', N'efwieand@gmail.test', N'', N'2', N'12763838423', N'Washington', N'DC', N'DC international high school dcpcs', N'University of Maryland')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Evelyn', N'Coronado Guillaumet', N'ecguillaumet@acog.test', N'', N'2', N'12763838423', N'"Washington, DC"', N'DC', N'Greene County Schools', N'University of Kentucky')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jermane', N'Bond', N'jbond@nationalcollaborative.test', N'', N'2', N'12763838423', N'Washington', N'DC', N'New Jersey Department of Education', N'University of Connecticut')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'John', N'Davitt', N'johnmdavitt@gmail.test', N'', N'2', N'12763838423', N'Washington', N'DC', N'AISD', N'Abilene Christian University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Rennetta', N'Mulkey', N'rennettamulkey@gmail.test', N'', N'2', N'12763838423', N'Washington', N'DC', N'Girl Scouts', N'Trevecca Nazarene Univ.')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Rosario', N'Falero', N'rosario.falero@va.test', N'', N'2', N'12763838423', N'Tampa', N'FL', N'Retired from SREB', N'Dartmouth College')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Alexandra', N'Sherman', N'Alexandra.a.sherman@gmail.test', N'', N'2', N'12763838423', N'New York', N'GA', N'UMUC', N'Tulane University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Cheryl', N'Prince', N'cbprince@icloud.test', N'', N'2', N'12763838423', N'Decatur', N'GA', N'Evaluation Partners', N'Florida State University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Cynthia', N'Loftin', N'ckloftin3@gmail.test', N'', N'2', N'12763838423', N'Decatur', N'GA', N'National Network of State Teachers of the Year', N'University of South Carolina')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Helen', N'Durrence', N'diane.durrence@dph.ga.test', N'', N'2', N'12763838423', N'Smyrna', N'GA', N'UCLA Center X', N'Ohio state')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jenie', N'Christopher', N'jeniechristopher@gmail.test', N'', N'2', N'12763838423', N'Kennesaw', N'GA', N'Round Rock ISD', N'Illinois State University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Lynn', N'Flen', N'lynnflen@yahoo.test', N'', N'2', N'12763838423', N'Atlanta', N'GA', N'Adjunct Faculty at Marygrove College', N'East Carolina University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Sherri', N'Livingstone', N'sghancel@gmail.test', N'', N'2', N'12763838423', N'Buford', N'GA', N'St. Lawrence University', N'Duquesne University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kimberley', N'Schorr', N'publichealthwahine@gmail.test', N'', N'2', N'12763838423', N'Pahoa', N'HI', N'Retired', N'Wayne State University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Glendean', N'Burton', N'glendeanburton@hotmail.test', N'', N'2', N'12763838423', N'Yorkville', N'IL', N'Oak Ridge Associated Universities', N'University of Houston-Clear Lake')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Hope', N'Barrett', N'hbarrett@aap.test', N'', N'2', N'12763838423', N'Itasca', N'IL', N'"Semi-retired, Marygrove College and AdvancED"', N'Nova Southeastern University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kairsten', N'Thies', N'kairsten.thies@gmail.test', N'', N'2', N'12763838423', N'Chicago', N'IL', N'East Orange Board of Education', N'East Carolina University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Karla', N'Palmer', N'karlitapalmer@gmail.test', N'', N'2', N'12763838423', N'Chicago', N'IL', N'Montclair State University', N'University of Massachusetts')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kelly', N'Vrablic', N'Kelly.Vrablic@illinois.test', N'', N'2', N'12763838423', N'Evergreen Park', N'IL', N'UNLV', N'Baylor University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kera', N'Beskin', N'kerabeskin@gmail.test', N'', N'2', N'12763838423', N'Chicago', N'IL', N'Self', N'University of California')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Mary', N'Curry', N'marycurrynd@gmail.test', N'', N'2', N'12763838423', N'Chicago', N'IL', N'Metropolitan Nashville Public Schools', N'Leyte Normal University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Mulubrhan', N'Mogos', N'mmogos@uic.test', N'', N'2', N'12763838423', N'Chicago', N'IL', N'Metropolitan Nashville Public Schools', N'The Ohio State University (B.S. Edu)')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Pamela', N'Roesch', N'pamela.roesch@sinai.test', N'', N'2', N'12763838423', N'Chicago', N'IL', N'Capitol Region Education Council', N'University of Massachusetts')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Casandra', N'Cashman', N'casandra.cashman@yahoo.test', N'', N'2', N'12763838423', N'indianapolis', N'IN', N'University of Houston', N'University of Pittsburgh')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Gina', N'Forrest', N'gforrest@indiana.test', N'', N'2', N'12763838423', N'Bloomington', N'IN', N'Fort Valley State University', N'University of Houston')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Mary', N'Abernathy', N'mabernat@iupui.test', N'', N'2', N'12763838423', N'Indianapolis', N'IN', N'HEDGE Co', N'Kent State University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Denise', N'Wheeler', N'bittycat3@yahoo.test', N'', N'2', N'12763838423', N'Ankeny', N'IA', N'EVSC', N'Grambling')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Carina', N'Ryder', N'crydercnm@districtgyn.test', N'', N'2', N'12763838423', N'Takoma Park', N'MD', N'Ohio State University', N'Claremont Graduate School')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Garrette', N'Martin-Yeboah', N'garrette.martin-yeboah@hhs.test', N'', N'2', N'12763838423', N'Cockeysville', N'MD', N'Military Child Education Coalition', N'Stanford University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jaida', N'Carter', N'jaidacarter86@gmail.test', N'', N'2', N'12763838423', N'Fort Washington', N'MD', N'Montgomery Township Board of Education', N'Iowa State University (BS')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jasmin', N'Saville', N'saville814@gmail.test', N'', N'2', N'12763838423', N'Wilmington', N'MD', N'The Learning Partnership', N'University of Illinois')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Joy', N'Nanda', N'joypnanda@gmail.test', N'', N'2', N'12763838423', N'Baltimore', N'MD', N'SOUTH CAROLINA ASSOCIATION FOR ACHIEVEMENT NOW', N'University of Southern')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'KENNETH', N'SIMIYU', N'ksimiyu@gmail.test', N'', N'2', N'12763838423', N'ELKRIDGE', N'MD', N'Retired educator from Ohio University', N'Penn State')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Pat', N'Paluzzi', N'pat@healthyteennetwork.test', N'', N'2', N'12763838423', N'Baltimore', N'MD', N'Brigham Young University Idaho', N'University of Toledo')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Wendy', N'Frosh', N'wjfrosh@wendyfrosh.test', N'', N'2', N'12763838423', N'North Bethesda', N'MD', N'Healthcare Management Strategies/self', N'University of Florida')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Barbara', N'Tausey', N'taus1717@norwoodlight.test', N'', N'2', N'12763838423', N'New York', N'MA', N'Manhattan Strategy Group', N'American InterContinental university')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Heather', N'Sankey', N'Heather.Sankey@baystatehealth.test', N'', N'2', N'12763838423', N'Springfield', N'MA', N'Johnson C. Smith University', N'Ohio state')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Karen', N'Edlund', N'kedlund3@gmail.test', N'', N'2', N'12763838423', N'Somerville', N'MA', N'KIPP Texas', N'UMass Dartmouth')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Maisha', N'DouyonCover', N'mdouyon@bwh.harvard.test', N'', N'2', N'12763838423', N'West Roxbury', N'MA', N'St. Francis de Sales School', N'Seton Hall University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Melanie', N'Zurek', N'mz@providecare.test', N'', N'2', N'12763838423', N'Cambridge', N'MA', N'UPMC Health Plan', N'University of Maryland Eastern Shore')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kiddada', N'Green', N'Kiddadag@bmbfa.test', N'', N'2', N'12763838423', N'Southfield', N'MI', N'Texas Southern University', N'University of Texas at Austin')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jill', N'Farris', N'farrisj@umn.test', N'', N'2', N'12763838423', N'Minneapolis', N'MN', N'Nyssa School District', N'West Craven High School')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Dr. Melinda', N'Todd', N'melinda.g.todd@jsums.test', N'', N'2', N'12763838423', N'Jackson', N'MS', N'Guilford County Schools', N'NA')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Holly', N'Jordt', N'hjordt@flathead.mt.test', N'', N'2', N'12763838423', N'Kalispell', N'MO', N'Grand Canyon University', N'Oakland U and Wayne State')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kathleen', N'Mullen', N'kmmullen@comcast.net', N'', N'2', N'12763838423', N'Brick', N'NJ', N'Bina Bangsa School', N'Grand Valley State University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Bibi', N'Alladin', N'noorie@mail.test', N'', N'2', N'12763838423', N'New York', N'NY', N'SRI International', N'Harvard Graduate School of Education')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Dionne', N'Durant', N'dionneadurant@aol.test', N'', N'2', N'12763838423', N'Jamaica', N'NY', N'Yorkville High School', N'Tech')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Mildred', N'Hall', N'mkh@bppn.test', N'', N'2', N'12763838423', N'Buffalo', N'NY', N'Kentucky Department of Education', N'Ed.D. Texas A& M University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Cherish', N'Stewart', N'cstewa15@eagles.nccu.test', N'', N'2', N'12763838423', N'Charlotte', N'NC', N'College of the Mainland', N'Loyola University Chicago')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Eleanor', N'Stevenson', N'eleanor.stevenson@duke.test', N'', N'2', N'12763838423', N'Durham', N'NC', N'North Broward Preparatory School', N'University of Colorado at Boulder')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Janis', N'Blanchard', N'recap7314@mypacks.net', N'', N'2', N'12763838423', N'Wilmington', N'NC', N'semi-retired', N'UC Berkeley')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'John', N'Thorp (USA)', N'thorp@med.unc.test', N'', N'2', N'12763838423', N'Chapel Hill', N'NC', N'Portland Public Schools', N'Oakland University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Kathryn', N'Trotter', N'kathy.trotter@duke.test', N'', N'2', N'12763838423', N'Hillsborough', N'NC', N'Cornell Tech', N'University of Minnesota')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Mary', N'Vance', N'mary.m.vance@gmail.test', N'', N'2', N'12763838423', N'Durham', N'NC', N'UnboundEd', N'UNLV')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Frederick', N'Eruo', N'feruo@yahoo.test', N'', N'2', N'12763838423', N'North Canton', N'OH', N'Humble ISD', N'Ohio State University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Zyishia', N'Bailey', N'zyishia.bailey@yahoo.test', N'', N'2', N'12763838423', N'Toledo', N'OH', N'Toledo-Lucas County Health Department', N'Brigham Young University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Ayesha', N'Lampkins', N'ayeshal@health.ok.test', N'', N'2', N'12763838423', N'New York', N'OK', N'Utah State Board of Education', N'Grinnell College')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Diana', N'Smith', N'dslouise@gmail.test', N'', N'2', N'12763838423', N'Portland', N'OR', N'Retired', N'Illinois Institute of Technology')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Lynn', N'Shay', N'crnplynn@gmail.test', N'', N'2', N'12763838423', N'Barto', N'PA', N'Eastern Michigan University', N'HOFSTRA UNIVERSITY')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Paul', N'Whittaker', N'paulwhit@pennmedicine.upenn.test', N'', N'2', N'12763838423', N'Wyncote', N'PA', N'Northern Arizona University Center', N'Marygrove College')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Snigdha', N'Mukherjee', N'snigdhamukherjee@yahoo.test', N'', N'2', N'12763838423', N'Philadelphia', N'PA', N'Foundation for Advancement', N'University of Louisville')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Villar-Robles', N'Fernando', N'fvillar@salud.pr.test', N'', N'2', N'12763838423', N'Carolina', N'PR', N'MCH DHPR', N'UCLA')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jami', N'Star', N'jstar126@gmail.test', N'', N'2', N'12763838423', N'Barrington', N'RI', N'University of Wisconsin Superior', N'Florida State University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jennifer Hosmer', N'MPH', N'jjhosmer@cox.net', N'', N'2', N'12763838423', N'Cranston', N'RI', N'University of Michigan', N'Nova Southeastern University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Katherine', N'Larsen', N'katherine.larsen@knoxcounty.test', N'', N'2', N'12763838423', N'Knoxville', N'TN', N'Canton City School District', N'University of Toledo')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Loraine', N'Lucinski', N'loraine.lucinski@gmail.test', N'', N'2', N'12763838423', N'Nashville', N'TN', N'Marshall Public Schools', N'Pomona College')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Nikki', N'Zite', N'nzite@utmck.test', N'', N'2', N'12763838423', N'Knoxville', N'TN', N'Portsmouth Public Schools (Virginia)', N'Hampton University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Olukayode', N'Akinlaja', N'Kayakins72@yahoo.test', N'', N'2', N'12763838423', N'Chattanooga', N'TN', N'"Education Design, INC"', N'Oakland University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Revlon', N'Briggs', N'rbriggs@tnstate.test', N'', N'2', N'12763838423', N'Nashville', N'TN', N'"Clark County School District - Las Vegas, NV"', N'University of Scranton')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Carla', N'Crider', N'carla.crider@tccd.test', N'', N'2', N'12763838423', N'Lipan', N'TX', N'Griffin Center for Inspired Instruction', N'UC Berkeley')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Erica', N'Asante', N'edanquah@gmail.test', N'', N'2', N'12763838423', N'Dallas', N'TX', N'Ignited (igniteducation.org)', N'Arizona State University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Lauren', N'Thaxton', N'lauren.thaxton@austin.utexas.test', N'', N'2', N'12763838423', N'Austin', N'TX', N'Detroit Public School Community District', N'Eastern Oregon University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Mary Ann', N'Faucher', N'maryann_faucher@baylor.test', N'', N'2', N'12763838423', N'Dallas', N'TX', N'Ohio Department of Education', N'Ohio University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Rahmatu', N'Kassimu', N'Tkass87@gmail.test', N'', N'2', N'12763838423', N'Arlington', N'TX', N'DC Public Schools', N'Universit y of Colorado')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Rebecca', N'Teng', N'rtengmd@gmail.test', N'', N'2', N'12763838423', N'Round Rock', N'TX', N'Sauk Prairie School District', N'Union College (NY)')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Susan', N'Wolfe', N'susan@susanwolfeandassociates.test', N'', N'2', N'12763838423', N'Cedar Hill', N'TX', N'"Susan Wolfe and Associates, LLC"', N'University of Virginia')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Abigail', N'Aiken', N'araa2@utexas.test', N'', N'2', N'12763838423', N'Austin', N'TX', N'Manor ISD', N'Pennsylvania State University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Pascale', N'de Rozario', N'p.derozario@gmail.test', N'', N'2', N'12763838423', N'Salt Lake City', N'UT', N'The School of Arts & Enterprise', N'Western Michigan University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Cornelia', N'Deagle', N'cornelia.deagle@vdh.virginia.test', N'', N'2', N'12763838423', N'Richmond', N'VA', N'DCPS', N'Tennessee State University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jeanne', N'Murphy-Stone', N'jeannemurphy@gwu.test', N'', N'2', N'12763838423', N'Ashburn', N'VA', N'Boston College', N'CSU Fullerton')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Lemlem', N'Ejo', N'lemerk@gmail.test', N'', N'2', N'12763838423', N'Ashburn', N'VA', N'Grand Canyon University', N'St. Edward''s University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Marilyn', N'Lewis', N'mwlewis@nsu.test', N'', N'2', N'12763838423', N'Norfolk', N'VA', N'Arizona State University', N'Boston University')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Laura', N'Hart', N'richlaura2@comcast.net', N'', N'2', N'12763838423', N'Seattle', N'WA', N'Florida State University', N'University of Idaho')
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Jill', N'Denson', N'jillddenson@gmail.test', N'', N'2', N'12763838423', N'Brown Deer', N'WI', N'Billings Public Schools', N'California Academy of Sciences')
GO
INSERT [dbo].[Researchers1] ([FirstName], [LastName], [Email], [HashPwd], [RoleID], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (N'Mary', N'Homan', N'mhoman@mcw.test', N'', N'2', N'12763838423', N'Milwaukee', N'WI', N'KIPP ENC College Prep', N'University of Washington')
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'CampaignManager')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Researcher')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [HashPwd], [RoleId], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (3, N'Dan', N'Lee', N'LDan@TestUniversity.com', N'123', 1, 0, N'Gaithersburg', N'MD', NULL, NULL)
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [HashPwd], [RoleId], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (4, N'Rani', N'Babar', N'RBabar@TestUniversity.com', N'123', 2, 0, N'Los Angeles', N'CA', NULL, NULL)
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [HashPwd], [RoleId], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (5, N'John', N'Levis', N'JLevis@TestUniversity.com', N'123', 2, 0, N'Chicago', N'IL', NULL, NULL)
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [HashPwd], [RoleId], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (13, N'Sreepallavi', N'Thota', N'sreepallavi.thota@lcginc.com', N'test', 2, 4057144614, N'TestCity', N'MD', N'TestCity', N'TEST University')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [HashPwd], [RoleId], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (14, N'Tester1', N'Fixit', N'Test1@gmail.com', N'test', 2, 6666666666, N'hellocity', N'MD', N'hellocity', N'Raven University')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [HashPwd], [RoleId], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (15, N'Seeta', N'Mishra', N'SeetaMsk@gmail.com', N'test', 2, 8888888888, N'Newyork', N'NY', N'Newyork', N'AVM Vniversity')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [HashPwd], [RoleId], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (16, N'Sarita', N'Malik', N'SaritaMSR@gmail.com', N'test', 2, 5559998909, N'Seattle', N'WA', N'Seattle', N'TEST University')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [HashPwd], [RoleId], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (17, N'Nandita', N'Prasad', N'nandita.prasad@lcginc.com', N'123', 2, 1111111111, N'Rockville', N'MD', N'Rockville', N'LCG')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [HashPwd], [RoleId], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (18, N'Monster', N'Tester', N'monster_tester@gmail.com', N'123', 2, 1234564568, N'Rockville', N'MD', N'Rockville', N'LCG')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [HashPwd], [RoleId], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (19, N'Hansa', N'Parik', N'HansaParik@tesla.cars', N'rose', 2, 4444444444, N'Rockville', N'MD', N'Rockville', N'FRM University')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [HashPwd], [RoleId], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (20, N'Sita', N'Aggrawal', N'Sita@testing.com', N'test', 2, 6666666666, N'Damascus', N'MD', N'Damascus', N'TEST University')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [HashPwd], [RoleId], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (21, N'Hima', N'Poonadathu', N'hima.poonadathu@lcginc.com', N'123', 2, 1234567788, N'Rockville', N'MD', N'Rockville', N'LCG')
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [HashPwd], [RoleId], [PhoneNumber], [City], [State], [Organization], [AlmaMater]) VALUES (22, N'Sri', N'K', N'kothuri@gmail.com', N'123', 2, 3124986979, N'thr', N'CA', N'thr', N'LCG')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_FK_ResearcherApproval_ApprovalStatuses]    Script Date: 12/19/2019 2:21:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ResearcherApproval_ApprovalStatuses] ON [dbo].[ResearcherApprovals]
(
	[ApprovalStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ResearcherApproval_Users]    Script Date: 12/19/2019 2:21:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ResearcherApproval_Users] ON [dbo].[ResearcherApprovals]
(
	[ApproverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ResearcherApproval_Users1]    Script Date: 12/19/2019 2:21:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ResearcherApproval_Users1] ON [dbo].[ResearcherApprovals]
(
	[ResearcherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ResearcherAvailability_Users]    Script Date: 12/19/2019 2:21:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ResearcherAvailability_Users] ON [dbo].[ResearcherAvailabilities]
(
	[ResearcherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Expertise_Users]    Script Date: 12/19/2019 2:21:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Expertise_Users] ON [dbo].[ResearcherExpertises]
(
	[ResearcherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ResearcherExpertise_Expertise]    Script Date: 12/19/2019 2:21:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ResearcherExpertise_Expertise] ON [dbo].[ResearcherExpertises]
(
	[ExpertiseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_Roles]    Script Date: 12/19/2019 2:21:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Users_Roles] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ResearcherApprovals] ADD  CONSTRAINT [DF_ResearcherApprovals_HasResearcherApplied]  DEFAULT ((0)) FOR [HasResearcherApplied]
GO
ALTER TABLE [dbo].[ProjectExpertises]  WITH CHECK ADD  CONSTRAINT [FK_ProjectExpertises_Expertises] FOREIGN KEY([ExpertiseId])
REFERENCES [dbo].[Expertises] ([ExpertiseId])
GO
ALTER TABLE [dbo].[ProjectExpertises] CHECK CONSTRAINT [FK_ProjectExpertises_Expertises]
GO
ALTER TABLE [dbo].[ProjectExpertises]  WITH CHECK ADD  CONSTRAINT [FK_ProjectExpertises_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[ProjectExpertises] CHECK CONSTRAINT [FK_ProjectExpertises_Projects]
GO
ALTER TABLE [dbo].[ResearcherApprovals]  WITH CHECK ADD  CONSTRAINT [FK_ResearcherApproval_ApprovalStatuses] FOREIGN KEY([ApprovalStatusId])
REFERENCES [dbo].[ApprovalStatuses] ([ApprovalStatusId])
GO
ALTER TABLE [dbo].[ResearcherApprovals] CHECK CONSTRAINT [FK_ResearcherApproval_ApprovalStatuses]
GO
ALTER TABLE [dbo].[ResearcherApprovals]  WITH CHECK ADD  CONSTRAINT [FK_ResearcherApproval_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[ResearcherApprovals] CHECK CONSTRAINT [FK_ResearcherApproval_Projects]
GO
ALTER TABLE [dbo].[ResearcherApprovals]  WITH CHECK ADD  CONSTRAINT [FK_ResearcherApproval_Users] FOREIGN KEY([ApproverId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ResearcherApprovals] CHECK CONSTRAINT [FK_ResearcherApproval_Users]
GO
ALTER TABLE [dbo].[ResearcherApprovals]  WITH CHECK ADD  CONSTRAINT [FK_ResearcherApproval_Users1] FOREIGN KEY([ResearcherId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ResearcherApprovals] CHECK CONSTRAINT [FK_ResearcherApproval_Users1]
GO
ALTER TABLE [dbo].[ResearcherAvailabilities]  WITH CHECK ADD  CONSTRAINT [FK_ResearcherAvailability_Users] FOREIGN KEY([ResearcherId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ResearcherAvailabilities] CHECK CONSTRAINT [FK_ResearcherAvailability_Users]
GO
ALTER TABLE [dbo].[ResearcherExpertises]  WITH CHECK ADD  CONSTRAINT [FK_Expertise_Users] FOREIGN KEY([ResearcherId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ResearcherExpertises] CHECK CONSTRAINT [FK_Expertise_Users]
GO
ALTER TABLE [dbo].[ResearcherExpertises]  WITH CHECK ADD  CONSTRAINT [FK_ResearcherExpertise_Expertise] FOREIGN KEY([ExpertiseId])
REFERENCES [dbo].[Expertises] ([ExpertiseId])
GO
ALTER TABLE [dbo].[ResearcherExpertises] CHECK CONSTRAINT [FK_ResearcherExpertise_Expertise]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [ScheduleEx] SET  READ_WRITE 
GO
