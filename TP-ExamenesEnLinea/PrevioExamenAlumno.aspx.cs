using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_ExamenesEnLinea
{
    public partial class PrevioExamenAlumno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id_a = Convert.ToInt32(Session["Id"]);
        }
    }
}