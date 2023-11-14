namespace FAPClient.Models
{
    internal class CourseDTO
    {
        public int Id { get; set; }

        public string? Name { get; set; }

        public string? Code { get; set; }

        public virtual ICollection<SlotDTO> Slots { get; set; } = new List<SlotDTO>();

        public virtual ICollection<UserDTO> Teachers { get; set; } = new List<UserDTO>();
    }
}
