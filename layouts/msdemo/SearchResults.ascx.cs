using System;
using System.Collections.Generic;
using System.Linq;
using ms8.code.Search;
using Sitecore.ContentSearch.Linq;
using Sitecore.Data;
using Sitecore.Data.Fields;
using Sitecore.Data.Items;

namespace ms8.layouts.msdemo
{
    public partial class SearchResults : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RunSearch();
            }
        }

        private void RunSearch()
        {
            IIndexSearchService searchService = new IndexSearchService(new QueryBuilder());

            var results = searchService.Search(BuildSearchParameters());

            BindFacetNavigation(results.FacetCategories);

            DumpSearchResults(results.SearchResults);
        }

        private void BindFacetNavigation(List<FacetCategory> facetCategories)
        {
            CategoryFacets.QueryStringParameter = SearchResultsManager.CategoryFacets;

            CategoryFacets.Name = "Categories";

            CategoryFacets.BindFacetNavigation(facetCategories.FirstOrDefault(a => a.Name == "categories"));

            JournalTypeFacets.QueryStringParameter = SearchResultsManager.JournalTypeFacets;

            JournalTypeFacets.Name = "Types";

            JournalTypeFacets.BindFacetNavigation(facetCategories.FirstOrDefault(a => a.Name == "journal_types"));
        }

        private void DumpSearchResults(IEnumerable<ID> searchResults)
        {
            List<Tuple<string, Item>> results = new List<Tuple<string, Item>>();

            foreach (ID id in searchResults)
            {
                Item relatedItem = Sitecore.Context.Database.GetItem(id);

                Field field = relatedItem?.Fields["Title"];

                if (field != null)
                {
                    results.Add(new Tuple<string, Item>(field.Value, relatedItem));
                }
            }

            ResultRepeater.DataSource = results;

            ResultRepeater.DataBind();
        }

        private SearchParameters BuildSearchParameters()
        {
            string searchTerm = Request.QueryString[SearchResultsManager.SearchTermQueryString];

            SearchTerm.Text = searchTerm;

            return new SearchParameters
            {
                IndexName = "sitecore_master_journals_index",
                RootItemID = new ID("{95A0B67B-04DF-4307-A5F7-D107E769FAD5}"),
                Facets = BuildFacets(),
                PageIndex = 0,
                PageSize = 50,
                ContextLanguage = Sitecore.Context.Language.Name,
                SearchTerm = searchTerm,
            };
        }

        private IList<SearchParametersFacet> BuildFacets()
        {
            return new List<SearchParametersFacet>
            {
                new SearchParametersFacet
                {
                    Name = "Categories",
                    SelectedValues = SearchResultsManager.ExtractCategoriesFromQueryString().Select(Clean)
                },
                new SearchParametersFacet
                {
                    Name = "Journal Types",
                    SelectedValues = SearchResultsManager.ExtractJournalTypesFromQueryString().Select(Clean)
                }
            };
        }

        private string Clean(Guid value)
        {
            return value.ToString().Replace("{", "").Replace("}", "").Replace("-", "");
        }


        protected void SearchClick(object sender, EventArgs e)
        {
            if (SearchTerm.Text.Trim().Length > 0)
            {
                Response.Redirect(SearchResultsManager.AddSearchToUrl(SearchTerm.Text));
            }
        }
    }
}