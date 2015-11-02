using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Sitecore.ContentSearch.Linq;
using Sitecore.ContentSearch.Linq.Utilities;
using Sitecore.ContentSearch.SearchTypes;
using Sitecore.Data;

namespace ms8.code.Search
{
    public class QueryBuilder
    {
        private readonly bool _matchAnyFacetValue;
        private SearchParameters _searchParameters;

        public QueryBuilder(bool matchAnyFacetValue = false)
        {
            _matchAnyFacetValue = matchAnyFacetValue;
        }

        public Expression<Func<SearchResultItem, bool>> BuildQuery(SearchParameters searchParameters)
        {
            _searchParameters = searchParameters;

            // Expressions will be AND'd together, anchor to 'True'
            Expression<Func<SearchResultItem, bool>> query = PredicateBuilder.True<SearchResultItem>();

            query = AddSearchTermQuery(query);
            query = AddLatestVersionFilter(query);
            query = AddFilterByPath(query);
            query = AddFilterByLanguage(query);
            query = AddFilterByTags(query);
            query = AddFilterByFacets(query);
            query = AddFilterByTemplates(query);

            return query;
        }

        private Expression<Func<SearchResultItem, bool>> AddSearchTermQuery(Expression<Func<SearchResultItem, bool>> query)
        {
            if (!String.IsNullOrEmpty(_searchParameters.SearchTerm))
            {
                query = query.And(a => a.Content.Contains(_searchParameters.SearchTerm));
            }

            return query;
        }

        private Expression<Func<SearchResultItem, bool>> AddLatestVersionFilter(Expression<Func<SearchResultItem, bool>> query)
        {
            return query.And(i => i["_latestversion"] == "1");
        }

        public IQueryable<SearchResultItem> ApplySortingPagingFacets(IQueryable<SearchResultItem> queryable, SearchParameters searchParameters)
        {
            _searchParameters = searchParameters;

            queryable = ApplySorting(queryable);
            queryable = ApplyFacets(queryable);
            queryable = ApplyPaging(queryable);

            return queryable;
        }

        private Expression<Func<SearchResultItem, bool>> AddFilterByPath(Expression<Func<SearchResultItem, bool>> query)
        {
            ID rootItemId = new ID(_searchParameters.RootItemID.Guid);

            query = query.And(i => i.Paths.Contains(rootItemId));
            query = query.And(i => i.ItemId != rootItemId);

            return query;
        }

        private Expression<Func<SearchResultItem, bool>> AddFilterByLanguage(Expression<Func<SearchResultItem, bool>> query)
        {
            if (String.IsNullOrWhiteSpace(_searchParameters.ContextLanguage))
            {
                return query;
            }
            else
            {
                // languages will be OR'd together, anchor to 'False'
                Expression<Func<SearchResultItem, bool>> languageQuery = PredicateBuilder.False<SearchResultItem>();

                languageQuery = languageQuery.Or(i => i.Language == _searchParameters.ContextLanguage);

                if (_searchParameters.DoLanguageFallback)
                {
                    languageQuery = languageQuery.Or(i => i["fallbacktargets"].Contains(_searchParameters.ContextLanguage));
                }

                return query.And(languageQuery);
            }
        }

        private Expression<Func<SearchResultItem, bool>> AddFilterByTags(Expression<Func<SearchResultItem, bool>> query)
        {
            if (_searchParameters.HasTags())
            {
                // tags will be OR'd together, anchor to 'False'
                Expression<Func<SearchResultItem, bool>> tagsQuery = PredicateBuilder.False<SearchResultItem>();

                foreach (ID tagID in _searchParameters.TagIDs)
                {
                    tagsQuery = tagsQuery.Or(i => i.Semantics.Contains(tagID));
                }

                return query.And(tagsQuery);
            }
            else
            {
                return query;
            }
        }

        // TODO: Write unit tests for the logic of AND and OR in this method - these are missing
        private Expression<Func<SearchResultItem, bool>> AddFilterByFacets(Expression<Func<SearchResultItem, bool>> query)
        {
            if (_searchParameters.HasFacets())
            {
                foreach (SearchParametersFacet facet in _searchParameters.Facets)
                {
                    if (facet.SelectedValues != null && facet.SelectedValues.Any())
                    {
                        // facet values within a single facet will be OR'd together, anchor to 'False'
                        Expression<Func<SearchResultItem, bool>> facetValuesQuery = _matchAnyFacetValue ? PredicateBuilder.False<SearchResultItem>() : PredicateBuilder.True<SearchResultItem>();

                        foreach (string facetValue in facet.SelectedValues)
                        {
                            facetValuesQuery = _matchAnyFacetValue ? facetValuesQuery.Or(i => i[facet.Name] == facetValue) : facetValuesQuery.And(i => i[facet.Name] == facetValue);
                        }

                        // Now AND each set of selected facet values from each facet into the main query
                        query = query.And(facetValuesQuery);
                    }
                }
            }

            return query;
        }

        private Expression<Func<SearchResultItem, bool>> AddFilterByTemplates(Expression<Func<SearchResultItem, bool>> query)
        {
            if (_searchParameters.TemplatesToExclude != null && _searchParameters.TemplatesToExclude.Any())
            {
                return query.And(i => !_searchParameters.TemplatesToExclude.Contains(i.TemplateId));
            }
            else
            {
                return query;
            }
        }

        private IQueryable<SearchResultItem> ApplySorting(IQueryable<SearchResultItem> queryable)
        {
            if (!String.IsNullOrWhiteSpace(_searchParameters.SortField))
            {
                if (_searchParameters.SortAscending)
                {
                    return queryable.OrderBy(i => i[_searchParameters.SortField]);
                }

                return queryable.OrderByDescending(i => i[_searchParameters.SortField]);
            }

            return queryable;
        }

        private IQueryable<SearchResultItem> ApplyFacets(IQueryable<SearchResultItem> queryable)
        {
            if (_searchParameters.HasFacets())
            {
                IEnumerable<string> distinctFacetNames = _searchParameters.Facets.Select(f => f.Name).Distinct();

                foreach (string facetName in distinctFacetNames)
                {
                    queryable = queryable.FacetOn(i => i[facetName]);
                }
            }

            return queryable;
        }

        private IQueryable<SearchResultItem> ApplyPaging(IQueryable<SearchResultItem> queryable)
        {
            if (_searchParameters.PageSize > 0)
            {
                return queryable.Page(_searchParameters.PageIndex, _searchParameters.PageSize);
            }
            else
            {
                return queryable;
            }
        }
    }
}
