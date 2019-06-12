using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidad;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public bool Autenticacion(UsuarioEntidad usuarioEntidad) => new UsuarioDatos().Autenticacion(usuarioEntidad);

        public bool Validacion(UsuarioEntidad usuarioEntidad) => new UsuarioDatos().Validacion(usuarioEntidad);

        public string ValidarToken(string token) => new UsuarioDatos().ValidarToken(token);

        public bool RestablecerContraseña(string contraseña, string token) => new UsuarioDatos().RestablecerContraseña(contraseña, token);
    }
}
