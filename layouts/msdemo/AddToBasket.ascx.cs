using ms8.code.Basket;
using Sitecore.Analytics;
using Sitecore.Configuration;
using Sitecore.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ms8.layouts.msdemo
{
    public partial class AddToBasket : System.Web.UI.UserControl
    {
        private TemplateID ProductBasketTemplate = new TemplateID(new ID("{FBAA4FA6-1D35-4560-94E7-DAA7E7BD1A19}"));

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            var helper = new BasketHelper();
            var basket = helper.GetBasket();

            if (basket != null)
            {
                helper.AddProductToBasket(basket, Sitecore.Context.Item.Name, 1);
            }
        }
    }
}