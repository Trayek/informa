using Sitecore.Analytics;
using Sitecore.Configuration;
using Sitecore.Data;
using Sitecore.Data.Fields;
using Sitecore.Data.Items;
using Sitecore.SecurityModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ms8.code.Basket
{
    public class BasketHelper
    {
        private Database db;
        private ID basketRootID = new ID("{66744168-EAB2-4D3C-9DD4-8C546F0AB122}");
        private TemplateID BasketTemplate = new TemplateID(new ID("{BADB2E89-E9EC-493A-A57D-CD063DF909A7}"));
        private TemplateID ProductBasketTemplate = new TemplateID(new ID("{FBAA4FA6-1D35-4560-94E7-DAA7E7BD1A19}"));
        private string basketName;

        public BasketHelper()
        {
            db = Factory.GetDatabase("master");
            basketName = Tracker.Current.Contact.ContactId.ToString();
        }

        internal int GetProductCount()
        {
            var basket = GetBasket();
            var products = GetAllProducts(basket);
            int productCount = 0;
            foreach (var product in products)
            {
                int x;
                if (int.TryParse(product["Quantity"], out x))
                {
                    productCount = productCount + x;
                }
            }

            return productCount;
        }

        public Item GetBasket()
        {
            var basketRoot = db.GetItem(basketRootID);
            Item basket = null;
            if (basketRoot != null)
            {
                basket = basketRoot.Children.FirstOrDefault(x => string.Equals(basketName, x.Name, StringComparison.InvariantCultureIgnoreCase));
            }

            if (basket == null)
            {
                basket = CreateBasket();
            }
            
            return basket;
        }

        internal Item CreateBasket()
        {
            var basketRoot = db.GetItem(basketRootID);
            if (basketRoot != null)
            {
                using (new SecurityDisabler())
                {
                    return basketRoot.Add(basketName, BasketTemplate);
                }
            }

            return null;
        }

        internal void RemoveProduct(Item basket, Item product)
        {
            using (new SecurityDisabler())
            {
                product.Delete();
            }
        }

        internal Item GetProduct(Item basket, string productName)
        {
            return basket.Children.FirstOrDefault(x => string.Equals(x.Name, productName, StringComparison.InvariantCultureIgnoreCase));
        }

        internal void UpdateProduct(Item product, int quantity, bool updateProduct = false)
        {
            using (new SecurityDisabler())
            {
                product.Editing.BeginEdit();
                product["Quantity"] = quantity.ToString();

                if (updateProduct)
                {
                    product["Product"] = Sitecore.Context.Item.ID.ToString();
                }

                product.Editing.EndEdit();
            }
        }

        internal Item AddProductToBasket(Item basket, string productName, int quantity)
        {
            var product = GetProduct(basket, productName);
            if (product == null)
            {
                using (new SecurityDisabler())
                {
                    product = basket.Add(Sitecore.Context.Item.Name, ProductBasketTemplate);
                }

                UpdateProduct(product, quantity, true);
            }
            else
            {
                int amount = 1; // if the product is there there's a minumum of 1 - however this value should not be used anyway because of the next statement
                int.TryParse(product["Quantity"], out amount);
                UpdateProduct(product, amount + 1); 
            }

            return product;
        }

        /// <summary>
        /// Gets all ProductBasket items
        /// </summary>
        /// <param name="basket">The basket</param>
        /// <returns>A list of ProductBasket items</returns>
        internal List<Item> GetAllProducts(Item basket = null)
        {
            if (basket == null)
            {
                basket = GetBasket();
            }

            return basket.Children.Where(x => !Sitecore.MainUtil.GetBool(x["Purchased"], false)).ToList();
        }
    }
}
