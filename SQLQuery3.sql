USE [master]
GO
/****** Object:  Database [NartySerwisSklep]    Script Date: 23.05.2020 13:38:02 ******/
CREATE DATABASE [NartySerwisSklep]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NartySerwisSklep', FILENAME = N'C:\Users\aaa\NartySerwisSklep.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NartySerwisSklep_log', FILENAME = N'C:\Users\aaa\NartySerwisSklep_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NartySerwisSklep] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NartySerwisSklep].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NartySerwisSklep] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET ARITHABORT OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NartySerwisSklep] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NartySerwisSklep] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NartySerwisSklep] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NartySerwisSklep] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NartySerwisSklep] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NartySerwisSklep] SET  MULTI_USER 
GO
ALTER DATABASE [NartySerwisSklep] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NartySerwisSklep] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NartySerwisSklep] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NartySerwisSklep] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NartySerwisSklep] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NartySerwisSklep] SET QUERY_STORE = OFF
GO
USE [NartySerwisSklep]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [NartySerwisSklep]
GO
/****** Object:  Table [dbo].[Dostawcy]    Script Date: 23.05.2020 13:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dostawcy](
	[IDDostawcy] [int] IDENTITY(1,1) NOT NULL,
	[IDProduktu] [int] NULL,
	[NazwaDostawcy] [nvarchar](100) NULL,
	[Adres] [nvarchar](100) NULL,
	[KodPocztowy] [int] NULL,
	[Miasto] [nvarchar](80) NULL,
	[Kraj] [nvarchar](80) NULL,
	[Telefon] [int] NULL,
	[StronaWWW] [varchar](100) NULL,
	[Opis] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDDostawcy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategorie]    Script Date: 23.05.2020 13:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategorie](
	[IDKategori] [int] IDENTITY(1,1) NOT NULL,
	[IDProduktu] [int] NULL,
	[NazwaKategori] [nvarchar](60) NULL,
	[OpisPrzedmiotu] [nvarchar](255) NULL,
	[ZdjęciePrzedmiotu] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDKategori] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klienci]    Script Date: 23.05.2020 13:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klienci](
	[IDKlienta] [int] IDENTITY(1,1) NOT NULL,
	[IDZamówienia] [int] NOT NULL,
	[Imię] [nvarchar](45) NULL,
	[Nazwisko] [nvarchar](70) NULL,
	[Adres] [nvarchar](100) NULL,
	[Miasto] [nvarchar](80) NULL,
	[KodPocztowy] [int] NULL,
	[Telefon] [int] NULL,
	[Firma] [nvarchar](255) NULL,
	[Kraj] [nvarchar](80) NULL,
	[NIP] [decimal](15, 0) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDKlienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy]    Script Date: 23.05.2020 13:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy](
	[IDPracownika] [int] IDENTITY(1,1) NOT NULL,
	[IDZamówienia] [int] NULL,
	[Imię] [nvarchar](45) NULL,
	[Nazwisko] [nvarchar](70) NULL,
	[PESEL] [decimal](11, 0) NULL,
	[DataUrodzenia] [date] NULL,
	[Adres] [nvarchar](100) NULL,
	[KodPocztowy] [int] NULL,
	[Miasto] [nvarchar](80) NULL,
	[Kraj] [nvarchar](80) NULL,
	[NrKontaBankowego] [decimal](30, 0) NULL,
	[DataZatrudnienia] [date] NULL,
	[Zdjęcie] [image] NULL,
	[Stanowisko] [nvarchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPracownika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produkty]    Script Date: 23.05.2020 13:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produkty](
	[IDProduktu] [int] IDENTITY(1,1) NOT NULL,
	[IDKategori] [int] NULL,
	[IDDostawcy] [int] NULL,
	[NazwaProduktu] [nvarchar](100) NULL,
	[StanNaMagazynie] [int] NULL,
	[CenaZaSztukę] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProduktu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SzczegółyZamówienia]    Script Date: 23.05.2020 13:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SzczegółyZamówienia](
	[IDZamówienia] [int] NULL,
	[IDProduktu] [int] NULL,
	[CenaNetto] [money] NULL,
	[CenaBrutto] [money] NULL,
	[WartośćVAT] [money] NULL,
	[Ilość] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zamówienia]    Script Date: 23.05.2020 13:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zamówienia](
	[IDZamówienia] [int] IDENTITY(1,1) NOT NULL,
	[IDKlienta] [int] NULL,
	[IDPracownika] [int] NULL,
	[DataZamówienia] [datetime] NULL,
	[DataWysyłki] [datetime] NULL,
	[RodzajWysyłki] [nvarchar](45) NULL,
	[RodzajPłatności] [nvarchar](45) NULL,
	[AdresWysyłki] [varchar](100) NULL,
	[MiastoWysyłki] [nvarchar](80) NULL,
	[KrajWysyłki] [nvarchar](80) NULL,
	[KodPocztowyWysyłki] [int] NULL,
	[StatusZamówienia] [nvarchar](30) NULL,
	[Komentarz] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDZamówienia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Produkty]  WITH CHECK ADD FOREIGN KEY([IDDostawcy])
REFERENCES [dbo].[Dostawcy] ([IDDostawcy])
GO
ALTER TABLE [dbo].[Produkty]  WITH CHECK ADD  CONSTRAINT [FK_Produkty_Kategorie] FOREIGN KEY([IDKategori])
REFERENCES [dbo].[Kategorie] ([IDKategori])
GO
ALTER TABLE [dbo].[Produkty] CHECK CONSTRAINT [FK_Produkty_Kategorie]
GO
ALTER TABLE [dbo].[SzczegółyZamówienia]  WITH CHECK ADD FOREIGN KEY([IDProduktu])
REFERENCES [dbo].[Produkty] ([IDProduktu])
GO
ALTER TABLE [dbo].[SzczegółyZamówienia]  WITH CHECK ADD FOREIGN KEY([IDZamówienia])
REFERENCES [dbo].[Zamówienia] ([IDZamówienia])
GO
ALTER TABLE [dbo].[Zamówienia]  WITH CHECK ADD FOREIGN KEY([IDKlienta])
REFERENCES [dbo].[Klienci] ([IDKlienta])
GO
ALTER TABLE [dbo].[Zamówienia]  WITH CHECK ADD FOREIGN KEY([IDPracownika])
REFERENCES [dbo].[Pracownicy] ([IDPracownika])
GO
USE [master]
GO
ALTER DATABASE [NartySerwisSklep] SET  READ_WRITE 
GO
