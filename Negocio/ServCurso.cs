using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using Datos;
using System.Data;

namespace Negocio
{
    public class ServCurso
    {
        CursoDatos elCurso = new CursoDatos();


        public object muestraCursos(int idlogueado)
        {
            var cursos = elCurso.listarCursos(idlogueado);
            return cursos;
        }
        //public void AltaCurso(string nombre, int estado, DateTime fini, DateTime ffin, int id_p)
        //{
        //    elCurso.CrearNuevoCurso(nombre, estado, fini, ffin, id_p);
        //}

        public void AltaCurso(string nombre, int estado, DateTime fini, DateTime ffin, int id_p, string mails)
        {
            throw new NotImplementedException();
        }

        public void AltaCurso(string nombre, int estado, DateTime fini, int id_p, string mails)
        {
            throw new NotImplementedException();
        }

        //public void actualizarDatosCursos(int id_p, string Curso_Nombre, string Examen_Nombre, string Fecha_Examen, string Rindieron)
        //{
        //    int totalRind = Convert.ToInt32(Rindieron);
        //    elCurso.modificarCurso(id_p, Curso_Nombre, Examen_Nombre, Fecha_Examen, totalRind);
        //}

        //public void eliminarCurso(int id_p)
        //{
        //    elCurso.bajaCurso(id_p);
        //}
    }
}
