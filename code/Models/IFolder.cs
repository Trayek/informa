namespace ms8.code.Models
{
    public interface IFolder : IHasId
    {
        bool IsFolder { get; }

        string ParentId { get; }
    }
}