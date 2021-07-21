using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppProspectos.Models;
using Newtonsoft.Json;

namespace WebAppProspectos
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [System.Web.Services.WebMethod]
        public static string ObtenerInformacion()
        {
            string result = "";
            try
            {

                MantenimientoProspectos objmanProspectos = new MantenimientoProspectos();

                var js = new JavaScriptSerializer();
                result=(js.Serialize(objmanProspectos.RecuperarTodos().ListProspectos));


            }
            catch (Exception ex)
            {
                result = "false|Existió un error al capturar la información";
            }
            return result;
        }
    }
}