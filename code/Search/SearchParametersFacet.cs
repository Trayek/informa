using System.Collections.Generic;

namespace ms8.code.Search
{
    public class SearchParametersFacet
    {
        public string Name { get; set; }
        public IEnumerable<string> SelectedValues { get; set; }
    }
}
