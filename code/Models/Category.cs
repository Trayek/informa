namespace ms8.code.Models
{
    class Category: IHasName, IHasId
    {
        public string Id { get; set; }
        public string Name { get; set; }
    }
}
