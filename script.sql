USE [master]
GO
/****** Object:  Database [clinicalmanagementsystem]    Script Date: 2/24/2022 12:39:44 PM ******/
CREATE DATABASE [clinicalmanagementsystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'clinicalmanagementsystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\clinicalmanagementsystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'clinicalmanagementsystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\clinicalmanagementsystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [clinicalmanagementsystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clinicalmanagementsystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clinicalmanagementsystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clinicalmanagementsystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clinicalmanagementsystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [clinicalmanagementsystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clinicalmanagementsystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [clinicalmanagementsystem] SET  MULTI_USER 
GO
ALTER DATABASE [clinicalmanagementsystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clinicalmanagementsystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clinicalmanagementsystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clinicalmanagementsystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [clinicalmanagementsystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [clinicalmanagementsystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [clinicalmanagementsystem] SET QUERY_STORE = OFF
GO
USE [clinicalmanagementsystem]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Appointment_Id] [int] IDENTITY(1,1) NOT NULL,
	[Patient_Id] [int] NULL,
	[Doctor_Id] [int] NULL,
	[Reception_Id] [int] NULL,
	[Date] [date] NULL,
	[Time] [datetime] NULL,
	[TokenNumber] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[Appointment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_Id] [int] IDENTITY(1,1) NOT NULL,
	[Appointment_Id] [int] NULL,
	[Status] [int] NULL,
	[Amount] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Bill_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Doctor_Id] [int] IDENTITY(1,1) NOT NULL,
	[Specialization_Id] [int] NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Doctor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeneralNotes]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneralNotes](
	[GeneralNote_Id] [int] IDENTITY(1,1) NOT NULL,
	[Appointment_Id] [int] NULL,
	[Notes] [varchar](500) NULL,
 CONSTRAINT [PK_GeneralNotes] PRIMARY KEY CLUSTERED 
(
	[GeneralNote_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[Medicine_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Price] [numeric](18, 0) NULL,
	[Stock] [int] NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[Medicine_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineBill]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineBill](
	[MedicineBill_Id] [int] IDENTITY(1,1) NOT NULL,
	[MedicinePrescription_Id] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_MedicineBill] PRIMARY KEY CLUSTERED 
(
	[MedicineBill_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineItemPrice]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineItemPrice](
	[MedicinePrice_Id] [int] IDENTITY(1,1) NOT NULL,
	[MedicineBill_Id] [int] NULL,
	[Medicine_Id] [int] NULL,
	[Price] [numeric](18, 0) NULL,
 CONSTRAINT [PK_MedicineItemPrice] PRIMARY KEY CLUSTERED 
(
	[MedicinePrice_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineList]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineList](
	[MedicineList_Id] [int] IDENTITY(1,1) NOT NULL,
	[MedicinePrescription_Id] [int] NULL,
	[Medicine_Id] [int] NULL,
	[Doze] [int] NULL,
 CONSTRAINT [PK_MedicineList] PRIMARY KEY CLUSTERED 
(
	[MedicineList_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicinePrescription]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicinePrescription](
	[MedicinePrescription_Id] [int] IDENTITY(1,1) NOT NULL,
	[Appointment_Id] [int] NULL,
	[Pharmacist_Id] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_MedicinePrescription] PRIMARY KEY CLUSTERED 
(
	[MedicinePrescription_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Patient_Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Date] [date] NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[BloodGroup] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Patient_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Qualification]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Qualification](
	[Qualification_Id] [int] IDENTITY(1,1) NOT NULL,
	[QualificationName] [varchar](50) NULL,
 CONSTRAINT [PK_Qualification] PRIMARY KEY CLUSTERED 
(
	[Qualification_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_Id] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [varchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[Specialization_Id] [int] IDENTITY(1,1) NOT NULL,
	[SpecializationName] [varchar](50) NULL,
	[ConsultancyFee] [float] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[Specialization_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[Test_Id] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [varchar](50) NULL,
	[NormalRangeStart] [numeric](18, 0) NULL,
	[NormalRangeEnd] [numeric](18, 0) NULL,
	[Unit] [varchar](50) NULL,
	[Price] [numeric](18, 0) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[Test_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestBill]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestBill](
	[TestBill_Id] [int] IDENTITY(1,1) NOT NULL,
	[TestPrescription_Id] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_TestBill] PRIMARY KEY CLUSTERED 
(
	[TestBill_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestPrescription]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestPrescription](
	[TestPrescription_Id] [int] IDENTITY(1,1) NOT NULL,
	[Appointment_Id] [int] NULL,
	[LabTechnician_Id] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_TestPrescription] PRIMARY KEY CLUSTERED 
(
	[TestPrescription_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestPrice]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestPrice](
	[TestPrice_Id] [int] IDENTITY(1,1) NOT NULL,
	[TestBill_Id] [int] NULL,
	[Test_Id] [int] NULL,
	[Price] [numeric](18, 0) NULL,
 CONSTRAINT [PK_TestPrice] PRIMARY KEY CLUSTERED 
(
	[TestPrice_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestReport]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestReport](
	[TestReport_Id] [int] IDENTITY(1,1) NOT NULL,
	[TestPrescription_Id] [int] NULL,
	[Test_Id] [int] NULL,
	[TestValue] [numeric](18, 0) NULL,
 CONSTRAINT [PK_TestReport] PRIMARY KEY CLUSTERED 
(
	[TestReport_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/24/2022 12:39:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[Role_Id] [int] NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[UserDob] [date] NULL,
	[Phone] [varchar](50) NULL,
	[JoinDate] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Appointment] FOREIGN KEY([Appointment_Id])
REFERENCES [dbo].[Appointment] ([Appointment_Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Appointment]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Specialization1] FOREIGN KEY([Specialization_Id])
REFERENCES [dbo].[Specialization] ([Specialization_Id])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Specialization1]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Users] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([User_Id])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Users]
GO
ALTER TABLE [dbo].[GeneralNotes]  WITH CHECK ADD  CONSTRAINT [FK_GeneralNotes_Appointment] FOREIGN KEY([Appointment_Id])
REFERENCES [dbo].[Appointment] ([Appointment_Id])
GO
ALTER TABLE [dbo].[GeneralNotes] CHECK CONSTRAINT [FK_GeneralNotes_Appointment]
GO
ALTER TABLE [dbo].[MedicineBill]  WITH CHECK ADD  CONSTRAINT [FK_MedicineBill_MedicinePrescription] FOREIGN KEY([MedicinePrescription_Id])
REFERENCES [dbo].[MedicinePrescription] ([MedicinePrescription_Id])
GO
ALTER TABLE [dbo].[MedicineBill] CHECK CONSTRAINT [FK_MedicineBill_MedicinePrescription]
GO
ALTER TABLE [dbo].[MedicineItemPrice]  WITH CHECK ADD  CONSTRAINT [FK_MedicineItemPrice_Medicine] FOREIGN KEY([Medicine_Id])
REFERENCES [dbo].[Medicine] ([Medicine_Id])
GO
ALTER TABLE [dbo].[MedicineItemPrice] CHECK CONSTRAINT [FK_MedicineItemPrice_Medicine]
GO
ALTER TABLE [dbo].[MedicineItemPrice]  WITH CHECK ADD  CONSTRAINT [FK_MedicineItemPrice_MedicineBill] FOREIGN KEY([MedicineBill_Id])
REFERENCES [dbo].[MedicineBill] ([MedicineBill_Id])
GO
ALTER TABLE [dbo].[MedicineItemPrice] CHECK CONSTRAINT [FK_MedicineItemPrice_MedicineBill]
GO
ALTER TABLE [dbo].[MedicineList]  WITH CHECK ADD  CONSTRAINT [FK_MedicineList_Medicine] FOREIGN KEY([Medicine_Id])
REFERENCES [dbo].[Medicine] ([Medicine_Id])
GO
ALTER TABLE [dbo].[MedicineList] CHECK CONSTRAINT [FK_MedicineList_Medicine]
GO
ALTER TABLE [dbo].[MedicineList]  WITH CHECK ADD  CONSTRAINT [FK_MedicineList_MedicinePrescription] FOREIGN KEY([MedicinePrescription_Id])
REFERENCES [dbo].[MedicinePrescription] ([MedicinePrescription_Id])
GO
ALTER TABLE [dbo].[MedicineList] CHECK CONSTRAINT [FK_MedicineList_MedicinePrescription]
GO
ALTER TABLE [dbo].[MedicinePrescription]  WITH CHECK ADD  CONSTRAINT [FK_MedicinePrescription_Appointment] FOREIGN KEY([Appointment_Id])
REFERENCES [dbo].[Appointment] ([Appointment_Id])
GO
ALTER TABLE [dbo].[MedicinePrescription] CHECK CONSTRAINT [FK_MedicinePrescription_Appointment]
GO
ALTER TABLE [dbo].[MedicinePrescription]  WITH CHECK ADD  CONSTRAINT [FK_MedicinePrescription_Users] FOREIGN KEY([Pharmacist_Id])
REFERENCES [dbo].[Users] ([User_Id])
GO
ALTER TABLE [dbo].[MedicinePrescription] CHECK CONSTRAINT [FK_MedicinePrescription_Users]
GO
ALTER TABLE [dbo].[TestBill]  WITH CHECK ADD  CONSTRAINT [FK_TestBill_TestPrescription] FOREIGN KEY([TestPrescription_Id])
REFERENCES [dbo].[TestPrescription] ([TestPrescription_Id])
GO
ALTER TABLE [dbo].[TestBill] CHECK CONSTRAINT [FK_TestBill_TestPrescription]
GO
ALTER TABLE [dbo].[TestPrescription]  WITH CHECK ADD  CONSTRAINT [FK_TestPrescription_Appointment] FOREIGN KEY([Appointment_Id])
REFERENCES [dbo].[Appointment] ([Appointment_Id])
GO
ALTER TABLE [dbo].[TestPrescription] CHECK CONSTRAINT [FK_TestPrescription_Appointment]
GO
ALTER TABLE [dbo].[TestPrescription]  WITH CHECK ADD  CONSTRAINT [FK_TestPrescription_Users] FOREIGN KEY([LabTechnician_Id])
REFERENCES [dbo].[Users] ([User_Id])
GO
ALTER TABLE [dbo].[TestPrescription] CHECK CONSTRAINT [FK_TestPrescription_Users]
GO
ALTER TABLE [dbo].[TestPrice]  WITH CHECK ADD  CONSTRAINT [FK_TestPrice_Test] FOREIGN KEY([Test_Id])
REFERENCES [dbo].[Test] ([Test_Id])
GO
ALTER TABLE [dbo].[TestPrice] CHECK CONSTRAINT [FK_TestPrice_Test]
GO
ALTER TABLE [dbo].[TestPrice]  WITH CHECK ADD  CONSTRAINT [FK_TestPrice_TestBill] FOREIGN KEY([TestBill_Id])
REFERENCES [dbo].[TestBill] ([TestBill_Id])
GO
ALTER TABLE [dbo].[TestPrice] CHECK CONSTRAINT [FK_TestPrice_TestBill]
GO
ALTER TABLE [dbo].[TestReport]  WITH CHECK ADD  CONSTRAINT [FK_TestReport_Test] FOREIGN KEY([Test_Id])
REFERENCES [dbo].[Test] ([Test_Id])
GO
ALTER TABLE [dbo].[TestReport] CHECK CONSTRAINT [FK_TestReport_Test]
GO
ALTER TABLE [dbo].[TestReport]  WITH CHECK ADD  CONSTRAINT [FK_TestReport_TestPrescription] FOREIGN KEY([TestPrescription_Id])
REFERENCES [dbo].[TestPrescription] ([TestPrescription_Id])
GO
ALTER TABLE [dbo].[TestReport] CHECK CONSTRAINT [FK_TestReport_TestPrescription]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Role] ([Role_Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [clinicalmanagementsystem] SET  READ_WRITE 
GO
