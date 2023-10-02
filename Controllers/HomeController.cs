using Microsoft.AspNetCore.Mvc;

namespace TP09.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
}
