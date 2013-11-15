using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TP_ExamenesEnLinea
{
    public partial class BorrarExamen : System.Web.UI.Page
    {
        ServProfesor elServicio = new ServProfesor();  
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id_e = Convert.ToInt32(Request.QueryString["id"]);
                lblexamen.Text = "<h2>" + elServicio.consultarNombreExamen(id_e) + "</h2>";
            }
        }

        protected void btnborrar_Click(object sender, EventArgs e)
        {
             if (Request.QueryString["id"] != null)
            {
                int id_e = Convert.ToInt32(Request.QueryString["id"]);
                if (elServicio.noPuedeSerBorrado(id_e) == true)
                {
                    lblmensaje.Text = "<h3>El examen no puede ser eliminado</h3>";
                    lblmensaje.Text += "<h3>Ya fue resuelto por algun alumno</h3>";
                }
                else
                {
                    try
                    {
                        elServicio.eliminarExamen(id_e);
                        lblmensaje.Text = "<h1>Se ha eliminado el curso correctamente</h1>";
                    }
                    catch (Exception)
                    {
                        //Para cuando tiene alumnos asociados:
                        lblmensaje.Text = "<h3>El examen no se puede borrar porque tiene alumnos asociados</h3>";

                    }
                }
            }
        }
    }
}