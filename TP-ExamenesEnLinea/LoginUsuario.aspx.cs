using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;


namespace TP_ExamenesEnLinea
{
    public partial class LoginUsuario : System.Web.UI.Page
    {
        ServProfesor elServicio = new ServProfesor();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String mailUsuario = txtmail.Text;
            String passUsuario = txtpass.Text;

            bool valido = elServicio.validarUsuario(mailUsuario, passUsuario);
            if (valido == true) {
                abrirSesionProfesor(passUsuario,mailUsuario);
            }
            else
            {
                erroLogueo();
            }
        }

        private void abrirSesionProfesor(String passUsuario, String mailU)
        {
            try
            {
                    int id = elServicio.RecuperarIdLogueado(mailU);
                    string nombre = elServicio.RecuperaNombreLogueado(mailU);
                 
                    Session["Id"] = id;
                    Session["Logueado"] = nombre;
                    Session["Email"] = mailU;
                    Response.Redirect("~/AdminProfesor.aspx");  
            }
            catch (Exception ex)
            {
                string mensaje = "Error de Inicio de Sesion";

                ClientException.LogException(ex, mensaje); Server.Transfer("ErrorGeneral.aspx");
            }
        }

        private void erroLogueo()
        {
            string mensaje = "Usuario y/o contraseña incorrecta.Reingrese";
            lblmensaje.Text = mensaje;
            //RequiredFieldValidator2.ErrorMessage = "Contraseña Incorrecta";
            //Response.Redirect("LoginUsuario.aspx?msj=" + mensaje);
        }

      
    }
}