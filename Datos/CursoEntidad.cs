﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Datos
{
    public class CursoEntidad
    {
        public int _idcurso { get; set; }
        public string _curso { get; set; }
        public int estado { get; set; }
        public string _examen { get; set; }
        public DateTime _fechora { get; set; }
        public DateTime _fecfin { get; set; }
        public int _profid { get; set; }
    }
}
