USE [master]
GO
/****** Object:  Database [DB_PruebaTecnica]    Script Date: 12/06/2019 15:16:33 ******/
CREATE DATABASE [DB_PruebaTecnica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_PruebaTecnica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_PruebaTecnica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_PruebaTecnica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_PruebaTecnica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_PruebaTecnica] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_PruebaTecnica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_PruebaTecnica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_PruebaTecnica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_PruebaTecnica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_PruebaTecnica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_PruebaTecnica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_PruebaTecnica] SET  MULTI_USER 
GO
ALTER DATABASE [DB_PruebaTecnica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_PruebaTecnica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_PruebaTecnica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_PruebaTecnica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_PruebaTecnica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_PruebaTecnica] SET QUERY_STORE = OFF
GO
USE [DB_PruebaTecnica]
GO
/****** Object:  Table [dbo].[TablaCambioContraseña]    Script Date: 12/06/2019 15:16:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablaCambioContraseña](
	[Token] [uniqueidentifier] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Utiliazado] [bit] NOT NULL,
	[FechaVencimiento] [datetime] NOT NULL,
 CONSTRAINT [PK_TablaCambioContraseña] PRIMARY KEY CLUSTERED 
(
	[Token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TablaEmpleado]    Script Date: 12/06/2019 15:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablaEmpleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[DPI] [int] NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[Hijo] [numeric](2, 0) NOT NULL,
	[SalarioBase] [numeric](7, 2) NOT NULL,
	[Estado] [varchar](1) NOT NULL,
	[IdUsuarioCreacion] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_TablaEmpleado] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TablaUsuario]    Script Date: 12/06/2019 15:16:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablaUsuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](128) NOT NULL,
	[Contraseña] [varchar](128) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_TablaUsuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TablaCambioContraseña] ([Token], [IdUsuario], [Utiliazado], [FechaVencimiento]) VALUES (N'00000000-0000-0000-0000-000000000000', 1, 0, CAST(N'2019-06-12T04:46:45.000' AS DateTime))
GO
INSERT [dbo].[TablaCambioContraseña] ([Token], [IdUsuario], [Utiliazado], [FechaVencimiento]) VALUES (N'ecf6b877-8c38-4721-9fc1-009bcf59a28d', 1, 0, CAST(N'2019-06-12T05:13:53.000' AS DateTime))
GO
INSERT [dbo].[TablaCambioContraseña] ([Token], [IdUsuario], [Utiliazado], [FechaVencimiento]) VALUES (N'cc5cd9d4-ce5c-4fa9-83f0-2439b399552f', 1, 0, CAST(N'2019-06-12T05:34:53.000' AS DateTime))
GO
INSERT [dbo].[TablaCambioContraseña] ([Token], [IdUsuario], [Utiliazado], [FechaVencimiento]) VALUES (N'52d6e01f-3c5f-440b-8129-30a534e0bce1', 1, 0, CAST(N'2019-06-12T05:32:49.000' AS DateTime))
GO
INSERT [dbo].[TablaCambioContraseña] ([Token], [IdUsuario], [Utiliazado], [FechaVencimiento]) VALUES (N'656df9d1-afdf-4a08-be6c-53553950ea39', 1, 0, CAST(N'2019-06-12T04:53:07.000' AS DateTime))
GO
INSERT [dbo].[TablaCambioContraseña] ([Token], [IdUsuario], [Utiliazado], [FechaVencimiento]) VALUES (N'ea54eb9d-a50b-4b16-9241-7609614b75b8', 1, 1, CAST(N'2019-06-12T19:00:32.000' AS DateTime))
GO
INSERT [dbo].[TablaCambioContraseña] ([Token], [IdUsuario], [Utiliazado], [FechaVencimiento]) VALUES (N'da21b1ef-82bf-4136-9b45-b39968faa73a', 1, 0, CAST(N'2019-06-12T05:11:23.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TablaEmpleado] ON 
GO
INSERT [dbo].[TablaEmpleado] ([IdEmpleado], [DPI], [Nombre], [Hijo], [SalarioBase], [Estado], [IdUsuarioCreacion], [FechaCreacion]) VALUES (1, 11111111, N'kevin', CAST(3 AS Numeric(2, 0)), CAST(2700.00 AS Numeric(7, 2)), N'A', 1, CAST(N'2019-06-12T12:14:32.107' AS DateTime))
GO
INSERT [dbo].[TablaEmpleado] ([IdEmpleado], [DPI], [Nombre], [Hijo], [SalarioBase], [Estado], [IdUsuarioCreacion], [FechaCreacion]) VALUES (2, 123123, N'kevin', CAST(1 AS Numeric(2, 0)), CAST(3750.58 AS Numeric(7, 2)), N'A', 1, CAST(N'2019-06-12T12:26:17.570' AS DateTime))
GO
INSERT [dbo].[TablaEmpleado] ([IdEmpleado], [DPI], [Nombre], [Hijo], [SalarioBase], [Estado], [IdUsuarioCreacion], [FechaCreacion]) VALUES (3, 11111, N'QQ', CAST(2 AS Numeric(2, 0)), CAST(3456.00 AS Numeric(7, 2)), N'A', 1, CAST(N'2019-06-12T12:31:06.863' AS DateTime))
GO
INSERT [dbo].[TablaEmpleado] ([IdEmpleado], [DPI], [Nombre], [Hijo], [SalarioBase], [Estado], [IdUsuarioCreacion], [FechaCreacion]) VALUES (4, 1232314234, N'Prueba', CAST(12 AS Numeric(2, 0)), CAST(3578.58 AS Numeric(7, 2)), N'A', 1, CAST(N'2019-06-12T12:31:46.657' AS DateTime))
GO
INSERT [dbo].[TablaEmpleado] ([IdEmpleado], [DPI], [Nombre], [Hijo], [SalarioBase], [Estado], [IdUsuarioCreacion], [FechaCreacion]) VALUES (5, 123456789, N'Prueba', CAST(3 AS Numeric(2, 0)), CAST(2770.00 AS Numeric(7, 2)), N'A', 1, CAST(N'2019-06-12T14:40:24.373' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TablaEmpleado] OFF
GO
SET IDENTITY_INSERT [dbo].[TablaUsuario] ON 
GO
INSERT [dbo].[TablaUsuario] ([IdUsuario], [Email], [Contraseña], [Nombre], [FechaNacimiento]) VALUES (1, N'kevin03910391@gmail.com', N'admin2', N'Kevin Estuardo Tax Velásquez', CAST(N'1991-08-03' AS Date))
GO
INSERT [dbo].[TablaUsuario] ([IdUsuario], [Email], [Contraseña], [Nombre], [FechaNacimiento]) VALUES (3, N'prueba.tecnica.japon@gmail.com', N'admin', N'Adminnistrador', CAST(N'2019-06-12' AS Date))
GO
SET IDENTITY_INSERT [dbo].[TablaUsuario] OFF
GO
ALTER TABLE [dbo].[TablaCambioContraseña]  WITH CHECK ADD  CONSTRAINT [FK_TablaCambioContraseña_TablaUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TablaUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TablaCambioContraseña] CHECK CONSTRAINT [FK_TablaCambioContraseña_TablaUsuario]
GO
ALTER TABLE [dbo].[TablaEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_TablaEmpleado_TablaUsuario] FOREIGN KEY([IdUsuarioCreacion])
REFERENCES [dbo].[TablaUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TablaEmpleado] CHECK CONSTRAINT [FK_TablaEmpleado_TablaUsuario]
GO
USE [master]
GO
ALTER DATABASE [DB_PruebaTecnica] SET  READ_WRITE 
GO
