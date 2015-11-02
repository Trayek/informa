using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ms8.code.Search;
using Sitecore.ContentSearch.Linq;
using Sitecore.Data;
using Sitecore.Data.Fields;
using Sitecore.Data.Items;
using Sitecore.Links;

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

            ResultsPlaceHolder.Visible = results.TotalHits > 0;

            NoResultsPlaceHolder.Visible = results.TotalHits == 0;

            if (results.TotalHits > 0)
            {
                BindFacetNavigation(results.FacetCategories);

                DumpSearchResults(results.SearchResults);

                SearchResultsPagination.TotalPages = results.TotalHits / SearchResultsManager.ResultsPerPage;
            }
        }

        private SearchParameters BuildSearchParameters()
        {
            string searchTerm = HttpContext.Current.Request.QueryString[SearchResultsManager.SearchTermQueryString];

            SearchTerm.Text = searchTerm;

            return SearchResultsManager.BuildSearchParameters();
        }

        private void BindFacetNavigation(List<FacetCategory> facetCategories)
        {
            CategoryFacets.QueryStringParameter = SearchResultsManager.CategoryFacets;

            CategoryFacets.BindFacetNavigation(facetCategories.FirstOrDefault(a => a.Name == "categories"));

            JournalTypeFacets.QueryStringParameter = SearchResultsManager.JournalTypeFacets;

            JournalTypeFacets.BindFacetNavigation(facetCategories.FirstOrDefault(a => a.Name == "journal_types"));
        }

        private void DumpSearchResults(IEnumerable<ID> searchResults)
        {
            List<Tuple<SearchResult, Item>> results = new List<Tuple<SearchResult, Item>>();

            foreach (ID id in searchResults)
            {
                Item relatedItem = Sitecore.Context.Database.GetItem(id);

                Field titleField = relatedItem?.Fields["Title"];

                if (titleField != null)
                {
                    results.Add(new Tuple<SearchResult, Item>(BuildResult(relatedItem, titleField), relatedItem));
                }
            }

            ResultRepeater.DataSource = results;

            ResultRepeater.DataBind();
        }

        private SearchResult BuildResult(Item relatedItem, Field titleField)
        {
            return new SearchResult
            {
                Title = titleField.Value,
                Isbn = relatedItem["ISBN"],
                Url = LinkManager.GetItemUrl(relatedItem),
                Edition = relatedItem["Edition"],
                PrintFormat = relatedItem["Print format"],
                Pages = relatedItem["Pages"]
            };
        }

        protected void SearchClick(object sender, EventArgs e)
        {
            if (SearchTerm.Text.Trim().Length > 0)
            {
                Response.Redirect(SearchResultsManager.AddSearchToUrl(SearchTerm.Text));
            }
        }

        protected void ResetClick(object sender, EventArgs e)
        {
            Response.Redirect(SearchResultsManager.RemoveSearchTerm());
        }
    }

    public class SearchResult
    {
        public string Title { get; set; }
        public string Isbn { get; set; }
        public string Url { get; set; }

        public string Pages { get; set; }
        public string Edition { get; set; }
        public string PrintFormat { get; set; }
    }
}