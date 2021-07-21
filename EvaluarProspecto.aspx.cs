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
    public partial class EvaluarProspecto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    string id = Request.QueryString[0];
                    List<Archivo> listArchivos = new List<Archivo>();
                    string DirectoryName = Request.MapPath("Archivos/" + id);
                    if (Directory.Exists(DirectoryName))
                    {
                        String[] Files = Directory.GetFiles(DirectoryName);
                        foreach (var a in Files)
                        {
                            string fileName = Path.GetFileName(a);
                            listArchivos.Add(new Archivo { NombreArchivo = fileName, PathArchivo = a });
                        }
                        repeater1.DataSource = listArchivos;
                        repeater1.DataBind();
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Redirect("Default.aspx");
            }
            
        }


        /// <summary>
        /// Evalua al prospecto Autorizado/Rechazado
        /// </summary>
        /// <param name="dataF">Objeto Prospecto con la información del prospecto</param>
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
                
                var rs = objmanProspectos.Modificar(objDes.obj);
                if (rs.IsCorrecto)
                {
                    if (objDes.obj.Estatus == "Autorizado")
                    {
                        result = "true|Prospecto autorizado";
                    }
                    else
                    {
                        result = "true|Prospecto rechazado";
                    }
                    
                }
                else
                {
                    result = "false|"+rs.Mensaje;
                }

            }
            catch (Exception ex)
            {
                result = "false|Existió un error al modificar la información";
            }
            return result;
        }

        /// <summary>
        /// Obtiene la Información del prospecto
        /// </summary>
        /// <param name="dataF"></param>
        /// <returns></returns>
        [System.Web.Services.WebMethod]
        public static string ObtenerInformacion(object dataF)
        {
            string result = "";
            try
            {

                var json = new JavaScriptSerializer().Serialize(dataF);
                var objDes = JsonConvert.DeserializeObject<Root>(json);
                MantenimientoProspectos objmanProspectos = new MantenimientoProspectos();

                var infProspecto = objmanProspectos.Recuperar(objDes.obj.Id);
                if (infProspecto.Id != 0)
                {

                    result = "true|" + JsonConvert.SerializeObject(infProspecto);
                }
                else
                {
                    result = "true|No se pudo recuperar la información";
                }


            }
            catch (Exception ex)
            {
                result = "false|Existió un error al capturar la información";
            }
            return result;
        }
        /// <summary>
        /// Descarga el archivo 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void linkbtnDownloda_Command(object sender, CommandEventArgs e)
        {
            string uri = e.CommandArgument.ToString();
            string filename = uri.Substring(uri.LastIndexOf("\\") + 1);           
            FileStream fs = new FileStream(uri, FileMode.Open);
            byte[] bytes = new byte[(int)fs.Length];
            fs.Read(bytes, 0, (int)fs.Length);           
            fs.Close();           
            Response.ContentType = "application/octet-stream";           
            Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));           
            Response.BinaryWrite(bytes);           
            Response.Flush();            
            Response.End();
        }
    }
}
