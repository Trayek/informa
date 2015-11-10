using ms8.code.Basket;
using Sitecore.Data.Items;
using Sitecore.SecurityModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ms8.layouts.msdemo
{
    public partial class RatingReview : System.Web.UI.UserControl
    {
        RatingsHelper helper = new RatingsHelper();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptReviews.DataSource = helper.GetProductRatings(Sitecore.Context.Item);
                rptReviews.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var review = helper.CreateReview(Sitecore.Context.Item, txtName.Text);

            using (new SecurityDisabler())
            {
                review.Editing.BeginEdit();

                review["Name"] = txtName.Text;
                review["Email"] = txtEmail.Text;
                review["Review"] = txtReview.InnerText;
                review["Rating"] = backing5.Text; //backing5.Value;

                review.Editing.EndEdit();
            }

            var url = Sitecore.Web.WebUtil.GetRawUrl();
            Response.Redirect(url);
        }

        protected void rptReviews_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
            {
                return;
            }

            var productRating = e.Item.DataItem as Item;
            if (productRating != null)
            {
                var ratingControl = e.Item.FindControl("litDisplayStars") as Literal;
                if (ratingControl != null)
                {
                    ratingControl.Text = helper.GetRating(productRating);
                }
            }
        }
    }
}