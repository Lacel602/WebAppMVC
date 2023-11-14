using APIController.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace APIController.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseController : ControllerBase
    {

        [HttpGet("GetCourseById/{Id}")]
        public IActionResult GetCourseById(int Id)
        {
            using (Prn231ProjectContext context = new Prn231ProjectContext())
            {
                var user = context.Users.Where(u => u.Uid == Id).FirstOrDefault();
                if (user == null)
                {
                    return NotFound("No user found!");
                }
                if (user.RoleId != 2)
                {
                    return BadRequest("User isn't  a teacher!");
                }
                else
                {
                    var list = context.Courses.Include(c => c.Teachers).Where(c => c.Teachers.Any(t => t.Uid == Id)).ToList().Select(c =>
                    {
                        foreach (var t in c.Teachers)
                        {
                            t.Courses = null!;
                        }
                        return c;
                    });
                    return Ok(list);
                }
            }
        }
    }
}
