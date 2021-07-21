using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppProspectos.Models
{
    /// <summary>
    /// Clase Archivo 
    /// </summary>
    public class Archivo
    {
        private string _NombreArchivo;
        private string _PathArchivo;

        public string NombreArchivo { get => _NombreArchivo; set => _NombreArchivo = value; }
        public string PathArchivo { get => _PathArchivo; set => _PathArchivo = value; }
    }
}