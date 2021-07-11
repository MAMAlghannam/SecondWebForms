using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using SecondWebForms.Models;

namespace SecondWebForms
{
    public partial class YelpAPI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            selectedItems.Text += CategoriesList.SelectedIndex;
        }

        public List<Category> GetCategories()
        {
            try
            {
                HttpWebRequest request = (HttpWebRequest) WebRequest.Create("https://api.yelp.com/v3/categories");
                request.Headers.Add("Authorization", "Bearer ODhDW-tWOd7Uo0-lpyIV1nWzLQmRHqjH5hYR18QfKM4qco7GSIhWpuValltHQZCm-KGgVYRRn8YktfFosXauGwfpYYBd9i6ZbgD4_ebFoIQj7I5tnfLktAhG4IPqYHYx");
                HttpWebResponse response = (HttpWebResponse) request.GetResponse();
                StreamReader dataStream = new StreamReader(response.GetResponseStream());
                string responseText = dataStream.ReadToEnd();

                JObject obj = JObject.Parse(responseText);
                List<Category> categories = JsonConvert.DeserializeObject<List<Category>>(obj["categories"].ToString());
                return categories;
            }
            catch (Exception exc)
            {
                //messageText.Text = "Error with request " + exc;
                return null;
            }
        }

    }
}