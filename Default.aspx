<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>啦啦书屋</title>
    <link href="./css/basic.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="top">
                
                <div class="main">
                    <asp:Image ImageUrl="./images/logo.png" CssClass="logo" runat="server" />
                    
                    <asp:HyperLink ID="login" runat="server" CssClass="login l-r" NavigateUrl="./login.aspx" Target="_self" Text="登录"></asp:HyperLink>
                    <asp:HyperLink ID="register" runat="server" CssClass="register l-r" NavigateUrl="./register.aspx" Target="_self" Text="注册"></asp:HyperLink>
                    
                    <asp:Label ID="user_welcome" runat="server" CssClass="user-welcome" Visible="False"></asp:Label>
                    <asp:LinkButton ID="logout" runat="server" CssClass="register l-r" Text="注销" OnClick="logout_Click" Visible="False" ></asp:LinkButton>
                </div>
            </div>
            <div class="middle">
                <div class="main">
                    <div class="category">
                        <div class="item-first">图书分类列表</div>
                        <a href="#"><div class="category-item selected">童书</div></a>
                        <a href="#"><div class="category-item">励志</div></a>
                        <a href="#"><div class="category-item">生活</div></a>
                        <a href="#"><div class="category-item">教育</div></a>
                        <a href="#"><div class="category-item">文艺</div></a>
                        <a href="#"><div class="category-item">经营</div></a>
                        <a href="#"><div class="category-item">科技</div></a>
                    </div>
                    <div class="content">
                        <%--<div class="book-ctt">
                            <div>
                                <div class="content-item">
                                    <asp:ImageButton CssClass="book-img" ImageUrl="./images/ts/1.jpg" runat="server" />
                                    <asp:Label CssClass="book-title" runat="server" Text="信谊世界精选图画书-猜猜我有多爱你"></asp:Label><br />
                                    <asp:Label CssClass="book-price" runat="server" Text="￥39.90"></asp:Label>
                                </div>
                                <div class="pay">
                                    <asp:Button runat="server" CssClass="pay-btn" Text="加入购物车" />
                                    <asp:Button runat="server" CssClass="pay-btn" Text="立即购买" />
                                </div>
                            </div>
                        </div>--%>
                        <div class="book-ctt">
                            <asp:Repeater ID="goods" runat="server">
                                <ItemTemplate>
                                    <div>
                                        <div class="content-item">
                                            <asp:ImageButton CssClass="book-img" ImageUrl='<% #Eval("g_imgurl") %>' runat="server" />
                                            <asp:Label CssClass="book-title" runat="server" Text='<% #Eval("g_name") %>'></asp:Label><br />
                                            <asp:Label CssClass="book-price" runat="server" Text='￥'>
                                                <asp:Label runat="server" Text='<% #Eval("g_price") %>'></asp:Label>
                                            </asp:Label>
                                        </div>
                                        <div class="pay">
                                            <asp:Button runat="server" CssClass="pay-btn" Text="加入购物车" />
                                            <asp:Button runat="server" CssClass="pay-btn" Text="立即购买" />
                                        </div>
                                </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="content-nav">
                            &lt;上一页 1 2 3 4 5 下一页&gt;
                        </div>
                    </div>
                </div>
            </div>
            <div class="bottom">

            </div>

            <script src="https://lib.sinaapp.com/js/jquery/3.1.0/jquery-3.1.0.min.js"></script>
            <script type="text/javascript">
                $(".category-item").click(function () {
                    $(".category-item").removeClass("selected")
                    $(this).addClass("selected")
                })
            </script>
        </div>
    </form>
</body>
</html>
