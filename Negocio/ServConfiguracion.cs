using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

namespace Negocio
{
    public class ServConfiguracion
    {
        public static string HashMD5(string texto) {
            MD5 md5 = new MD5CryptoServiceProvider();
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(texto));
            
            byte[] resulta = md5.Hash;
            int cantidad = resulta.Length;

            StringBuilder str = new StringBuilder();
            
            for (int i = 0; i < cantidad; i++)
            {
                str.Append(resulta[i].ToString("x2"));
            }

            return str.ToString();
        }
    }
}
