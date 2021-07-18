using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SecondWebForms.Models.Yelp
{
    public class BusinessLocation
    {
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string City { get; set; }
        public string Zip_Code { get; set; }
        public string Country { get; set; }
        public string State { get; set; }

        public string DisplayAddress()
        {
            return City + ", " + State + " " + Zip_Code;
        }

    }
}