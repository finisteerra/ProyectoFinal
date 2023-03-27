using ProyectoFinal.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Web;

namespace ProyectoFinal.Models
{
    public class CevichesModels
    {
        public List<CevichesEnt> ConsultarCeviches()
        {
            using (var client = new HttpClient())
            {
                string url = "https://localhost:44372/api/ConsultarCeviches";

                //client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Current.Session["Token"].ToString());
                HttpResponseMessage respuesta = client.GetAsync(url).GetAwaiter().GetResult();

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<List<CevichesEnt>>().Result;

                return new List<CevichesEnt>();
            }
        }
    }
}