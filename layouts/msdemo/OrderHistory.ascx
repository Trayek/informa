<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderHistory.ascx.cs" Inherits="ms8.layouts.msdemo.OrderHistory" %>

<div class="col-md-12">
    <div class="row" style="padding-left: 15px; padding-right: 15px;">
        <div class="portlet box scbrandblue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-check" style="color: #fff;"></i>Order History
                </div>
            </div>
            <div class="portlet-body">
                <div class="row" style="font-weight: 600">
                    <div class="col-md-3">
                        Order submitted:
                    </div>
                    <div class="col-md-7">
                        Product:
                    </div>
                    <div class="col-md-1">
                        Quantity:
                    </div>
                    <div class="col-md-1">
                        Total:
                    </div>
                    <asp:Repeater runat="server" ID="rptOrderHistory" ItemType="Sitecore.Data.Items.Item">
                        <ItemTemplate>
                            <div class="col-md-3">
                                <%# Sitecore.DateUtil.IsoDateToDateTime(Item["__updated"]) %>
                            </div>
                            <div class="col-md-7">
                                <%# GetProductName(Item) %>
                            </div>
                            <div class="col-md-1">
                                <%# Item["Quantity"] %>
                            </div>
                            <div class="col-md-1">
                                <%# GetTotalPrice(Item) %>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="padding-left: 15px; padding-right: 15px;">
        <div class="portlet box scbrandteal">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-shopping-cart" style="color: #fff;"></i>Current Basket
                </div>
            </div>
            <div class="portlet-body">
                <div class="row" style="font-weight: 600">
                    <div class="col-md-3">
                        Order submitted:
                    </div>
                    <div class="col-md-7">
                        Product:
                    </div>
                    <div class="col-md-1">
                        Quantity:
                    </div>
                    <div class="col-md-1">
                        Total:
                    </div>

                    <asp:Repeater runat="server" ID="rptCurrentOrders" ItemType="Sitecore.Data.Items.Item">
                        <ItemTemplate>
                            <div class="col-md-3">
                                <%# Sitecore.DateUtil.IsoDateToDateTime(Item["__updated"]) %>
                            </div>
                            <div class="col-md-7">
                                <%# GetProductName(Item) %>
                            </div>
                            <div class="col-md-1">
                                <%# Item["Quantity"] %>
                            </div>
                            <div class="col-md-1">
                                <%# GetTotalPrice(Item) %>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</div>
