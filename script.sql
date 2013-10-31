USE [ExamenOnLine]
GO
/****** Object:  Table [dbo].[ALUMNO]    Script Date: 10/31/2013 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ALUMNO](
	[IdAlumno] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [bigint] NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Mail] [varchar](max) NULL,
	[Contrasenia] [varchar](50) NULL,
 CONSTRAINT [PK_ALUMNO] PRIMARY KEY CLUSTERED 
(
	[IdAlumno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROFESOR]    Script Date: 10/31/2013 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROFESOR](
	[IdProfesor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Mail] [varchar](max) NULL,
	[Contrasenia] [varchar](50) NULL,
	[EsUsuario] [int] NULL,
 CONSTRAINT [PK_PROFESOR] PRIMARY KEY CLUSTERED 
(
	[IdProfesor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PROFESOR', @level2type=N'COLUMN',@level2name=N'EsUsuario'
GO
/****** Object:  Table [dbo].[CURSO]    Script Date: 10/31/2013 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CURSO](
	[IdCurso] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NULL,
	[Estado] [int] NULL,
	[FecIni] [datetime] NULL,
	[FecFin] [datetime] NULL,
	[ProfId] [int] NULL,
 CONSTRAINT [PK_CURSO] PRIMARY KEY CLUSTERED 
(
	[IdCurso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EXAMEN]    Script Date: 10/31/2013 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EXAMEN](
	[IdExamen] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](max) NULL,
	[Duracion] [int] NULL,
	[FecHora] [datetime] NULL,
	[CursoId] [int] NULL,
 CONSTRAINT [PK_EXAMEN] PRIMARY KEY CLUSTERED 
(
	[IdExamen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Curso_Alumno]    Script Date: 10/31/2013 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso_Alumno](
	[idTab] [int] IDENTITY(1,1) NOT NULL,
	[IDCURSO] [int] NOT NULL,
	[IDALUMNO] [int] NOT NULL,
 CONSTRAINT [PK_Curso_Alumno] PRIMARY KEY CLUSTERED 
(
	[idTab] ASC,
	[IDCURSO] ASC,
	[IDALUMNO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PREGUNTA]    Script Date: 10/31/2013 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PREGUNTA](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[ExamenId] [int] NOT NULL,
 CONSTRAINT [PK_PREGUNTA] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[listarExamenesProfesor]    Script Date: 10/31/2013 17:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[listarExamenesProfesor]
@Id_Profesor INT
as
select cu.Nombre AS CURSOS,ex.Nombre AS EXAMEN,ex.FecHora AS FECHA_Y_HORA--faltan los calculos para tabla Alumno 
from PROFESOR pr join CURSO cu on pr.IdProfesor = cu.ProfId inner join EXAMEN ex on cu.IdCurso=ex.CursoId 
where cu.IdCurso=@Id_Profesor
GO
/****** Object:  Table [dbo].[RESULTADO]    Script Date: 10/31/2013 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RESULTADO](
	[IdResultado] [int] IDENTITY(1,1) NOT NULL,
	[FecHora] [datetime] NULL,
	[FecIni] [datetime] NULL,
	[Demora] [time](7) NULL,
	[Porcentaje] [int] NULL,
	[Nota] [varchar](50) NULL,
	[AlumnoId] [int] NOT NULL,
	[ExamenId] [int] NOT NULL,
 CONSTRAINT [PK_RESULTADO] PRIMARY KEY CLUSTERED 
(
	[IdResultado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_traer_examenes]    Script Date: 10/31/2013 17:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_traer_examenes]
@id_Alumno INT
AS
	select c.Nombre as CURSO,ex.Nombre as Examen,ex.FecHora as Fecha_Tope
	from CURSO c join EXAMEN ex on c.IdCurso=ex.CursoId join RESULTADO r on ex.IdExamen = r.ExamenId
	where r.AlumnoId = 1 AND r.IdResultado <> null
GO
/****** Object:  Table [dbo].[RESPUESTA]    Script Date: 10/31/2013 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RESPUESTA](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[EsValida] [int] NULL,
	[PreguntaId] [int] NOT NULL,
 CONSTRAINT [PK_RESPUESTA] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_CURSO_PROFESOR]    Script Date: 10/31/2013 17:06:42 ******/
ALTER TABLE [dbo].[CURSO]  WITH CHECK ADD  CONSTRAINT [FK_CURSO_PROFESOR] FOREIGN KEY([ProfId])
REFERENCES [dbo].[PROFESOR] ([IdProfesor])
GO
ALTER TABLE [dbo].[CURSO] CHECK CONSTRAINT [FK_CURSO_PROFESOR]
GO
/****** Object:  ForeignKey [FK_Curso_Alumno_ALUMNO]    Script Date: 10/31/2013 17:06:42 ******/
ALTER TABLE [dbo].[Curso_Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Curso_Alumno_ALUMNO] FOREIGN KEY([IDALUMNO])
REFERENCES [dbo].[ALUMNO] ([IdAlumno])
GO
ALTER TABLE [dbo].[Curso_Alumno] CHECK CONSTRAINT [FK_Curso_Alumno_ALUMNO]
GO
/****** Object:  ForeignKey [FK_Curso_Alumno_CURSO]    Script Date: 10/31/2013 17:06:42 ******/
ALTER TABLE [dbo].[Curso_Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Curso_Alumno_CURSO] FOREIGN KEY([IDCURSO])
REFERENCES [dbo].[CURSO] ([IdCurso])
GO
ALTER TABLE [dbo].[Curso_Alumno] CHECK CONSTRAINT [FK_Curso_Alumno_CURSO]
GO
/****** Object:  ForeignKey [FK_EXAMEN_CURSO]    Script Date: 10/31/2013 17:06:42 ******/
ALTER TABLE [dbo].[EXAMEN]  WITH CHECK ADD  CONSTRAINT [FK_EXAMEN_CURSO] FOREIGN KEY([CursoId])
REFERENCES [dbo].[CURSO] ([IdCurso])
GO
ALTER TABLE [dbo].[EXAMEN] CHECK CONSTRAINT [FK_EXAMEN_CURSO]
GO
/****** Object:  ForeignKey [FK_PREGUNTA_EXAMEN]    Script Date: 10/31/2013 17:06:42 ******/
ALTER TABLE [dbo].[PREGUNTA]  WITH CHECK ADD  CONSTRAINT [FK_PREGUNTA_EXAMEN] FOREIGN KEY([ExamenId])
REFERENCES [dbo].[EXAMEN] ([IdExamen])
GO
ALTER TABLE [dbo].[PREGUNTA] CHECK CONSTRAINT [FK_PREGUNTA_EXAMEN]
GO
/****** Object:  ForeignKey [FK_RESPUESTA_PREGUNTA]    Script Date: 10/31/2013 17:06:42 ******/
ALTER TABLE [dbo].[RESPUESTA]  WITH CHECK ADD  CONSTRAINT [FK_RESPUESTA_PREGUNTA] FOREIGN KEY([PreguntaId])
REFERENCES [dbo].[PREGUNTA] ([IdPregunta])
GO
ALTER TABLE [dbo].[RESPUESTA] CHECK CONSTRAINT [FK_RESPUESTA_PREGUNTA]
GO
/****** Object:  ForeignKey [FK_RESULTADO_ALUMNO]    Script Date: 10/31/2013 17:06:42 ******/
ALTER TABLE [dbo].[RESULTADO]  WITH CHECK ADD  CONSTRAINT [FK_RESULTADO_ALUMNO] FOREIGN KEY([AlumnoId])
REFERENCES [dbo].[ALUMNO] ([IdAlumno])
GO
ALTER TABLE [dbo].[RESULTADO] CHECK CONSTRAINT [FK_RESULTADO_ALUMNO]
GO
/****** Object:  ForeignKey [FK_RESULTADO_EXAMEN]    Script Date: 10/31/2013 17:06:42 ******/
ALTER TABLE [dbo].[RESULTADO]  WITH CHECK ADD  CONSTRAINT [FK_RESULTADO_EXAMEN] FOREIGN KEY([ExamenId])
REFERENCES [dbo].[EXAMEN] ([IdExamen])
GO
ALTER TABLE [dbo].[RESULTADO] CHECK CONSTRAINT [FK_RESULTADO_EXAMEN]
GO
