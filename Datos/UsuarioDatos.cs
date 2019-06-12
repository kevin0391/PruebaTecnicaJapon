using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidad;
using Componete;

namespace Datos
{
    public class UsuarioDatos
    {
        public bool Autenticacion(UsuarioEntidad usuarioEntidad)
        {
            using (DataClassesDataContext context = new DataClassesDataContext())
            {
                try
                {
                    var query = (from t0 in context.TablaUsuarios where t0.Email == usuarioEntidad.Email && t0.Contraseña == usuarioEntidad.Contraseña select t0).FirstOrDefault();

                    if (query == null)
                    {
                        return false;
                    }
                    else
                    {
                        return true;
                    }
                }

                catch
                {
                    return false;
                }
            }
        }

        public bool Validacion(UsuarioEntidad usuarioEntidad)
        {
            using (DataClassesDataContext context = new DataClassesDataContext())
            {
                try
                {
                    var query = (from t0 in context.TablaUsuarios where t0.Email == usuarioEntidad.Email && t0.FechaNacimiento == usuarioEntidad.FechaNacimiento select t0).FirstOrDefault();

                    if (query == null)
                    {
                        return false;
                    }

                    else
                    {
                        DateTime ahora = DateTime.Now;

                        TablaCambioContraseña tablaCambioContraseña = new TablaCambioContraseña();
                        tablaCambioContraseña.Token = Guid.NewGuid();
                        tablaCambioContraseña.IdUsuario = query.IdUsuario;
                        tablaCambioContraseña.Utiliazado = false;
                        tablaCambioContraseña.FechaVencimiento = new DateTime(ahora.Year,ahora.Month,ahora.Day,ahora.Hour+4,ahora.Minute,ahora.Second);

                        if (!new EmailComponente().EnviarCorreoElectronico(query.Email, tablaCambioContraseña.Token.ToString()))
                        {
                            throw new Exception();
                        }

                        context.TablaCambioContraseñas.InsertOnSubmit(tablaCambioContraseña);
                        context.SubmitChanges();

                        return true;
                    }
                }

                catch
                {
                    return false;
                }
            }
        }

        public string ValidarToken(string token)
        {
            using (DataClassesDataContext context = new DataClassesDataContext())
            {
                try
                {
                    var query = (from t0 in context.TablaCambioContraseñas where t0.Token == Guid.Parse(token) select t0).FirstOrDefault();

                    if (query == null)
                    {
                        throw new Exception("Token inválido");
                    }

                    if (query.Utiliazado == true)
                    {
                        throw new Exception("Token utilizado");
                    }

                    if (DateTime.Now > query.FechaVencimiento)
                    {
                        throw new Exception("Token vencido");
                    }

                    return "Correcto";
                }

                catch(Exception e)
                {
                    return e.Message;
                }
            }
        }

        public bool RestablecerContraseña(string contraseña, string token)
        {
            using (DataClassesDataContext context = new DataClassesDataContext())
            {
                try
                {
                    var query = (from t0 in context.TablaCambioContraseñas where t0.Token == Guid.Parse(token) select t0).FirstOrDefault();
                    var queryUsuario = (from t0 in context.TablaUsuarios where t0.IdUsuario == query.IdUsuario select t0).FirstOrDefault();

                    queryUsuario.Contraseña = contraseña;
                    query.Utiliazado = true;
                
                    context.SubmitChanges();

                    return true;
                }

                catch
                {
                    return false;
                }
            }
        }
    }
}
