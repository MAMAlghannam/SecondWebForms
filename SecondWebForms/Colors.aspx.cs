using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

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
                    ltMessage.Text = "Connected!";
                }
                catch
                {
                    ltMessage.Text = "Error happened";
                }
            }
        }
    }
}