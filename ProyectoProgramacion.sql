USE [ProyectoProgramacion]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 3/6/2023 02:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[consecutivo_error] [int] IDENTITY(1,1) NOT NULL,
	[fechaHora] [datetime] NOT NULL,
	[mensajeError] [varchar](50) NOT NULL,
	[origen] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[consecutivo_error] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ceviche]    Script Date: 3/6/2023 02:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ceviche](
	[codigo_ceviche] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[precio] [numeric](10, 2) NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Ceviche] PRIMARY KEY CLUSTERED 
(
	[codigo_ceviche] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Error]    Script Date: 3/6/2023 02:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Error](
	[consecutivo_error] [int] IDENTITY(1,1) NOT NULL,
	[fechaHora] [datetime] NOT NULL,
	[mensajeError] [nvarchar](50) NOT NULL,
	[origen] [nvarchar](max) NOT NULL,
	[codigo_usuario] [int] NOT NULL,
 CONSTRAINT [PK_Error] PRIMARY KEY CLUSTERED 
(
	[consecutivo_error] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 3/6/2023 02:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[codigo_factura] [int] IDENTITY(1,1) NOT NULL,
	[codigo_usuario] [int] NOT NULL,
	[codigo_promocion] [int] NOT NULL,
	[codigo_sucursal] [int] NOT NULL,
	[total] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[codigo_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promocion]    Script Date: 3/6/2023 02:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promocion](
	[codigo_promocion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_promocion] [nvarchar](50) NOT NULL,
	[descuento] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Promocion] PRIMARY KEY CLUSTERED 
(
	[codigo_promocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 3/6/2023 02:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[codigo_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](10) NOT NULL,
	[apellido] [nchar](10) NOT NULL,
	[compañia] [nchar](10) NOT NULL,
	[pais] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Provedor] PRIMARY KEY CLUSTERED 
(
	[codigo_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor_Ceviche]    Script Date: 3/6/2023 02:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor_Ceviche](
	[codigo_proveedor] [int] NOT NULL,
	[codigo_ceviche] [int] NOT NULL,
 CONSTRAINT [PK_Provedor_Ceviche] PRIMARY KEY CLUSTERED 
(
	[codigo_proveedor] ASC,
	[codigo_ceviche] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 3/6/2023 02:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[codigo_rol] [int] IDENTITY(1,1) NOT NULL,
	[tipo_rol] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[codigo_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 3/6/2023 02:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[codigo_sucursal] [int] IDENTITY(1,1) NOT NULL,
	[nombre_sucursal] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[codigo_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 3/6/2023 02:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[codigo_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[edad] [int] NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[contrasenna] [nvarchar](50) NOT NULL,
	[telefono] [int] NOT NULL,
	[estado] [bit] NOT NULL,
	[codigo_rol] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[codigo_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Usuario] UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Ceviche]    Script Date: 3/6/2023 02:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Ceviche](
	[codigo_usuario] [int] NOT NULL,
	[codigo_ceviche] [int] NOT NULL,
 CONSTRAINT [PK_Usuario_Ceviche] PRIMARY KEY CLUSTERED 
(
	[codigo_usuario] ASC,
	[codigo_ceviche] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Error]  WITH CHECK ADD FOREIGN KEY([codigo_usuario])
REFERENCES [dbo].[Usuario] ([codigo_usuario])
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([codigo_usuario])
REFERENCES [dbo].[Usuario] ([codigo_usuario])
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([codigo_promocion])
REFERENCES [dbo].[Promocion] ([codigo_promocion])
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([codigo_sucursal])
REFERENCES [dbo].[Sucursal] ([codigo_sucursal])
GO
ALTER TABLE [dbo].[Proveedor_Ceviche]  WITH CHECK ADD FOREIGN KEY([codigo_proveedor])
REFERENCES [dbo].[Proveedor] ([codigo_proveedor])
GO
ALTER TABLE [dbo].[Proveedor_Ceviche]  WITH CHECK ADD FOREIGN KEY([codigo_ceviche])
REFERENCES [dbo].[Ceviche] ([codigo_ceviche])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([codigo_rol])
REFERENCES [dbo].[Rol] ([codigo_rol])
GO
ALTER TABLE [dbo].[Usuario_Ceviche]  WITH CHECK ADD FOREIGN KEY([codigo_usuario])
REFERENCES [dbo].[Usuario] ([codigo_usuario])
GO
ALTER TABLE [dbo].[Usuario_Ceviche]  WITH CHECK ADD FOREIGN KEY([codigo_ceviche])
REFERENCES [dbo].[Ceviche] ([codigo_ceviche])
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarios]    Script Date: 3/6/2023 02:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarUsuarios]
AS
BEGIN
	SELECT	codigo_usuario,
			correo,
			estado
	FROM	dbo.Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[ValidarUsuario]    Script Date: 3/6/2023 02:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidarUsuario]
	@CorreoElectronico	NVARCHAR(70),
	@Contrasenna		NVARCHAR(10)
AS
BEGIN
	
	SELECT codigo_usuario,
		   correo,
		   estado
	  FROM dbo.Usuario
	  WHERE correo = @CorreoElectronico
		AND contrasenna		  = @Contrasenna
		AND estado			  = 1

END
GO
