using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TP_ExamenesEnLinea
{
    public partial class BorrarCursoProfesor : System.Web.UI.Page
    {
        ServCurso miCurso = new ServCurso();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id_c = Convert.ToInt32(Request.QueryString["id"]);
                lblcurso.Text = "<h2>" +miCurso.consultarNombre(id_c) +"</h2>";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id_c = Convert.ToInt32(Request.QueryString["id"]);
                if (miCurso.tieneExamenOAlumno(id_c) == true)
                {
                    lblmensaje.Text = "<h3>El curso no puede ser eliminado</h3>";
                    lblmensaje.Text += "<h3>Tiene cursos o examenes asociados</h3>";
                }
                else
                {
                    try
                    {
                        miCurso.eliminarCurso(id_c);
                        lblmensaje.Text = "<h1>Se ha eliminado el curso correctamente</h1>";
                    }
                    catch (Exception ex)
                    {
                        string mensaje = "No se ha podido dar de baja el curso";
                        ClientException.LogException(ex, mensaje); Server.Transfer("ErrorGeneral.aspx");
                    }
                }
            }
        }
    }
}