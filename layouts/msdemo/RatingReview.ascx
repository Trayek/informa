<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RatingReview.ascx.cs" Inherits="ms8.layouts.msdemo.RatingReview" %>

<h2>Reviews</h2>
<div class="reviews" id="Reviews">
    <asp:Repeater runat="server" ID="rptReviews" ItemType="Sitecore.Data.Items.Item" OnItemDataBound="rptReviews_ItemDataBound">
        <ItemTemplate>
            <div class="review-item clearfix">
                <div class="review-item-submitted">
                    <strong><sc:Text Field="Name" runat="server" DisableWebEditing="true" Item="<%# Item %>" /></strong>
                    <p class="rateit" style="float: right">
                        <asp:Literal ID="litDisplayStars" runat="server" />
                    </p>
                </div>
                <div class="review-item-content">
                    <sc:Text Field="Review" runat="server" DisableWebEditing="true" Item="<%# Item %>" />
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>

<div style="padding-top: 10px;">
    <!-- BEGIN FORM-->
    <form2 action="#" class="reviews-form" role="form">
        <h2>Write a review</h2>
        <div class="form-group">
          <label for="name">
            Name <span class="require">*</span>
          </label>
          <asp:TextBox CssClass="form-control" id="txtName" runat="server" />
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <asp:TextBox CssClass="form-control" id="txtEmail" runat="server" />
        </div>
        <div class="form-group">
          <label for="review">
            Review <span class="require">*</span>
          </label>
          <textarea class="form-control" rows="8" id="txtReview" runat="server"></textarea>
        </div>
        <div class="form-group">
          <label for="email" style="padding-right:10px;">Rating</label>
          <%--<input type="range" value="4" step="1" id="backing5"  />--%>
            <asp:TextBox runat="server" ID="backing5" ClientIDMode="Static" />
            <div class="rateit" data-rateit-backingfld="#backing5" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
            </div>
          </div>
        <div class="padding-top-20">
          <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" class="btn btn-primary" Text="Send" />
        </div>
      </form2>
    <!-- END FORM-->
</div>
