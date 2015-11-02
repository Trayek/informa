using System;
using System.Collections.Generic;
namespace ms8.code.Models
{
    public class Journal : StructuredItem, IHasName
    {
        public Journal()
        {
            Types = new string[0];
            Categories = new string[0];
        }

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

        public string SeriesDescription { get; set; }
        public string Subtitle { get; set; }
        public string Edition { get; set; }
        public string TotalPages { get; set; }
        public string PrintFormat { get; set; }
    }
}
