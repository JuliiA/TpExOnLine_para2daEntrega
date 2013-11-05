using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Datos
{
    public class PreguntaDatos
    {
        ExOnLineEntities ctx = new ExOnLineEntities();

        public int obtenerLaUltimaPregunta() {
            var ultimo = (from j in ctx.Preguntas
                          orderby j.IdPregunta descending
                          select j.IdPregunta).FirstOrDefault();
            return ultimo;
        }
        
        public void asociarRespuestas(string respuestauno, int r1, string repuestados, int r2, string respuestatres, int r3)
        {
            string[] answers = new string[] { respuestauno, repuestados, respuestatres };
            int valida;
            for(int i =0; i<answers.Length;i++)
            {
                int id_e = obtenerLaUltimaPregunta();
                if (i==0)
                        valida = r1;
                else{
                     if(i == 1) 
                        valida = r2;
                     else
                         valida = r3;
                }
                crearRespuesta(answers[i], valida, id_e);
            }
        }

        private void crearRespuesta(string p, int valida, int id_e)
        {
            RESPUESTA neoresp = new RESPUESTA();
            neoresp.PreguntaId = id_e;
            neoresp.Descripcion = p;
            neoresp.EsValida = valida;
            ctx.Respuestas.AddObject(neoresp);
            ctx.SaveChanges();
        }

        

        public void CrearPreguntaEnCurso(int id, string pregunta)
        {
            //ctx = new ExOnLineEntities();
            PREGUNTA neopreg = new PREGUNTA();
            neopreg.Descripcion = pregunta;
            neopreg.ExamenId = id;
            ctx.Preguntas.AddObject(neopreg);
            ctx.SaveChanges();
        }
    }
}
