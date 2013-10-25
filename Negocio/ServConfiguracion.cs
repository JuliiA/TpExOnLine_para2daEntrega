using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos;

namespace Negocio
{
    public class ServConfiguracion
    {
        Configuracion cs = new Configuracion();

        public bool validarUsuario(string user, string pass) {
            bool comprobar = cs.ComprobarUsuario(user, pass);
            return comprobar;
        }


    }
}
