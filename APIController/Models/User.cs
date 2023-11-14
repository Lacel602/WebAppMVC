using System;
using System.Collections.Generic;

namespace APIController.Models;

public partial class User
{
    public int Uid { get; set; }

    public string? FullName { get; set; }

    public string? Code { get; set; }

    public string Email { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string? Phone { get; set; }

    public int CampusId { get; set; }

    public string? Image { get; set; }

    public int RoleId { get; set; }

    public virtual Campus Campus { get; set; } = null!;

    public virtual Role Role { get; set; } = null!;

    public virtual ICollection<Slot> Slots { get; set; } = new List<Slot>();

    public virtual ICollection<Class> Classes { get; set; } = new List<Class>();

    public virtual ICollection<Course> Courses { get; set; } = new List<Course>();
}
