namespace ms8.layouts.msdemo
{
    using System;
    using ms8.code.Basket;

    public partial class BasketValue : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataBind();
        }

        protected string GetBasketTotal()
        {
            var helper = new BasketHelper();
            var total = helper.GetBasketTotal();

            return total.ToString("F");
        }
    }
}