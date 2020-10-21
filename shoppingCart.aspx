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
                <div class="m-main">
                    <asp:UpdatePanel></asp:UpdatePanel>
                    <div class="item">
                        <asp:ImageButton runat="server" CssClass="item-img" ImageUrl="~/images/lz/1.jpg" />
                        <asp:Label runat="server" CssClass="item-title" Text="URtoID日丰管我哦ID舒服个地方官iOSdryor破译的人和事都怕"></asp:Label>
                        <asp:Label runat="server" CssClass="item-price" Text="￥39.99"></asp:Label>
                        <asp:Label runat="server" Text="x3"></asp:Label>
                        <asp:Label runat="server" Text="￥100.12"></asp:Label>
                    </div>
                    
                </div>

            </div>
        </div>
    </form>
</body>
</html>
