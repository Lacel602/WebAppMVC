namespace FAPClient.Models
{
    internal class UserDTO
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

        public virtual CampusDTO Campus { get; set; } = null!;

        public virtual RoleDTO Role { get; set; } = null!;

        public virtual ICollection<SlotDTO> Slots { get; set; } = new List<SlotDTO>();

        public virtual ICollection<ClassDTO> Classes { get; set; } = new List<ClassDTO>();

        public virtual ICollection<CourseDTO> Courses { get; set; } = new List<CourseDTO>();
    }
}