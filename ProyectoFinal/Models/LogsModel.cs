﻿using ProyectoFinal.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Net.Http;
using System.Web;

namespace ProyectoFinal.Models
{
    public class LogsModel
    {
        public void RegistrarBitacora(LogsEnt entidad)
        {
            using (var client = new HttpClient())
            {
                JsonContent body = JsonContent.Create(entidad);
                string url = "https://localhost:44372/api/RegistrarBitacora";
                HttpResponseMessage respuesta = client.PostAsync(url, body).Result;
            }
        }
    }
}