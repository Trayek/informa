<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RatingReview.ascx.cs" Inherits="ms8.layouts.msdemo.RatingReview" %>

<div class="reviews">
    <asp:Repeater runat="server" ID="rptReviews" ItemType="Sitecore.Data.Items.Item">
        <ItemTemplate>
            <p>
                <sc:Text Field="Name" runat="server" DisableWebEditing="true" Item="<%# Item %>" />
            </p>
            <p>
                <sc:Text Field="Email" runat="server" DisableWebEditing="true" Item="<%# Item %>" />
            </p>
            <p>
                <sc:Text Field="Review" runat="server" DisableWebEditing="true" Item="<%# Item %>" />
            </p>
            <p>
                <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false" data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                    <button id="rateit-reset-2" data-role="none" class="rateit-reset" aria-label="reset rating" aria-controls="rateit-range-2" style="display: none;"></button>
                    <div id="rateit-range-2" class="rateit-range" tabindex="0" role="slider" aria-label="rating" aria-owns="rateit-reset-2" aria-valuemin="0" aria-valuemax="5" aria-valuenow="<%# Item["Rating"] %>" aria-readonly="false" style="width: 80px; height: 16px;">
                        <div class="rateit-selected rateit-preset" style="height: 16px; width: 64px; display: block;"></div><div class="rateit-hover" style="height: 16px; width: 0px; display: none;"></div>
                    </div>
                </div>
            </p>
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
          <input type="range" value="4" step="1" id="backing5" runat="server"/>
            <div class="rateit" data-rateit-backingfld="#backing5" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
            </div>
          </div>
        <div class="padding-top-20">
          <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" class="btn btn-primary" Text="Send" />
        </div>
      </form2>
    <!-- END FORM-->
</div>