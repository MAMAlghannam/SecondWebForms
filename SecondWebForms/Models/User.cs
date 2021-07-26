using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SecondWebForms.Models
{
    [Table("User")]
    public class User
    {
        public int User_Id { set; get; }
        public string Email { set; get; }
        public string User_Name { set; get; }
    }
}