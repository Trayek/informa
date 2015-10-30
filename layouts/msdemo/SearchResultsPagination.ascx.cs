using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sitecore.Forms.Core.Crm;

namespace ms8.layouts.msdemo
{
    public partial class SearchResultsPagination : System.Web.UI.UserControl
    {
        private static int MaxPaginationEntries => 10;

        protected void Page_Load(object sender, EventArgs e)
        {
            int currentPage = SearchResultsManager.CurrentPage();

            bool hasNextPage = currentPage < TotalPages;

            PreviousUrl = new PaginationEntry
            {
                ItemUrl = SearchResultsManager.SetPage(currentPage - 1)
            };

            FirstUrl = new PaginationEntry
            {
                ItemUrl = SearchResultsManager.SetPage(0)
            };

            LastUrl = new PaginationEntry
            {
                ItemUrl = SearchResultsManager.SetPage(TotalPages)
            };

            NextUrl = new PaginationEntry
            {
                ItemUrl = SearchResultsManager.SetPage(currentPage + 1)
            };

            if (currentPage == 0)
            {
                FirstUrl.CssClass = PreviousUrl.CssClass = "disabled";
                FirstUrl.ItemUrl = PreviousUrl.ItemUrl = "#";
            }

            if (!hasNextPage)
            {
                LastUrl.CssClass = NextUrl.CssClass = "disabled";
                LastUrl.ItemUrl = NextUrl.ItemUrl = "#";
            }

            List<PaginationEntry> entries = new List<PaginationEntry>();

            for (int i = 0; i <= TotalPages; i++)
            {
                entries.Add(new PaginationEntry
                {
                    ItemUrl = SearchResultsManager.SetPage(i),
                    Text = (i+1).ToString(),
                    CssClass = i == currentPage ? "active" : ""
                });
            }

            if (entries.Count > MaxPaginationEntries)
            {
                entries = CenterEntries(entries, currentPage).ToList();
            }

            ResultsRepeater.DataSource = entries;

            ResultsRepeater.DataBind();
        }

        private IEnumerable<PaginationEntry> CenterEntries(List<PaginationEntry> entries, int currentPage)
        {
            string elipses = "...";

            int halfWindow = (MaxPaginationEntries - MaxPaginationEntries/2);

            if (currentPage < halfWindow)
            {
                IEnumerable<PaginationEntry> startFilteredEntries = entries.Take(MaxPaginationEntries);

                startFilteredEntries.Last().Text = elipses;

                return startFilteredEntries;
            }

            if (currentPage >= TotalPages - halfWindow)
            {
                return entries.Skip(Math.Max(0, entries.Count() - MaxPaginationEntries));
            }

            IEnumerable<PaginationEntry> filteredEntries = entries.Skip(currentPage - halfWindow).Take(MaxPaginationEntries);
            
            filteredEntries.First().Text = elipses;
            filteredEntries.Last().Text = elipses;

            return filteredEntries;
        }

        public PaginationEntry PreviousUrl { get; set; }
        public PaginationEntry NextUrl { get; set; }
        public PaginationEntry LastUrl { get; set; }
        public PaginationEntry FirstUrl { get; set; }
        public int TotalPages { get; set; }
    }

    public class PaginationEntry
    {
        public string ItemUrl { get; set; }
        public string CssClass { get; set; }
        public string Text { get; set; }
    }
}