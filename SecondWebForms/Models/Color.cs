using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SecondWebForms.Models
{
    [Table("Colors")]
    public class Color
    {
        [Key]
        public int Color_Id { get; set; }
        public string Color_Name { get; set; }
        public string Color_Hex { get; set; }

        public override string ToString()
        {
            return Color_Id + ", " + Color_Name + ", " + Color_Hex;
        }

    }
}