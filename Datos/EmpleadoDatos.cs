using Entidad;
using System;

namespace Datos
{
    public class EmpleadoDatos
    {
        public bool CrearEmpleado(EmpleadoEntidad empleadoEntidad)
        {
            using (DataClassesDataContext Context = new DataClassesDataContext())
            {
                Context.Connection.Open();

                using (Context.Transaction = Context.Connection.BeginTransaction())
                {
                    try
                    {
                        TablaEmpleado tablaEmpleado = new TablaEmpleado();
                        tablaEmpleado.DPI = empleadoEntidad.DPI;
                        tablaEmpleado.Nombre = empleadoEntidad.Nombre;
                        tablaEmpleado.Hijo = empleadoEntidad.Hijo;
                        tablaEmpleado.SalarioBase = (decimal)empleadoEntidad.SalarioBase;
                        tablaEmpleado.FechaCreacion = DateTime.Now;
                        tablaEmpleado.IdUsuarioCreacion = 1;
                        tablaEmpleado.Estado = "A";

                        Context.TablaEmpleados.InsertOnSubmit(tablaEmpleado);
                        Context.SubmitChanges();
                        Context.Transaction.Commit();
                        return true;
                    }

                    catch (Exception ex)
                    {
                        Context.Transaction.Rollback();
                        return false;
                    }

                    finally { Context.Connection.Close(); }
                }
            }
        }
    }
}
