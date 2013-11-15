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
            txtmail.Text = elServicio.recuperarMailAlumno(id_p);
            EmptyTextBoxes(txtnombre);
            EmptyTextBoxes(txtdni);
            EmptyTextBoxes(txtcontraseñaactual);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int id_p = Convert.ToInt32(Session["id"]);
                string nombre;
                string apellido;
                string dni;

                if (txtnombre.Text != null)
                      nombre= txtnombre.Text;
                else
                    nombre = null;
                if(txtapellido.Text != null)        
                    apellido = txtapellido.Text;
                else
                    apellido = null;
                if(txtdni.Text != null)
                    dni = txtdni.Text;
                else
                    dni = null;

                elServicio.EditarDatos(id_p,nombre,apellido,dni);
                lblnueva.Text = "Se han efectuado correctamente los cambios";
                }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int id_p = Convert.ToInt32(Session["id"]);
            if (Page.IsValid) {
                if (elServicio.CambiarContrasenia(id_p,txtcontraseñaactual.Text,txtcontraseñanueva.Text))
                {
                    lblnueva.Text = "La clave se ha cambiado correctamente";
                }
                else {
                    lblnueva.Text = "La clave no pudo ser cambiada";
                }
            }
        }

        public void EmptyTextBoxes(Control control)
        {
            foreach (Control c in control.Controls)
            {
                if (c is TextBox)
                {
                    ((TextBox)c).Text = String.Empty;
                }
            }
        }

    }
}