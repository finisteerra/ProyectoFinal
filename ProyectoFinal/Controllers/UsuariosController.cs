using ProyectoFinal.Entities;
using ProyectoFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoFinal.Controllers
{
    public class UsuariosController : Controller
    {
        UsuariosModel model = new UsuariosModel();
        //ProvinciasModel modelProvincias = new ProvinciasModel();

        [HttpGet]
        public ActionResult ConsultarUsuarios()
        {
            var resultado = model.ConsultarUsuarios();
            return View(resultado);
        }

    }
}
