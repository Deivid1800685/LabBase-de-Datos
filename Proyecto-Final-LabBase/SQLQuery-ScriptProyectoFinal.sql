USE [Videos8]
GO
/****** Object:  Table [dbo].[Actor]    Script Date: 27/10/2018 01:48:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actor](
	[iID_Actor] [int] IDENTITY(30,1) NOT NULL,
	[vNombre_Actor] [varchar](20) NULL,
 CONSTRAINT [PK__Actor__0AB1F8634314730F] PRIMARY KEY CLUSTERED 
(
	[iID_Actor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alquiler]    Script Date: 27/10/2018 01:48:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alquiler](
	[iID_Alquier] [int] NOT NULL,
	[dFecha_Renta] [datetime] NULL,
	[mTotal] [money] NULL,
	[iID_Cliente] [int] NOT NULL,
	[iID_Empleado] [int] NOT NULL,
 CONSTRAINT [PK_Alquiler] PRIMARY KEY CLUSTERED 
(
	[iID_Alquier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alquiler_Detalle]    Script Date: 27/10/2018 01:48:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alquiler_Detalle](
	[iID_Alquiler] [int] IDENTITY(380,1) NOT NULL,
	[mPrecio] [money] NULL,
	[tCantidad] [tinyint] NULL,
	[mSubtotal]  AS ([mPrecio]*[tCantidad]),
	[dFecha_Alquiler] [date] NULL,
	[dFecha_Devolucion] [date] NULL,
	[iID_Sucursal] [int] NULL,
	[iID_Pelicula] [int] NULL,
 CONSTRAINT [PK_Alquiler_Detalle] PRIMARY KEY CLUSTERED 
(
	[iID_Alquiler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calidad]    Script Date: 27/10/2018 01:48:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calidad](
	[iID_Calidad] [int] IDENTITY(70,1) NOT NULL,
	[vCalidad] [varchar](30) NULL,
 CONSTRAINT [PK__Calidad__0D23D758F1B620A3] PRIMARY KEY CLUSTERED 
(
	[iID_Calidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casting]    Script Date: 27/10/2018 01:48:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casting](
	[iID_Casting] [int] IDENTITY(180,1) NOT NULL,
	[iID_Pelicula] [int] NULL,
	[iID_Actor] [int] NULL,
 CONSTRAINT [PK__Casting__8A3C00F302B7A312] PRIMARY KEY CLUSTERED 
(
	[iID_Casting] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clasificacion]    Script Date: 27/10/2018 01:48:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasificacion](
	[iID_Clasificacion] [int] IDENTITY(10,1) NOT NULL,
	[cClasificacion] [char](1) NULL,
 CONSTRAINT [PK__Clasific__476770833A3B50F7] PRIMARY KEY CLUSTERED 
(
	[iID_Clasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 27/10/2018 01:48:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[iID_Cliente] [int] IDENTITY(100,1) NOT NULL,
	[vNombre_Cliente] [varchar](50) NULL,
	[vApellidoP_Cliente] [varchar](50) NULL,
	[vApellidoM_Cliente] [varchar](50) NULL,
	[vNombre_Completo]  AS (((([vNombre_Cliente]+' ')+[vApellidoP_Cliente])+' ')+[vApellidoM_Cliente]),
	[dFecha_Nac] [datetime] NULL,
	[iID_Pago] [int] NULL,
	[iID_Domicilio] [int] NULL,
	[iID_Tipo] [int] NULL,
 CONSTRAINT [PK__Cliente__E3552DCAD1AA2151] PRIMARY KEY CLUSTERED 
(
	[iID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devolucion]    Script Date: 27/10/2018 01:48:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devolucion](
	[iID_Devolucion] [int] IDENTITY(310,1) NOT NULL,
	[iID_Alquiler] [int] NOT NULL,
	[iID_Empleado] [int] NOT NULL,
	[iID_Cliente] [int] NOT NULL,
	[iID_Pelicula] [int] NOT NULL,
	[dFechaDevolucion] [date] NULL,
 CONSTRAINT [PK_Devolucion] PRIMARY KEY CLUSTERED 
(
	[iID_Devolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 27/10/2018 01:48:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domicilio](
	[iID_Direccion] [int] IDENTITY(160,1) NOT NULL,
	[vColonia] [varchar](50) NULL,
	[vCalle] [varchar](50) NULL,
	[vNumero] [varchar](20) NULL,
	[vCod_Postal] [varchar](10) NULL,
	[vMunicipio] [varchar](10) NULL,
	[iID_Cliente] [int] NULL,
 CONSTRAINT [PK__Domicili__55485083F4E13841] PRIMARY KEY CLUSTERED 
(
	[iID_Direccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 27/10/2018 01:48:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[iID_Empleado] [int] IDENTITY(130,1) NOT NULL,
	[vNombre_Empleado] [varchar](50) NULL,
	[vApellidoP_Empleado] [varchar](50) NULL,
	[vApellidoM_Empleado] [varchar](50) NULL,
	[vNombre_Completo]  AS (((([vNombre_Empleado]+' ')+[vApellidoP_Empleado])+' ')+[vApellidoM_Empleado]),
	[mSueldo] [money] NULL,
	[iID_Sucursal] [int] NULL,
	[iID_Puesto] [int] NULL,
	[iID_Horario] [int] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[iID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 27/10/2018 01:48:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evento](
	[iID_Evento] [int] IDENTITY(330,1) NOT NULL,
	[dFecha_Evento] [date] NULL,
	[nvDescripcion_Evento] [nvarchar](500) NULL,
	[iID_Empleado] [int] NULL,
 CONSTRAINT [PK_Evento] PRIMARY KEY CLUSTERED 
(
	[iID_Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Forma_Pago]    Script Date: 27/10/2018 01:48:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forma_Pago](
	[iID_Pago] [int] IDENTITY(90,1) NOT NULL,
	[vForma_Pago] [varchar](30) NULL,
 CONSTRAINT [PK__Forma_Pa__AA786E723A6FBD01] PRIMARY KEY CLUSTERED 
(
	[iID_Pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Formato]    Script Date: 27/10/2018 01:48:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formato](
	[iID_Formato] [int] IDENTITY(20,1) NOT NULL,
	[vFormato] [varchar](15) NULL,
 CONSTRAINT [PK__Formato__0627A68BACA91430] PRIMARY KEY CLUSTERED 
(
	[iID_Formato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 27/10/2018 01:48:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[iID_Genero] [int] IDENTITY(40,1) NOT NULL,
	[vGenero] [varchar](20) NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[iID_Genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horario1]    Script Date: 27/10/2018 01:48:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario1](
	[iID_Horario] [int] IDENTITY(260,1) NOT NULL,
	[Horario] [varchar](100) NULL,
 CONSTRAINT [PK_Horario1] PRIMARY KEY CLUSTERED 
(
	[iID_Horario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 27/10/2018 01:48:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[iID_Idioma] [int] IDENTITY(60,1) NOT NULL,
	[vIdioma] [varchar](20) NULL,
 CONSTRAINT [PK__Idioma__8DCCC1912116D418] PRIMARY KEY CLUSTERED 
(
	[iID_Idioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 27/10/2018 01:48:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[iID_Inventario] [int] IDENTITY(220,1) NOT NULL,
	[iID_Sucursal] [int] NULL,
	[iID_Pelicula] [int] NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[iID_Inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pelicula]    Script Date: 27/10/2018 01:48:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelicula](
	[iID_Pelicula] [int] IDENTITY(80,1) NOT NULL,
	[vNombre_Peli] [varchar](30) NULL,
	[iAño_Estreno] [int] NULL,
	[mPrecio] [money] NULL,
	[fPuntuaje] [float] NULL,
	[vDuración] [varchar](20) NULL,
	[tDescripción] [text] NULL,
	[iImagen] [image] NULL,
	[tCantidad] [tinyint] NULL,
	[iID_Genero] [int] NULL,
	[iID_Actor] [int] NULL,
	[iID_Formato] [int] NULL,
	[iID_Clasificacion] [int] NULL,
	[iID_Calidad] [int] NULL,
	[iID_Idioma] [int] NULL,
	[iID_Resolucion] [int] NULL,
 CONSTRAINT [PK__Pelicula__E8D46E8E38C72DBD] PRIMARY KEY CLUSTERED 
(
	[iID_Pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 27/10/2018 01:48:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puesto](
	[iID_Puesto] [int] IDENTITY(50,1) NOT NULL,
	[Nombre_Puesto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Puesto] PRIMARY KEY CLUSTERED 
(
	[iID_Puesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resolucion]    Script Date: 27/10/2018 01:48:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resolucion](
	[iID_Resolucion] [int] IDENTITY(50,1) NOT NULL,
	[vResolucion] [varchar](20) NULL,
 CONSTRAINT [PK__Resoluci__030E58E1418FD617] PRIMARY KEY CLUSTERED 
(
	[iID_Resolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 27/10/2018 01:48:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[iID_Sucursal] [int] IDENTITY(120,1) NOT NULL,
	[vSucursal] [varchar](30) NULL,
	[vDireccion] [varchar](40) NULL,
 CONSTRAINT [PK__Sucursal__FE07BD43FDF7BDAD] PRIMARY KEY CLUSTERED 
(
	[iID_Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo]    Script Date: 27/10/2018 01:48:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo](
	[iID_Tipo] [int] IDENTITY(170,1) NOT NULL,
	[vTipo] [varchar](30) NULL,
 CONSTRAINT [PK__Tipo__812EF381D3B45716] PRIMARY KEY CLUSTERED 
(
	[iID_Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 27/10/2018 01:48:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[iID_Usuario] [int] IDENTITY(290,1) NOT NULL,
	[vUsuario] [varchar](50) NOT NULL,
	[vContraseña] [varchar](50) NOT NULL,
	[iID_Empleado] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[iID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alquiler]  WITH CHECK ADD  CONSTRAINT [FK_Alquiler_Cliente] FOREIGN KEY([iID_Cliente])
REFERENCES [dbo].[Cliente] ([iID_Cliente])
GO
ALTER TABLE [dbo].[Alquiler] CHECK CONSTRAINT [FK_Alquiler_Cliente]
GO
ALTER TABLE [dbo].[Alquiler]  WITH CHECK ADD  CONSTRAINT [FK_Alquiler_Empleado] FOREIGN KEY([iID_Empleado])
REFERENCES [dbo].[Empleado] ([iID_Empleado])
GO
ALTER TABLE [dbo].[Alquiler] CHECK CONSTRAINT [FK_Alquiler_Empleado]
GO
ALTER TABLE [dbo].[Alquiler_Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Alquiler_Detalle_Alquiler] FOREIGN KEY([iID_Alquiler])
REFERENCES [dbo].[Alquiler] ([iID_Alquier])
GO
ALTER TABLE [dbo].[Alquiler_Detalle] CHECK CONSTRAINT [FK_Alquiler_Detalle_Alquiler]
GO
ALTER TABLE [dbo].[Alquiler_Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Alquiler_Detalle_Pelicula] FOREIGN KEY([iID_Pelicula])
REFERENCES [dbo].[Pelicula] ([iID_Pelicula])
GO
ALTER TABLE [dbo].[Alquiler_Detalle] CHECK CONSTRAINT [FK_Alquiler_Detalle_Pelicula]
GO
ALTER TABLE [dbo].[Alquiler_Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Alquiler_Detalle_Sucursal] FOREIGN KEY([iID_Sucursal])
REFERENCES [dbo].[Sucursal] ([iID_Sucursal])
GO
ALTER TABLE [dbo].[Alquiler_Detalle] CHECK CONSTRAINT [FK_Alquiler_Detalle_Sucursal]
GO
ALTER TABLE [dbo].[Casting]  WITH CHECK ADD  CONSTRAINT [FK_Casting_Actor] FOREIGN KEY([iID_Actor])
REFERENCES [dbo].[Actor] ([iID_Actor])
GO
ALTER TABLE [dbo].[Casting] CHECK CONSTRAINT [FK_Casting_Actor]
GO
ALTER TABLE [dbo].[Casting]  WITH CHECK ADD  CONSTRAINT [FK_Casting_Pelicula] FOREIGN KEY([iID_Pelicula])
REFERENCES [dbo].[Pelicula] ([iID_Pelicula])
GO
ALTER TABLE [dbo].[Casting] CHECK CONSTRAINT [FK_Casting_Pelicula]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Domicilio] FOREIGN KEY([iID_Domicilio])
REFERENCES [dbo].[Domicilio] ([iID_Direccion])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Domicilio]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Forma_Pago] FOREIGN KEY([iID_Pago])
REFERENCES [dbo].[Forma_Pago] ([iID_Pago])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Forma_Pago]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Tipo] FOREIGN KEY([iID_Tipo])
REFERENCES [dbo].[Tipo] ([iID_Tipo])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Tipo]
GO
ALTER TABLE [dbo].[Devolucion]  WITH CHECK ADD  CONSTRAINT [FK_Devolucion_Alquiler] FOREIGN KEY([iID_Alquiler])
REFERENCES [dbo].[Alquiler] ([iID_Alquier])
GO
ALTER TABLE [dbo].[Devolucion] CHECK CONSTRAINT [FK_Devolucion_Alquiler]
GO
ALTER TABLE [dbo].[Devolucion]  WITH CHECK ADD  CONSTRAINT [FK_Devolucion_Cliente] FOREIGN KEY([iID_Cliente])
REFERENCES [dbo].[Cliente] ([iID_Cliente])
GO
ALTER TABLE [dbo].[Devolucion] CHECK CONSTRAINT [FK_Devolucion_Cliente]
GO
ALTER TABLE [dbo].[Devolucion]  WITH CHECK ADD  CONSTRAINT [FK_Devolucion_Empleado] FOREIGN KEY([iID_Empleado])
REFERENCES [dbo].[Empleado] ([iID_Empleado])
GO
ALTER TABLE [dbo].[Devolucion] CHECK CONSTRAINT [FK_Devolucion_Empleado]
GO
ALTER TABLE [dbo].[Devolucion]  WITH CHECK ADD  CONSTRAINT [FK_Devolucion_Pelicula] FOREIGN KEY([iID_Pelicula])
REFERENCES [dbo].[Pelicula] ([iID_Pelicula])
GO
ALTER TABLE [dbo].[Devolucion] CHECK CONSTRAINT [FK_Devolucion_Pelicula]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Horario1] FOREIGN KEY([iID_Horario])
REFERENCES [dbo].[Horario1] ([iID_Horario])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Horario1]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Puesto] FOREIGN KEY([iID_Puesto])
REFERENCES [dbo].[Puesto] ([iID_Puesto])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Puesto]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Sucursal] FOREIGN KEY([iID_Sucursal])
REFERENCES [dbo].[Sucursal] ([iID_Sucursal])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Sucursal]
GO
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Empleado] FOREIGN KEY([iID_Empleado])
REFERENCES [dbo].[Empleado] ([iID_Empleado])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Empleado]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Pelicula] FOREIGN KEY([iID_Pelicula])
REFERENCES [dbo].[Pelicula] ([iID_Pelicula])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Pelicula]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Sucursal] FOREIGN KEY([iID_Sucursal])
REFERENCES [dbo].[Sucursal] ([iID_Sucursal])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Sucursal]
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Actor1] FOREIGN KEY([iID_Actor])
REFERENCES [dbo].[Actor] ([iID_Actor])
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [FK_Pelicula_Actor1]
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Calidad1] FOREIGN KEY([iID_Calidad])
REFERENCES [dbo].[Calidad] ([iID_Calidad])
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [FK_Pelicula_Calidad1]
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Clasificacion1] FOREIGN KEY([iID_Clasificacion])
REFERENCES [dbo].[Clasificacion] ([iID_Clasificacion])
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [FK_Pelicula_Clasificacion1]
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Formato1] FOREIGN KEY([iID_Formato])
REFERENCES [dbo].[Formato] ([iID_Formato])
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [FK_Pelicula_Formato1]
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Genero] FOREIGN KEY([iID_Genero])
REFERENCES [dbo].[Genero] ([iID_Genero])
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [FK_Pelicula_Genero]
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Idioma1] FOREIGN KEY([iID_Idioma])
REFERENCES [dbo].[Idioma] ([iID_Idioma])
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [FK_Pelicula_Idioma1]
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Resolucion1] FOREIGN KEY([iID_Resolucion])
REFERENCES [dbo].[Resolucion] ([iID_Resolucion])
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [FK_Pelicula_Resolucion1]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empleado] FOREIGN KEY([iID_Empleado])
REFERENCES [dbo].[Empleado] ([iID_Empleado])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Empleado]
GO
ALTER TABLE [dbo].[Forma_Pago]  WITH CHECK ADD  CONSTRAINT [CK__Forma_Pag__vForm__6EF57B66] CHECK  (([vForma_Pago]='Efectivo' OR [vForma_Pago]='Tarjeta de credito' OR [vForma_Pago]='Vales'))
GO
ALTER TABLE [dbo].[Forma_Pago] CHECK CONSTRAINT [CK__Forma_Pag__vForm__6EF57B66]
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [CK__Pelicula__iAño_E__4E88ABD4] CHECK  (([iAño_Estreno]>=(1990)))
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [CK__Pelicula__iAño_E__4E88ABD4]
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [CK__Pelicula__mPreci__4F7CD00D] CHECK  (([mPrecio]>(30.00)))
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [CK__Pelicula__mPreci__4F7CD00D]
GO
