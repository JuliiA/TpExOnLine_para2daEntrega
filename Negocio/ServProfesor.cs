using System;
using System.Collections.Generic;
using System.Linq;
using Datos;
using System.Web;

namespace Negocio
{
    public class ServProfesor
    {
        ProfesorDatos esProfesor = new ProfesorDatos();

        public int RecuperarIdLogueado(string passUsuario)
        {
            int idUser = esProfesor.BuscarId(passUsuario);
            return idUser;
        }

        public string RecuperaNombreLogueado(string mailUsuario)
        {
            string NameUser = esProfesor.BuscarNombre(mailUsuario);
            return NameUser;
        }

        public object mostrarExamenes(int id_p)
        {
            var resulta = esProfesor.ListarLosExamenes(id_p);
            return resulta;
        }

        public object LlenarDdlConCursos(int id_p)
        {
            var resulta = esProfesor.ListarLosCursosEnCombo(id_p);
            return resulta;
        }

        public bool validarUsuario(string user, string pass)
        {
            bool comprobar = esProfesor.ComprobarUsuario(user, pass);
            return comprobar;
        }

        public bool tieneCursosCreados(int id_p)
        {
            bool resulta = esProfesor.tieneCursos(id_p);
            return resulta;
        }

        public void crearNuevoExamen(string nombre, string descripcion, int duracion, string tiempotope, DateTime horatope, int porcentaje, int idcurso)
        {
            string[] fec = tiempotope.Split('/');
            int mes = Convert.ToInt16(fec[0]);
            int dia = Convert.ToInt16(fec[1]);
            int anio = Convert.ToInt16(fec[2]);
            DateTime fecini = new DateTime(anio, mes, dia);
            esProfesor.altaExamen(nombre, descripcion, duracion, fecini, horatope, idcurso);
            esProfesor.agregarPorcentaje(porcentaje);
        }
    }
}
