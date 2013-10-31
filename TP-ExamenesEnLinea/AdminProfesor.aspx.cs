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
            
        }

        protected void btncrear_Click(object sender, EventArgs e)
        {
            string nombre = txtcurso.Text;
            string mails = txtmails.Text;
            //cadena que resulta de busqueda en el texto ingresado como separador
            char[] delimiterChars = { ',' };
            //creo un array 
            string[] words = mails.Split(delimiterChars);
            int cantidadMails = words.Length;
            elServicio.crearBucle(words, cantidadMails);
            
            int estado = 1;
            //string mails = lblmails.Text;
            int id_p = Convert.ToInt32(Session["Id"]);
            //PARA GUARDAR LAS FECHAS:
            DateTime feini = fecCalendario1.Calendario;
            DateTime fefin = fecCalendario2.Calendario;

            if (Page.IsValid)
            {
                try
                {
                    //crear logica de alta curso
                    elServicio.AltaCurso(txtcurso.Text, estado, feini, fefin, id_p);
                    lblmensaje.Text = "Curso creado correctamente";
                    
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

        //Validar el check, siempre tiene que estar activo para que se cree el curso:
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (CheckBox1.Checked)
                args.IsValid = true;
            else
                args.IsValid = false;
        }

    }
}