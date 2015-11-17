namespace ms8.layouts.msdemo
{
    using System;
    using ms8.code.Basket;
    using Sitecore.SecurityModel;

    public partial class Checkout : System.Web.UI.UserControl
    {
        BasketHelper helper = new BasketHelper();
         
        protected void Page_Load(object sender, EventArgs e)
        {
            var ordered = Sitecore.Web.WebUtil.GetQueryString("ordered", "0");
            if (ordered == "1")
            {
                thankspanel.Visible = true;
                checkoutpanel.Visible = false;
            }
            else
            {
                thankspanel.Visible = false;
                checkoutpanel.Visible = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            foreach (var product in helper.GetAllProducts())
            {
                using (new SecurityDisabler())
                {
                    product.Editing.BeginEdit();

                    product["Purchased"] = "1";

                    product.Editing.EndEdit();
                }
            }

            var url = Sitecore.Web.WebUtil.GetRawUrl();
            Response.Redirect(url + "?ordered=1");
        }
    }
}