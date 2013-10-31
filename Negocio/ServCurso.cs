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

        public void AltaCurso(string nombre, int estado, DateTime fini, DateTime ffin, int id_p)
        {
            elCurso.CrearNuevoCurso(nombre, estado, fini, ffin, id_p);
        }
        
        public void crearBucle(string[] words, int cantidadMails)
        {
            List<string> mails = new List<string>();
            foreach (string s in words)
            {
                while (cantidadMails > 0)
                {
                    mails.Add(words[cantidadMails - 1]);
                    cantidadMails = cantidadMails - 1;
                }
            }
            elCurso.buscarMailsNoRegistrados(mails);
        }

        public void eliminarCurso(int id_p)
        {
            elCurso.darBajaAlCurso(id_p);
        }

        //public void AltaCurso(string p, int estado, DateTime feini, DateTime fefin, int id_p)
        //{
        //    elCurso.CrearNuevoCurso(p, estado, feini, fefin, id_p);
        //}

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
