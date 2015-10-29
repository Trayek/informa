<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResultsFacets.ascx.cs" Inherits="ms8.layouts.msdemo.SearchResultsFacets" %>
<%= Name %><br/>
<asp:Repeater runat="server" ID="FacetRepeater">
        <HeaderTemplate><ul></HeaderTemplate>
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