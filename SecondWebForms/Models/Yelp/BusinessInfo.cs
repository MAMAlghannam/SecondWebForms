using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SecondWebForms.Models.Yelp
{
    public class BusinessInfo
    {
        public string Id { set; get; }
        public string Alias { set; get; }
        public string Name { set; get; }
        public string Image_Url { set; get; }
        public string Url { set; get; }
        public int Review_Count { set; get; }
        public float Rating { set; get; }
        public string Price { set; get; }
        public List<Category> Categories { set; get; }
        public BusinessLocation Location { set; get; }

    }
}