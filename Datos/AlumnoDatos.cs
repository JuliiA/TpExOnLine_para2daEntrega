using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Data.Objects;

namespace Datos
{
    public class AlumnoDatos
    {
        ExOnLineEntities ctx = new ExOnLineEntities();
        public bool ComprobarUsuario(string usuario, string pass)
        {
            bool esUsuario = false;
            var alumno = (from al in ctx.Alumnos
                        where al.Mail == usuario && al.Contrasenia == pass
                        select al).FirstOrDefault();
            if (alumno != null)
            {
                esUsuario = true;
            }
            else
            {
                esUsuario = false;
            }
            return esUsuario;
        }
        public int BuscarId(string mailUsuario)
        {
            var _usId = (from u in ctx.Alumnos
                             where u.Mail == mailUsuario
                             select u.IdAlumno).FirstOrDefault();
            return _usId;
        }


        public string BuscarNombre(string mailu)
        {
            string user;
            var _name = (from b in ctx.Alumnos
                             where b.Mail == mailu
                             select b.Nombre).FirstOrDefault();
            if (_name == null)
            {
                user = "Alumno";
            }
            else
            {
                user = _name;
            }
            return user;
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

        public void CargarDatos(int id_p, string p, string p_2, int dni)
        {
            ALUMNO editA = ctx.Alumnos.Where(s => s.IdAlumno == id_p).First();
            editA.Nombre = p;
            editA.Apellido = p_2;
            editA.DNI = dni;
            ctx.SaveChanges();
        }

        public bool BuscarExamenes(int id_p)
        {
            var resul = (from cl in ctx.CursosAl
                         join ex in ctx.Examenes on cl.IDCURSO equals ex.CursoId
                         where cl.IDALUMNO == id_p
                         select ex).FirstOrDefault();
            if (resul != null)
                return true;
            else
                    return false;
        }

        public void CrearAlumnoDesdeMail(string p)
        {
            ALUMNO neoAl = new ALUMNO();
            neoAl.Mail = p;
            neoAl.Contrasenia = p;

            ctx.Alumnos.AddObject(neoAl);
            ctx.SaveChanges();
        }

        public bool buscarMailsRegistrados(string p)
        {
            ALUMNO mailSi = ctx.Alumnos.Where(m => m.Mail == p).FirstOrDefault();
            bool resulta;
            if (mailSi != null)
                resulta = true;
            else
                resulta = false;
            return resulta;
        }

        public int obtenerIdPorMail(string p)
        {
            var ultimo = (from ula in ctx.Alumnos
                          where ula.Mail == p
                          select ula.IdAlumno).First();
            return ultimo;
        }

        public bool buscaIdAlumnoRegistrados(int id_c, int IdAlumno)
        {
            Curso_Alumno cural = ctx.CursosAl.Where(m => m.IDALUMNO == IdAlumno && m.IDCURSO == id_c).FirstOrDefault();
            bool resulta;
            if (cural != null)
                resulta = true;
            else
                resulta = false;
            return resulta;
        }

        public void borrarDelCurso(string p,int idcurso)
        {
            int id = obtenerIdPorMail(p);
            var elimina = (from e in ctx.CursosAl
                           where e.IDALUMNO == id && e.IDCURSO ==idcurso
                           select e);
            foreach (Curso_Alumno cal in elimina)
                ctx.CursosAl.DeleteObject(cal);
            ctx.SaveChanges();
        }

        public object consultarExamenes(int id_p)
        {
            ObjectParameter _idAl = new ObjectParameter("id_Alumno", typeof(String));
            var resulta = ctx.SP_traerExamenes(id_p);
            return resulta;
        }
    }
}
