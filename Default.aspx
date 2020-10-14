<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="./css/basic.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="top">
                <div class="main">
                    <asp:Image ImageUrl="./images/logo.png" CssClass="logo" runat="server" />
                    <asp:HyperLink runat="server" CssClass="login l-r" NavigateUrl="#" Target="_self" Text="登录"></asp:HyperLink>
                    <asp:HyperLink runat="server" CssClass="register l-r" NavigateUrl="#" Target="_self" Text="注册"></asp:HyperLink>
                </div>
            </div>
            <div class="middle">
                <div class="main">
                    <div class="category">
                        <div class="category-item item-first">图书分类列表</div>
                        <a href="#"><div class="category-item">童书</div></a>
                        <a href="#"><div class="category-item">励志</div></a>
                        <a href="#"><div class="category-item">生活</div></a>
                        <a href="#"><div class="category-item">教育</div></a>
                        <a href="#"><div class="category-item">文艺</div></a>
                        <a href="#"><div class="category-item">经营</div></a>
                        <a href="#"><div class="category-item">科技</div></a>
                    </div>
                    <div class="content">
                        <div><div class="content-item"></div><div class="pay"></div></div>
                        <div><div class="content-item"></div><div class="pay"></div></div>
                        <div><div class="content-item"></div><div class="pay"></div></div>
                        <div><div class="content-item"></div><div class="pay"></div></div>
                        <div><div class="content-item"></div><div class="pay"></div></div>
                        <div><div class="content-item"></div><div class="pay"></div></div>
                        
                    </div>
                </div>
            </div>
            <div class="bottom">

            </div>
        </div>
    </form>
</body>
</html>
