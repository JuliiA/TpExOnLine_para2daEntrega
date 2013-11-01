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


        public void altaExamen(string nombre, string descripcion, int duracion, DateTime tiempotope, DateTime horatope, int idcurso)
        {
            //DateTime Fecha = Convert.ToDateTime(tiempotope.Date);
            //DateTime Hora = Convert.ToDateTime(horatope.TimeOfDay);

            //concatenar los valores fecha y hora:
            DateTime fechahora = Convert.ToDateTime(tiempotope.Date + "" + horatope.TimeOfDay);

            // ExamenEntidad miExamen = new ExamenEntidad();
            // miExamen.nombrexamen = Nombre;
            // miExamen.descripcion = Descripcion;
            // miExamen.duracion = Duracion;

            //miExamen.porcentajeAprobacion = porcentaje;  
            // miExamen.idcurso = idcurso;


            EXAMEN exa = new EXAMEN();
            exa.Nombre = nombre;
            exa.Descripcion = descripcion;
            exa.Duracion = duracion;
            exa.FecHora = tiempotope; //concatenado
            exa.CursoId = idcurso;


            ctx.Examenes.AddObject(exa);
            ctx.SaveChanges();

        }
    }
}
