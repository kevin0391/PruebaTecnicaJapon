using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Entidad;
using Negocio;

namespace Presentacion.Controllers
{
    public class EmpleadoController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult IngresoEmpleado(int DPI, string Nombre, int Hijos, float SalarioBase)
        {
            EmpleadoEntidad empleadoEntidad = new EmpleadoEntidad();
            empleadoEntidad.DPI = DPI;
            empleadoEntidad.Nombre = Nombre;
            empleadoEntidad.Hijo = Hijos;
            empleadoEntidad.SalarioBase = SalarioBase;

            if (new EmpleadoNegocio().CrearEmpleado(empleadoEntidad))
            {
                return Json(true);
            }

            return Json(false);
        }
    }
}