using System;
using System.Collections.Generic;
namespace ms8.code.Models
{
    public class Journal : IHasId, IHasName
    {
        public Journal()
        {
            Types = new string[0];
            Categories = new string[0];
        }

        public string ParentId { get; set; }
        public string Id { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public IEnumerable<string> Categories { get; set; }

        public IEnumerable<string> Types { get; set; } 

        public string ISBN { get; set; }

        public string SubjectGroup { get; set; }

        public string PublisherDescription { get; set; }
        public DateTime PublicationDate { get; set; }

        public string TableOfContents { get; set; }
    }
}
