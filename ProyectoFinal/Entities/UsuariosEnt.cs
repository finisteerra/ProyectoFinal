using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoFinal.Entities
{
    public class UsuariosEnt
    {

        public long ConsecutivoUsuario { get; set; }

        public string CorreoElectronico { get; set; }

        public string Contrasenna { get; set; }

        public string ConfirmarContrasenna { get; set; }

        public bool Estado { get; set; }

        public string Token { get; set; }

        public string Nombre { get; set; }

        public string Apellido { get; set; }

        public int Edad { get; set; }

        public int Telefono { get; set; }

        public long Rol { get; set; }
    }
}
