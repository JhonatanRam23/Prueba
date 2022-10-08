USE [prueba]
GO
/****** Object:  Table [dbo].[colaboradores]    Script Date: 8/10/2022 1:48:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[colaboradores](
	[dpi_colaborador] [int] NOT NULL,
	[nombre_colaborador] [varchar](50) NULL,
	[apellido_colaborador] [varchar](50) NULL,
	[direccion_colaborador] [varchar](50) NULL,
	[telefono_colaborador] [int] NULL,
	[cantidad_hijos] [int] NULL,
	[puesto_colaborador] [varchar](50) NULL,
	[codigo_departamento] [int] NULL,
	[salario_mensual] [float] NULL,
 CONSTRAINT [PK_colaboradores] PRIMARY KEY CLUSTERED 
(
	[dpi_colaborador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departamento]    Script Date: 8/10/2022 1:48:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamento](
	[codigo_departamento] [int] NOT NULL,
	[nombre_departamento] [varchar](50) NULL,
 CONSTRAINT [PK_departamento] PRIMARY KEY CLUSTERED 
(
	[codigo_departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_user]    Script Date: 8/10/2022 1:48:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_user](
	[id_tipo] [int] NOT NULL,
	[descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 8/10/2022 1:48:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[email_usuario] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[Nombre_usuario] [varchar](50) NOT NULL,
	[Apellido_usuario] [varchar](50) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[tipo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[email_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[colaboradores]  WITH CHECK ADD  CONSTRAINT [fk_departamento] FOREIGN KEY([codigo_departamento])
REFERENCES [dbo].[departamento] ([codigo_departamento])
GO
ALTER TABLE [dbo].[colaboradores] CHECK CONSTRAINT [fk_departamento]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [fk_user_tipo] FOREIGN KEY([tipo])
REFERENCES [dbo].[tipo_user] ([id_tipo])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [fk_user_tipo]
GO
