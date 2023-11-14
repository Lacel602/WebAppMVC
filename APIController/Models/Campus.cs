using System;
using System.Collections.Generic;

namespace APIController.Models;

public partial class Campus
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
