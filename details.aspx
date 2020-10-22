<%@ Page Language="C#" AutoEventWireup="true" CodeFile="details.aspx.cs" Inherits="details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>图书详情页</title>
    <link href="./css/details.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="top">

                <div class="main">
                    <asp:Image ImageUrl="./images/logo.png" CssClass="logo" runat="server" />
                    <%--<div class="title">我的购物车</div>--%>
                </div>
            </div>
            <div class="middle">
                <div class="main">
                    <asp:Image ID="book_img" runat="server" CssClass="book-img" ImageUrl="./images/ts/1.jpg" />
                    <div class="main-r">
                        <asp:Label ID="book_title" runat="server" CssClass="book-title" Text="null"></asp:Label>
                        <asp:Label ID="book_info" runat="server" CssClass="book-info" Text="null"></asp:Label>
                        <asp:Label CssClass="book-price" runat="server" Text='￥'>
                            <asp:Label ID="book_price" runat="server" Text="null"></asp:Label>
                        </asp:Label>
                        <asp:Button runat="server" Text="加入购物车" CssClass="add-btn" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
