USE [master]
GO
/****** Object:  Database [diellza]    Script Date: 05/07/2021 23:37:26 ******/
CREATE DATABASE [diellza]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'diellza', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\diellza.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'diellza_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\diellza_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [diellza] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [diellza].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [diellza] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [diellza] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [diellza] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [diellza] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [diellza] SET ARITHABORT OFF 
GO
ALTER DATABASE [diellza] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [diellza] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [diellza] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [diellza] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [diellza] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [diellza] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [diellza] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [diellza] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [diellza] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [diellza] SET  ENABLE_BROKER 
GO
ALTER DATABASE [diellza] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [diellza] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [diellza] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [diellza] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [diellza] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [diellza] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [diellza] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [diellza] SET RECOVERY FULL 
GO
ALTER DATABASE [diellza] SET  MULTI_USER 
GO
ALTER DATABASE [diellza] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [diellza] SET DB_CHAINING OFF 
GO
ALTER DATABASE [diellza] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [diellza] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [diellza] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'diellza', N'ON'
GO
ALTER DATABASE [diellza] SET QUERY_STORE = OFF
GO
USE [diellza]
GO
/****** Object:  User [diellza] Script Date: 05/07/2021 23:37:26 ******/
CREATE USER [diellza] FOR LOGIN [diellza] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[myFunction]    Script Date: 05/07/2021 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[myFunction] (@loyaltyCard int)
returns decimal(10,2)
as
begin
	declare @ammount decimal(10,2)
	set @ammount =(
		select l.Amount
		from loyaltyCard l
		where l.loyaltyCardID=@loyaltyCard
	)

	return @ammount
end
GO
/****** Object:  Table [dbo].[client]    Script Date: 05/07/2021 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[clientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[IsRegistred] [bit] NULL,
	[loyaltyCardId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[clientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drink]    Script Date: 05/07/2021 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drink](
	[drinkID] [int] IDENTITY(1,1) NOT NULL,
	[DrinkName] [varchar](50) NULL,
	[Price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[drinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[food]    Script Date: 05/07/2021 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food](
	[FoodID] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [varchar](50) NULL,
	[Price] [money] NULL,
	[Description] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 05/07/2021 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice](
	[invoiceID] [int] IDENTITY(1,1) NOT NULL,
	[TotalCost] [money] NULL,
	[orderid] [int] NULL,
	[paymentid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[location]    Script Date: 05/07/2021 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[location](
	[locationID] [int] NOT NULL,
	[City] [varchar](50) NULL,
	[PostalCode] [int] NULL,
	[StreetName] [int] NULL,
	[clientid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[locationID] ASC,
	[clientid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[locationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loyaltyCard]    Script Date: 05/07/2021 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loyaltyCard](
	[loyaltyCardID] [int] IDENTITY(1,1) NOT NULL,
	[ValidUntil] [date] NULL,
	[Amount] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[loyaltyCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[meal]    Script Date: 05/07/2021 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[meal](
	[mealID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealDrink]    Script Date: 05/07/2021 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealDrink](
	[drinkID] [int] NOT NULL,
	[mealID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[drinkID] ASC,
	[mealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealFood]    Script Date: 05/07/2021 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealFood](
	[foodID] [int] NOT NULL,
	[mealID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[foodID] ASC,
	[mealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 05/07/2021 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[orderID] [int] NOT NULL,
	[Price] [money] NULL,
	[Delivery] [varchar](50) NULL,
	[clientid] [int] NOT NULL,
	[mealid] [int] NULL,
	[locationid] [int] NULL,
	[client] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[clientid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 05/07/2021 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[paymentID] [int] NOT NULL,
	[PaymentType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[client]  WITH CHECK ADD FOREIGN KEY([loyaltyCardId])
REFERENCES [dbo].[loyaltyCard] ([loyaltyCardID])
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD FOREIGN KEY([orderid])
REFERENCES [dbo].[order] ([orderID])
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD FOREIGN KEY([paymentid])
REFERENCES [dbo].[payment] ([paymentID])
GO
ALTER TABLE [dbo].[location]  WITH CHECK ADD FOREIGN KEY([clientid])
REFERENCES [dbo].[client] ([clientID])
GO
ALTER TABLE [dbo].[MealDrink]  WITH CHECK ADD FOREIGN KEY([drinkID])
REFERENCES [dbo].[drink] ([drinkID])
GO
ALTER TABLE [dbo].[MealDrink]  WITH CHECK ADD FOREIGN KEY([mealID])
REFERENCES [dbo].[meal] ([mealID])
GO
ALTER TABLE [dbo].[MealFood]  WITH CHECK ADD FOREIGN KEY([foodID])
REFERENCES [dbo].[food] ([FoodID])
GO
ALTER TABLE [dbo].[MealFood]  WITH CHECK ADD FOREIGN KEY([mealID])
REFERENCES [dbo].[meal] ([mealID])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([client])
REFERENCES [dbo].[client] ([clientID])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([clientid])
REFERENCES [dbo].[client] ([clientID])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([locationid])
REFERENCES [dbo].[location] ([locationID])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([mealid])
REFERENCES [dbo].[meal] ([mealID])
GO
USE [master]
GO
ALTER DATABASE [diellza] SET  READ_WRITE 
GO
