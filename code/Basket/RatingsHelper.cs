using Sitecore;
using Sitecore.Configuration;
using Sitecore.Data;
using Sitecore.Data.Items;
using Sitecore.SecurityModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ms8.code.Basket
{
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
            return RatingsRoot.Children.FirstOrDefault(x => string.Equals(product.ID.ToString(), Sitecore.Context.Item.ID.ToString(), StringComparison.InvariantCultureIgnoreCase));
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
