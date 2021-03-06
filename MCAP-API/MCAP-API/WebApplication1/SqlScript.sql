USE [master]
GO
/****** Object:  Database [MCAP]    Script Date: 7/5/2022 4:28:30 PM ******/
CREATE DATABASE [MCAP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MCAP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MCAP.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MCAP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MCAP_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MCAP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MCAP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MCAP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MCAP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MCAP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MCAP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MCAP] SET ARITHABORT OFF 
GO
ALTER DATABASE [MCAP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MCAP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MCAP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MCAP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MCAP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MCAP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MCAP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MCAP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MCAP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MCAP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MCAP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MCAP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MCAP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MCAP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MCAP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MCAP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MCAP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MCAP] SET RECOVERY FULL 
GO
ALTER DATABASE [MCAP] SET  MULTI_USER 
GO
ALTER DATABASE [MCAP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MCAP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MCAP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MCAP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MCAP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MCAP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MCAP', N'ON'
GO
ALTER DATABASE [MCAP] SET QUERY_STORE = OFF
GO
USE [MCAP]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 7/5/2022 4:28:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Age] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trades]    Script Date: 7/5/2022 4:28:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](100) NULL,
	[AccountName] [nvarchar](100) NULL,
	[Security] [nvarchar](100) NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[TD_MarketValue] [decimal](18, 2) NULL,
	[TD_Quantity] [int] NULL,
	[Dv0] [nvarchar](50) NULL,
	[LoginId] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TradesTable1]    Script Date: 7/5/2022 4:28:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TradesTable1](
	[Id] [int] NOT NULL,
	[Account] [nvarchar](50) NULL,
 CONSTRAINT [PK_TradesTable1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Employees] ([Id], [Name], [Age]) VALUES (5, N'Tushar', 40)
GO
SET IDENTITY_INSERT [dbo].[Trades] ON 

INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (1, N'Test1', N'Test123', N'Yahoo', 10, CAST(900.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 10, N'uu', NULL)
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (2, N'Test2', N'Test456', N'Tesla', 20, CAST(77.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 20, N'jj', NULL)
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (3, N'399         ', NULL, N'VPCO', 13017, CAST(234.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 13017, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (4, N'399         ', NULL, N'922099205', -2603, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), -2603, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (5, N'399         ', NULL, N'922099205', -1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), -1, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (6, N'399', NULL, N'VPCOD', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (7, N'92000080', NULL, N'VPCOD', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (8, N'92000080', NULL, N'VPCO.OLD', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (9, N'93501716', NULL, N'VPCO.OLD', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (10, N'92000080', NULL, N'DHOXQ', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (11, N'93501617', NULL, N'DHOXQ', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (12, N'93501679', NULL, N'DHOXQ', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (13, N'93501702', NULL, N'DHOXQ', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (14, N'93501716', NULL, N'DHOXQ', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (15, N'93501721', NULL, N'DHOXQ', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (16, N'93501783', NULL, N'DHOXQ', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (17, N'93501919', NULL, N'DHOXQ', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (18, N'92000080', NULL, N'DRLC', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (19, N'93501636', NULL, N'DRLC', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (20, N'93501679', NULL, N'DRLC', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (21, N'93501684', NULL, N'DRLC', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (22, N'93501702', NULL, N'DRLC', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (23, N'93510080', NULL, N'DRLC', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (24, N'92000080', NULL, N'CSAL', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (25, N'93501636', NULL, N'CSAL', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (26, N'92000080', NULL, N'PYPL', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (27, N'93510077', NULL, N'PYPL', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (28, N'24001', NULL, N'ESV', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (29, N'399', NULL, N'ESV', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (30, N'402', NULL, N'ESV', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (31, N'92000080', NULL, N'ESV', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (32, N'399         ', NULL, N'VXXB', -20, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), -20, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (33, N'399         ', NULL, N'CBAK', -96, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), -96, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (34, N'399         ', NULL, N'CBAK', -50, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), -50, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (35, N'399         ', NULL, N'CBAK', -1000, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), -1000, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (36, N'399         ', NULL, N'CBAK', -550, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), -550, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (37, N'402', N'    ', N'FMCI', 50, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 50, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (38, N'402', N'    ', N'ACAM', 200, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 200, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (39, N'399         ', NULL, N'GOHE', 5000, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 5000, N'Dv0', N'IC-System')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (40, N'92000080', NULL, N'VPCO', 2603, CAST(8.00 AS Decimal(18, 2)), CAST(20564.00 AS Decimal(18, 2)), 2603, N'Dv0', N'jcastro')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (41, N'92000080', NULL, N'VPCO', 2603, CAST(8.00 AS Decimal(18, 2)), CAST(20564.00 AS Decimal(18, 2)), 2603, N'Dv0', N'jcastro')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (42, N'92000080', NULL, N'VPCO', 2603, CAST(8.00 AS Decimal(18, 2)), CAST(20564.00 AS Decimal(18, 2)), 2603, N'Dv0', N'jcastro')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (43, N'92000080', NULL, N'VPCOD', 2603, CAST(8.00 AS Decimal(18, 2)), CAST(20564.00 AS Decimal(18, 2)), 2603, N'Dv0', N'jcastro')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (44, N'93501783', N'SPDR           ', N'BW', 100, CAST(16.00 AS Decimal(18, 2)), CAST(1598.00 AS Decimal(18, 2)), 100, N'Dv0', N'jcastro')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (45, N'93501783', N'SPDR           ', N'BW', 100, CAST(16.00 AS Decimal(18, 2)), CAST(1598.00 AS Decimal(18, 2)), 100, N'Dv0', N'jcastro')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (46, N'93501783', N'SPDR           ', N'BNED', 100, CAST(8.00 AS Decimal(18, 2)), CAST(794.00 AS Decimal(18, 2)), 100, N'Dv0', N'jcastro')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (47, N'93501783', N'SPDR           ', N'BNED', 100, CAST(8.00 AS Decimal(18, 2)), CAST(794.00 AS Decimal(18, 2)), 100, N'Dv0', N'jcastro')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (48, N'01009010', NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, N'Dv0', N'jcastro')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (49, N'01009010', NULL, NULL, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, N'Dv0', N'jcastro')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (50, N'93510184', N'SPDR           ', N'FOX', -33, CAST(39.00 AS Decimal(18, 2)), CAST(-1274.00 AS Decimal(18, 2)), -33, N'Dv0', N'jcastro')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (51, N'9002727613', N'ARCA           ', N'TSLA', 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (52, N'9002727613', N'ARCA           ', N'TSLA', 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (53, N'04222022', N'NON', N'IBM', 10, CAST(10.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 10, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (54, N'04222022', N'NON', N'IBM', 10, CAST(10.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 10, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (55, N'04222022', N'NON', N'IBM', 10, CAST(10.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 10, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (56, N'04222022', N'NON', N'IBM', 10, CAST(10.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 10, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (57, N'04222022', N'NON            ', N'IBM', 10, CAST(10.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 10, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (58, N'43505007', N'NON', N'IBM', 1, CAST(99.00 AS Decimal(18, 2)), CAST(99.00 AS Decimal(18, 2)), 1, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (59, N'9002727613', N'ARCA           ', N'TSLA', 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (60, N'9002727613', N'ARCA           ', N'TSLA', 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (61, N'04222022', N'NON', N'IBM', 10, CAST(10.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 10, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (62, N'04222022', N'NON', N'IBM', 10, CAST(10.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 10, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (63, N'04222022', N'NON', N'IBM', 10, CAST(10.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 10, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (64, N'04222022', N'NON', N'IBM', 10, CAST(10.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 10, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (65, N'04222022', N'NON            ', N'IBM', 10, CAST(10.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 10, N'Dv0', N'devadm')
INSERT [dbo].[Trades] ([Id], [Account], [AccountName], [Security], [Quantity], [Price], [TD_MarketValue], [TD_Quantity], [Dv0], [LoginId]) VALUES (66, N'43505007', N'NON', N'IBM', 1, CAST(99.00 AS Decimal(18, 2)), CAST(99.00 AS Decimal(18, 2)), 1, N'Dv0', N'devadm')
SET IDENTITY_INSERT [dbo].[Trades] OFF
GO
INSERT [dbo].[TradesTable1] ([Id], [Account]) VALUES (1, N'Test123')
INSERT [dbo].[TradesTable1] ([Id], [Account]) VALUES (2, N'Test456')
GO
/****** Object:  StoredProcedure [dbo].[sp_AddTradesbyLoginId]    Script Date: 7/5/2022 4:28:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


  CREATE procedure [dbo].[sp_AddTradesbyLoginId] 
(
@LoginId varchar(50)=null,
@Account varchar(100)=null,
@AccountName varchar(100)=null,
@Security varchar(100)=null,
@Quantity decimal=null,
@Price decimal =null,
@TD_MarketValue decimal=null,
@TD_Quantity decimal=null,
@Dv0 varchar(100)=null
)
as
begin
INSERT INTO [dbo].[Trades]
           ([Account]
           ,[AccountName]
           ,[Security]
           ,[Quantity]
           ,[Price]
           ,[TD_MarketValue]
           ,[TD_Quantity]
           ,[Dv0]
           ,[LoginId])
     VALUES
           (@Account
           ,@AccountName
           ,@Security
           ,@Quantity
           ,@Price
           ,@TD_MarketValue
           ,@TD_Quantity
           ,@Dv0
           ,@LoginId)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_getmcaptrades]    Script Date: 7/5/2022 4:28:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_getmcaptrades]
(
@LoginId varchar(100)=null
)
as

begin
If(@LoginId is null)
begin
SELECT  [Id]
      ,[Account]
      ,[AccountName]
      ,[Security]
      ,[Quantity]
      ,[Price]
      ,[TD_MarketValue]
      ,[TD_Quantity]
      ,[Dv0]
      ,[LoginId]
  FROM [MCAP].[dbo].[Trades]
end
else
begin

SELECT  [Id]
      ,[Account]
      ,[AccountName]
      ,[Security]
      ,[Quantity]
      ,[Price]
      ,[TD_MarketValue]
      ,[TD_Quantity]
      ,[Dv0]
      ,[LoginId]
  FROM [MCAP].[dbo].[Trades] where LoginId=@LoginId
  end
end
GO
USE [master]
GO
ALTER DATABASE [MCAP] SET  READ_WRITE 
GO
