using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SecondWebForms.Models.Yelp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SecondWebForms.API
{
    public class TestRESTController : ApiController
    {
        [HttpGet]
        [Authorize]
        public List<Category> Categories()
        {
            // .ASPXFORMSDEMO
            //var token = Request.Headers.GetCookies()[0].Cookies.Where(e => e.Name == "myCustomCookie").FirstOrDefault();
            //if(token == null)
            //    throw new HttpResponseException(HttpStatusCode.Unauthorized);
            try
            {

                HttpWebRequest request = (HttpWebRequest)WebRequest.Create("https://api.yelp.com/v3/categories");
                request.Headers.Add("Authorization", "Bearer ODhDW-tWOd7Uo0-lpyIV1nWzLQmRHqjH5hYR18QfKM4qco7GSIhWpuValltHQZCm-KGgVYRRn8YktfFosXauGwfpYYBd9i6ZbgD4_ebFoIQj7I5tnfLktAhG4IPqYHYx");
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                StreamReader dataStream = new StreamReader(response.GetResponseStream());
                string responseText = dataStream.ReadToEnd();

                JObject obj = JObject.Parse(responseText);
                List<Category> categories = JsonConvert.DeserializeObject<List<Category>>(obj["categories"].ToString());
                return categories;
            }
            catch
            {
                //messageText.Text = "Error with request " + exc;
                return new List<Category>();
            }
        }

        [HttpGet]
        [Authorize]
        public List<BusinessInfo> GetBusinessByCategory(string id)
        {
            // .ASPXFORMSDEMO
            var token = Request.Headers.GetCookies()[0].Cookies.Where(e => e.Name == ".ASPXFORMSDEMO").FirstOrDefault();
            if (token == null)
                throw new HttpResponseException(HttpStatusCode.Unauthorized);
            try
            {

                HttpWebRequest request = (HttpWebRequest)WebRequest.Create($"https://api.yelp.com/v3/businesses/search?location=NYC&categories={id}");
                request.Headers.Add("Authorization", "Bearer ODhDW-tWOd7Uo0-lpyIV1nWzLQmRHqjH5hYR18QfKM4qco7GSIhWpuValltHQZCm-KGgVYRRn8YktfFosXauGwfpYYBd9i6ZbgD4_ebFoIQj7I5tnfLktAhG4IPqYHYx");
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                StreamReader dataStream = new StreamReader(response.GetResponseStream());
                string responseText = dataStream.ReadToEnd();

                JObject obj = JObject.Parse(responseText);
                List<BusinessInfo> list = JsonConvert.DeserializeObject<List<BusinessInfo>>(obj["businesses"].ToString());

                return list;
            }
            catch
            {
                return new List<BusinessInfo>();
            }
        }

        public int GetNumber(int id)
        {
            return id;
        }

    }
}