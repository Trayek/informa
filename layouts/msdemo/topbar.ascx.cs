using ms8.code.Basket;
using Sitecore.Data.Items;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ms8.layouts.msdemo
{
    public partial class TopBar : System.Web.UI.UserControl
    {
        public Item FooterItem { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            FooterItem = Sitecore.Context.Database.GetItem("7FBC4CFA-EAE4-45A9-B7B5-C2799D2B01F6");

            DataBind();
        }

        protected string GetBasketText()
        {
            var helper = new BasketHelper();
            var basket = helper.GetBasket();

            return string.Format("My Basket ({0})", helper.GetProductCount());
        }
    }
}