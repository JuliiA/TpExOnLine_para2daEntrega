using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_ExamenesEnLinea
{
    public partial class Fecha : System.Web.UI.UserControl
    {
        public string Calendario
        {
            get { return datepicker1.Text; }
            set { datepicker1.Text = value; }
        }

    }
}