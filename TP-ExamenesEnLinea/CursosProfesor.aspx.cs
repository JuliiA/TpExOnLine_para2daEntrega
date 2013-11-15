using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TP_ExamenesEnLinea
{
    public partial class CursosProfesor : System.Web.UI.Page
    {
        ServCurso elServicio = new ServCurso();
        ServProfesor elProfesor = new ServProfesor();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id_p = Convert.ToInt32(Session["Id"]);
                if (elProfesor.tieneCursosCreados(id_p))
                {
                    cargarCursosCreados(id_p);
                }
                else
                {
                    lblmensaje.Text = "No ha agregado ningun curso";
                }
            }
            else {
                Server.Transfer("~/Index.aspx");
            }
        }

        private void cargarCursosCreados(int idlogueado)
        {
            try
            {
                //gvcursos.DataSource = elServicio.muestraCursos(idlogueado);
                //gvcursos.DataBind();
                gvprueba.DataSource = elServicio.muestraCursos(idlogueado);
                gvprueba.DataBind();
            }
            catch (Exception ex)
            {
                string mensaje = "Error al llenar GridView de datos";
                lblmensaje.Text = mensaje;
                ClientException.LogException(ex, mensaje); Server.Transfer("ErrorGeneral.aspx");
            }
        }
        
        protected void gvcursos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[2].Visible = false;
            ////e.Row.Cells[7].Visible = false;
        }

        protected void gvcursos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                switch (Convert.ToInt32(e.Row.Cells[4].Text))
                {
                    case 1: e.Row.Cells[4].Text = "Activado"; break;
                    case 2: e.Row.Cells[4].Text = "Desactivado"; break;
                }
                switch (Convert.ToInt32(e.Row.Cells[7].Text))
                {
                    case 0: e.Row.Cells[7].Text = "Sin Alumnos"; break;
                }
            }
           
        }

        protected void gvcursos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            //esto se prueba con el HiperLinkField del aspx
            GridViewRow rw = gvprueba.Rows[e.NewSelectedIndex];
            this.lblmensaje.Text = Convert.ToString(gvprueba.DataKeys[rw.RowIndex].Values["_idcurso"]);

        }



        
    }
}