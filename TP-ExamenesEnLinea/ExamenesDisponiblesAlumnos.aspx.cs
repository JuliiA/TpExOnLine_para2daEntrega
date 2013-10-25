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
            if (Page.IsPostBack) {
                int id_p = Convert.ToInt32(Session["Id"]);
                if (miServicio.ConsultarExamenesDisponibles(id_p) == false)
                {
                    lblmensaje.Text = "No hay Examenes A Realizar";
                }
                else {
                        cargarGvExamenes(id_p);
                }
            }
        }

        private void cargarGvExamenes(int id_p)
        {
            try
            {
                //llenar GV
            }
            catch (Exception ex)
            {
                string mensaje = "Error al llenar GridView de datos";

                ClientException.LogException(ex, mensaje); Server.Transfer("ErrorGeneral.aspx");
            }
        }
    }
}