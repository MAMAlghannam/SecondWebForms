using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SecondWebForms
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            divAlert.Attributes.Add("style", "color: deepskyblue;margin-bottom: 10px");
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            string message = string.Format("You entered: <br /> {0} <br /> {1} <br /> {2}", txtName.Text, txtEmail.Text, favList.Text);

            alertMessage.Text = message;
        }
    }
}