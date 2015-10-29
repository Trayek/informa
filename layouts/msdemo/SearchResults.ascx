<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResults.ascx.cs" Inherits="ms8.layouts.msdemo.SearchResults" %>
<%@ Register src="SearchResultsFacets.ascx" tagname="SearchResultsFacets" tagprefix="uc1" %>

<br />
Search term:
<asp:TextBox runat="server" ID="SearchTerm" Width="800" />
<asp:Button runat="server" OnClick="SearchClick" Text="Search" /><br />
<hr />
<style type="text/css">
    a.facet-selected {
        color: red;
    }
    a.facet-unselected {
        color: #08C;
    }
</style>
<div style="width: 400px; float: left;">
    Facets:
    <br/>
    <uc1:SearchResultsFacets ID="CategoryFacets" runat="server" />
    <br/>
    <uc1:SearchResultsFacets ID="JournalTypeFacets" runat="server" Visible="False" />
    <br/>
</div>
<div style="float: left; width: 800px;">
    Items<br />
    <asp:Repeater runat="server" ID="ResultRepeater" >
         <HeaderTemplate><ul></HeaderTemplate>
        <ItemTemplate>
            <li>
                <%# Eval("Item1") %>
            </li>
        </ItemTemplate>
        <FooterTemplate></ul></FooterTemplate>
        
    </asp:Repeater>
    <!--http://sc80rev150812_demo/journals-->
</div>

<br clear="all" />