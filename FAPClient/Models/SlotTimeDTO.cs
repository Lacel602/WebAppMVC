namespace FAPClient.Models
{
    internal class SlotTimeDTO
    {
        public int Id { get; set; }

        public TimeSpan? StartTime { get; set; }

        public TimeSpan? EndTime { get; set; }

        public virtual ICollection<SlotDTO> Slots { get; set; } = new List<SlotDTO>();
    }
}
