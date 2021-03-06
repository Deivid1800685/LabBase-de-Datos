USE [Videos3]
GO
/****** Object:  Table [dbo].[Actor]    Script Date: 22/09/2018 01:40:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actor](
	[iID_Actor] [int] IDENTITY(30,1) NOT NULL,
	[vNombre_Actor] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[iID_Actor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alquiler]    Script Date: 22/09/2018 01:40:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alquiler](
	[iID_Alquiler] [int] IDENTITY(110,1) NOT NULL,
	[dFecha_Alquiler] [datetime] NULL,
	[dFecha_Devolucion] [datetime] NULL,
	[iID_Cliente] [int] NULL,
	[Subtotal] [money] NULL,
	[Cantidad_Pelicula] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iID_Alquiler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alquiler_Pelicula]    Script Date: 22/09/2018 01:40:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alquiler_Pelicula](
	[iID_Alquiler] [int] NULL,
	[iID_Pelicula] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calidad]    Script Date: 22/09/2018 01:40:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calidad](
	[iID_Calidad] [int] IDENTITY(70,1) NOT NULL,
	[vCalidad] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[iID_Calidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casting]    Script Date: 22/09/2018 01:40:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casting](
	[iID_Casting] [int] IDENTITY(180,1) NOT NULL,
	[vNombre_Pelicula] [varchar](30) NULL,
	[vNombre_Actor] [varchar](30) NULL,
	[iID_Pelicula] [int] NULL,
	[iID_Actor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iID_Casting] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clasificacion]    Script Date: 22/09/2018 01:40:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasificacion](
	[iID_Clasificacion] [int] IDENTITY(10,1) NOT NULL,
	[cClasificacion] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[iID_Clasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 22/09/2018 01:40:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[iID_Cliente] [int] IDENTITY(100,1) NOT NULL,
	[vNombre_Cliente] [varchar](50) NULL,
	[vApellidoP_Cliente] [varchar](50) NULL,
	[vApellidoM_Cliente] [varchar](50) NULL,
	[vNombre_Completo]  AS (((([vNombre_Cliente]+' ')+[vApellidoM_Cliente])+' ')+[vApellidoM_Cliente]),
	[dFecha_Nac] [datetime] NULL,
	[vContacto] [varchar](1) NULL,
	[iID_Pago] [int] NULL,
	[iID_Domicilio] [int] NULL,
	[iID_ClienDistinguido] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distinguido]    Script Date: 22/09/2018 01:40:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distinguido](
	[iID_ClienDistinguido] [int] IDENTITY(170,1) NOT NULL,
	[bClien_Distinguido] [bit] NULL,
	[iID_Cliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iID_ClienDistinguido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 22/09/2018 01:40:04 a. m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[iID_Direccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 22/09/2018 01:40:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[iID_Empleado] [int] IDENTITY(130,1) NOT NULL,
	[vNombre_Empleado] [varchar](50) NULL,
	[vApellidoP_Empleado] [varchar](50) NULL,
	[vApellidoM_Empleado] [varchar](50) NULL,
	[vNombre_Completo]  AS (((([vNombre_Empleado]+' ')+[vApellidoM_Empleado])+' ')+[vApellidoM_Empleado]),
	[mSueldo] [money] NULL,
	[iImagen] [image] NULL,
	[iID_Sucursal] [int] NULL,
	[iID_Puesto] [int] NULL,
 CONSTRAINT [PK__Empleado__B2B55FC642F2178A] PRIMARY KEY CLUSTERED 
(
	[iID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Forma_Pago]    Script Date: 22/09/2018 01:40:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forma_Pago](
	[iID_Pago] [int] IDENTITY(90,1) NOT NULL,
	[vForma_Pago] [int] NULL,
 CONSTRAINT [PK__Forma_Pa__AA786E723A6FBD01] PRIMARY KEY CLUSTERED 
(
	[iID_Pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Formato]    Script Date: 22/09/2018 01:40:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formato](
	[iID_Formato] [int] IDENTITY(20,1) NOT NULL,
	[vFormato] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[iID_Formato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 22/09/2018 01:40:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[iID_Genero] [int] IDENTITY(40,1) NOT NULL,
	[vGenero] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[iID_Genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 22/09/2018 01:40:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[iID_Idioma] [int] IDENTITY(60,1) NOT NULL,
	[vIdioma] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[iID_Idioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pelicula]    Script Date: 22/09/2018 01:40:04 a. m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[iID_Pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 22/09/2018 01:40:04 a. m. ******/
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
/****** Object:  Table [dbo].[Resolucion]    Script Date: 22/09/2018 01:40:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resolucion](
	[iID_Resolucion] [int] IDENTITY(50,1) NOT NULL,
	[vResolucion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[iID_Resolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 22/09/2018 01:40:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[iID_Sucursal] [int] IDENTITY(120,1) NOT NULL,
	[vSucursal] [varchar](30) NULL,
	[vDireccion] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[iID_Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 22/09/2018 01:40:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[iID_Ventas] [int] IDENTITY(140,1) NOT NULL,
	[iID_Empleado] [int] NULL,
	[iID_Alquiler] [int] NULL,
	[FechaDeVenta] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[iID_Ventas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alquiler]  WITH CHECK ADD  CONSTRAINT [FK_Alquiler_Cliente] FOREIGN KEY([iID_Cliente])
REFERENCES [dbo].[Cliente] ([iID_Cliente])
GO
ALTER TABLE [dbo].[Alquiler] CHECK CONSTRAINT [FK_Alquiler_Cliente]
GO
ALTER TABLE [dbo].[Alquiler_Pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Alquiler_Pelicula_Alquiler] FOREIGN KEY([iID_Alquiler])
REFERENCES [dbo].[Alquiler] ([iID_Alquiler])
GO
ALTER TABLE [dbo].[Alquiler_Pelicula] CHECK CONSTRAINT [FK_Alquiler_Pelicula_Alquiler]
GO
ALTER TABLE [dbo].[Alquiler_Pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Alquiler_Pelicula_Pelicula1] FOREIGN KEY([iID_Pelicula])
REFERENCES [dbo].[Pelicula] ([iID_Pelicula])
GO
ALTER TABLE [dbo].[Alquiler_Pelicula] CHECK CONSTRAINT [FK_Alquiler_Pelicula_Pelicula1]
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
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Distinguido] FOREIGN KEY([iID_ClienDistinguido])
REFERENCES [dbo].[Distinguido] ([iID_ClienDistinguido])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Distinguido]
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
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Puesto] FOREIGN KEY([iID_Puesto])
REFERENCES [dbo].[Puesto] ([iID_Puesto])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Puesto]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Sucursal1] FOREIGN KEY([iID_Sucursal])
REFERENCES [dbo].[Sucursal] ([iID_Sucursal])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Sucursal1]
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
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Genero1] FOREIGN KEY([iID_Genero])
REFERENCES [dbo].[Genero] ([iID_Genero])
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [FK_Pelicula_Genero1]
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
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Alquiler1] FOREIGN KEY([iID_Alquiler])
REFERENCES [dbo].[Alquiler] ([iID_Alquiler])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Alquiler1]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Empleado] FOREIGN KEY([iID_Empleado])
REFERENCES [dbo].[Empleado] ([iID_Empleado])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Empleado]
GO
ALTER TABLE [dbo].[Forma_Pago]  WITH CHECK ADD  CONSTRAINT [CK__Forma_Pag__vForm__6EF57B66] CHECK  (([vForma_Pago]='Efectivo' OR [vForma_Pago]='Tarjeta de credito'))
GO
ALTER TABLE [dbo].[Forma_Pago] CHECK CONSTRAINT [CK__Forma_Pag__vForm__6EF57B66]
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD CHECK  (([iAño_Estreno]>=(1990)))
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD CHECK  (([mPrecio]>(30.00)))
GO
