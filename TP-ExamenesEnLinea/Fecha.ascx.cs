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
        public DateTime Calendario
        {
            get { return Calendar1.SelectedDate; }
            set { Calendar1.SelectedDate = value; }


        }

    }
}