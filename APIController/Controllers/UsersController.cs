using APIController.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace APIController.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        [HttpGet("GetUserByEmail/{Email}")]
        public IActionResult GetUserByEmail(string Email)
        {
            using (Prn231ProjectContext context = new Prn231ProjectContext())
            {
                var user = context.Users.Include(u => u.Campus).Include(u => u.Role).Where(u => u.Email.Contains(Email)).ToList().Select(u =>
                {
                    u.Campus.Users = null!; 
                    u.Role.Users = null!;
                    return u;
                }).FirstOrDefault();
                return Ok(user);
            }
        }
    }
}
