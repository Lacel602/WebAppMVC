using APIController.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace APIController.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomController : ControllerBase
    {
        [HttpGet("GetAllRoom")]
        public IActionResult GetAllRoom()
        {
            using (Prn231ProjectContext context = new Prn231ProjectContext())
            {
                var data = context.Rooms.ToList();
                return Ok(data);
            }
        }
    }
}
