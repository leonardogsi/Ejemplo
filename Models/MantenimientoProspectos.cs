using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebAppProspectos.Context;

namespace WebAppProspectos.Models
{
    /// <summary>
    /// Clase para Obtener,Agregar,Actualizar la información del prospecto
    /// </summary>
    public class MantenimientoProspectos
    {

        private ApplicationDbContext _applicationDbContext;

        /// <summary>
        /// Agrega un nuevo elemento a la tabla tblProspectos
        /// </summary>
        /// <param name="art">Objeto de clase Prospecto</param>
        /// <returns>Clase Result</returns>
        public Result Alta(Prospecto objProspecto)
        {
            Result rs = new Result();
            try
            {
                // GUARDA EL OBJETO DEL  EN LA BD.
                using (_applicationDbContext = new ApplicationDbContext())
                {

                    _applicationDbContext.Prospectos.Add(objProspecto);
                    _applicationDbContext.SaveChanges();

                }
                rs.Id = objProspecto.Id;
                rs.IsCorrecto = true;
                rs.Mensaje = "";
            }
            catch (Exception ex)
            {
                rs.IsCorrecto = false;
                rs.Mensaje = "Existió un error al obtener los datos";

            }
            return rs;
        }
        /// <summary>
        /// Obtiene la lista de prospectos de la base de datos
        /// </summary>
        /// <returns>Lista de Objeto Prospecto</returns>
        public Result RecuperarTodos()
        {
            Result rs = new Result();
            try
            {
                rs.ListProspectos = new List<Prospecto>();
                using (_applicationDbContext = new ApplicationDbContext())
                {
                    rs.ListProspectos = _applicationDbContext.Prospectos.OrderByDescending(x => x.Nombre).ToList();

                }
                rs.IsCorrecto = true;
                rs.Mensaje = "";

            }
            catch (Exception ex)
            {
                rs.IsCorrecto = false;
                rs.Mensaje = "Existió un error al obtener los datos";
            }

            return rs;
        }
        /// <summary>
        /// Obtiene la información de un prospecto por su identificador
        /// </summary>
        /// <param name="id">Identificador del prospecto</param>
        /// <returns>Objeto Prospecto</returns>
        public Prospecto Recuperar(int id)
        {

            Prospecto objProspecto = new Prospecto();
            using (_applicationDbContext = new ApplicationDbContext())
            {
                objProspecto = _applicationDbContext.Prospectos.Where(x => x.Id == id).FirstOrDefault();

            }
            return objProspecto;
        }

        /// <summary>
        /// Actualiza la información de un prospecto
        /// </summary>
        /// <param name="art"></param>
        /// <returns></returns>
        public Result Modificar(Prospecto objP)
        {
            Result rs = new Result();
            try
            {
                using (_applicationDbContext = new ApplicationDbContext())
                {
                    var objProspecto = _applicationDbContext.Prospectos.SingleOrDefault(x => x.Id == objP.Id);

                    if (objProspecto != null)
                    {
                        objProspecto.Estatus = objP.Estatus;
                        objProspecto.Observaciones = objP.Observaciones;
                        _applicationDbContext.SaveChanges();
                    }
                }
                rs.IsCorrecto = true;
                rs.Mensaje = "ok";
            }
            catch (Exception ex)
            {
                rs.IsCorrecto = false;
                rs.Mensaje = "Existió un error al modificar los datos";
            }
            return rs;
        }
    }
}