using ProyectoFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoFinal.Controllers
{
    public class CevichesController : Controller
    {
        CevichesModels modelCeviches = new CevichesModels();

        // GET: Ceviches
        [HttpGet]
        public ActionResult ConsultarCeviches()
        {
            var resultado = modelCeviches.ConsultarCeviches();
            return View(resultado);
        }
    }
}