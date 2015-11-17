using ms8.code.Basket;
using ms8.code.Pricing;
using Sitecore.Data.Fields;
using Sitecore.Data.Items;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ms8.layouts.msdemo
{
    public partial class OrderHistory : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var helper = new BasketHelper();
            rptOrderHistory.DataSource = helper.GetAllPurchasedProducts();
            rptOrderHistory.DataBind();

            rptCurrentOrders.DataSource = helper.GetAllProducts();
            rptCurrentOrders.DataBind();
        }

        protected string GetProductName(Item item)
        {
            ReferenceField field = item.Fields["Product"];
            if (field != null && field.TargetItem != null)
            {
                return field.TargetItem.Name;
            }

            return string.Empty;
        }

        protected string GetTotalPrice(Item item)
        {
            ReferenceField field = item.Fields["Product"];
            if (field != null && field.TargetItem != null)
            {
                var price = new PricingDetailsService().GetPrices(field.TargetItem["Isbn"], "").Value;
                var qty = int.Parse(item["Quantity"]);
                var x = (price * qty);

                return x.ToString("F");
            }

            return string.Empty;
        }
    }
}