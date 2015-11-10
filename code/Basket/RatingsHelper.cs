namespace ms8.code.Basket
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using Sitecore;
    using Sitecore.Configuration;
    using Sitecore.Data;
    using Sitecore.Data.Items;
    using Sitecore.SecurityModel;

    public class RatingsHelper
    {
        private Database db;
        private Item RatingsRoot;
        private ID RatingsRootId = new ID("{89CF5BD2-95A2-4374-A2C4-E0939FE02D6C}");
        private TemplateID RatingTemplateID = new TemplateID(new ID("{8158389D-C841-4993-876A-2B2ED53EA984}"));
        private TemplateID FolderTemplateID = new TemplateID(new ID("{A87A00B1-E6DB-45AB-8B54-636FEC3B5523}"));

        public RatingsHelper()
        {
            db = Factory.GetDatabase("master");
            RatingsRoot = db.GetItem(RatingsRootId);
        }

        public string GetGlobalRating(Item product)
        {
            var allRatings = GetProductRatings(product);
            var i = 0;
            var totalRating = 0;
            var avgRating = 0;
            var returnValue = string.Empty;
            foreach (var rating in allRatings.Where(x => !string.IsNullOrEmpty(x["Rating"])))
            {
                var r = 0;
                int.TryParse(rating["Rating"], out r);
                totalRating = totalRating + r;
                i++;
            }

            if (i > 0)
            {
                avgRating = totalRating / i;

                returnValue = GetRatingString(avgRating);
            }
            else
            {
                returnValue = GetRatingString(i, true);
            }

            return returnValue;
        }

        internal string GetRating(Item productRating)
        {
            var rating = 0;
            if (int.TryParse(productRating["Rating"], out rating))
            {
                return GetRatingString(rating);
            }

            return GetRatingString(rating, true);
        }

        private string GetRatingString(int rating, bool notRated = false)
        {
            var returnValue = string.Empty;

            if (notRated)
            {
                for (var z = 1; z <= 5; z++)
                {
                    returnValue += "<span class=\"emptystar\">&nbsp;</span>";
                }

                returnValue += " (Not yet rated)";
            }
            else
            {
                for (var z = 1; z <= 5; z++)
                {
                    if (rating >= z)
                    {
                        returnValue += "<span class=\"goldstar\">&nbsp;</span>";
                    }
                    else
                    {
                        returnValue += "<span class=\"emptystar\">&nbsp;</span>";
                    }
                }
            }

            return returnValue;
        }

        public List<Item> GetProductRatings(Item product)
        {
            var list = new List<Item>();
            var ratingProduct = GetProductRatingRoot(product);

            if (ratingProduct != null)
            {
                foreach (Item rating in ratingProduct.Children)
                {
                    list.Add(rating);
                }
            }

            return list;
        }

        public Item GetProductRatingRoot(Item product)
        {
            return RatingsRoot.Children.FirstOrDefault(x => string.Equals(x.Name, product.ID.ToShortID().ToString(), StringComparison.InvariantCultureIgnoreCase));
        }

        public Item CreateReview(Item product, string reviewer)
        {
            var ratingProductRoot = GetProductRatingRoot(product);
            if (ratingProductRoot == null)
            {
                using (new SecurityDisabler())
                {
                    ratingProductRoot = RatingsRoot.Add(product.ID.ToShortID().ToString(), FolderTemplateID);
                }
            }

            using (new SecurityDisabler())
            {
                return ratingProductRoot.Add(reviewer + DateUtil.IsoNow, RatingTemplateID);
            }
        }
    }
}
