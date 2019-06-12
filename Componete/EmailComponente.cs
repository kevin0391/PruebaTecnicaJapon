using System.Net;
using System.Net.Mail;

namespace Componete
{
    public class EmailComponente
    {
        public bool EnviarCorreoElectronico(string correCliente, string token)
        {
            try
            {
                string body_correo = "";
                body_correo += "Estimado cliente, ";
                body_correo += "<br/><br/>";
                body_correo += "<br/><br/>";
                body_correo += "Para restrablecer su contraseña clic en siguiente link:ss http://localhost:50402/Account/Reset?Token=" + token;

                MailMessage mail = new MailMessage();
                mail.To.Add(new MailAddress(correCliente));
                mail.From = new MailAddress("prueba.tecnica.japon@gmail.com");
                mail.Subject = "Restablecer contraseña - Prueba Técnica";
                mail.IsBodyHtml = true;
                mail.Body = body_correo;
                mail.Priority = MailPriority.Normal;

                SmtpClient client = new SmtpClient();
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("prueba.tecnica.japon@gmail.com", "pruebatecnica...");

                client.Send(mail);
                client.Dispose();

                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
