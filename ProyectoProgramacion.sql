Use [ProyectoProgramacion]

CREATE TABLE [dbo].[Bitacora](
	[ConsecutivoError] [bigint] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[MensajeError] [varchar](50) NOT NULL,
	[Origen] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[ConsecutivoError] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


CREATE TABLE [dbo].[Ceviche](
	[CodigoCeviche] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Precio] [numeric](10, 2) NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Ceviche] PRIMARY KEY CLUSTERED 
(
	[CodigoCeviche] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[Rol](
	[CodigoRol] [bigint] IDENTITY(1,1) NOT NULL,
	[TipoRol] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[CodigoRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[Promocion](
	[CodigoPromocion] [bigint] IDENTITY(1,1) NOT NULL,
	[DescripcionPromocion] [nvarchar](50) NOT NULL,
	[Descuento] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Promocion] PRIMARY KEY CLUSTERED 
(
	[CodigoPromocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[Proveedor](
	[CodigoProveedor] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](10) NOT NULL,
	[Apellido] [nchar](10) NOT NULL,
	[Compañia] [nchar](10) NOT NULL,
	[Pais] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Provedor] PRIMARY KEY CLUSTERED 
(
	[CodigoProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Sucursal](
	[CodigoSucursal] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreSucursal] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[CodigoSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[Usuario](
	[CodigoUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[CorreoElectronico] [nvarchar](70) NOT NULL,
	[Contrasenna] [nvarchar](10) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[CodigoRol] [bigint] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[CodigoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Usuario] UNIQUE NONCLUSTERED 
(
	[CorreoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([CodigoRol])
REFERENCES [dbo].[Rol] ([CodigoRol])

CREATE TABLE [dbo].[Error](
	[ConsecutivoError] [bigint] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[MensajeError] [nvarchar](50) NOT NULL,
	[Origen] [nvarchar](max) NOT NULL,
	[CodigoUsuario] [bigint] NOT NULL,
 CONSTRAINT [PK_Error] PRIMARY KEY CLUSTERED 
(
	[ConsecutivoError] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


ALTER TABLE [dbo].[Error]  WITH CHECK ADD FOREIGN KEY([CodigoUsuario])
REFERENCES [dbo].[Usuario] ([CodigoUsuario])

CREATE TABLE [dbo].[Usuario_Ceviche](
	[CodigoUsuario] [bigint] NOT NULL,
	[CodigoCeviche] [bigint] NOT NULL,
 CONSTRAINT [PK_Usuario_Ceviche] PRIMARY KEY CLUSTERED 
(
	[CodigoUsuario] ASC,
	[CodigoCeviche] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[Usuario_Ceviche]  WITH CHECK ADD FOREIGN KEY([CodigoUsuario])
REFERENCES [dbo].[Usuario] ([CodigoUsuario])


ALTER TABLE [dbo].[Usuario_Ceviche]  WITH CHECK ADD FOREIGN KEY([CodigoCeviche])
REFERENCES [dbo].[Ceviche] ([CodigoCeviche])

CREATE TABLE [dbo].[Proveedor_Ceviche](
	[CodigoProveedor] [bigint] NOT NULL,
	[CodigoCeviche] [bigint] NOT NULL,
 CONSTRAINT [PK_Provedor_Ceviche] PRIMARY KEY CLUSTERED 
(
	[CodigoProveedor] ASC,
	[CodigoCeviche] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Proveedor_Ceviche]  WITH CHECK ADD FOREIGN KEY([CodigoProveedor])
REFERENCES [dbo].[Proveedor] ([CodigoProveedor])

ALTER TABLE [dbo].[Proveedor_Ceviche]  WITH CHECK ADD FOREIGN KEY([CodigoCeviche])
REFERENCES [dbo].[Ceviche] ([CodigoCeviche])

CREATE TABLE [dbo].[Factura](
	[CodigoFactura] [bigint] IDENTITY(1,1) NOT NULL,
	[CodigoUsuario] [bigint] NOT NULL,
	[CodigoPromocion] [bigint] NOT NULL,
	[CodigoSucursal] [bigint] NOT NULL,
	[Total] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[CodigoFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([CodigoUsuario])
REFERENCES [dbo].[Usuario] ([CodigoUsuario])

ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([CodigoPromocion])
REFERENCES [dbo].[Promocion] ([CodigoPromocion])

ALTER TABLE [dbo].[Factura]  WITH CHECK ADD FOREIGN KEY([CodigoSucursal])
REFERENCES [dbo].[Sucursal] ([CodigoSucursal])
