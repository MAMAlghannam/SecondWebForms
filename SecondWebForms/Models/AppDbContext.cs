﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace SecondWebForms.Models
{
    public class AppDbContext : DbContext
    {
        public DbSet<Color> Color { get; set; }
    }
}