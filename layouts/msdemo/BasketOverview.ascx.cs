using ms8.code.Basket;
using Sitecore.Configuration;
using Sitecore.Data;
using Sitecore.Data.Fields;
using Sitecore.Data.Items;
using Sitecore.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ms8.layouts.msdemo
{
    public partial class BasketOverview : System.Web.UI.UserControl
    {
        BasketHelper helper;
        Item basket;

        protected void Page_Load(object sender, EventArgs e)
        {
            helper = new BasketHelper();
            // Get basket based on tracker id
            basket = helper.GetBasket();

            if (basket != null)
            {
                rptProducts.DataSource = helper.GetAllProducts(basket);
                rptProducts.DataBind();
            }
        }

        protected string GetFieldValue(Item item, string fieldName)
        {
            ReferenceField field = item.Fields["Product"];
            if (field != null && field.TargetItem != null)
            {
                return field.TargetItem[fieldName];
            }

            return string.Empty;
        }

        protected Item GetItem(Item item)
        {
            ReferenceField field = item.Fields["Product"];
            if (field != null && field.TargetItem != null)
            {
                return field.TargetItem;
            }

            return null;
        }

        protected string GetQuantity(Item productBasket)
        {
            return productBasket["Quantity"];
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            var button = (HtmlButton)sender;
            var index = int.Parse(button.Attributes["index"]);
            var item = helper.GetAllProducts(basket)[index];

            helper.RemoveProduct(basket, item);
            var url = WebUtil.GetRawUrl();
            Response.Redirect(url);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            var button = (HtmlButton)sender;
            var index = int.Parse(button.Attributes["index"]);
            var item = helper.GetAllProducts(basket)[index];

            var repeaterItem = (RepeaterItem)button.NamingContainer;
            var txtQuantity = (TextBox)repeaterItem.FindControl("txtQuantity" + index);

            if (string.IsNullOrEmpty(txtQuantity.Text))
            {
                helper.RemoveProduct(basket, item);
                var url = WebUtil.GetRawUrl();
                Response.Redirect(url);
            }

            int quantity = int.Parse(txtQuantity.Text);
            if (quantity <= 0)
            {
                helper.RemoveProduct(basket, item);
                var url = WebUtil.GetRawUrl();
                Response.Redirect(url);
            }
            else
            {
                helper.UpdateProduct(item, quantity);
                var url = WebUtil.GetRawUrl();
                Response.Redirect(url);
            }
        }

        public void rptProductsDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
            {
                return;
            }

            var btnRemoveLine = (HtmlButton)e.Item.FindControl("btnRemove");
            btnRemoveLine.Attributes.Add("index", e.Item.ItemIndex.ToString());
            var btnUpdateLine = (HtmlButton)e.Item.FindControl("btnUpdate");
            btnUpdateLine.Attributes.Add("index", e.Item.ItemIndex.ToString());
            var txtQuantity = (TextBox)e.Item.FindControl("txtQuantity");
            txtQuantity.ID = "txtQuantity" + e.Item.ItemIndex.ToString();
        }
    }
}