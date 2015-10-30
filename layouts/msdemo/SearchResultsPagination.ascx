<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResultsPagination.ascx.cs" Inherits="ms8.layouts.msdemo.SearchResultsPagination" %>
<nav>
    <ul class="pagination">
        <li class="<%= FirstUrl.CssClass %>" >
            <a href="<%= FirstUrl.ItemUrl %>"  aria-label="Previous">
                <span aria-hidden="true">&larr;</span>
            </a>
        </li>
        <li class="<%= PreviousUrl.CssClass %>" >
            <a href="<%= PreviousUrl.ItemUrl %>"  aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
       <asp:Repeater runat="server" id="ResultsRepeater">
           <ItemTemplate>
               <li class="<%# Eval("CssClass")%>"><a href="<%# Eval("ItemUrl")%>" ><%# Eval("Text")%></a></li>
           </ItemTemplate>
       </asp:Repeater>
        <li class="<%= NextUrl.CssClass %>">
            <a href="<%= NextUrl.ItemUrl %>"  aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
         <li class="<%= LastUrl.CssClass %>">
            <a href="<%= LastUrl.ItemUrl %>"  aria-label="Next">
                <span aria-hidden="true">&rarr;</span>
            </a>
        </li>
    </ul>
</nav>
