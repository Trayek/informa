using System;
using System.Collections.Generic;
using System.Linq;
using ms8.code.Search;
using Sitecore.Data.Fields;
using Sitecore.Data.Items;
using Sitecore.Data;
using Sitecore.Resources.Media;
using System.Web.UI.WebControls;

namespace ms8.layouts.msdemo
{
    public partial class RelatedProducts : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindRelatedItemRepeater();
        }

        private void BindRelatedItemRepeater()
        {
            IEnumerable<Guid> categories =
                Sitecore.Context.Item.Fields["Categories"].Value.Split("|".ToCharArray(),
                    StringSplitOptions.RemoveEmptyEntries).Select(Parse).Where(a=>a!=Guid.Empty);

            IIndexSearchService searchService = new IndexSearchService(new QueryBuilder(true));

            SearchParameters parameters = SearchResultsManager.BuildSearchParameters();

            parameters.Facets.Clear();

            parameters.Facets.Add(new SearchParametersFacet
            {
                Name = "Categories",
                SelectedValues = categories.Select(SearchResultsManager.Clean)
            });

            var results = searchService.Search(parameters);

            RelatedItemRepeater.DataSource = results.SearchResults
                .Where(a => a.Guid != Sitecore.Context.Item.ID.Guid)
                .Take(5)
                .Select(b => Sitecore.Context.Database.GetItem(b));

            RelatedItemRepeater.DataBind();
        }

        private Guid Parse(string value)
        {
            try
            {
                return Guid.Parse(value);
            }
            catch 
            {
                return Guid.Empty;
            }
        }

        public string Isbn
        {
            get { return Sitecore.Context.Item.Fields["ISBN"].Value; }
        }
       
    }
}