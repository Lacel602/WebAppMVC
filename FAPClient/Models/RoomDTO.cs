namespace FAPClient.Models
{
    internal class RoomDTO
    {
        public int Id { get; set; }

        public string? Name { get; set; }

        public virtual ICollection<SlotDTO> Slots { get; set; } = new List<SlotDTO>();
    }
}
