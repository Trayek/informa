namespace ms8.layouts.msdemo
{
    using System;
    using code.Basket;

    public partial class Rating : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var helper = new RatingsHelper();
            litDisplayStars.Text = helper.GetGlobalRating(Sitecore.Context.Item);
        }
    }
}