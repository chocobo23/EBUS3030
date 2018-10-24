USE [master]
GO
CREATE DATABASE [EBUS3030A2]

GO
ALTER DATABASE [EBUS3030A2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EBUS3030A2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EBUS3030A2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EBUS3030A2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EBUS3030A2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EBUS3030A2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EBUS3030A2] SET ARITHABORT OFF 
GO
ALTER DATABASE [EBUS3030A2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EBUS3030A2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EBUS3030A2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EBUS3030A2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EBUS3030A2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EBUS3030A2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EBUS3030A2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EBUS3030A2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EBUS3030A2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EBUS3030A2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EBUS3030A2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EBUS3030A2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EBUS3030A2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EBUS3030A2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EBUS3030A2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EBUS3030A2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EBUS3030A2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EBUS3030A2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EBUS3030A2] SET  MULTI_USER 
GO
ALTER DATABASE [EBUS3030A2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EBUS3030A2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EBUS3030A2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EBUS3030A2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EBUS3030A2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EBUS3030A2] SET QUERY_STORE = OFF
GO
USE [EBUS3030A2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [EBUS3030A2]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 1/09/2018 5:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [varchar](4) NOT NULL,
	[CustomerFirstName] [varchar](255) NOT NULL,
	[CustomerSurname] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 1/09/2018 5:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] NOT NULL,
	[ItemDescription] [varchar](255) NOT NULL,
	[ShelfPrice] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Office]    Script Date: 1/09/2018 5:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Office](
	[OfficeId] [tinyint] NOT NULL,
	[OfficeLocation] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[OfficeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 1/09/2018 5:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ReceiptDate] [datetime2](7) NOT NULL,
	[ReceiptId] [int] NOT NULL,
	[ReceiptCustomerId] [varchar](4) NOT NULL,
	[ReceiptStaffId] [varchar](4) NOT NULL,
	[TotalPrice] [int],
	[DiscountPrice] [int],
	CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[ReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiptItem]    Script Date: 1/09/2018 5:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptItem](
	[ReceiptId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[ReceiptItemQuantity] [smallint] NOT NULL,
	[SalePrice] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 1/09/2018 5:26:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffId] [varchar](4) NOT NULL,
	[StaffFirstName] [varchar](255) NOT NULL,
	[StaffSurname] [varchar](255) NOT NULL,
	[StaffOfficeId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReceiptItem]    Script Date: 1/09/2018 5:26:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReceiptItem] ON [dbo].[ReceiptItem]
(
	[ReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Staff] FOREIGN KEY([ReceiptStaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_Staff]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptCustomer] FOREIGN KEY([ReceiptCustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_ReceiptCustomer]
GO
ALTER TABLE [dbo].[ReceiptItem]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptItem_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[ReceiptItem] CHECK CONSTRAINT [FK_ReceiptItem_Item]
GO
ALTER TABLE [dbo].[ReceiptItem]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptItemReceipt] FOREIGN KEY([ReceiptId])
REFERENCES [dbo].[Receipt] ([ReceiptId])
GO
ALTER TABLE [dbo].[ReceiptItem] CHECK CONSTRAINT [FK_ReceiptItemReceipt]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_StaffOffice] FOREIGN KEY([StaffOfficeId])
REFERENCES [dbo].[Office] ([OfficeId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_StaffOffice]
GO
USE [master]
GO
ALTER DATABASE [EBUS3030A2] SET  READ_WRITE 
GO