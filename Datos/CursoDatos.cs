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
            var curso = (from p in ctxto.Profesores
                         join c in ctxto.Cursos on p.IdProfesor equals c.ProfId
                         where p.IdProfesor == idlogueado
                         select c).ToList();
            return curso;
        }

        //public void modificarCurso(int id_p, string Curso_Nombre, string Examen_Nombre, string Fecha_Examen, int totalRind)
        //{
        //    CURSO miCurso= (from c in ctxto.Cursos
        //                    where c.ProfId == id_p
        //}

        public string buscarNombreCurso(int id_c)
        {
            CURSO miCurso = ctxto.Cursos.Where(c => c.IdCurso == id_c).First();
            return miCurso.Nombre;
        }

        public void darBajaAlCurso(int id_p)
        {
            string borrar = buscarNombreCurso(id_p);
            var _baja = (from b in ctxto.Cursos
                         where b.Nombre.StartsWith(borrar)
                         select b).Single();
            ctxto.DeleteObject(_baja);
            ctxto.SaveChanges();
        }

        public bool tieneAsignaciones(int id_c)
        {
            EXAMEN ex_encurso = ctxto.Examenes.Where(ex => ex.CursoId == id_c).FirstOrDefault();
            //LA ASIGNACION DE ALGUN ALUMNO A UN CURSO COMO LA CONSULTO??
            if (ex_encurso == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public bool obtenerEstadoCurso(int id_c)
        {
            bool activo;
            var estado = (from es in ctxto.Cursos
                          where es.IdCurso == id_c
                          select es.Estado).First();
            if (estado == 1)
            {
                activo = true;
            }
            else
            {
                activo = false;
            }
            return activo;
        }

        public void CrearNuevoCurso(string nombre, int estado, DateTime fini, DateTime ffin, int id_p)
        {
            
            CURSO miCurso = new CURSO();
            miCurso.Nombre = nombre;
            miCurso.Estado = estado;
            miCurso.FecIni = fini;
            miCurso.FecFin = ffin;
            miCurso.ProfId = id_p;
            ctxto.Cursos.AddObject(miCurso);
            ctxto.SaveChanges();
        }
        public void buscarMailsNoRegistrados(List<string> mails)
        {
            List<string> resulta = new List<string>();

            //traigo todos los mails de la base de datos
            var consulta = (from c in ctxto.Alumnos
                            select c.Mail).ToList();
            //comparo componentes de cada lista
            IEnumerable<string> Diferencias = mails.Except(consulta);
            //guardo en nueva lista los componentes que no son iguales
            foreach (string f in Diferencias)
            {
                resulta.Add(f);
            }
            //valor de retorno->Lista de componentes diferentes a los traidos de la base
            crearNuevoAlumnosDesdeMail(resulta);
        }
        private void crearNuevoAlumnosDesdeMail(List<string> resulta)
        {
            int cantidad = resulta.Count();
            var id_c = (from ul in ctxto.Cursos
                        orderby ul.IdCurso descending
                        select ul).FirstOrDefault();
            
            for (int i = 0; i < cantidad; i++)
            {
                string nuevoMail = resulta[i];

                ALUMNO neoAl = new ALUMNO();
                neoAl.Mail = nuevoMail;
                neoAl.Contrasenia = nuevoMail;
                
                ctxto.Alumnos.AddObject(neoAl);
                ctxto.SaveChanges();
                incluirCamposEnBD(id_c);
            }
        }

        private void incluirCamposEnBD(object id_c)
        {
            var ultimoAl = (from ul in ctxto.Alumnos
                            where ul.IdAlumno !=null
                            select ul.IdAlumno).LastOrDefault();
            Curso_Alumno ins = new Curso_Alumno();
            ins.IDCURSO = id_c;
            ins.IDALUMNO = ultimoAl;
            ctxto.CursosAl.AddObject(ins);
            ctxto.SaveChanges();
        }
    }
}
