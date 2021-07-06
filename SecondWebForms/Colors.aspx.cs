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

        protected void c1_SelectionChangedDeparture(object sender, EventArgs e)
        {
            tbDeparture.Text = c1.SelectedDate.ToString().Substring(0, 10);
        }

        protected void c1_SelectionChangedReturn(object sender, EventArgs e)
        {
            tbReturn.Text = c2.SelectedDate.ToString().Substring(0, 10);
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }
    }
}