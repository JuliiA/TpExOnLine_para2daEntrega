using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.Data;
using System.Data.Objects;

namespace Datos
{
    public class ProfesorDatos
    {
        ExOnLineEntities ctx = new ExOnLineEntities();

        public bool ComprobarUsuario(string usuario, string pass)
        {
            bool esUsuario;
            var prof = (from p in ctx.Profesores
                        where p.Mail == usuario && p.Contrasenia == pass
                        select p).FirstOrDefault();
            if (prof != null)
            {
                esUsuario = true;
            }
            else
            {
                esUsuario = false;
            }
            return esUsuario;
        }

        public int BuscarId(string mailUsuario)
        {
            int RetornaId;
            var usID = (from u in ctx.Profesores
                        where u.Mail == mailUsuario
                        select u.IdProfesor).FirstOrDefault();
            RetornaId = usID;
            return RetornaId;
        }

        public string BuscarNombre(string mailUsuario)
        {
            string RetornaCadena;
            var name = (from n in ctx.Profesores
                        where n.Mail == mailUsuario
                        select n.Nombre).First();
            RetornaCadena = name;
            return RetornaCadena;
        }

        public object ListarLosExamenes(int id_p)
        {
            ObjectParameter _idProf = new ObjectParameter("Id_Profesor", typeof(String));
            var resulta = ctx.listarExamenesProfesor(id_p);
            return resulta;
        }

        public object ListarLosCursosEnCombo(int id_p)
        {
            var retornaCursos = (from c in ctx.Cursos
                                 where c.ProfId == id_p && c.Estado == 1
                                 select c).ToList();
            return retornaCursos;
        }

        public bool tieneCursos(int id_p)
        {
            CURSO unCurso = ctx.Cursos.Where(c => c.ProfId == id_p).FirstOrDefault();
            //LA ASIGNACION DE ALGUN ALUMNO A UN CURSO COMO LA CONSULTO??
            if (unCurso == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public void altaExamen(string nombre, string descripcion, int duracion, DateTime tiempotope, DateTime horatope, int idcurso)
        {
            //concatenar los valores fecha y hora:
            DateTime fechahora = Convert.ToDateTime(tiempotope.Date + horatope.TimeOfDay);

            EXAMEN exa = new EXAMEN();
            exa.Nombre = nombre;
            exa.Descripcion = descripcion;
            exa.Duracion = duracion;
            exa.FecHora = fechahora; //concatenado
            exa.CursoId = idcurso;

            ctx.Examenes.AddObject(exa);
            ctx.SaveChanges();
        }

        public void agregarPorcentaje(int porcentaje)
        {
            int ultimo = consultarUltimoExamen();
            TabPorcentaje tab = new TabPorcentaje();
            tab.ExamenId = ultimo;
            tab.PorcentajeAprobacion = porcentaje;
            ctx.Porcentaje.AddObject(tab);
            ctx.SaveChanges();
        }

        public int consultarUltimoExamen()
        {
            int ultimo = (from e in ctx.Examenes
                          orderby e.IdExamen descending
                          select e.IdExamen).FirstOrDefault();
            return ultimo;
        }

        public string buscarExamen(int id_c)
        {
            EXAMEN miExamen = ctx.Examenes.Where(e => e.IdExamen == id_c).FirstOrDefault();
            //var miExamen = (from e in ctx.Examenes
            //                where e.IdExamen == id_c
            //                select e.Nombre).FirstOrDefault();
            return miExamen.Nombre;
        }

        public bool examenYaFueResuelto(int id_e)
        {
            RESULTADO res_EnExamen = ctx.Resultados.Where(re => re.ExamenId == id_e).FirstOrDefault();
            if (res_EnExamen == null)
                return false;
            else
                return true;
        }

        public void darBajaExamen(int id_e)
        {
            var _borrar = (from e in ctx.Examenes
                           where e.IdExamen == id_e
                           select e).FirstOrDefault();

            ctx.Examenes.DeleteObject(_borrar);
            ctx.SaveChanges();
        }
    }
}
