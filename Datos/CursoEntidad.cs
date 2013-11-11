using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Datos
{
    public class CursoEntidad
    {
        public int _idcurso { get; set; }
        public string CURSO { get; set; }
        public int estado { get; set; }
        //public string _examen { get; set; }
        public DateTime FECHA_INICIO { get; set; }
        public DateTime FECHA_FIN { get; set; }
        public int _profid { get; set; }
        public int CANTIDAD_ALUMNOS { get; set; }
    }
}
