using System;
using System.Collections.Generic;

namespace APIController.Models;

public partial class Room
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Slot> Slots { get; set; } = new List<Slot>();
}
