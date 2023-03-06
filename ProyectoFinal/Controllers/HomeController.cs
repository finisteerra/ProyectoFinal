﻿using ProyectoFinal.Entities;
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

        //Métodos de Iniciar Sesión

        [HttpGet]
        public ActionResult Index()
        {
            try
            {
                return View();
            }
            catch (Exception ex)
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult IniciarSesion(UsuariosEnt entidad)
        {
            try
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
            catch (Exception ex)
            {
                return View("Index");
            }
        }

    }
}