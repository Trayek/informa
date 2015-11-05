<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RelatedProducts.ascx.cs" Inherits="ms8.layouts.msdemo.ProductDetails" %>
<%@ Import Namespace="Sitecore.Data.Items" %>
<%@ Import Namespace="Sitecore.Links" %>


<!-- BEGIN BLOG PHOTOS STREAM -->
<div class="blog-photo-stream margin-bottom-20">

    <asp:Repeater runat="server" id="RelatedItemRepeater">
        <HeaderTemplate><h2>Photos Stream</h2><ul class="list-unstyled"> </HeaderTemplate>
        <ItemTemplate>
            <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/people/img5-small.jpg"/></a></li>
            <li><a href="<%# LinkManager.GetItemUrl((Item) Container.DataItem) %>"><%# ((Item) Container.DataItem)["Title"] %></a><br/>ISBN:<%# ((Item) Container.DataItem)["ISBN"] %> </li>
        </ItemTemplate>
        <FooterTemplate></ul></FooterTemplate>
    </asp:Repeater>

</div>
