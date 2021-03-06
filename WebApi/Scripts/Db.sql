USE [master]
GO
/****** Object:  Database [Deneme]    Script Date: 17.01.2021 16:39:44 ******/
CREATE DATABASE [Deneme]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Deneme', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Deneme.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Deneme_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Deneme_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Deneme] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Deneme].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Deneme] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Deneme] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Deneme] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Deneme] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Deneme] SET ARITHABORT OFF 
GO
ALTER DATABASE [Deneme] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Deneme] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Deneme] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Deneme] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Deneme] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Deneme] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Deneme] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Deneme] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Deneme] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Deneme] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Deneme] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Deneme] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Deneme] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Deneme] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Deneme] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Deneme] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Deneme] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Deneme] SET RECOVERY FULL 
GO
ALTER DATABASE [Deneme] SET  MULTI_USER 
GO
ALTER DATABASE [Deneme] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Deneme] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Deneme] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Deneme] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Deneme] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Deneme', N'ON'
GO
USE [Deneme]
GO
/****** Object:  Table [dbo].[CVCalisma]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CVCalisma](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CvId] [int] NULL,
	[FirmaAdi] [nvarchar](250) NULL,
	[Pozisyon] [nvarchar](150) NULL,
	[Aciklama] [nvarchar](max) NULL,
	[BaslangicTarihi] [datetime] NULL,
	[BitisTarihi] [datetime] NULL,
 CONSTRAINT [PK_CVCalisma] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CVEgitim]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CVEgitim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CvId] [int] NULL,
	[EgitimDurumu] [nvarchar](150) NULL,
	[Adi] [nvarchar](250) NULL,
	[Notu] [int] NULL,
	[BaslangicTarihi] [datetime] NULL,
	[BitisTarihi] [datetime] NULL,
 CONSTRAINT [PK_CVEgitim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CVKullanici]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CVKullanici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciId] [int] NULL,
	[Meslegi] [nvarchar](150) NULL,
	[CalismaSuresi] [int] NULL,
 CONSTRAINT [PK_CVKullanici] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firma]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firma](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](250) NULL,
	[Adres] [nvarchar](350) NULL,
 CONSTRAINT [PK_Firma] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FirmaIlan]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirmaIlan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirmaId] [int] NULL,
	[IlanAciklama] [nvarchar](max) NULL,
	[Konum] [nvarchar](150) NULL,
	[SonaErmeSuresi] [datetime] NULL,
 CONSTRAINT [PK_FirmaIlan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IlanBasvuru]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IlanBasvuru](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IlanId] [int] NULL,
	[CvId] [int] NULL,
 CONSTRAINT [PK_IlanBasvuru] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_Basvuru]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Basvuru]
	@IlanId INT,
	@CvId INT
AS
BEGIN
	INSERT INTO	dbo.IlanBasvuru
	(
	    IlanId,
	    CvId
	)
	VALUES
	(   @IlanId,
		@CvId
	)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CvCalismaOlustur]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CvCalismaOlustur]
	@Aciklama NVARCHAR(MAX),
	@BaslangicTarihi DATETIME,
	@BitisTarihi DATETIME,
	@CvId INT,
	@FirmaAdi NVARCHAR(250),
	@Pozisyon NVARCHAR(150)
AS
BEGIN
	INSERT INTO dbo.CVCalisma
	(
	    CvId,
	    FirmaAdi,
	    Pozisyon,
	    Aciklama,
	    BaslangicTarihi,
	    BitisTarihi
	)
	VALUES
	(   @CvId,
	    @FirmaAdi,
	    @Pozisyon,
	    @Aciklama,
	    @BaslangicTarihi,
	    @BitisTarihi
	    )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CvCalismaSil]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CvCalismaSil]
	@Id INT
AS
BEGIN
	DELETE FROM dbo.CVCalisma WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CvEgitimOlustur]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CvEgitimOlustur]
	@Adi NVARCHAR(250),
	@BaslangicTarihi DATETIME,
	@BitisTarihi DATETIME,
	@CvId INT,
	@EgitimDurumu NVARCHAR(150),
	@Notu INT
AS
BEGIN
	INSERT INTO dbo.CVEgitim
	(
	    CvId,
	    EgitimDurumu,
	    Adi,
	    Notu,
	    BaslangicTarihi,
	    BitisTarihi
	)
	VALUES
	(   @CvId,
	    @EgitimDurumu,
	    @Adi,
	    @Notu,
	    @BaslangicTarihi,
	    @BitisTarihi
	    )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CvEgitimSil]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CvEgitimSil]
	@Id INT
AS
BEGIN
	DELETE FROM dbo.CVEgitim WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CvOlustur]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CvOlustur]
	@CalismaSuresi INT,
	@KullaniciId INT,
	@Meslegi NVARCHAR(150)
AS
BEGIN
	INSERT INTO dbo.CVKullanici
	(
	    KullaniciId,
	    Meslegi,
	    CalismaSuresi
	)
	VALUES
	(   @KullaniciId,
	    @Meslegi,
	    @CalismaSuresi
	    )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CvSil]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CvSil]
	@Id	INT
AS
BEGIN
	DELETE FROM dbo.CVKullanici WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_FirmaBilgileri]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_FirmaBilgileri]
	@Adi NVARCHAR(250),
	@Adres NVARCHAR(350)
AS
BEGIN
	INSERT INTO dbo.Firma
	(
	    Adi,
	    Adres
	)
	VALUES
	(   @Adi,
	    @Adres
	    )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_FirmaIlanGetir]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_FirmaIlanGetir]
AS
BEGIN
	SELECT Id,
           FirmaId,
           IlanAciklama,
           Konum,
           SonaErmeSuresi 
	FROM dbo.FirmaIlan
END
GO
/****** Object:  StoredProcedure [dbo].[sp_FirmaSil]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_FirmaSil]
	@Id	 INT
AS
BEGIN
	DELETE FROM dbo.Firma WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_IlanOlustur]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_IlanOlustur]
	@FirmaId INT,
	@IlanAciklama NVARCHAR(MAX),
	@Konum NVARCHAR(150),
	@SonaErmeSuresi DATETIME
AS
BEGIN
	INSERT INTO dbo.FirmaIlan
	(
	    FirmaId,
	    IlanAciklama,
	    Konum,
	    SonaErmeSuresi
	)
	VALUES
	(   @FirmaId,
	    @IlanAciklama,
	    @Konum,
	    @SonaErmeSuresi
	    )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_IlanSil]    Script Date: 17.01.2021 16:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_IlanSil]
	@Id INT
AS
BEGIN
	DELETE FROM dbo.FirmaIlan WHERE Id = @Id
END
GO
USE [master]
GO
ALTER DATABASE [Deneme] SET  READ_WRITE 
GO
