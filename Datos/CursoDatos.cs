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
       
        public List<CursoEntidad> listarCursosCantidad(int idlogueado)
        {
            //List<CursoEntidad> concatena;
            var curso = (from c in ctxto.Cursos
                         join c in ctxto.CursosAl on c.IdCurso equals c.IDCURSO
                         into c2
                         from fd in c2.DefaultIfEmpty()
                         where c.ProfId == idlogueado
                         group c by new
                         {
                             idCurso2 = c.IdCurso,
                             Nombre2 = c.Nombre,
                             Activo2 = (int)c.Estado,
                             FecahIni2 = (DateTime)c.FecIni,
                             FechaFin2 = (DateTime)c.FecFin,
                             idProf2 = c.ProfId
                         }
                         //hago la junta de cantidad con la lista obtenida de cursos
                             into agrupa
                             let cantidadAlumnos = agrupa.Count()
                             orderby cantidadAlumnos
                         //agrupo los datos obtenidos en una nueva clase CursoEntidad
                             select new CursoEntidad
                             {
                                 _idcurso = agrupa.Key.idCurso2,
                                 CURSO = agrupa.Key.Nombre2,
                                 estado = (int)agrupa.Key.Activo2,
                                 FECHA_INICIO = (DateTime)agrupa.Key.FecahIni2,
                                 FECHA_FIN = (DateTime)agrupa.Key.FechaFin2,
                                 _profid = (int)agrupa.Key.idProf2,
                                 CANTIDAD_ALUMNOS = cantidadAlumnos
                             }).ToList();
            return curso;
        }
  
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

        public int obtenerUltimoCurso(string c)
        {
            var ultc = (from ul in ctxto.Cursos
                        where ul.Nombre == c
                        select ul.IdCurso).FirstOrDefault();
            return ultc;
        }

        public void asociarCursoConAlumno(int id_c, int idALumnoAux)
        {
            Curso_Alumno cal = new Curso_Alumno();
            cal.IDCURSO = id_c;
            cal.IDALUMNO = idALumnoAux;
            ctxto.CursosAl.AddObject(cal);
            ctxto.SaveChanges();
        }

        private string obtenerTotalAlumnos(int p)
        {
            string total;
            int cantA = (from cl in ctxto.CursosAl
                         where cl.IDCURSO == p
                         select cl.IDALUMNO).Count();

            total = cantA.ToString();
            return total;
         }

        public DateTime obtenerFechaInicial(int id_c)
        {
            DateTime f_curso;
            var fech = (from f in ctxto.Cursos
                        where f.IdCurso == id_c
                        select f.FecIni).FirstOrDefault();
            f_curso = Convert.ToDateTime(fech);
            return f_curso;
        }

        public List<string> obtenerLosMailsCurso(int id_c)
        {
            var mail = (from m in ctxto.CursosAl
                        join pe in ctxto.Alumnos on m.IDALUMNO equals pe.IdAlumno
                        where m.IDCURSO == id_c
                        select pe.Mail).ToList();
            return mail;
        }

        public DateTime obtenerFechafin(int id_c)
        {
            var fecha = (from fin in ctxto.Cursos
                         where fin.IdCurso == id_c
                         select fin.FecFin).FirstOrDefault();
            DateTime fefinal = Convert.ToDateTime(fecha);
            return fefinal;
        }

        public void CargarDatos(int id_c, string p, bool p_2, DateTime dateTime, DateTime dateTime_2)
        {
            CURSO edcur = ctxto.Cursos.Where(s => s.IdCurso == id_c).First();

            edcur.IdCurso = id_c;
            edcur.Nombre = p;
            edcur.Estado = Convert.ToInt32(p_2);
            edcur.FecIni = dateTime;
            edcur.FecFin = dateTime_2;

            ctxto.SaveChanges();
        }
    }
}
