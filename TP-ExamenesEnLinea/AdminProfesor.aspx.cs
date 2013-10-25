using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TP_ExamenesEnLinea
{
    public partial class AdminProfesor : System.Web.UI.Page
    {
        ServCurso elServicio = new ServCurso();

        protected void Page_Load(object sender, EventArgs e)
        {
                
        }

        protected void btncrear_Click(object sender, EventArgs e)
        {
            string nombre = txtcurso.Text;
            int estado = 1;

            string mails = lblmails.Text;

            int id_p = Convert.ToInt32(Session["Id"]);
            
            if (Page.IsValid) {
                try
                {
                    //crear logica de alta curso
                    //elServicio.AltaCurso(txtcurso.Text, 1, fecini.SelectedDate.Date, fecfin.SelectedDate.Date, id_p);
                    
                }
                catch (Exception ex)
                {
                    string mensaje = "Error al cargar nuevo curso";

                    ClientException.LogException(ex, mensaje); Server.Transfer("ErrorGeneral.aspx");
                }
            }
        }

        protected void btncancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}