using FAPClient.API;
using FAPClient.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace FAPClient.Controllers
{
    public class TimeTableController : Controller
    {
        GetData gd = new GetData();

        [HttpGet]
        public async Task<IActionResult> IndexAsync()
        {
            //Validate User
            string jsonData = HttpContext.Session.GetString("User");
            if (jsonData == null)
            {
                return RedirectToAction("Index", "Login");
            }
            UserDTO user = JsonConvert.DeserializeObject<UserDTO>(jsonData);
            ViewBag.User = user;

            //Get current time
            DateTime today = DateTime.Today;
            ViewBag.Date = today;
            ViewBag.Week = 0;
            int delta = DayOfWeek.Monday - today.DayOfWeek;
            DateTime startDate = today.AddDays(delta);
            DateTime endDate = startDate.AddDays(6);

            //Check role user
            if (user.Role.Type.Equals("Student"))
            {
                List<SlotDTO> slots = await gd.GetStudentSlot(user.Uid, startDate, endDate);
                ViewBag.ListSlot = slots;
                TempData["Message"] = "";
                return View();
            }
            else
            {
                if (user.Role.Type.Equals("Teacher"))
                {
                    List<SlotDTO> slots = await gd.GetTeacherSlot(user.Uid, startDate, endDate);
                    ViewBag.ListSlot = slots;
                    return View();
                }
                return RedirectToAction("Index", "Login");
            }
        }
        [HttpPost]
        public async Task<IActionResult> IndexAsync(DateTime startTime, int week)
        {
            DateTime today = DateTime.Today;
            ViewBag.Date = startTime;
            ViewBag.Week = week;
            string jsonData = HttpContext.Session.GetString("User");
            if (jsonData == null)
            {
                return RedirectToAction("Index", "Login");
            }
            UserDTO user = JsonConvert.DeserializeObject<UserDTO>(jsonData);
            ViewBag.User = user;

            DateTime endTime = startTime.AddDays(6);

            if (user.Role.Type.Equals("Student"))
            {
                List<SlotDTO> slots = await gd.GetStudentSlot(user.Uid, startTime, endTime);
                ViewBag.ListSlot = slots;
                TempData["Message"] = "";
                return View();
            }
            else
            {
                if (user.Role.Type.Equals("Teacher"))
                {
                    List<SlotDTO> slots = await gd.GetTeacherSlot(user.Uid, startTime, endTime);
                    ViewBag.ListSlot = slots;
                    return View();
                }
                return RedirectToAction("Index", "Login");
            }
        }

        [HttpGet]
        public IActionResult ChangeSlot()
        {
            //Validate User
            string jsonData = HttpContext.Session.GetString("User");
            if (jsonData == null)
            {
                return RedirectToAction("Index", "Login");
            }
            UserDTO user = JsonConvert.DeserializeObject<UserDTO>(jsonData);
            ViewBag.User = user;

            //Check role user
            if (user.Role.Type.Equals("Student"))
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {
                if (user.Role.Type.Equals("Teacher"))
                {
                    return View();
                }
                return RedirectToAction("Index", "Login");
            }
        }

        [HttpGet]
        public async Task<IActionResult> EditSlotAsync(int id)
        {
            //Validate User
            string jsonData = HttpContext.Session.GetString("User");
            if (jsonData == null)
            {
                return RedirectToAction("Index", "Login");
            }
            UserDTO user = JsonConvert.DeserializeObject<UserDTO>(jsonData);
            ViewBag.User = user;

            //Check role user
            if (user.Role.Type.Equals("Student"))
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {
                if (user.Role.Type.Equals("Teacher"))
                {
                    List<RoomDTO> listRoom = await gd.GetAllRoom();
                    ViewBag.Rooms = listRoom;
                    List<SlotTimeDTO> listSlotTime = await gd.GetAllSlotTime();
                    ViewBag.SlotTimes = listSlotTime;
                    SlotDTO slot = await gd.GetSlotById(id);
                    ViewBag.Slot = slot;
                    return View();
                }
                return RedirectToAction("Index", "Login");
            }
        }


        [HttpPost]
        public async Task<IActionResult> EditSlotAsync(int id, int room, int slot, DateTime newDate)
        {
            //Validate User           
            string jsonData = HttpContext.Session.GetString("User");
            if (jsonData == null)
            {
                return RedirectToAction("Index", "Login");
            }
            UserDTO user = JsonConvert.DeserializeObject<UserDTO>(jsonData);
            ViewBag.User = user;

            //Check role user
            if (user.Role.Type.Equals("Student"))
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {
                if (user.Role.Type.Equals("Teacher"))
                {

                    int slotId = 0;

                    if (id != null)
                    {
                        slotId = Int32.Parse(id.ToString());
                    }

                    List<RoomDTO> listRoom = await gd.GetAllRoom();
                    ViewBag.Rooms = listRoom;
                    List<SlotTimeDTO> listSlotTime = await gd.GetAllSlotTime();
                    ViewBag.SlotTimes = listSlotTime;

                    SlotDTO thisSlot = await gd.GetSlotById(slotId);
                    ViewBag.Slot = thisSlot;
                    List<SlotDTO> list = await gd.GetAllSlotCurr();
                    list.Remove(thisSlot);
                    if (newDate == null)
                    {
                        newDate = (DateTime)thisSlot.Week;
                        newDate = newDate.Date;
                    }
                    else
                    {
                        thisSlot.Week = newDate;
                        newDate = newDate.Date;
                    }

                    if (room != null)
                    {
                        if (room != thisSlot.RoomId)
                        {
                            thisSlot.RoomId = room;
                        }
                    }

                    if (slot != null)
                    {
                        if (slot != thisSlot.TimeId)
                        {
                            thisSlot.TimeId = slot;
                        }
                    }

                    foreach (SlotDTO sl in list)
                    {
                        if ((newDate == sl.Week) && (thisSlot.TimeId == sl.TimeId) && (thisSlot.TeacherId == sl.TeacherId))
                        {
                            TempData["Message"] = "Duplicate slot for a teacher!";
                            return View();
                        }
                        if ((newDate == sl.Week) && (thisSlot.TimeId == sl.TimeId) && (thisSlot.RoomId == sl.RoomId))
                        {
                            TempData["Message"] = "Duplicate slot in a room in a time!";
                            return View();
                        }

                        List<UserDTO> thisSlotList = await gd.GetAllStudentInClass(thisSlot.ClassId);
                        List<UserDTO> slList = await gd.GetAllStudentInClass(sl.ClassId);

                        if ((thisSlotList == slList) && (newDate == sl.Week) && (thisSlot.TimeId == sl.TimeId))
                        {
                            TempData["Message"] = "Duplicate slot for a student!";
                            return View();
                        }
                    }

                    await gd.PutSlotAsync(thisSlot);
                    return View();
                    //return RedirectToAction("ChangeSlot", "TimeTable");

                }
                return RedirectToAction("Index", "Login");
            }
        }

    }
}
