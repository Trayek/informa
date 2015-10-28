using System.Collections.Generic;
using Sitecore.ContentSearch.Linq;
using Sitecore.Data;

namespace ms8.code.Search
{
    public class SearchResult
    {
        public IEnumerable<ID> SearchResults { get; set; }
        public List<FacetCategory> FacetCategories { get; set; }
        public int TotalHits { get; set; }
    }
}
