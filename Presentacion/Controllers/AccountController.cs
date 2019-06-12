using System.Web.Mvc;
using System.Web.Security;
using Negocio;
using Entidad;
using System;

namespace Presentacion.Controllers
{
    public class AccountController : Controller
    {
        [HttpGet]
        public ActionResult Login()
        {
            if (!string.IsNullOrEmpty(User.Identity.Name)) return RedirectToAction("Index", "Home", new { Area = "" });

            ViewBag.Titulo = "Login";

            return View();
        }

        [HttpPost]
        public ActionResult Login(string Email, string Contraseña)
        {
            UsuarioEntidad usuarioEntidad = new UsuarioEntidad();
            usuarioEntidad.Email = Email;
            usuarioEntidad.Contraseña = Contraseña;
        
            if (new UsuarioNegocio().Autenticacion(usuarioEntidad))
            {
                FormsAuthentication.SetAuthCookie(Email.ToUpper(), true);

                return Json(true);
            }

            return Json(false);
        }

        [HttpGet]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("Login", "Account", new { Area = "" });
        }

        [HttpGet]
        public ActionResult Forget()
        {
            ViewBag.Titulo = "Forget";

            return View();
        }

        [HttpPost]
        public ActionResult Forget(string Email, DateTime FechaNacimiento)
        {
            UsuarioEntidad usuarioEntidad = new UsuarioEntidad();
            usuarioEntidad.Email = Email;
            usuarioEntidad.FechaNacimiento = FechaNacimiento;

            if (new UsuarioNegocio().Validacion(usuarioEntidad))
            {
                return Json(true);
            }

            return Json(false);
        }

        [HttpGet]
        public ActionResult Reset(string Token)
        {
            ViewBag.Titulo = "Reset";
            ViewBag.Token = Token;
            ViewBag.MnesajeToken = new UsuarioNegocio().ValidarToken(Token);

            return View();
        }

        [HttpPost]
        public ActionResult Reset(string Contraseña, string Token)
        {
            if (new UsuarioNegocio().RestablecerContraseña(Contraseña, Token))
            {
                return Json(true);
            }

            return Json(false);
        }
    }
}