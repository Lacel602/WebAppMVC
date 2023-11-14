using APIController.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace APIController.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SlotController : ControllerBase
    {
        [HttpGet("GetAllSlotByCur")]
        public IActionResult GetAllSlotByCur()
        {
            using (Prn231ProjectContext context = new Prn231ProjectContext())
            {
                DateTime date = DateTime.Today;
                var data = context.Slots.Include(s => s.Room).Include(s => s.Teacher).Include(s => s.Class).Include(s => s.Course).Include(s => s.Time)
                    .Where(s => s.Week >= date)
                    .ToList().Select(s =>
                    {
                        s.Room.Slots = null!;
                        s.Teacher.Slots = null!;
                        s.Class.Slots = null!;
                        s.Course.Slots = null!;
                        s.Time.Slots = null!;
                        return s;
                    });
                return Ok(data);
            }
        }


        [HttpGet("GetStudentSlot/{Id}/{StartDate}/{EndDate}")]
        public IActionResult GetStudentSlot(int Id, DateTime StartDate, DateTime EndDate)
        {
            using (Prn231ProjectContext context = new Prn231ProjectContext())
            {
                if (context.Users.Where(u => u.Uid == Id).FirstOrDefault() == null)
                {
                    return BadRequest("User not exist");
                }
                if (StartDate > EndDate)
                {
                    return BadRequest("StartDate must be smaller than EndDate");
                }
                if (context.Users.Where(u => u.Uid == Id).FirstOrDefault().RoleId != 3)
                {
                    return BadRequest("User not exist");
                }
                var allClass = context.Classes.Include(c => c.Students).ToList().Select(c =>
                {
                    foreach (var student in c.Students)
                    {
                        student.Classes = null!;
                    }
                    return c;
                });

                List<string> listClass = new List<string>();

                foreach (var item in allClass)
                {
                    if (item.Students.Any(s => s.Uid == Id))
                    {
                        listClass.Add("C" + item.Id);
                    }
                }

                List<Slot> listSlot = new List<Slot>();

                var data = context.Slots.Include(s => s.Room).Include(s => s.Teacher).Include(s => s.Class).Include(s => s.Course).Include(s => s.Time)
                    .Where(s => s.Week >= StartDate && s.Week <= EndDate)
                    .ToList().Select(s =>
                    {
                        s.Room.Slots = null!;
                        s.Teacher.Slots = null!;
                        s.Class.Slots = null!;
                        s.Course.Slots = null!;
                        s.Time.Slots = null!;
                        return s;
                    });
                foreach (var item in data)
                {
                    foreach (var c in listClass)
                    {
                        if (GetString(item.ValiCode, 3).Equals(c))
                        {
                            listSlot.Add(item);
                        }
                    }
                }
                return Ok(listSlot);
            }
        }

        [HttpGet("GetTeacherSlot/{Id}/{StartDate}/{EndDate}")]
        public IActionResult GetTeacherSlot(int Id, DateTime StartDate, DateTime EndDate)
        {
            using (Prn231ProjectContext context = new Prn231ProjectContext())
            {
                if (context.Users.Where(u => u.Uid == Id).FirstOrDefault() == null)
                {
                    return BadRequest("User not exist");
                }
                if (StartDate > EndDate)
                {
                    return BadRequest("StartDate must be smaller than EndDate");
                }
                if (context.Users.Where(u => u.Uid == Id).FirstOrDefault().RoleId != 2)
                {
                    return BadRequest("User not exist");
                }

                List<Slot> listSlot = new List<Slot>();

                var data = context.Slots.Include(s => s.Room).Include(s => s.Teacher).Include(s => s.Class).Include(s => s.Course).Include(s => s.Time)
                    .Where(s => s.Week >= StartDate && s.Week <= EndDate)
                    .ToList().Select(s =>
                    {
                        s.Room.Slots = null!;
                        s.Teacher.Slots = null!;
                        s.Class.Slots = null!;
                        s.Course.Slots = null!;
                        s.Time.Slots = null!;
                        return s;
                    });
                foreach (var item in data)
                {
                    if (GetString(item.ValiCode, 4).Equals("T" + Id))
                    {
                        listSlot.Add(item);
                    }
                }
                return Ok(listSlot);
            }
        }

        [HttpGet("GetSlotByCourseAndUidAndClass/{Uid}/{courseId}/{ClassId}")]
        public IActionResult GetSlotByCourseAndUidAndClass(int Uid, int courseId, int ClassId)
        {
            using (Prn231ProjectContext context = new Prn231ProjectContext())
            {
                if (context.Users.Where(u => u.Uid == Uid).FirstOrDefault() == null)
                {
                    return NotFound("User not exist!");
                }
                if (context.Users.Where(u => u.Uid == Uid).FirstOrDefault().RoleId != 2)
                {
                    return BadRequest("User not exist!");
                }

                var data = context.Slots.Include(s => s.Room).Include(s => s.Teacher).Include(s => s.Class).Include(s => s.Course).Include(s => s.Time)
                    .Where(s => s.CourseId == courseId && s.TeacherId == Uid && s.ClassId == ClassId)
                    .ToList().Select(s =>
                    {
                        s.Room.Slots = null!;
                        s.Teacher.Slots = null!;
                        s.Class.Slots = null!;
                        s.Course.Slots = null!;
                        s.Time.Slots = null!;
                        return s;
                    });
                return Ok(data);
            }
        }

        [HttpGet("GetSlotById/{id}")]
        public IActionResult GetSlotById(int id)
        {
            using (Prn231ProjectContext context = new Prn231ProjectContext())
            {
                var slot = context.Slots.Include(s => s.Room).Include(s => s.Teacher).Include(s => s.Class).Include(s => s.Course).Include(s => s.Time)
                    .Where(s => s.Id == id)
                    .ToList().Select(s =>
                    {
                        s.Room.Slots = null!;
                        s.Teacher.Slots = null!;
                        s.Class.Slots = null!;
                        s.Course.Slots = null!;
                        s.Time.Slots = null!;
                        return s;
                    }).FirstOrDefault();
                if (slot == null)
                {
                    return NotFound();
                }
                else
                {
                    return Ok(slot);
                }
            }
        }

        [HttpPut("UpdateSlot")]
        public IActionResult UpdateSlot(Slot slot)
        {
            using (Prn231ProjectContext context = new Prn231ProjectContext())
            {

                var data = context.Slots.Include(s => s.Room).Include(s => s.Teacher).Include(s => s.Class).Include(s => s.Course).Include(s => s.Time)
                    .Where(s => s.Id == slot.Id)
                    .ToList().Select(s =>
                    {
                        s.Room.Slots = null!;
                        s.Teacher.Slots = null!;
                        s.Class.Slots = null!;
                        s.Course.Slots = null!;
                        s.Time.Slots = null!;
                        return s;
                    }).FirstOrDefault();

                //Models.Slot data = context.Slots.FirstOrDefault(s => s.Id == id);

                if (slot.Id == null)
                {
                    return BadRequest();
                }
                if (data == null)
                {
                    return NotFound();
                }

                data.RoomId = slot.RoomId;
                data.TimeId = slot.TimeId;
                data.Week = slot.Week;

                context.SaveChanges();
                return Ok(data);
            }
        }

        static string GetString(string input, int index)
        {
            string[] parts = input.Split('_');

            if (index >= 0 && index < parts.Length)
            {
                return parts[index];
            }
            return string.Empty;
        }

    }
}
