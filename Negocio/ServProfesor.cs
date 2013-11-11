﻿using System;
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

        public void crearNuevoExamen(string nombre, string descripcion, int duracion, DateTime tiempotope, DateTime horatope, int porcentaje, int idcurso)
        {
            esProfesor.altaExamen(nombre, descripcion, duracion, tiempotope, horatope, idcurso);
            esProfesor.agregarPorcentaje(porcentaje);
        }
    }
}
