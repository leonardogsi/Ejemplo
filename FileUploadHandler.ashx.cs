using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace WebAppProspectos
{
    /// <summary>
    /// Descripción breve de Upload
    /// </summary>
    public class Upload : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            string carpetaTemporal = "";
            if (context.Session["idProspecto"] != null)
                carpetaTemporal = context.Session["idProspecto"].ToString();

            HttpPostedFile file = context.Request.Files[0];
            string path = context.Server.MapPath(string.Format("Archivos/{0}", carpetaTemporal));
            string fname = path + "/" + file.FileName;

            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            file.SaveAs(fname);
                     
            
            context.Response.ContentType = "text/plain";
            context.Response.Write("Archivo(s) subido correctamente!");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }        
    }
}