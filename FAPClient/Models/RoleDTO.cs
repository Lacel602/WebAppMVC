namespace FAPClient.Models
{
    internal class RoleDTO
    {
        public int Id { get; set; }

        public string? Type { get; set; }

        public virtual ICollection<UserDTO> Users { get; set; } = new List<UserDTO>();
    }
}