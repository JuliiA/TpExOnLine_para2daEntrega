using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{

    public class Configuracion
    {
        ExOnLineEntities ctx = new ExOnLineEntities();

        public bool ComprobarUsuario(string usuario, string pass)
        {
            bool esUsuario = false;
            var prof = (from p in ctx.Profesores
                        where p.Mail == usuario && p.Contrasenia == pass
                        select p).Count();
            if (prof != 0)
            {
                esUsuario = true;
            }
            else
            {
                //esUsuario = false;
                var alum = (from a in ctx.Alumnos
                            where a.Mail == usuario && a.Contrasenia == pass
                            select a).Count();
                if (alum != 0)
                {
                    esUsuario = true;
                }
                else
                {
                    esUsuario = false;
                }
            }
            return esUsuario;
        }
    }
}
