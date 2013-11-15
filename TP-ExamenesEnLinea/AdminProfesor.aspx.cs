using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TP_ExamenesEnLinea
{
    public partial class AdminProfesor : System.Web.UI.Page
    {
        ServCurso elServicio = new ServCurso();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                fecCalendario2.Calendario = DateTime.Now.AddMonths(1).ToShortDateString();
                CheckBox1.Checked = true;
            }
        }

        protected void btncrear_Click(object sender, EventArgs e)
        {
            string nombre = txtcurso.Text;
            int estado = 1;
            int id_p = Convert.ToInt32(Session["Id"]);
            //PARA GUARDAR LAS FECHAS:
            string feini = fecCalendario1.Calendario;
            string fefin = fecCalendario2.Calendario;

            if (Page.IsValid)
            {
                try
                {
                    //crear logica de alta curso
                    elServicio.AltaCurso(nombre, estado, feini, fefin, id_p);
                    if (String.IsNullOrEmpty(txtmails.Text))
                    {
                        lblmensaje.Text = "Curso creado correctamente";
                    }
                    else
                    {
                        string mails = txtmails.Text;
                        //cadena que resulta de busqueda en el texto ingresado como separador
                        char[] delimiterChars = { ';' };
                        //creo un array 
                        string[] words = mails.Split(delimiterChars);
                        elServicio.crearBucle(words, nombre);
                    }
                    
                    
                }
                catch (Exception ex)
                {
                    string mensaje = "Error al cargar nuevo curso";
                    ClientException.LogException(ex, mensaje); Server.Transfer("ErrorGeneral.aspx");
                }
            }
        }


        protected void btncancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }


    }
}