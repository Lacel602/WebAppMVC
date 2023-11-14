using System;
using System.Collections.Generic;

namespace APIController.Models;

public partial class Class
{
    public int Id { get; set; }

    public string? Code { get; set; }

    public virtual ICollection<Slot> Slots { get; set; } = new List<Slot>();

    public virtual ICollection<User> Students { get; set; } = new List<User>();
}
