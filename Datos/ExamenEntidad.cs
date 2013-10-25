using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Datos
{
    public class ExamenEntidad
    {
        
        public string nombrexamen { get; set; }
        public string descripcion { get; set; }
        public int duracion { get; set; }
        public DateTime fecyhora { get; set; }
        public int porcentajeAprobacion { get; set; }
        public int idcurso { get; set; }
    }
}
