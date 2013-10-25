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
        public int BuscarId(string passUsuario)
        {
            int RetornaId;
            var usID = (from u in ctx.Profesores
                        where u.Contrasenia == passUsuario
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
            var resulta = ctx.ListarExamenes(id_p);
            return resulta;
        }

        public object ListarLosCursosEnCombo(int id_p)
        {
            var retornaCursos = (from c in ctx.Cursos
                                 where c.ProfId == id_p && c.Estado ==1
                                 select c).ToList();
            return retornaCursos;
        }


        public void altaExamen(string Nombre, string Descripcion, int Duracion, DateTime tiempotope,DateTime horatope, int porcentaje, int idcurso)
        {
            DateTime Fecha = Convert.ToDateTime(tiempotope.Day);
            DateTime Hora = Convert.ToDateTime(horatope.Minute);

            //concatenar los valores fecha y hora

            ExamenEntidad miExamen = new ExamenEntidad();
            miExamen.nombrexamen = Nombre;
            miExamen.descripcion = Descripcion;
            miExamen.duracion = Duracion;
            
            miExamen.porcentajeAprobacion = porcentaje;
            miExamen.idcurso = idcurso;

            EXAMEN exa = new EXAMEN();
            exa.Nombre = Nombre;
            exa.Descripcion = Descripcion;
            exa.Duracion = Duracion;
            exa.FecHora = tiempotope;
            exa.CursoId = idcurso;

            ctx.Examenes.AddObject(exa);
            ctx.SaveChanges();
        }
    }
}
