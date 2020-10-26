<%@ Page Language="C#" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的订单</title>
    <link href="./css/order.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="top">

                <div class="main">
                    <asp:Image ImageUrl="./images/logo.png" CssClass="logo" runat="server" />
                    <div class="title">我的订单</div>
                </div>
            </div>
            <div class="middle">
                <asp:Repeater runat="server" ID="orderRP" OnItemDataBound="orderRP_ItemDataBound">
                    <ItemTemplate>
                        <div class="order-item">
                            <asp:Label runat="server" CssClass="th" Text='<%# "订单号:"+Eval("orderid") %>'></asp:Label>
                            <asp:Repeater runat="server" ID="orderGoods">
                                <ItemTemplate>
                                    <div class="good-item">
                                        <asp:Image runat="server" CssClass="item-image" ImageUrl='<%# Eval("g_imgurl") %>' />
                                        <asp:Label runat="server" CssClass="item-name" Text='<%# Eval("g_name") %>'></asp:Label>
                                        <asp:Label runat="server" CssClass="item-quantity" Text='<%# "x" + Eval("quantity") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</body>
</html>
