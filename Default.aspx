<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>啦啦书屋</title>
    <link href="./css/basic.css" rel="stylesheet" type="text/css" />
    <script src="./js/jquery-3.1.0.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <%--<asp:UpdatePanel runat="server" ID="test">
                <ContentTemplate>
                    <asp:Label ID="label1" runat="server" Text="465514"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>--%>
            <div class="top">

                <div class="main">
                    <asp:Image ImageUrl="./images/logo.png" CssClass="logo" runat="server" />

                    <asp:HyperLink ID="login" runat="server" CssClass="login l-r" NavigateUrl="./login.aspx" Target="_self" Text="登录"></asp:HyperLink>
                    <asp:HyperLink ID="register" runat="server" CssClass="register l-r" NavigateUrl="./register.aspx" Target="_self" Text="注册"></asp:HyperLink>

                    <asp:Label ID="user_welcome" runat="server" CssClass="user-welcome" Visible="False"></asp:Label>
                    <div class="l-r shopping-cart">
                        <asp:Image ID="shoppingCartImg" ImageUrl="./images/shoppingCart.png" runat="server" CssClass="shopping-cart-img" Visible="False" />
                        <asp:HyperLink ID="shoppingCart" runat="server" Text="购物车" NavigateUrl="./shoppingCart.aspx" Target="_blank" Visible="False"></asp:HyperLink>
                    </div>
                    <asp:LinkButton ID="logout" runat="server" CssClass="register l-r" Text="注销" OnClick="logout_Click" Visible="False"></asp:LinkButton>
                </div>
            </div>
            <div class="middle">
                <div class="main">
                    <div class="category">
                        <div class="item-first">图书分类列表</div>
<%--                        <asp:ScriptManager runat="server">--%>
                            <%--<Scripts>
                                <asp:ScriptReference Path="./js/jquery-3.1.0.min.js" />
                                <asp:ScriptReference Path="./js/default.js" />
                            </Scripts>--%>
<%--                        </asp:ScriptManager>--%>
                        <%--<asp:UpdatePanel runat="server" UpdateMode="Always">
                            <ContentTemplate>--%>
                                <asp:LinkButton runat="server" OnClick="changeTo_Click" CommandArgument="ts" ID="ts"><div class="category-item selected">童书</div></asp:LinkButton>
                                <asp:LinkButton runat="server" OnClick="changeTo_Click" CommandArgument="lz" ID="lz">
                                    <div class="category-item">励志</div>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" OnClick="changeTo_Click" CommandArgument="sh" ID="sh">
                                    <div class="category-item">生活</div>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" OnClick="changeTo_Click" CommandArgument="jy" ID="jy">
                                    <div class="category-item">教育</div>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" OnClick="changeTo_Click" CommandArgument="wy" ID="wy">
                                    <div class="category-item">文艺</div>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" OnClick="changeTo_Click" CommandArgument="jg" ID="jg">
                                    <div class="category-item">经管</div>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" OnClick="changeTo_Click" CommandArgument="kj" ID="kj">
                                    <div class="category-item">科技</div>
                                </asp:LinkButton>
                            <%--</ContentTemplate>
                            
                        </asp:UpdatePanel>--%>
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
                        <%--<asp:ScriptManager runat="server"></asp:ScriptManager>--%>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <div class="book-ctt">


                                    <asp:Repeater ID="goods" runat="server">
                                        <ItemTemplate>
                                            <div>
                                                <div class="content-item">
                                                    <asp:ImageButton CssClass="book-img" CommandArgument='<% #Eval("g_id") %>' OnClick="toDetails_Click" ImageUrl='<% #Eval("g_imgurl") %>' runat="server" />
                                                    <asp:Label CssClass="book-title" runat="server" Text='<% #Eval("g_name") %>'></asp:Label><br />
                                                    <asp:Label CssClass="book-price" runat="server" Text='￥'>
                                                        <asp:Label runat="server" Text='<% #Eval("g_price") %>'></asp:Label>
                                                    </asp:Label>
                                                </div>
                                                <div class="pay">
                                                    <asp:Button runat="server" CssClass="pay-btn" ID="addToShoppingCart" CommandArgument='<% #Eval("g_id") %>' Text="加入购物车" OnClick="addToShoppingCart_Click" OnClientClick="alert('添加成功！')" />
                                                    <asp:Button runat="server" CssClass="pay-btn" Text="立即购买" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="last_page" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="next_page" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="ts" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="lz" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="sh" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="jy" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="wy" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="jg" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="kj" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="content-nav">
                            <asp:LinkButton runat="server" CssClass="change-page" ID="last_page" Text="<< 上一页" OnClick="last_page_Click"></asp:LinkButton>
                            <asp:LinkButton runat="server" CssClass="change-page" ID="next_page" Text="下一页 >>" OnClick="next_page_Click"></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bottom">
            </div>


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
