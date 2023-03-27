using ProyectoFinal.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using System.Net.Http.Json;

namespace ProyectoFinal.Models
{
    public class RolesModel
    {
        public List<SelectListItem> ConsultarRoles()
        {
            using (var client = new HttpClient())
            {
                string url = "https://localhost:44372/api/ConsultarRoles";

                //client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Current.Session["Token"].ToString());
                HttpResponseMessage respuesta = client.GetAsync(url).GetAwaiter().GetResult();

                if (respuesta.IsSuccessStatusCode)
                {
                    var datos = respuesta.Content.ReadFromJsonAsync<List<RolesEnt>>().Result;

                    List<SelectListItem> ComboRoles = new List<SelectListItem>();

                    foreach (var item in datos)
                    {
                        ComboRoles.Add(new SelectListItem
                        {
                            Value = item.ConsecutivoRol.ToString(),
                            Text = item.TipoRol
                        });
                    }
                    return ComboRoles;
                }
                return new List<SelectListItem>();
            }
        }
    }
}