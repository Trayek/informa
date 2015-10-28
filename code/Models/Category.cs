namespace ms8.code.Models
{
    public class Category : IHasName, IHasId
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool IsFolder { get; set; }
        public string ParentId => IsFolder ? null : Id[0].ToString().ToLower();
    }
}
