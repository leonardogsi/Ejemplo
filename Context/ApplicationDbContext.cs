using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using WebAppProspectos.Models;

namespace WebAppProspectos.Context
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext() : base("name=conexionProspectos")
        {
        }
        public DbSet<Prospecto> Prospectos { get; set; }
    }
}