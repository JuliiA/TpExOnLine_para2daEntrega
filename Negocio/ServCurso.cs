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
        AlumnoDatos elAlumno = new AlumnoDatos();

        public object muestraCursos(int idlogueado)
        {
            var cursos = elCurso.listarCursos(idlogueado);
            return cursos;
        }
        //public void AltaCurso(string nombre, int estado, DateTime fini, DateTime ffin, int id_p)
        //{
        //    elCurso.CrearNuevoCurso(nombre, estado, fini, ffin, id_p);
        //}

        public void AltaCurso(string nombre, int estado, DateTime fini, DateTime ffin, int id_p)
        {
            elCurso.CrearNuevoCurso(nombre, estado, fini, ffin, id_p);
        }
        
        public void crearBucle(string[] words, string n)
        {
            int cantidadMails = words.Length;
            //itero por cada mail
            for (int i = 0; i < cantidadMails; i++)
            {
                //obtengo el id del ultimo curso
                int IdCurso = elCurso.obtenerUltimoCurso(n);
                int IdAlumno;
                //busco si no existe
                if (!elAlumno.buscarMailsRegistrados(words[i]))
                {
                    //lo creo si no existe
                    elAlumno.CrearAlumnoDesdeMail(words[i]);
                    //IdAlumno = elAlumno.obtenerIdPorMail(words[i]);
                }
                //else
                //{
                    //busco el ID del Alumno ya existiendo 
                    IdAlumno = elAlumno.obtenerIdPorMail(words[i]);
                //}
                //asocio alumno a curso
                elCurso.asociarCursoConAlumno(IdCurso,IdAlumno);
            }
        }

        public void eliminarCurso(int id_p)
        {
            elCurso.darBajaAlCurso(id_p);
        }

        public string consultarNombre(int id_c)
        {
            return elCurso.buscarNombreCurso(id_c);
        }

        public bool tieneExamenOAlumno(int id_c)
        {
            bool resulta = elCurso.tieneAsignaciones(id_c);
            return resulta;
        }

        public bool consultarEstado(int id_c)
        {
            bool resulta = elCurso.obtenerEstadoCurso(id_c);
            return resulta;
        }

        public DateTime consultarFechaInicio(int id_c)
        {
            throw new NotImplementedException();
        }
    }
}
