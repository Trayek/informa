namespace ms8.code.Models
{
    public interface IIsFolder : IHasId
    {
        bool IsFolder { get; }

        string ParentId { get; }
    }
}