USE [ExamenOnLine]
GO
/****** Object:  Table [dbo].[ALUMNO]    Script Date: 11/13/2013 17:13:14 ******/
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
/****** Object:  Table [dbo].[PROFESOR]    Script Date: 11/13/2013 17:13:14 ******/
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
/****** Object:  Table [dbo].[CURSO]    Script Date: 11/13/2013 17:13:14 ******/
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
/****** Object:  Table [dbo].[EXAMEN]    Script Date: 11/13/2013 17:13:14 ******/
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
/****** Object:  Table [dbo].[Curso_Alumno]    Script Date: 11/13/2013 17:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso_Alumno](
	[idTab] [int] IDENTITY(1,1) NOT NULL,
	[IDCURSO] [int] NOT NULL,
	[IDALUMNO] [int] NOT NULL,
 CONSTRAINT [PK_Curso_Alumno_1] PRIMARY KEY CLUSTERED 
(
	[idTab] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PREGUNTA]    Script Date: 11/13/2013 17:13:14 ******/
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
/****** Object:  Table [dbo].[RESULTADO]    Script Date: 11/13/2013 17:13:14 ******/
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
/****** Object:  Table [dbo].[TabPorcentaje]    Script Date: 11/13/2013 17:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TabPorcentaje](
	[idTabla] [int] IDENTITY(1,1) NOT NULL,
	[PorcentajeAprobacion] [int] NULL,
	[ExamenId] [int] NULL,
 CONSTRAINT [PK_TabPorcentaje] PRIMARY KEY CLUSTERED 
(
	[idTabla] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_traer_examenes]    Script Date: 11/13/2013 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_traer_examenes]
@id_Alumno INT
AS
	select e.IdExamen,e.Nombre as EXAMEN,c.Nombre AS CURSO,e.FecHora as FECHA_HORA,RESULTADO= case 
			when r.Nota >= 7 then 1	--aprobado
			when r.Nota < 7 then 2	--desaprobado
			--else 3					--Realizar Examen
			--end,	ESTADO= case
				when DATEDIFF(DAY,getdate(),e.FecHora)>=0 then 3	--RealizarExamen
				else 4												--vencido
			end
	from CURSO c inner join Curso_Alumno ca on c.IdCurso=ca.IDCURSO 
	inner join EXAMEN e on ca.IDCURSO=e.CursoId
	left join RESULTADO r on ca.IDALUMNO = r.AlumnoId and e.IdExamen = r.ExamenId
	where ca.IDALUMNO = @id_Alumno
GO
/****** Object:  Table [dbo].[RESPUESTA]    Script Date: 11/13/2013 17:13:14 ******/
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
/****** Object:  StoredProcedure [dbo].[listarExamenesProfesor]    Script Date: 11/13/2013 17:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[listarExamenesProfesor]
@Id_Profesor INT
as

select distinct ex.Nombre AS EXAMEN,cu.Nombre AS CURSOS,ex.FecHora AS FECHA_Y_HORA,
(select count(r2.AlumnoId) from RESULTADO r2 left join EXAMEN ex2 on r2.ExamenId=ex2.IdExamen where r2.ExamenId=r.ExamenId)as RINDIERON,
(select count(r2.AlumnoId) from RESULTADO r2 left join EXAMEN ex2 on r2.ExamenId=ex2.IdExamen where r2.Nota >= 7 and r2.ExamenId=r.ExamenId)as APROBARON,
(select count(r2.AlumnoId) from RESULTADO r2 left join EXAMEN ex2 on r2.ExamenId=ex2.IdExamen where r2.Nota < 7 and r2.ExamenId=r.ExamenId) AS REPROBARON,
FALTANTES=(select count(ca.IDALUMNO) FROM Curso_Alumno ca where ca.IDCURSO = cu.IdCurso)-
(select count(r2.AlumnoId) from RESULTADO r2 left join EXAMEN ex2 on r2.ExamenId=ex2.IdExamen where r2.ExamenId=r.ExamenId)
from RESULTADO r right join EXAMEN ex on r.ExamenId=ex.IdExamen 
left join CURSO cu on ex.CursoId = cu.IdCurso 
where cu.ProfId=@Id_Profesor
group by r.Nota,cu.Nombre,ex.Nombre,ex.FecHora,r.ExamenId,cu.IdCurso
GO
/****** Object:  ForeignKey [FK_CURSO_PROFESOR]    Script Date: 11/13/2013 17:13:14 ******/
ALTER TABLE [dbo].[CURSO]  WITH CHECK ADD  CONSTRAINT [FK_CURSO_PROFESOR] FOREIGN KEY([ProfId])
REFERENCES [dbo].[PROFESOR] ([IdProfesor])
GO
ALTER TABLE [dbo].[CURSO] CHECK CONSTRAINT [FK_CURSO_PROFESOR]
GO
/****** Object:  ForeignKey [FK_Curso_Alumno_ALUMNO]    Script Date: 11/13/2013 17:13:14 ******/
ALTER TABLE [dbo].[Curso_Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Curso_Alumno_ALUMNO] FOREIGN KEY([IDALUMNO])
REFERENCES [dbo].[ALUMNO] ([IdAlumno])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Curso_Alumno] CHECK CONSTRAINT [FK_Curso_Alumno_ALUMNO]
GO
/****** Object:  ForeignKey [FK_Curso_Alumno_CURSO]    Script Date: 11/13/2013 17:13:14 ******/
ALTER TABLE [dbo].[Curso_Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Curso_Alumno_CURSO] FOREIGN KEY([IDCURSO])
REFERENCES [dbo].[CURSO] ([IdCurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Curso_Alumno] CHECK CONSTRAINT [FK_Curso_Alumno_CURSO]
GO
/****** Object:  ForeignKey [FK_EXAMEN_CURSO]    Script Date: 11/13/2013 17:13:14 ******/
ALTER TABLE [dbo].[EXAMEN]  WITH CHECK ADD  CONSTRAINT [FK_EXAMEN_CURSO] FOREIGN KEY([CursoId])
REFERENCES [dbo].[CURSO] ([IdCurso])
GO
ALTER TABLE [dbo].[EXAMEN] CHECK CONSTRAINT [FK_EXAMEN_CURSO]
GO
/****** Object:  ForeignKey [FK_PREGUNTA_EXAMEN]    Script Date: 11/13/2013 17:13:14 ******/
ALTER TABLE [dbo].[PREGUNTA]  WITH CHECK ADD  CONSTRAINT [FK_PREGUNTA_EXAMEN] FOREIGN KEY([ExamenId])
REFERENCES [dbo].[EXAMEN] ([IdExamen])
GO
ALTER TABLE [dbo].[PREGUNTA] CHECK CONSTRAINT [FK_PREGUNTA_EXAMEN]
GO
/****** Object:  ForeignKey [FK_RESPUESTA_PREGUNTA]    Script Date: 11/13/2013 17:13:14 ******/
ALTER TABLE [dbo].[RESPUESTA]  WITH CHECK ADD  CONSTRAINT [FK_RESPUESTA_PREGUNTA] FOREIGN KEY([PreguntaId])
REFERENCES [dbo].[PREGUNTA] ([IdPregunta])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RESPUESTA] CHECK CONSTRAINT [FK_RESPUESTA_PREGUNTA]
GO
/****** Object:  ForeignKey [FK_RESULTADO_ALUMNO]    Script Date: 11/13/2013 17:13:14 ******/
ALTER TABLE [dbo].[RESULTADO]  WITH CHECK ADD  CONSTRAINT [FK_RESULTADO_ALUMNO] FOREIGN KEY([AlumnoId])
REFERENCES [dbo].[ALUMNO] ([IdAlumno])
GO
ALTER TABLE [dbo].[RESULTADO] CHECK CONSTRAINT [FK_RESULTADO_ALUMNO]
GO
/****** Object:  ForeignKey [FK_RESULTADO_EXAMEN]    Script Date: 11/13/2013 17:13:14 ******/
ALTER TABLE [dbo].[RESULTADO]  WITH CHECK ADD  CONSTRAINT [FK_RESULTADO_EXAMEN] FOREIGN KEY([ExamenId])
REFERENCES [dbo].[EXAMEN] ([IdExamen])
GO
ALTER TABLE [dbo].[RESULTADO] CHECK CONSTRAINT [FK_RESULTADO_EXAMEN]
GO
/****** Object:  ForeignKey [FK_TabPorcentaje_EXAMEN]    Script Date: 11/13/2013 17:13:14 ******/
ALTER TABLE [dbo].[TabPorcentaje]  WITH CHECK ADD  CONSTRAINT [FK_TabPorcentaje_EXAMEN] FOREIGN KEY([ExamenId])
REFERENCES [dbo].[EXAMEN] ([IdExamen])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TabPorcentaje] CHECK CONSTRAINT [FK_TabPorcentaje_EXAMEN]
GO
