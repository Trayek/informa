using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Flurl;
using ms8.code.Search;
using Sitecore.Data;

namespace ms8.layouts.msdemo
{
    public class SearchResultsManager
    {
        public static readonly string CategoryFacets = "categories";
        public static readonly string JournalTypeFacets = "journalTypes";
        public static readonly string SearchTermQueryString = "search";
        public static readonly string PageQueryString = "page";
        public static readonly int ResultsPerPage = 20;

        public static SearchParameters BuildSearchParameters()
        {
            string searchTerm = HttpContext.Current.Request.QueryString[SearchResultsManager.SearchTermQueryString];
            
            return new SearchParameters
            {
                IndexName = "sitecore_web_journals_index",
                RootItemID = new ID("{95A0B67B-04DF-4307-A5F7-D107E769FAD5}"),
                Facets = BuildFacets(),
                PageIndex = CurrentPage(),
                PageSize = ResultsPerPage,
                ContextLanguage = Sitecore.Context.Language.Name,
                SearchTerm = searchTerm,
            };
        }

        private static IList<SearchParametersFacet> BuildFacets()
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

        public static string Clean(Guid value)
        {
            return value.ToString().Replace("{", "").Replace("}", "").Replace("-", "");
        }

        public static string AddSearchToUrl(string searchTerm)
        {
            Url url = new Url(HttpContext.Current.Request.RawUrl);

            url.SetQueryParam(SearchTermQueryString, searchTerm);

            url.RemoveQueryParam(PageQueryString);

            return url;
        }

        public static List<Guid> ExtractFacetsFromQueryString(string queryStringKey)
        {
            Url url = new Url(HttpContext.Current.Request.RawUrl);

            List<Guid> allFacets = new List<Guid>();

            if (url.QueryParams.ContainsKey(queryStringKey))
            {
                var facets = url.QueryParams[queryStringKey];

                if (facets != null)
                {
                    allFacets =
                        facets.ToString()
                            .ToLower()
                            .Split("|".ToCharArray(), StringSplitOptions.RemoveEmptyEntries)
                            .Select(a => ExtractGuid(a))
                            .Where(a => a != Guid.Empty).ToList();
                }
            }

            return allFacets;
        }

        private static Guid ExtractGuid(string value)
        {
            try
            {
                return Guid.Parse(value);
            }
            catch (Exception)
            {
                return Guid.Empty;
            }
        }

        public static List<Guid> ExtractCategoriesFromQueryString()
        {
            return ExtractFacetsFromQueryString(CategoryFacets);
        }

        public static List<Guid> ExtractJournalTypesFromQueryString()
        {
            return ExtractFacetsFromQueryString(JournalTypeFacets);
        }

        public static string RemoveSearchTerm()
        {
            Url url = new Url(HttpContext.Current.Request.RawUrl);

            url.RemoveQueryParam(SearchTermQueryString);

            url.RemoveQueryParam(PageQueryString);

            return url;
        }

        public static int CurrentPage()
        {
            Url url = new Url(HttpContext.Current.Request.RawUrl);

            if (url.QueryParams.ContainsKey(PageQueryString))
            {
                try
                {
                    return int.Parse(url.QueryParams[PageQueryString].ToString());
                }
                catch (Exception e)
                {
                    
                }
            }

            return 0;
        }

        public static string SetPage(int page)
        {
            Url url = new Url(HttpContext.Current.Request.RawUrl);

            url.SetQueryParam(PageQueryString, page);

            return url;
        }
    }
}