using ProyectoFinal.Entities;
using ProyectoFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoFinal.Controllers
{
    public class HomeController : Controller
    {
         UsuariosModel usuariosModel = new UsuariosModel();
         LogsModel logsModel = new LogsModel();
        
        //Métodos de Iniciar Sesión
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult IniciarSesion(UsuariosEnt entidad)
        {
            var resultado = usuariosModel.ValidarUsuario(entidad);

            if (resultado)
                return View();
            else
            {
                ViewBag.mensaje = "Sus credenciales no fueron validados";
                return View("Index");
            }
        }

        //Recuperar Contraseña

        [HttpPost]
        public ActionResult BuscarCorreo(string ValidarCorreo)
        {
            return Json(usuariosModel.BuscarCorreo(ValidarCorreo), JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult RecuperarContrasenna()
        {
            try
            {
                return View();
            }
            catch (Exception ex)
            {
                RegistrarBitacora(ex, ControllerContext);
                return View();
            }

        }

        [HttpPost]
        public ActionResult RecuperarContrasenna(UsuariosEnt entidad)
        {
            try
            {
                usuariosModel.RecuperarContrasenna(entidad);
                return View("Index");
            }
            catch (Exception ex)
            {
                return View(ex);
            }
        }


        public void RegistrarBitacora(Exception ex, ControllerContext ubicacion)
        {
            LogsEnt logs = new LogsEnt();
            logs.origen = ubicacion.RouteData.Values["controller"].ToString() + "-" + ubicacion.RouteData.Values["action"].ToString();
            logs.mensajeError = ex.Message;
            logsModel.RegistrarBitacora(logs);
        }
        
    }
}
