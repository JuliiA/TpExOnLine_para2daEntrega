using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TP_ExamenesEnLinea
{
    public partial class LoginUsuario2 : System.Web.UI.Page
    {
        ServConfiguracion elServicio = new ServConfiguracion();
        ServAlumno miServicio = new ServAlumno();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String mailUsuario = txtmail.Text;
            String passUsuario = txtpass.Text;

            bool valido = elServicio.validarUsuario(mailUsuario, passUsuario);
            if (valido == true)
            {
                abrirSesionAlumno(mailUsuario,passUsuario);
            }
            else
            {
                errorLogueo();
            }
        }

        private void errorLogueo()
        {
            string mensaje = "Usuario y/o contraseña incorrecta.Reingrese";
            lblmensaje.Text = mensaje;
        }

        private void abrirSesionAlumno(string mailu,string passu)
        {
            try
            {
                int id = miServicio.RecuperarIdLogueado(passu);
                string nombre = miServicio.RecuperaNombreLogueado(mailu);

                Session["Id"] = id;
                Session["Logueado"] = nombre;
                Session["Email"] = mailu;
                Response.Redirect("~/EditarDatosAlumno.aspx");
            }
            catch (Exception ex)
            {
                string mensaje = "Error al llenar GridView de datos";
                ClientException.LogException(ex, mensaje); Server.Transfer("ErrorGeneral.aspx");
            }
        }
    }
}