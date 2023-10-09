using Microsoft.AspNetCore.Mvc;
using TP09.Models;
namespace TP09.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        ViewBag.levantar = Account.ObtenerUsuarios();
        return View();
    }
    public IActionResult Registro()
    {
        ViewBag.levantar = Account.ObtenerUsuarios();
        return View();
    }
    public IActionResult OlvideMiContraseña(Usuario Usuario, string NuevaContra)
    {
        Account.ActualizarContraseña(Usuario, NuevaContra);
        return View();
    }
    public IActionResult PostLogin(string email, string contraseña)
    {
        ViewBag.Usuario = Account.BuscarUsuario(email, contraseña);
        return View();
    }
    public IActionResult PostRegistro(Usuario Usuario)
    {
        Account.IngresarUsuario(Usuario);
        return RedirectToAction("PostLogin", new{Usuario = Usuario});
    }
}
