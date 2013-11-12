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

        public object muestraCursos(int idlogueado) {
            List<CursoEntidad> misCursos = elCurso.listarCursosCantidad(idlogueado);
            return misCursos;
        }
        
        public void AltaCurso(string nombre, int estado, string fini, string ffin, int id_p)
        {
            string[] fec = fini.Split('/');
            int mes = Convert.ToInt16(fec[0]);
            int dia = Convert.ToInt16(fec[1]);
            int anio = Convert.ToInt16(fec[2]);
            DateTime fecini = new DateTime(anio, mes, dia);

            string[] fecf = ffin.Split('/');
            int mesf = Convert.ToInt16(fecf[0]);
            int diaf = Convert.ToInt16(fecf[1]);
            int aniof = Convert.ToInt16(fecf[2]);
            DateTime fecfin = new DateTime(aniof, mesf, diaf);

            elCurso.CrearNuevoCurso(nombre, estado, fecini, fecfin, id_p);
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
            DateTime fecha = elCurso.obtenerFechaInicial(id_c);
            return fecha;
        }

        public DateTime consultarFechaFin(int id_c)
        {
            DateTime resulta = elCurso.obtenerFechafin(id_c);
            return resulta;
        }

        public List<string> consultarLosMails(int id_c)
        {
            List<string> resulta = elCurso.obtenerLosMailsCurso(id_c);
            return resulta;
        }

        public object cargarCantidad(int id_p)
        {
            return elCurso.listarCursosCantidad(id_p);
        }

        public void crearBucle(string[] words, int id_c)
        {
            for (int i = 0; i < words.Length; i++)
            {
                int IdAlumno;
                //busco si no existe
                if (!elAlumno.buscarMailsRegistrados(words[i]))
                {
                    //lo creo si no existe
                    elAlumno.CrearAlumnoDesdeMail(words[i]);
                }

                IdAlumno = elAlumno.obtenerIdPorMail(words[i]);

                if (!elAlumno.buscaIdAlumnoRegistrados(id_c, IdAlumno))//si el alumno registrado NO esta asociado al curso ese, entonces si lo asocia
                {
                    elCurso.asociarCursoConAlumno(id_c, IdAlumno);
                }    
            }
        }

        public void CargarCurso(int id_c, string p, bool p_2, string dateTime, string dateTime_2)
        {
            string[] fec = dateTime.Split('/');
            int mes = Convert.ToInt16(fec[0]);
            int dia = Convert.ToInt16(fec[1]);
            int anio = Convert.ToInt16(fec[2]);
            DateTime fecini = new DateTime(anio, mes, dia);

            string[] fecf = dateTime_2.Split('/');
            int mesf = Convert.ToInt16(fecf[0]);
            int diaf = Convert.ToInt16(fecf[1]);
            int aniof = Convert.ToInt16(fecf[2]);
            DateTime fecfin = new DateTime(aniof, mesf, diaf);

            elCurso.CargarDatos(id_c, p, p_2, fecini, fecfin);
        }

        public void borrarLasAusencias(List<string> aBorrar)
        {
            for (int i = 0; i < aBorrar.Count(); i++) {
                elAlumno.borrarDelCurso(aBorrar[i]);
            }
        }
    }
}
