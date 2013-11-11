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
            if (!IsPostBack)
            {
                ddlcursos.DataSource = miServicio.LlenarDdlConCursos(id_p);
                ddlcursos.DataTextField = "Nombre";
                ddlcursos.DataValueField = "IdCurso";
                ddlcursos.DataBind();
            }
        }

        protected void btnsig_Click(object sender, EventArgs e)
        {
            Int32 idcurso = Convert.ToInt32(ddlcursos.SelectedValue);
            string nombre = txtnomcurso.Text;
            string descripcion = txtdesc.Text;
            DateTime tiempotope = fechatope.Calendario;
            Int32 duracion = Convert.ToInt32(ddlduracion.SelectedItem.Text);
            Int32 porcentaje = Convert.ToInt32(ddlporcentaje.SelectedItem.Text); 
            DateTime hora = Convert.ToDateTime(txthoratope.Text);


            if (Page.IsValid)
            {
                try
                {
                    if (ddlcursos.Items.Count != 0)
                    {
                        miServicio.crearNuevoExamen(nombre, descripcion, duracion, tiempotope, hora,porcentaje,idcurso);
                        Label1.Text = "Se creo la primera parte";
                    }
                }
                catch (Exception ex)
                {
                    string mensaje = "No pudo cargarse el nuevo Examen" + ex;
                    Label1.Text = "No se cargo";
                    ClientException.LogException(ex, mensaje); Server.Transfer("ErrorGeneral.aspx");

                }
            }
            redireccionarAPreguntas();
        }

        private void redireccionarAPreguntas()
        {
            int idPregunta = 1;
            Response.Redirect("Preguntas.aspx?x="+idPregunta);
        }
    }
}