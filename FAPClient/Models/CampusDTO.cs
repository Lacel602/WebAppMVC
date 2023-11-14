namespace FAPClient.Models
{
    internal class CampusDTO
    {
        public int Id { get; set; }

        public string? Name { get; set; }

        public virtual ICollection<UserDTO> Users { get; set; } = new List<UserDTO>();
    }
}