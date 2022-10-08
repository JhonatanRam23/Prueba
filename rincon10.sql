USE [master]
GO
/****** Object:  Database [rincon10]    Script Date: 29/09/2022 1:38:23 a. m. ******/
CREATE DATABASE [rincon10]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rincon10', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\rincon10.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'rincon10_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\rincon10_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [rincon10] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rincon10].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rincon10] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rincon10] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rincon10] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rincon10] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rincon10] SET ARITHABORT OFF 
GO
ALTER DATABASE [rincon10] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [rincon10] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rincon10] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rincon10] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rincon10] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rincon10] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rincon10] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rincon10] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rincon10] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rincon10] SET  ENABLE_BROKER 
GO
ALTER DATABASE [rincon10] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rincon10] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rincon10] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rincon10] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rincon10] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rincon10] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rincon10] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rincon10] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [rincon10] SET  MULTI_USER 
GO
ALTER DATABASE [rincon10] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rincon10] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rincon10] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rincon10] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [rincon10] SET DELAYED_DURABILITY = DISABLED 
GO
USE [rincon10]
GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora](
	[fecha] [datetime] NULL,
	[tipo] [int] NULL,
	[producto] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [int] NULL,
	[usuario] [varchar](10) NULL,
	[comentario] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[caja]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caja](
	[fecha] [datetime] NULL,
	[transaccion] [varchar](50) NULL,
	[monto] [float] NULL,
	[comentario] [varchar](50) NULL,
	[saldo] [float] NULL,
	[usuario] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clase_producto]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clase_producto](
	[id] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[nit] [varchar](20) NOT NULL,
	[nombre] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[nit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_factura]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_factura](
	[factura] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[producto] [int] NOT NULL,
	[precio] [float] NOT NULL,
	[total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[factura] ASC,
	[cantidad] ASC,
	[producto] ASC,
	[precio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enc_factura]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enc_factura](
	[no_factura] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[cliente] [varchar](20) NULL,
	[total_factura] [float] NULL,
	[usuario] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[no_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id] [int] NOT NULL,
	[nombre] [varchar](40) NULL,
	[clase] [int] NULL,
	[unidad_medidad] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promociones]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promociones](
	[id] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[nit] [varchar](10) NOT NULL,
	[nombre] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[clase] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock](
	[producto] [int] NOT NULL,
	[fecha_ingreso] [date] NOT NULL,
	[precio] [float] NOT NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[producto] ASC,
	[fecha_ingreso] ASC,
	[precio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_transaccion]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_transaccion](
	[id] [int] NOT NULL,
	[descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_user]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_user](
	[id] [int] NOT NULL,
	[descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [varchar](10) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[tipo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vdetalles]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vdetalles]
   AS  

select a.factura as factura, a.cantidad cantidad, b.nombre as producto, a.precio as precio, a.total as total
from detalle_factura a, producto b
where a.producto=b.id

GO
/****** Object:  View [dbo].[vfacturas]    Script Date: 29/09/2022 1:38:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vfacturas]  
   AS  
   select a.no_factura as no_factura, a.fecha as fecha, b.nombre as cliente,a.total_factura total, a.usuario
from enc_factura a, cliente b
where a.cliente=b.nit

   
GO
ALTER TABLE [dbo].[bitacora]  WITH CHECK ADD  CONSTRAINT [fk_bitacora_producto] FOREIGN KEY([producto])
REFERENCES [dbo].[producto] ([id])
GO
ALTER TABLE [dbo].[bitacora] CHECK CONSTRAINT [fk_bitacora_producto]
GO
ALTER TABLE [dbo].[bitacora]  WITH CHECK ADD  CONSTRAINT [fk_bitacora_tipo] FOREIGN KEY([tipo])
REFERENCES [dbo].[tipo_transaccion] ([id])
GO
ALTER TABLE [dbo].[bitacora] CHECK CONSTRAINT [fk_bitacora_tipo]
GO
ALTER TABLE [dbo].[bitacora]  WITH CHECK ADD  CONSTRAINT [fk_bitacora_user] FOREIGN KEY([usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[bitacora] CHECK CONSTRAINT [fk_bitacora_user]
GO
ALTER TABLE [dbo].[caja]  WITH CHECK ADD  CONSTRAINT [fk_caja_user] FOREIGN KEY([usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[caja] CHECK CONSTRAINT [fk_caja_user]
GO
ALTER TABLE [dbo].[detalle_factura]  WITH CHECK ADD  CONSTRAINT [fk_detalle_factura] FOREIGN KEY([factura])
REFERENCES [dbo].[enc_factura] ([no_factura])
GO
ALTER TABLE [dbo].[detalle_factura] CHECK CONSTRAINT [fk_detalle_factura]
GO
ALTER TABLE [dbo].[detalle_factura]  WITH CHECK ADD  CONSTRAINT [fk_detalle_producto] FOREIGN KEY([producto])
REFERENCES [dbo].[producto] ([id])
GO
ALTER TABLE [dbo].[detalle_factura] CHECK CONSTRAINT [fk_detalle_producto]
GO
ALTER TABLE [dbo].[enc_factura]  WITH CHECK ADD  CONSTRAINT [fk_enc_cliente] FOREIGN KEY([cliente])
REFERENCES [dbo].[cliente] ([nit])
GO
ALTER TABLE [dbo].[enc_factura] CHECK CONSTRAINT [fk_enc_cliente]
GO
ALTER TABLE [dbo].[enc_factura]  WITH CHECK ADD  CONSTRAINT [fk_enc_usuario] FOREIGN KEY([usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[enc_factura] CHECK CONSTRAINT [fk_enc_usuario]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [fk_producto_clase] FOREIGN KEY([clase])
REFERENCES [dbo].[clase_producto] ([id])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [fk_producto_clase]
GO
ALTER TABLE [dbo].[proveedor]  WITH CHECK ADD  CONSTRAINT [fk_proveedor_clase] FOREIGN KEY([clase])
REFERENCES [dbo].[clase_producto] ([id])
GO
ALTER TABLE [dbo].[proveedor] CHECK CONSTRAINT [fk_proveedor_clase]
GO
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [fk_stock_producto] FOREIGN KEY([producto])
REFERENCES [dbo].[producto] ([id])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [fk_stock_producto]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [fk_user_tipo] FOREIGN KEY([tipo])
REFERENCES [dbo].[tipo_user] ([id])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [fk_user_tipo]
GO
USE [master]
GO
ALTER DATABASE [rincon10] SET  READ_WRITE 
GO
