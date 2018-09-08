USE [RentaDeVideos]
GO
/****** Object:  Table [dbo].[Actores]    Script Date: 06/09/2018 11:17:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actores](
	[Id_Actores] [int] IDENTITY(50,1) NOT NULL,
	[Nombre_Actor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Actores] PRIMARY KEY CLUSTERED 
(
	[Id_Actores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alquiler]    Script Date: 06/09/2018 11:17:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alquiler](
	[ID_Alquiler] [int] IDENTITY(50,1) NOT NULL,
	[Fecha_Alquiler] [datetime] NOT NULL,
	[Fecha_Devolucion] [datetime] NULL,
	[ID_Pagos] [int] NOT NULL,
 CONSTRAINT [PK_Alquiler] PRIMARY KEY CLUSTERED 
(
	[ID_Alquiler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 06/09/2018 11:17:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdClientes] [int] IDENTITY(50,1) NOT NULL,
	[clienteNombre] [varchar](50) NOT NULL,
	[clienteApellidos] [varchar](50) NOT NULL,
	[clienteNombreCompleto]  AS (([clienteNombre]+' ')+[clienteApellidos]),
	[empleadoGenero] [nchar](10) NOT NULL,
	[clienteFechadeNacimiento] [date] NOT NULL,
	[clienteVIP] [bit] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdClientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 06/09/2018 11:17:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(50,1) NOT NULL,
	[CURP] [nchar](18) NOT NULL,
	[empleadoNombre] [varchar](50) NOT NULL,
	[empleadoApellidos] [varchar](50) NOT NULL,
	[empleadoNombreCompleto]  AS (([empleadoNombre]+' ')+[empleadoApellidos]),
	[empleadoGenero] [nchar](10) NOT NULL,
	[fechaDeNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Empleado] UNIQUE NONCLUSTERED 
(
	[CURP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pelicula]    Script Date: 06/09/2018 11:17:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelicula](
	[IdPelicula] [int] IDENTITY(50,1) NOT NULL,
	[peliculaNombre] [varchar](50) NOT NULL,
	[peliculaEstreno] [date] NOT NULL,
	[peliculaCosto] [money] NOT NULL,
	[peliculaRating] [float] NOT NULL,
	[peliculaDescripcion] [text] NOT NULL,
	[peliculaImagen] [image] NULL,
	[peliculasDuracion] [time](7) NOT NULL,
 CONSTRAINT [PK_Pelicula] PRIMARY KEY CLUSTERED 
(
	[IdPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pelicula]  WITH CHECK ADD  CONSTRAINT [CK_Pelicula] CHECK  (([peliculaRating]<=(10) AND [peliculaRating]<=(10)))
GO
ALTER TABLE [dbo].[Pelicula] CHECK CONSTRAINT [CK_Pelicula]
GO
