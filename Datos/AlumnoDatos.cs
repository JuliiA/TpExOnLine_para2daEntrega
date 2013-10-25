using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
    public class AlumnoDatos
    {
        ExOnLineEntities ctx = new ExOnLineEntities();
        public int BuscarId(string passUsuario)
        {
            var _usId = (from u in ctx.Alumnos
                             where u.Contrasenia == passUsuario
                             select u.IdAlumno).FirstOrDefault();
            return _usId;
        }


        public string BuscarNombre(string mailu)
        {
            var _name = (from b in ctx.Alumnos
                             where b.Mail == mailu
                             select b.Nombre).FirstOrDefault();
             
            return _name;

        }

        public string BuscarMail(int id_p)
        {
            var _usMail = (from m in ctx.Alumnos
                           where m.IdAlumno == id_p
                           select m.Mail).First();
            return _usMail;
        }

        public string BuscarContrasenia(int id_p)
        {
            var _usPass = (from p in ctx.Alumnos
                           where p.IdAlumno == id_p
                           select p.Contrasenia).First();
            return _usPass;
        }

        public bool modificarContrasenia(int id_p, string p, string p_2)
        {
            ALUMNO todos = ctx.Alumnos.Where(s => s.IdAlumno == id_p && s.Contrasenia == p).FirstOrDefault();
            if (todos != null)
            {
                todos.Contrasenia = p_2;
                ctx.SaveChanges();
                return true;
            }
            else {
                return false;  
            }
        }

        public void CargarDatos(int id_p, string p, string p_2, long dni)
        {
            ALUMNO editA = ctx.Alumnos.Where(s => s.IdAlumno == id_p).First();
            editA.Nombre = p;
            editA.Apellido = p_2;
            editA.DNI = dni;
            ctx.SaveChanges();
        }

        public bool BuscarExamenes(int id_p)
        {
            RESULTADO resul = ctx.Resultados.Where(r => r.AlumnoId == id_p).FirstOrDefault();
            if (resul != null)
                return true;
            else
                    return false;
        }
    }
}
