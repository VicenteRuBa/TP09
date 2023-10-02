using Microsoft.AspNetCore.Mvc;
using TP09.Models;
namespace TP09.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult Login()
    {
        
    }  

}
