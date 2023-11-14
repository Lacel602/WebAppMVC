using FAPClient.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Diagnostics;

namespace FAPClient.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            string jsonData = HttpContext.Session.GetString("User");
            if (jsonData == null)
            {
                return RedirectToAction("Index", "Login");
            }
            UserDTO user = JsonConvert.DeserializeObject<UserDTO>(jsonData);
            ViewBag.User = user;
            return View();
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Login");
        }
    }
}