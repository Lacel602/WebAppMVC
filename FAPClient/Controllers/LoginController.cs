using FAPClient.API;
using FAPClient.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace FAPClient.Controllers
{
    public class LoginController : Controller
    {
        GetData gd = new GetData();
        public async Task<IActionResult> IndexAsync()
        {
            List<CampusDTO> list = await gd.GetAllCampus();
            ViewBag.ListCampus = list;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> IndexAsync(string email, string password, int campus)
        {
            UserDTO user = await gd.GetUserByEmailAsync(email);
            if (email == null || password == null || campus == 0)
            {
                TempData["Message"] = "Hãy điền đầy đủ thông tin!";
                return RedirectToAction("Index");
            }

            if (user == null)
            {
                TempData["Message"] = "Tài khoản không được phép đăng nhập vào hệ thống!";
                return RedirectToAction("Index");
            }
            else
            {
                if (!password.Contains(user.Password))
                {
                    TempData["Message"] = "Sai tài khoàn hoặc mật khẩu!";
                    return RedirectToAction("Index");
                }
                if (campus != user.CampusId)
                {
                    TempData["Message"] = "Tài khoản không được phép đăng nhập vào hệ thống!";
                    return RedirectToAction("Index");
                }
            }

            string jsonData = JsonConvert.SerializeObject(user);
            HttpContext.Session.SetString("User", jsonData);

            return RedirectToAction("Index", "Home");
        }
    }


}
