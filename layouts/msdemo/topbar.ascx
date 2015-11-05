<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="topbar.ascx.cs" Inherits="ms8.layouts.msdemo.TopBar" %>

<div class="pre-header">
    <div class="container">
        <div class="row">
            <!-- BEGIN TOP BAR LEFT PART -->
            <div class="col-md-6 col-sm-6 additional-shop-info">
                <ul class="list-unstyled list-inline">
                    <li><i class="fa fa-phone"></i><span>
                        <sc:Text runat="server" Field="Phone" Item="<%# FooterItem %>" />
                    </span></li>
                    <li><i class="fa fa-envelope-o"></i><span>
                        <sc:Text runat="server" Field="Email" Item="<%# FooterItem %>" DisableWebEditing="true" />
                    </span></li>
                </ul>
            </div>
            <!-- END TOP BAR LEFT PART -->
            <!-- BEGIN TOP BAR MENU -->
            <div class="col-md-6 col-sm-6 additional-nav">
                <ul class="list-unstyled list-inline pull-right">
                    <% if (Sitecore.Context.User.IsAuthenticated) { %>
                        <li><a href="/my-account">My Account</a></li>
                        <li><a href="/logout">Log out</a></li>
                    <% } %>

                    <% if (!Sitecore.Context.User.IsAuthenticated) { %>
                        <li><a href="/login">Log In</a></li>
                        <li><a href="/register">Registration</a></li>
                    <% } %>

                    <li><a href="/my-cart"><%# GetBasketText() %></a></li>
                </ul>
            </div>
            <!-- END TOP BAR MENU -->
        </div>
    </div>
</div>
