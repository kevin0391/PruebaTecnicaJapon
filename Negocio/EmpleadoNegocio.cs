using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidad;

namespace Negocio
{
    public class EmpleadoNegocio
    {
        public bool CrearEmpleado(EmpleadoEntidad empleadoEntidad) => new EmpleadoDatos().CrearEmpleado(empleadoEntidad);
    }
}
