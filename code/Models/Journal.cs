using System.Collections.Generic;

namespace ms8.code.Models
{
    public class Journal : IHasId, IHasName
    {
        public string ParentId { get; set; }
        public string Id { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public IEnumerable<string> Categories { get; set; }

        public IEnumerable<string> Types { get; set; } 
    }
}
