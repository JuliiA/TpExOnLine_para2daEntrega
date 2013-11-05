using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos;

namespace Negocio
{
    public class ServPregunta
    {
        PreguntaDatos esPregunta = new PreguntaDatos();

        public void guardarValores(int id_e,string pregunta, string respuestauno, bool rval1, string repuestados, bool rval2, string respuestatres, bool rval3)
        {
            esPregunta.CrearPreguntaEnCurso(id_e,pregunta);//pasar tambien id del examen
            int r1,r2,r3;
            if(rval1)
                r1 = 1;
            else
                r1=2;
            if(rval2)
                r2=1;
            else
                r2=2;
            if(rval3)
                r3 =1;
            else
                r3=2;

            esPregunta.asociarRespuestas(respuestauno, r1, repuestados, r2, respuestatres, r3);
        }
    }
}
