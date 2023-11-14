using System;
using System.Collections.Generic;

namespace APIController.Models;

public partial class Slot
{
    public int Id { get; set; }

    public int? TimeId { get; set; }

    public int? RoomId { get; set; }

    public string? MeetUrl { get; set; }

    public string? EduNext { get; set; }

    public int? CourseId { get; set; }

    public int? TeacherId { get; set; }

    public int? ClassId { get; set; }

    public DateTime? Week { get; set; }

    public string? ValiCode { get; set; }

    public virtual Class? Class { get; set; }

    public virtual Course? Course { get; set; }

    public virtual Room? Room { get; set; }

    public virtual User? Teacher { get; set; }

    public virtual SlotTime? Time { get; set; }
}
