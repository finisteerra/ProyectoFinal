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

        //[HttpGet]
        //public ActionResult ActualizarUsuarios(long q)
        //{
        //    var resultado = model.ConsultarUsuario(q);

        //    ViewBag.ListadoProvincias = modelProvincias.ConsultarProvincias();
        //    ViewBag.ListadoRoles = modelProvincias.ConsultarRoles();

        //    return View(resultado);
        //}

        //[HttpPost]
        //public ActionResult ActualizarUsuarios(UsuariosEnt entidad)
        //{
        //    model.ActualizarUsuarios(entidad);
        //    return RedirectToAction("ConsultarUsuarios", "Usuarios");
        //}

        //[HttpPost]
        //public ActionResult CambiarEstado(long id)
        //{
        //    model.CambiarEstadoUsuario(id);
        //    return Json("Ok", JsonRequestBehavior.AllowGet);
        //}

    }
}
