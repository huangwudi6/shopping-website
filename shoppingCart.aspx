<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shoppingCart.aspx.cs" Inherits="shoppingCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>我的购物车</title>
    <link rel="stylesheet" type="text/css" href="./css/shoppingCart.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="top">

                <div class="main">
                    <asp:Image ImageUrl="./images/logo.png" CssClass="logo" runat="server" />
                    <div class="title">我的购物车</div>
                </div>
            </div>
            <div class="middle">
                <asp:Button runat="server" Text="结算" CssClass="settle" ID="settle" OnClick="settle_Click" />
                <div class="m-title">
                    <div class="th1">商品图片</div>
                    <div class="th2">标题</div>
                    <div class="th3">单价</div>
                    <div class="th3">数量</div>
                    <div class="th3">总价</div>
                </div>
                <div class="m-main">
                    <asp:ScriptManager runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel runat="server" ID="sc">
                        <ContentTemplate>
                            <asp:Repeater runat="server" ID="shopping_cart">
                                <ItemTemplate>
                                    <div class="item">
                                        <asp:ImageButton runat="server" CssClass="item-img" ImageUrl='<% #Eval("g_imgurl") %>' />
                                        <asp:Label runat="server" CssClass="item-title" Text='<% #Eval("g_name") %>'></asp:Label>
                                        <asp:Label CssClass="item-price" runat="server" Text='￥'>
                                            <asp:Label runat="server" Text='<% #Eval("g_price") %>'></asp:Label>
                                        </asp:Label>
                                        <div class="item-price">
                                            <asp:Button ClientIDMode="Static" CssClass="change-quantity" runat="server" Text="-" ID="jian1" OnClick="jian_Click" CommandArgument='<%# Eval("id") + "," + Eval("category") + "," + Eval("quantity") %>' />
                                            <asp:Label runat="server" Text='<% #Eval("quantity") %>'></asp:Label>
                                            <asp:Button CssClass="change-quantity" runat="server" Text="+" ID="jia" OnClick="jia_Click" CommandArgument='<%# Eval("id") + "," + Eval("category") + "," + Eval("quantity") %>' />
                                        </div>
                                        <asp:Label CssClass="item-price" runat="server" Text='￥'>
                                            <asp:Label runat="server" Text='<% #Eval("total") %>'></asp:Label>
                                        </asp:Label>
                                        <asp:Button runat="server" ID="item_del" OnClick="item_del_Click" CommandArgument='<%# Eval("id") + "," + Eval("category") %>' Text="删除该商品" />
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ContentTemplate>
                        <%--<Triggers>
                                <asp:AsyncPostBackTrigger ControlID="jian" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="jia" EventName="Click" />
                        </Triggers>--%>
                    </asp:UpdatePanel>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
