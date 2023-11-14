using APIController.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace APIController.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CampusController : ControllerBase
    {
        [HttpGet("GetAllCampus")]
        public IActionResult GetAllCampus()
        {
            using (Prn231ProjectContext context = new Prn231ProjectContext())
            {
                var data = context.Campuses.ToList();
                return Ok(data);
            }
        }
    }
}
