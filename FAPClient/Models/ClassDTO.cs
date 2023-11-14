namespace FAPClient.Models
{
    internal class ClassDTO
    {
        public int Id { get; set; }

        public string? Code { get; set; }

        public virtual ICollection<SlotDTO> Slots { get; set; } = new List<SlotDTO>();

        public virtual ICollection<UserDTO> Students { get; set; } = new List<UserDTO>();
    }
}
