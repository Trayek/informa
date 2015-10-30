using System;
using System.Collections.Generic;
using System.Linq;
using Sitecore.ContentSearch.Linq;
using Sitecore.Data;
using Sitecore.Data.Items;
using Url = Flurl.Url;

namespace ms8.layouts.msdemo
{
    public partial class SearchResultsFacets : System.Web.UI.UserControl
    {
        public string QueryStringParameter { get; set; }

        public string Name { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void BindFacetNavigation(FacetCategory facetCategories)
        {
            List<Tuple<FacetValue, Item, string>> items = new List<Tuple<FacetValue, Item, string>>();

            foreach (var value in facetCategories.Values.OrderByDescending(a => a.Name))
            {
                Item relatedItem = Sitecore.Context.Database.GetItem(new ID(Guid.Parse(value.Name)));

                if (relatedItem != null)
                {
                    items.Add(new Tuple<FacetValue, Item, string>(value, relatedItem,
                        relatedItem.Fields["Title"] + " (" + value.AggregateCount + ")"));
                }
            }

            FacetRepeater.DataSource = items.OrderBy(a => a.Item3);

            FacetRepeater.DataBind();
        }

        protected string AddFacetToUrl(object dataItem)
        {
            Tuple<FacetValue, Item, string> tuple = dataItem as Tuple<FacetValue, Item, string>;

            Url url = new Url(Request.RawUrl);

            url.RemoveQueryParam(SearchResultsManager.PageQueryString);

            List<Guid> allFacets = SearchResultsManager.ExtractFacetsFromQueryString(QueryStringParameter);

            if (allFacets.Contains(tuple.Item2.ID.Guid))
            {
                allFacets.Remove(tuple.Item2.ID.Guid);
            }
            else
            {
                allFacets.Add(tuple.Item2.ID.Guid);
            }

            string fullQueryString = String.Join("|", allFacets.Distinct());

            url.QueryParams[QueryStringParameter] = fullQueryString;

            return url;
        }

        protected bool FacetExists(object dataItem)
        {
            Tuple<FacetValue, Item, string> tuple = dataItem as Tuple<FacetValue, Item, string>;

            return SearchResultsManager.ExtractFacetsFromQueryString(QueryStringParameter).Contains(tuple.Item2.ID.Guid);
        }

        protected string RemoveFacets()
        {
            Url url = new Url(Request.RawUrl);

            url.RemoveQueryParam(QueryStringParameter);

            return url;
        }
    }
}