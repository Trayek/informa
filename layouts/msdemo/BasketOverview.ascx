<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BasketOverview.ascx.cs" Inherits="ms8.layouts.msdemo.BasketOverview" %>
<%@ Import Namespace="Sitecore.Links" %>

<asp:Repeater runat="server" ID="rptProducts" ItemType="Sitecore.Data.Items.Item" OnItemDataBound="rptProductsDataBound">
    <ItemTemplate>
        <div class="basket-product" style="padding-bottom:60px;">
            <div class="basket-product-content">
                <h2><a href="<%# LinkManager.GetItemUrl(GetItem(Item)) %>"><%# GetFieldValue(Item, "title") %></a></h2>
                <div style="float:left;padding-right: 20px;padding-bottom:20px;">
                    <a href="<%# LinkManager.GetItemUrl(GetItem(Item)) %>"><sc:image Item="<%# GetItem(Item) %>" Field="Enriched Image" runat="server" MaxWidth="150"/></a>
                </div>
                <div>
                    <p><%# GetFieldValue(Item, "description") %></p>
                </div>
            </div>
            <div class="basket-product-actions">
                <button runat="server" ID="btnUpdate" OnServerClick="btnUpdate_Click" class="btn btn-primary" style="float:right;">Update</button>
                <button runat="server" ID="btnRemove" OnServerClick="btnRemove_Click" class="btn btn-primary scbrandred" style="float:right; margin-right:5px;">Remove from basket</button>
                <asp:TextBox runat="server" ID="txtQuantity" ClientIDMode="Static" Text="<%# GetQuantity(Item) %>" class="scfSingleLineTextBox" style="width: 40px; margin: 0px; height: 34px; padding: 6px 12px; font-size: 14px; line-height: 1.42857143; color: #555; background-color: #fff; background-image: none; border: 1px solid #ccc; border-radius: 4px;float:right; margin-right:5px;"/>
                
                
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>


