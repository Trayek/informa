<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResultsFacets.ascx.cs" Inherits="ms8.layouts.msdemo.SearchResultsFacets" %>
<h3><%= Name %></h3>
<asp:Repeater runat="server" ID="FacetRepeater">
    <HeaderTemplate>
        <ul class="list-unstyled">
    </HeaderTemplate>
    <ItemTemplate>
        <li>
            <a href="<%# AddFacetToUrl(Container.DataItem) %>" class="<%# FacetExists(Container.DataItem) ? "facet-selected" : "facet-unselected" %>"><%# FacetExists(Container.DataItem) ? " (X) " : "" %><%# Eval("Item3") %> </a>
        </li>
    </ItemTemplate>
    <FooterTemplate>
        <li><a href="<%# RemoveFacets() %>">--- Remove all facets ---</a></li>
        </ul>
    </FooterTemplate>
</asp:Repeater>
