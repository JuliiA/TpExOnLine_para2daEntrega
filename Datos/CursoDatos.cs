using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class CursoDatos
    {
        ExOnLineEntities ctxto = new ExOnLineEntities();
        public object listarCursos(int idlogueado)
        {
            //int cantA = (from r in ctxto.Resultados
            //             join e in ctxto.Examenes on r.ExamenId equals e.IdExamen
            //             join c in ctxto.Cursos on e.CursoId equals c.IdCurso
            //              where c.IdCurso == idCurso
            //              select r.ExamenId).Count();

            var curso = (from p in ctxto.Profesores
                         join c in ctxto.Cursos on p.IdProfesor equals c.ProfId
                         where p.IdProfesor == idlogueado
                         select c).ToList();
            return curso;
        }

        public void CrearNuevoCurso(string nombre, int estado, DateTime fini, DateTime ffin, int id_p)
        {
            CURSO miCurso = new CURSO();
            miCurso.Nombre = nombre;
            miCurso.Estado = estado;
            miCurso.FecIni = fini;
            miCurso.FecFin = ffin;
            miCurso.IdCurso = id_p;
            ctxto.Cursos.AddObject(miCurso);
            ctxto.SaveChanges();

        }

        //public void modificarCurso(int id_p, string Curso_Nombre, string Examen_Nombre, string Fecha_Examen, int totalRind)
        //{
        //    CURSO miCurso= (from c in ctxto.Cursos
        //                    where c.ProfId == id_p
        //}

        //public void bajaCurso(int id_p)
        //{
        //    throw new NotImplementedException();
        //}
    }  
}
