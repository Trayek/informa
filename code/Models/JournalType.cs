namespace ms8.code.Models
{
    public class JournalType : IHasName, IIsFolder
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool IsFolder { get { return false; } }
        public string ParentId => null;
    }
}
