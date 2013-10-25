using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos;

namespace Negocio
{
    public class ServLogueo
    {
        LogueoDatos userLogueado = new LogueoDatos();
        
        public Object login(String mail, String contrasenia)
        {
            Object p = userLogueado.esUsuario(mail);
            if (p != null)
            {
                return p;
            }
            else
            {
                return null;
            }
        }
    }
}
