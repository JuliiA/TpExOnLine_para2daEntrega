using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_ExamenesEnLinea
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Logueado"] == null)
            {
                Response.Redirect("Index.aspx");
            }
            else
            {
                string usuarioLogueado = Session["Logueado"].ToString();
                lbluser.Text = usuarioLogueado;
                
            }
        }

        protected void btnsalir_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Index.aspx");
        }

    }
}