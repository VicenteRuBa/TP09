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
    public IActionResult Registro(Usuario Usuario)
    {
        Account.IngresarUsuario(Usuario);
        return View();
    }
    public IActionResult OlvideMiContraseña(Usuario Usuario, string NuevaContra)
    {
        Account.ActualizarContraseña(Usuario, NuevaContra);
        return View();
    }
    public IActionResult PostLogin(Usuario Usuario)
    {
        ViewBag.Usuario = Usuario;
        return View();
    }
}
