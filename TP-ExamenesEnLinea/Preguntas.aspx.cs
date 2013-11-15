using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TP_ExamenesEnLinea
{
    public partial class Preguntas : System.Web.UI.Page
    {
        ServPregunta miPregunta = new ServPregunta();
        ServPregunta miServicio = new ServPregunta();

        private int nroPregunta;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnsig.Visible = true;
                btncrear.Visible = false;
            }
            lblnrp.Text = Request.QueryString["x"];
            if(Convert.ToInt32(Request.QueryString["x"])>5){
                Response.Redirect("Error404.aspx");        
            }

            if (Convert.ToInt32(Request.QueryString["x"]) == 5)
            {
                btncrear.Visible = true;
                btnsig.Visible = false;
            }

        }

        protected void btnsig_Click1(object sender, EventArgs e)
        {
            //paso un id provisorio-> que despues debe ser reemplazado por el id del examen creado y consultado como ultimo
            //int id_e = 3;
            int id_p = miServicio.obtenerUltimoExamen();
            nroPregunta = Convert.ToInt32(Request.QueryString["x"]);
            nroPregunta++;
            string pregunta = txtpregunta.Text;
            string respuestauno = txtresp1.Text;
            bool rval1 = check1.Checked;
            string repuestados = txtresp2.Text;
            bool rval2 = check2.Checked;
            string respuestatres = txtresp3.Text;
            bool rval3 = check3.Checked;

            miPregunta.guardarValores(id_p,pregunta, respuestauno, rval1, repuestados, rval2, respuestatres, rval3);
            
            Response.Redirect("Preguntas.aspx?x=" + nroPregunta);
            
        }

        protected void btncrear_Click(object sender, EventArgs e)
        {
            int id_p = miServicio.obtenerUltimoExamen();
            string pregunta = txtpregunta.Text;
            string respuestauno = txtresp1.Text;
            bool rval1 = check1.Checked;
            string repuestados = txtresp2.Text;
            bool rval2 = check2.Checked;
            string respuestatres = txtresp3.Text;
            bool rval3 = check3.Checked;

            miPregunta.guardarValores(id_p, pregunta, respuestauno, rval1, repuestados, rval2, respuestatres, rval3);
           
            lblmensaje.Text = "Se ha creado correctamente el curso";
            Response.Redirect("ExamenesProfesor.aspx");
        }

    }
}