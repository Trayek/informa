<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BasketOverview.ascx.cs" Inherits="ms8.layouts.msdemo.BasketOverview" %>

<asp:Repeater runat="server" ID="rptProducts" ItemType="Sitecore.Data.Items.Item" OnItemDataBound="rptProductsDataBound">
    <ItemTemplate>
        <div class="basket-product">
            <div class="basket-product-content">
                <h2><asp:Literal><%# GetFieldValue(Item, "title") %></asp:Literal></h2>
                <p><asp:Literal><%# GetFieldValue(Item, "description") %></asp:Literal></p>
            </div>
            <div class="basket-product-actions">
                <asp:TextBox runat="server" ID="txtQuantity" ClientIDMode="Static" Text="<%# GetQuantity(Item) %>" />
                <button runat="server" ID="btnRemove" OnServerClick="btnRemove_Click">Remove from basket</button>
                <button runat="server" ID="btnUpdate" OnServerClick="btnUpdate_Click">Update</button>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
