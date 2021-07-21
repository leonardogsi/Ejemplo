using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppProspectos.Models;

namespace WebAppProspectos
{
    public partial class CapturarProspecto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Remove("idProspecto");
            }
        }

        /// <summary>
        /// Se guarda la información del prospecto en la base de datos
        /// </summary>
        /// <returns></returns>
        [System.Web.Services.WebMethod]
        public static string Enviar(object dataF)
        {
            string result = "";
            try
            {
                var json = new JavaScriptSerializer().Serialize(dataF);
                var objDes = JsonConvert.DeserializeObject<Root>(json);
                MantenimientoProspectos objmanProspectos = new MantenimientoProspectos();

                Result rs = objmanProspectos.Alta(objDes.obj);
                if (rs.IsCorrecto)
                {
                    result = "true|Información enviada correctamente";

                    HttpContext.Current.Session["idProspecto"] = rs.Id;

                }
                else
                {
                    result = "false|" + rs.Mensaje;
                }

            }
            catch (Exception ex)
            {
                result = "false|Existió un error al capturar la información";
            }
            return result;
        }
    }
}