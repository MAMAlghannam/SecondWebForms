using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SecondWebForms
{
    public partial class Events : System.Web.UI.Page
    {
        private List<Event> eventsList;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Session["MyEvents"] = new List<Event>();

        }
        
        protected void AddEvent(object sender, EventArgs e)
        {
            UpdateEventsList();
            BindEvents();

        }

        private void UpdateEventsList()
        {
            // if there is an old events
            if (Session["MyEvents"] != null)
                eventsList = (List<Event>) Session["MyEvents"];
            else
                eventsList = new List<Event>();
            
            // add new event
            eventsList.Add(new Event(eventName.Text, calendarMenu.SelectedDate));

            Session["MyEvents"] = eventsList;
        }

        private void BindEvents()
        {
            rptEvent.DataSource = eventsList;
            rptEvent.DataBind();
            eventName.Text = "";
        }

    }

    public class Event
    {
        public string EventName { get; private set; }
        public string EventDate { get; private set; }

        public Event(string eventName, DateTime eventDate)
        {
            EventName = eventName;
            EventDate = eventDate.ToShortDateString();
        }

    }

}