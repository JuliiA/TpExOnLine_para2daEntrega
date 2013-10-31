using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TP_ExamenesEnLinea
{
    public partial class EditarCursoProfesor : System.Web.UI.Page
    {
        ServCurso elCurso = new ServCurso();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id_c = Convert.ToInt32(Request.QueryString["id"]);
                lblid.Text = "<h2>" + elCurso.consultarNombre(id_c) + "</h2>";
                recuperarValoresDeCurso(id_c);
            }
        }

        private void recuperarValoresDeCurso(int id_c)
        {
            try {
                TextBox1.Text = elCurso.consultarNombre(id_c);
                check.Checked = elCurso.consultarEstado(id_c);
                fecini.Calendario = elCurso.consultarFechaInicio(id_c);

            }
            catch (Exception ex) {
               // string mensaje = "No se pudieron recuperar los datos del curso";
                //ClientException.LogException(ex, mensaje); Server.Transfer("ErrorGeneral.aspx"); 
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}