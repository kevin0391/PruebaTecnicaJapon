using System;

namespace Entidad
{
    public class UsuarioEntidad
    {
        public int IdUsuario { get; set; }
        public string Email { get; set; }
        public string Contraseña { get; set; }
        public string  Nombre { get; set; }
        public DateTime FechaNacimiento { get; set; }
    }
}
