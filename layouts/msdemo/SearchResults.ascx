<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResults.ascx.cs" Inherits="ms8.layouts.msdemo.SearchResults" %>
<%@ Register Src="SearchResultsFacets.ascx" TagName="SearchResultsFacets" TagPrefix="uc1" %>
<%@ Register Src="~/layouts/msdemo/SearchResultsPagination.ascx" TagPrefix="uc1" TagName="SearchResultsPagination" %>


<div class="container">

    <script type="text/javascript">


        $(document).ready(function () {
            $('#<%= SearchTerm.ClientID %>').keyup(function (event) {
                $('#header-search-box').val($('#<%= SearchTerm.ClientID %>').val());
                if (event.keyCode == 13) {
                    event.preventDefault();
                    $('#<%= SearchButton.ClientID %>').click();
                }
             });

        });


    </script>
    <div class="">
        <div class="input-group">
            <asp:TextBox runat="server" CssClass="form-control" Placeholder="Search term" ID="SearchTerm" />
            <span class="input-group-btn">
                <asp:Button runat="server" CssClass="btn btn-primary" ID="SearchButton" OnClick="SearchClick" Text="Search" />
                <asp:Button runat="server" CssClass="btn btn-warning" OnClick="ResetClick" Text="Reset" />
            </span>
        </div>

    </div>
    <hr />
    <style type="text/css">
        a.facet-selected {
            color: red;
        }

        a.facet-unselected {
            color: #08C;
        }
    </style>
    <div runat="server" id="NoResultsPlaceHolder">
        <div class="col-md-offset-3 col-md-9">
            <p style="margin: 20px 0px 200px 0px">Sorry, no results could be found. Please try another search term.</p>

        </div>
    </div>

    <div runat="server" id="ResultsPlaceHolder" style="min-height: 500px;">
        <div class="col-md-4">
            <uc1:SearchResultsFacets ID="CategoryFacets" runat="server" />
            <br />
            <uc1:SearchResultsFacets ID="JournalTypeFacets" runat="server" Visible="False" />
            <br />
        </div>
        <div class="col-md-8">
            <uc1:SearchResultsPagination runat="server" ID="SearchResultsPagination" />
            <br clear="all" />
            <asp:Repeater runat="server" ID="ResultRepeater">
                <HeaderTemplate>
                    <ul class="list-unstyled">
                </HeaderTemplate>
                <ItemTemplate>
                    <li style="margin-bottom: 10px;">
                        <strong><a href="<%# Eval("Item1.Url") %>"><%# Eval("Item1.Title") %></a></strong><br />
                        ISBN: <%# Eval("Item1.Isbn") %>
                    </li>
                </ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>

            </asp:Repeater>
            <!--http://sc80rev150812_demo/journals-->
        </div>
    </div>
</div>
