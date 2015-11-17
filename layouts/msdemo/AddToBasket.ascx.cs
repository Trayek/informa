using ms8.code.Basket;
using Sitecore.Data;
using System;

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
                // TODO: This doesn't work if there's already a historical product..
                helper.AddProductToBasket(basket, Sitecore.Context.Item.Name, 1);
            }

            var url = Sitecore.Web.WebUtil.GetRawUrl();
            Response.Redirect(url);
        }
    }
}