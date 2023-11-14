using APIController.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace APIController.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClassController : ControllerBase
    {
        [HttpGet("GetAllStudentInClass/{classId}")]
        public IActionResult GetAllStudentInClass(int classId)
        {
            using (Prn231ProjectContext context = new Prn231ProjectContext())
            {
                var user = context.Users.Include(u => u.Campus).Include(u => u.Role).Include(u => u.Classes).ToList().Select(u =>
                {
                    u.Campus.Users = null!;
                    u.Role.Users = null!;
                    foreach (Class c in u.Classes)
                    {
                        c.Students = null!;
                    }
                    return u;
                }).Where(u => u.Classes.Any(c => c.Id == classId));

                return Ok(user);
            }
        }


        [HttpGet("GetClassByTeacherId/{Uid}/{courseId}")]
        public IActionResult GetClassByTeacherIdAndCourseId(int Uid, int courseId)
        {
            using (Prn231ProjectContext context = new Prn231ProjectContext())
            {
                var user = context.Users.Where(u => u.Uid == Uid).FirstOrDefault();
                List<Models.Class> listClass = new List<Models.Class>();
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
                    var listSlot = context.Slots.Include(s => s.Room).Include(s => s.Teacher).Include(s => s.Class).Include(s => s.Course).Include(s => s.Time)
                    .Where(s => s.CourseId == courseId && s.TeacherId == Uid)
                    .ToList().Select(s =>
                    {
                        s.Room.Slots = null!;
                        s.Teacher.Slots = null!;
                        s.Class.Slots = null!;
                        s.Course.Slots = null!;
                        s.Time.Slots = null!;
                        return s;
                    });

                    foreach (var slot in listSlot)
                    {
                        if (slot.CourseId == courseId && slot.TeacherId == Uid)
                        {
                            if (listClass.Count == 0)
                            {
                                listClass.Add(slot.Class);
                            }
                            else
                            {
                                if (!IsExist(slot.ClassId, listClass))
                                {
                                    listClass.Add(slot.Class);
                                }
                            }
                        }
                    }
                }
                return Ok(listClass);
            }
        }

        private bool IsExist(int? classId, List<Class> listClass)
        {
            foreach (Models.Class item in listClass)
            {
                if (item.Id == classId)
                {
                    return true;
                }
            }
            return false;
        }
    }
}
