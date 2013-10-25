using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TP_ExamenesEnLinea
{
    public partial class EditarDatosAlumno : System.Web.UI.Page
    {
        ServAlumno elServicio = new ServAlumno();

        protected void Page_Load(object sender, EventArgs e)
        {
            int id_p = Convert.ToInt32(Session["id"]);
            if (txtmail.Text == string.Empty)
            {
                txtmail.Text = elServicio.recuperarMailAlumno(id_p);
            }

            if(txtcontraseñaactual.Text == string.Empty){
                txtcontraseñaactual.Text = elServicio.recuperarContraseniaActual(id_p);
            }//txtnombre.Text = elServicio.RecuperaNombreLogueado(txtmail.Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) {
                int id_p = Convert.ToInt32(Session["id"]);
                elServicio.EditarDatos(id_p,txtnombre.Text, txtapellido.Text,txtdni.Text);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int id_p = Convert.ToInt32(Session["id"]);
            if (Page.IsValid) {
                if (elServicio.CambiarContrasenia(id_p, txtcontraseñaactual.Text, txtcontraseñanueva.Text))
                {
                    lblnueva.Text = "";
                }
                else {
                    lblnueva.Text = "La clave no pudo ser cambiada";
                }
            }
        }

       
    }
}