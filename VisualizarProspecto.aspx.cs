using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppProspectos.Models;

namespace WebAppProspectos
{
    public partial class VisualizarProspecto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string id = Request.QueryString[0];
                    MantenimientoProspectos objman = new MantenimientoProspectos();
                    var infProspecto = objman.Recuperar(Convert.ToInt32(id));
                    cnnombre.Value = infProspecto.Nombre;
                    cSegundoApellido.Value = infProspecto.SegundoApellido;
                    cCalle.Value = infProspecto.Calle;
                    cPrimerApellido.Value = infProspecto.PrimerApellido;
                    cNumero.Value = infProspecto.Numero;
                    ccolonia.Value = infProspecto.Colonia;
                    cCodigoPostal.Value = infProspecto.CP;
                    cTelefono.Value = infProspecto.Telefono;
                    cRFC.Value = infProspecto.RFC;
                    cObservaciones.Value = infProspecto.Observaciones;
                    if (infProspecto.Estatus != "Rechazado")
                    {
                        lblObservaciones.Visible = false;
                        cObservaciones.Visible = false;
                    }

                    List<Archivo> listArchivos = new List<Archivo>();
                    string DirectoryName = Request.MapPath("Archivos/"+id);
                    if (Directory.Exists(DirectoryName))
                    {
                        String[] Files = Directory.GetFiles(DirectoryName);
                        foreach (var a in Files)
                        {  
                            string fileName = Path.GetFileName(a);
                            listArchivos.Add(new Archivo { NombreArchivo=fileName,PathArchivo=a });
                        }
                        repeater1.DataSource = listArchivos;
                        repeater1.DataBind();
                    }

                }
                catch(Exception ex)
                {
                    Response.Redirect("Default.aspx");
                }                              
            }
        }
        /// <summary>
        /// Lee y descarga el archivo
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