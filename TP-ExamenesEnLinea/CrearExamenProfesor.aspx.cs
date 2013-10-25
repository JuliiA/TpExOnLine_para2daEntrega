using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TP_ExamenesEnLinea
{
    public partial class CrearExamenProfesor : System.Web.UI.Page
    {
        ServProfesor miServicio = new ServProfesor();

        protected void Page_Load(object sender, EventArgs e)
        {
            int id_p = Convert.ToInt32(Session["id"]);
            ddlcursos.DataSource = miServicio.LlenarDdlConCursos(id_p);
            ddlcursos.DataTextField = "Nombre";
            ddlcursos.DataValueField = "IdCurso";
            ddlcursos.DataBind();

        }

        protected void btnsig_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    if (ddlcursos.Items.Count != 0)
                    {
                        int idcurso = Convert.ToInt32(ddlcursos.SelectedValue);
                        miServicio.crearNuevoExamen(txtnomcurso.Text, txtdesc.Text, txtduracion.Text, txtfectope.Text, txthoratope.Text, txtporcentaje.Text, idcurso);
                        Response.Redirect("Preguntas.aspx");
                    }
                }
                catch (Exception ex)
                {
                    string mensaje = "No pudo cargarse el nuevo Examen";

                    ClientException.LogException(ex, mensaje); Server.Transfer("ErrorGeneral.aspx");
                }
            }


        }
    }
}