<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.ascx.cs" Inherits="ms8.layouts.msdemo.ProductDetails" %>
<%@ Import Namespace="Sitecore.Data.Items" %>
<%@ Import Namespace="Sitecore.Links" %>

<div class="container" style="min-height: 500px; line-height: 200%; padding-bottom: 20px;">
    <style type="text/css">
        h1,h2,h3 {
            margin-bottom: 2%;
        }
        h1 {
            margin-top: 20px;
        }
    </style>
    <a href="/en/journals.aspx">< Back to search</a>
    <h1>
        <sc:Text runat="server" Field="title" />
    </h1>
    <h2>
        <sc:Text runat="server" Field="Subject Group" /> - Publisher: <sc:Text runat="server" Field="Publisher Description" />
    </h2>
    <h3>
        Date of publication: <sc:Date runat="server" Format="MM/dd/YYYY" Field="Publication Date"/>. ISBN: <sc:Text runat="server" Field="ISBN" />
    </h3>
    <h3>
        Edition:  <sc:Text runat="server" Field="Edition" /> - Pages:  <sc:Text runat="server" Field="Pages" /> - Format:  <sc:Text runat="server" Field="Print format" />
    </h3>
    <asp:Repeater runat="server" id="RelatedItemRepeater">
        <HeaderTemplate><p>Related items:<ul> </HeaderTemplate>
        <ItemTemplate>
            <li><a href="<%# LinkManager.GetItemUrl((Item) Container.DataItem) %>"><%# ((Item) Container.DataItem)["Title"] %></a><br/>ISBN:<%# ((Item) Container.DataItem)["ISBN"] %> </li>
        </ItemTemplate>
        <FooterTemplate></ul></p></FooterTemplate>
    </asp:Repeater>
    <p>
        <sc:Text runat="server" Field="description" />
    </p>
    <hr />
    <p>
        <sc:Text runat="server" Field="Table of content" />
    </p>
</div>
