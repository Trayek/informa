<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RelatedProducts.ascx.cs" Inherits="ms8.layouts.msdemo.RelatedProducts" %>
<%@ Import Namespace="Sitecore.Data.Items" %>
<%@ Import Namespace="Sitecore.Links" %>


<!-- BEGIN BLOG PHOTOS STREAM -->
<div class="blog-photo-stream margin-bottom-20">

    <asp:Repeater runat="server" id="RelatedItemRepeater">
        <HeaderTemplate><h2>Photos Stream</h2><ul class="list-unstyled"> </HeaderTemplate>
        <ItemTemplate>
            <li><a href="<%# LinkManager.GetItemUrl((Item) Container.DataItem) %>"><sc:image item="<%#(Item) Container.DataItem%>" Field="Enriched Image" runat="server" MaxWidth="150"/></a></li>
        </ItemTemplate>
        <FooterTemplate></ul></FooterTemplate>
    </asp:Repeater>

</div>
