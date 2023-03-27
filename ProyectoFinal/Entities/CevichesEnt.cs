using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoFinal.Entities
{
    public class CevichesEnt
    {
        public long ConsecutivoCeviche { get; set; }

        public string Descripcion { get; set; }

        public decimal Precio { get; set; }

        public int Cantidad { get; set; }
    }
}