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
            if (!IsPostBack)
            {
                try
                {
                    TextBox1.Text = elCurso.consultarNombre(id_c);
                    check.Checked = elCurso.consultarEstado(id_c);
                    fecini.Calendario = elCurso.consultarFechaInicio(id_c).ToShortDateString();
                    fecfin.Calendario = elCurso.consultarFechaFin(id_c).ToShortDateString();
                    //if(elCurso.tieneExamenOAlumno(id_c))
                        txtmails.Text = string.Join(";", elCurso.consultarLosMails(id_c).ToArray());
                    
                }
                catch (Exception ex)
                {
                    string mensaje = "No se pudieron recuperar los datos del curso";
                    ClientException.LogException(ex, mensaje); Server.Transfer("ErrorGeneral.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nombre = TextBox1.Text;
            bool estado = check.Checked;
            string feini = fecini.Calendario;
            string fefin = fecfin.Calendario;
            
            int id_p = Convert.ToInt32(Session["id"]);
            int id_c = Convert.ToInt32(Request.QueryString["id"]); //Para buscar los datos por id de curso
            
            if (Page.IsValid)
            {
                try
                {
                    elCurso.CargarCurso(id_c, nombre, estado, feini, fefin);
                    string mails = txtmails.Text;
                    char[] delimiterChars = { ';' };
                    string[] words = mails.Split(delimiterChars);
                    
                    if (String.IsNullOrEmpty(mails))
                    {
                        //consulto los mails asociados al curso 
                        List<string> consulta = elCurso.consultarLosMails(id_c);

                        //comparo componentes de cada lista para saber lo que ya no estan
                        IEnumerable<string> Diferencias = consulta.Except(words);

                        //guardo en nueva lista los componentes que no son iguales
                        List<string> aBorrar = new List<string>();
                        foreach (string f in Diferencias)
                        {
                            aBorrar.Add(f);
                        }

                        elCurso.borrarLasAusencias(aBorrar,id_c);
                    }
                    else{
                            elCurso.crearBucle(words, id_c);
                            lblmensaje.Text = "Curso modificado correctamente";
                        }
                }
                catch (Exception ex)
                {
                    string mensaje = "Error al editar el curso" + ex;
                    ClientException.LogException(ex, mensaje); Server.Transfer("ErrorGeneral.aspx");
                }

            }
        }
    }
}