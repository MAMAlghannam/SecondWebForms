using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Linq;
using SecondWebForms.Models;
using System.Data;
using System.Net;
using System.Threading.Tasks;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace SecondWebForms
{
    public partial class Colors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var DBConn = WebConfigurationManager.ConnectionStrings["DBConn"];

            using (SqlConnection db = new SqlConnection(DBConn.ConnectionString))
            {
                try
                {
                    db.Open();
                    SqlCommand command = new SqlCommand("SELECT * FROM Color", db);
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataSet dataSet = new DataSet();
                    dataAdapter.Fill(dataSet);
                    ltMessage.Text = "Connected! and, " + dataSet.Tables[0].Rows.Count;
                    db.Close();
                }
                catch(Exception err)
                {
                    db.Close();
                    ltMessage.Text = "Error: " + err.Message;
                }
            }
        }

        public IQueryable<Color> GetColors()
        {
            try
            {
                var _db = new SecondWebForms.Models.AppDbContext();
                IQueryable<Color> query = _db.Color;
                ltMessage.Text += " query.Count: " + query.Count();
                return query;
            }
            catch(Exception err)
            {
                ltMessage.Text += " Error happened wth EntityFramework " + err.Message;
            }

            return null;

        }

        public List<City> GetCities()
        {
            HttpWebRequest request = (HttpWebRequest) WebRequest.Create("http://localhost:5000/api/getCities");
            
            HttpWebResponse response = (HttpWebResponse) request.GetResponse();
            ltMessage.Text += " " + response.ContentType + " " + response.StatusDescription;

            StreamReader dataStream = new StreamReader(response.GetResponseStream());
            string result = dataStream.ReadToEnd();
            List<City> convertedRsult = JsonConvert.DeserializeObject<List<City>>(result);
            convertedRsult.Insert(0, new City { City_Name = "Choose a city", City_Id = -1 });

            return convertedRsult;
        }

        public void GetDistricts(object sender, EventArgs e)
        {
            if (CitiesList.SelectedValue.Equals("-1"))
            {
                DistrictsList.Enabled = false;
                return;
            }

            HttpWebRequest request = (HttpWebRequest) WebRequest.Create("http://localhost:5000/api/getDistricts/1");
            HttpWebResponse response = (HttpWebResponse) request.GetResponse();
            StreamReader dataStream = new StreamReader(response.GetResponseStream());
            string result = dataStream.ReadToEnd();
            List<District> convertedResult = JsonConvert.DeserializeObject<List<District>>(result);
            convertedResult.Insert(0, new District { City_Id = -1, District_Id = -1, District_Name = "Choose a district" });

            DistrictsList.DataSource = convertedResult;
            DistrictsList.DataTextField = "District_Name";
            DistrictsList.DataValueField = "District_Id";
            DistrictsList.DataBind();
            DistrictsList.Enabled = true;
        }
    }
}