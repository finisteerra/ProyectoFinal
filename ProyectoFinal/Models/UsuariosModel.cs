using ProyectoFinal.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Http.Json; 
using System.Web;

namespace ProyectoFinal.Models
{
    public class UsuariosModel
    {

        public UsuariosEnt ValidarUsuario(UsuariosEnt entidad)
        {
            using (var client = new HttpClient())
            {
                JsonContent body = JsonContent.Create(entidad);
                string url = "https://localhost:44372/api/ValidarUsuario";
                HttpResponseMessage respuesta = client.PostAsync(url, body).GetAwaiter().GetResult();

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<UsuariosEnt>().Result;

                return new UsuariosEnt();
            }
        }

        public List<UsuariosEnt> ConsultarUsuarios()
        {
            using (var client = new HttpClient())
            {
                string url = "https://localhost:44372/api/ConsultarUsuarios";

                //client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Current.Session["Token"].ToString());
                HttpResponseMessage respuesta = client.GetAsync(url).GetAwaiter().GetResult();

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<List<UsuariosEnt>>().Result;

                return new List<UsuariosEnt>();
            }
        }
        
        public UsuariosEnt ConsultarUsuario(long q)
        {
            using (var client = new HttpClient())
            {
                string url = "https://localhost:44372/api/ConsultarUsuario?q=" + q;

                //client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Current.Session["Token"].ToString());
                HttpResponseMessage respuesta = client.GetAsync(url).GetAwaiter().GetResult();

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<UsuariosEnt>().Result;

                return new UsuariosEnt();
            }
        }

        public void ActualizarUsuarios(UsuariosEnt entidad)
        {
            using (var client = new HttpClient())
            {
                JsonContent body = JsonContent.Create(entidad);
                string url = "https://localhost:44372/api/ActualizarUsuarios";

                //client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Current.Session["Token"].ToString());
                HttpResponseMessage respuesta = client.PutAsync(url, body).GetAwaiter().GetResult();
            }
        }

        public string BuscarCorreo(string ValidarCorreo)
        {
            using (var client = new HttpClient())
            {

                string url = "https://localhost:44372/api/BuscarCorreo?ValidarCorreo=" + ValidarCorreo;
                HttpResponseMessage respuesta = client.GetAsync(url).GetAwaiter().GetResult();
                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<string>().Result;

            }
            return "ERROR";
        }

        public int RegistrarUsuario(UsuariosEnt entidad)
        {
            using (var client = new HttpClient())
            {
                JsonContent body = JsonContent.Create(entidad);
                string url = "https://localhost:44372//api/RegistrarUsuario";
                HttpResponseMessage respuesta = client.PostAsync(url, body).GetAwaiter().GetResult();

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<int>().Result;

                return 0;
            }
        }

        public void RecuperarContrasenna(UsuariosEnt entidad)
        {
            using (var client = new HttpClient())
            {
                JsonContent body = JsonContent.Create(entidad);
                string url = "https://localhost:44372/api/RecuperarContrasenna";
                HttpResponseMessage respuesta = client.PostAsync(url, body).GetAwaiter().GetResult();
            }
        }

    }
}
