<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Checkout.ascx.cs" Inherits="ms8.layouts.msdemo.Checkout" %>

<div style="padding-top: 10px;" id="checkoutpanel" runat="server">
    <!-- BEGIN FORM-->
    <form2 action="#" class="reviews-form" role="form">
        <h2>Checkout</h2>
        <div class="form-group">
          <label for="txtName">
            Name <span class="require">*</span>
          </label>
          <asp:TextBox CssClass="form-control" id="txtName" runat="server" />
        </div>
        <div class="form-group">
          <label for="txtAddress1">Address line 1 <span class="require">*</span></label>
          <asp:TextBox CssClass="form-control" id="txtAddress1" runat="server" />
        </div>
        <div class="form-group">
          <label for="txtAddress2">Address line 2</label>
          <asp:TextBox CssClass="form-control" id="txtAddress2" runat="server" />
        </div>
        <div class="form-group">
          <label for="txtPostcode">Postcode</label>
          <asp:TextBox CssClass="form-control" id="txtPostcode" runat="server" />
        </div>
        <div class="form-group">
          <label for="txtPhone">Phone number</label>
          <asp:TextBox CssClass="form-control" id="txtPhone" runat="server" />
        </div>
        <div class="padding-top-20">
          <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" class="btn btn-primary" Text="Checkout" />
        </div>
      </form2>
    <!-- END FORM-->
</div>

<div style="padding-top: 10px;" id="thankspanel" runat="server">
    <h2>Thanks for ordering</h2>

    <p>
        Your order will be shipped as fast as we can.
    </p>
</div>
