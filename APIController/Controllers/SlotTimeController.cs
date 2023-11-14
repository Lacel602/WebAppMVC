using APIController.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace APIController.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SlotTimeController : ControllerBase
    {
        [HttpGet("GetAllSlotTime")]
        public IActionResult GetAllSlotTime()
        {
            using (Prn231ProjectContext context = new Prn231ProjectContext())
            {
                var data = context.SlotTimes.ToList();
                return Ok(data);
            }
        }
    }
}
