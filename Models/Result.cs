using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppProspectos.Models
{
    public class Result
    {
        private bool _IsCorrecto;
        private int _Id;
        private string _Mensaje;
        private List<Prospecto> _ListProspectos;

        public bool IsCorrecto { get => _IsCorrecto; set => _IsCorrecto = value; }
        public int Id { get => _Id; set => _Id = value; }
        public string Mensaje { get => _Mensaje; set => _Mensaje = value; }
        public List<Prospecto> ListProspectos { get => _ListProspectos; set => _ListProspectos = value; }
    }
}