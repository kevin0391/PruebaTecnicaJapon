using System;

namespace Entidad
{
    public class CambioContraseñaEntidad
    {
        public Guid Token { get; set; }
        public int IdUsuario { get; set; }
        public bool Utilizado { get; set; }
        public DateTime FechaVencimiento { get; set; }
    }
}
