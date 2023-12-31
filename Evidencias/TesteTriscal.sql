USE [master]
GO
/****** Object:  Database [TesteTriscal_db]    Script Date: 27/10/2023 00:45:42 ******/
CREATE DATABASE [TesteTriscal_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TesteTriscal_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TesteTriscal_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TesteTriscal_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TesteTriscal_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TesteTriscal_db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TesteTriscal_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TesteTriscal_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TesteTriscal_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TesteTriscal_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TesteTriscal_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TesteTriscal_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET RECOVERY FULL 
GO
ALTER DATABASE [TesteTriscal_db] SET  MULTI_USER 
GO
ALTER DATABASE [TesteTriscal_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TesteTriscal_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TesteTriscal_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TesteTriscal_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TesteTriscal_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TesteTriscal_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TesteTriscal_db', N'ON'
GO
ALTER DATABASE [TesteTriscal_db] SET QUERY_STORE = OFF
GO
USE [TesteTriscal_db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 27/10/2023 00:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 27/10/2023 00:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [uniqueidentifier] NOT NULL,
	[ProdutoId] [uniqueidentifier] NULL,
	[Qtde] [int] NOT NULL,
	[SolicitacaoCompraId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 27/10/2023 00:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produto](
	[Id] [uniqueidentifier] NOT NULL,
	[Categoria] [int] NOT NULL,
	[Descricao] [nvarchar](max) NULL,
	[Nome] [nvarchar](max) NULL,
	[Preco] [decimal](10, 2) NULL,
	[Situacao] [int] NOT NULL,
 CONSTRAINT [PK_Produto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SolicitacaoCompra]    Script Date: 27/10/2023 00:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitacaoCompra](
	[Id] [uniqueidentifier] NOT NULL,
	[Data] [datetime2](7) NOT NULL,
	[Situacao] [int] NOT NULL,
	[CondicaoPagamento] [int] NULL,
	[NomeFornecedor] [nvarchar](max) NULL,
	[UsuarioSolicitante] [nvarchar](max) NULL,
	[TotalGeral] [decimal](10, 2) NULL,
 CONSTRAINT [PK_SolicitacaoCompra] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Item_ProdutoId]    Script Date: 27/10/2023 00:45:43 ******/
CREATE NONCLUSTERED INDEX [IX_Item_ProdutoId] ON [dbo].[Item]
(
	[ProdutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Item_SolicitacaoCompraId]    Script Date: 27/10/2023 00:45:43 ******/
CREATE NONCLUSTERED INDEX [IX_Item_SolicitacaoCompraId] ON [dbo].[Item]
(
	[SolicitacaoCompraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Produto] ADD  DEFAULT ((1)) FOR [Situacao]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Produto_ProdutoId] FOREIGN KEY([ProdutoId])
REFERENCES [dbo].[Produto] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Produto_ProdutoId]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_SolicitacaoCompra_SolicitacaoCompraId] FOREIGN KEY([SolicitacaoCompraId])
REFERENCES [dbo].[SolicitacaoCompra] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_SolicitacaoCompra_SolicitacaoCompraId]
GO
USE [master]
GO
ALTER DATABASE [TesteTriscal_db] SET  READ_WRITE 
GO
