namespace FAPClient.Models
{
    internal class SlotDTO
    {
        public int Id { get; set; }

        public int? TimeId { get; set; }

        public int? RoomId { get; set; }

        public string? MeetUrl { get; set; }

        public string? EduNext { get; set; }

        public int? CourseId { get; set; }

        public int? TeacherId { get; set; }

        public int? ClassId { get; set; }

        public DateTime? Week { get; set; }

        public string? ValiCode { get; set; }

        public virtual ClassDTO? Class { get; set; }

        public virtual CourseDTO? Course { get; set; }

        public virtual RoomDTO? Room { get; set; }

        public virtual UserDTO? Teacher { get; set; }

        public virtual SlotTimeDTO? Time { get; set; }
    }
}
