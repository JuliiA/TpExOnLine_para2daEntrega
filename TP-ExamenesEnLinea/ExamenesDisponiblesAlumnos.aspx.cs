using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TP_ExamenesEnLinea
{
    public partial class ExamenesDisponiblesAlumnos : System.Web.UI.Page
    {
        ServAlumno miServicio = new ServAlumno();

        protected void Page_Load(object sender, EventArgs e)
        {
                int id_p = Convert.ToInt32(Session["Id"]);
                if (miServicio.ConsultarExamenesDisponibles(id_p) == false)
                {
                    lblmensaje.Text = "No hay Examenes A Realizar";
                }
                else {
                        cargarGvExamenes(id_p);
                }   
        }

        private void cargarGvExamenes(int id_p)
        {
            try
            {
                //llenar GV
                gvexamenes.DataSource = miServicio.traerTodosExamenes(id_p);
                gvexamenes.DataBind();
            }
            catch (Exception ex)
            {
                string mensaje = "Error al llenar GridView de datos";

                ClientException.LogException(ex, mensaje); Server.Transfer("ErrorGeneral.aspx");
            }
        }

        protected void gvexamenes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                switch (Convert.ToInt32(e.Row.Cells[3].Text))
                {
                    case 1: e.Row.Cells[3].Text = "Aprobado"; break;
                    case 2: e.Row.Cells[3].Text = "Desaprobado"; break;
                    case 3: e.Row.Cells[3].Text = "<a href='RealizarExamenAlumno.aspx'>Realizar Examen</a>"; break;
                }
                switch (Convert.ToInt32(e.Row.Cells[4].Text))
                {
                    case 1: e.Row.Cells[4].Text = "Disponible"; break;
                    case 2: e.Row.Cells[4].Text = "Vencido"; break;
                }
            }
        }
    }
}