using System.Collections.Generic;
using System.Linq;
using Sitecore.Data;

namespace ms8.code.Search
{
    public class SearchParameters
    {
        public string SearchTerm { get; set; }

        public string IndexName { get; set; }
        public string ContextLanguage { get; set; }

        public ID RootItemID { get; set; }
        public IList<SearchParametersFacet> Facets { get; set; }
        public IEnumerable<ID> TagIDs { get; set; }

        public int PageIndex { get; set; }
        public int PageSize { get; set; }

        public string SortField { get; set; }
        public bool SortAscending { get; set; }

        public bool DoLanguageFallback { get; set; }

        public bool HasFacets()
        {
            return Facets != null && Facets.Any();
        }

        public bool HasTags()
        {
            return TagIDs != null && TagIDs.Any();
        }

        public IEnumerable<ID> TemplatesToExclude { get; set; }
    }
}
