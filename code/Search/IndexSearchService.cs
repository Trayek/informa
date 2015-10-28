using System;
using System.Linq;
using System.Linq.Expressions;
using Sitecore.ContentSearch;
using Sitecore.ContentSearch.Linq;
using Sitecore.ContentSearch.SearchTypes;

namespace ms8.code.Search
{
    public class IndexSearchService : IIndexSearchService
    {
        private readonly QueryBuilder _indexQueryBuilder;
        private SearchParameters _searchParameters;
        private IProviderSearchContext _context;

        public IndexSearchService(QueryBuilder indexQueryBuilder)
        {
            _indexQueryBuilder = indexQueryBuilder;
        }

        public SearchResult Search(SearchParameters searchParameters)
        {
            _searchParameters = searchParameters;

            using (_context = ContentSearchManager.GetIndex(_searchParameters.IndexName).CreateSearchContext())
            {
                Expression<Func<SearchResultItem, bool>> query = _indexQueryBuilder.BuildQuery(searchParameters);

                IQueryable<SearchResultItem> queryable = ConvertToQueryable(query);

                queryable = _indexQueryBuilder.ApplySortingPagingFacets(queryable, searchParameters);

                return ExecuteQuery(queryable);
            }
        }

        private IQueryable<SearchResultItem> ConvertToQueryable(Expression<Func<SearchResultItem, bool>> query)
        {
            return _context.GetQueryable<SearchResultItem>().Where(query);
        }

        private SearchResult ExecuteQuery(IQueryable<SearchResultItem> queryable)
        {
            SearchResults<SearchResultItem> searchResults = queryable.GetResults();

            return new SearchResult
            {
                FacetCategories = queryable.GetFacets().Categories,
                SearchResults = searchResults.Hits.Select(i => i.Document.ItemId).ToList(),
                TotalHits = searchResults.TotalSearchResults
            };
        }
    }
}
