using System;
using System.Collections.Generic;

namespace APIController.Models;

public partial class SlotTime
{
    public int Id { get; set; }

    public TimeSpan? StartTime { get; set; }

    public TimeSpan? EndTime { get; set; }

    public virtual ICollection<Slot> Slots { get; set; } = new List<Slot>();
}
