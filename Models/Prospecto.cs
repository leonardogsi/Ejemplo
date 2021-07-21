using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppProspectos.Models
{
    public class Prospecto
    {
        private int _Id;
        private string _Nombre;
        private string _PrimerApellido;
        private string _SegundoApellido;
        private string _Calle;
        private string _Numero;
        private string _Colonia;
        private string _CP;
        private string _Telefono;
        private string _RFC;
        private string _Estatus;
        private string _Observaciones;
        public int Id { get => _Id; set => _Id = value; }
        public string Nombre { get => _Nombre; set => _Nombre = value; }
        public string PrimerApellido { get => _PrimerApellido; set => _PrimerApellido = value; }
        public string SegundoApellido { get => _SegundoApellido; set => _SegundoApellido = value; }
        public string Calle { get => _Calle; set => _Calle = value; }
        public string Numero { get => _Numero; set => _Numero = value; }
        public string Colonia { get => _Colonia; set => _Colonia = value; }
        public string CP { get => _CP; set => _CP = value; }
        public string Telefono { get => _Telefono; set => _Telefono = value; }
        public string RFC { get => _RFC; set => _RFC = value; }
        public string Estatus { get => _Estatus; set => _Estatus = value; }
        public string Observaciones { get => _Observaciones; set => _Observaciones = value; }
    }
}