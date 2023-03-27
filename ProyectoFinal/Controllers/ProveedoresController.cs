using ProyectoFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoFinal.Controllers
{
    public class ProveedoresController : Controller
    {
        // GET: Provedores

        ProveedoresModels modelProveedores = new ProveedoresModels();

        [HttpGet]
        public ActionResult ConsultarProveedores()
        {
            var resultado = modelProveedores.ConsultarProveedores();
            return View(resultado);
        }
    }
}