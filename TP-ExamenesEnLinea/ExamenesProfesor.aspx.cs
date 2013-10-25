using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TP_ExamenesEnLinea
{
    public partial class ExamenesProfesor : System.Web.UI.Page
    {
        ServProfesor elServicio = new ServProfesor();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id_p = Convert.ToInt32(Session["Id"]);
                cargarExamenesCreados(id_p);
            }
            else
            {
                Server.Transfer("~/Index.aspx");
            }
        }

        private void cargarExamenesCreados(int id_p)
        {
            try
            {
                gvexamenes.DataSource = elServicio.mostrarExamenes(id_p);
                gvexamenes.DataBind();
            }
            catch {
                lblmensaje.Text = "No se pudo cargar La grilla";
            }
        }
    }
}