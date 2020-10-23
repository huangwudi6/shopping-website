<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>图书管理</title>
    <link href="./css/admin.css" rel="stylesheet" type="text/css" />
    <script src="./js/jquery-3.1.0.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="top">

                <div class="main">
                    <asp:Image ImageUrl="./images/logo.png" CssClass="logo" runat="server" />
                    <div class="title">图书管理</div>
                </div>
            </div>
            <div class="middle">
                <div class="m-main">
                    <div class="th">
                        <asp:LinkButton runat="server" ID="all" OnClick="changePanel_Click" CommandArgument="panel1" CssClass="th-i selected" Text="所有图书"></asp:LinkButton>
                        <asp:LinkButton runat="server" ID="add" OnClick="changePanel_Click" CommandArgument="panel2" CssClass="th-i" Text="添加图书"></asp:LinkButton>
                        <asp:LinkButton runat="server" ID="del" OnClick="changePanel_Click" CommandArgument="panel3" CssClass="th-i" Text="删除图书"></asp:LinkButton>
                        <asp:LinkButton runat="server" ID="udt" OnClick="changePanel_Click" CommandArgument="panel4" CssClass="th-i" Text="修改图书"></asp:LinkButton>
                    </div>
                    <asp:ScriptManager runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Panel runat="server" ID="panel1">
                                <asp:Repeater runat="server" ID="goods">
                                    <ItemTemplate>
                                        <div class="goods-item">
                                            <asp:ImageButton runat="server" CssClass="item-img" ImageUrl='<% #Eval("g_imgurl") %>' />
                                            <div class="item-ti">
                                                <asp:Label runat="server" CssClass="item-title" Text='<% #Eval("g_name") %>'></asp:Label>
                                                <asp:Label runat="server" CssClass="item-info" Text='<% #Eval("g_info") %>'></asp:Label>
                                            </div>
                                            <div class="item-r">
                                                <div class="item-cis">
                                                    <asp:Label CssClass="item-category" runat="server" Text='商品分类：'>
                                                        <asp:Label runat="server" Text='<% #Eval("g_category") %>'></asp:Label>
                                                    </asp:Label>
                                                    <asp:Label CssClass="item-id" runat="server" Text='商品ID：'>
                                                        <asp:Label runat="server" Text='<% #Eval("g_id") %>'></asp:Label>
                                                    </asp:Label>
                                                    <asp:Label CssClass="item-stock" runat="server" Text='库存：'>
                                                        <asp:Label runat="server" Text='<% #Eval("g_stock") %>'></asp:Label>
                                                    </asp:Label>
                                                </div>
                                                <asp:Label CssClass="item-price" runat="server" Text='￥'>
                                                    <asp:Label runat="server" Text='<% #Eval("g_price") %>'></asp:Label>
                                                </asp:Label>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="panel2" Visible="False">
                                <asp:FileUpload ID="upload_img" runat="server" /><br />
                                <asp:TextBox runat="server" ID="upload_title" placeholder="商品标题"></asp:TextBox>
                                <asp:TextBox runat="server" ID="upload_info" placeholder="商品信息"></asp:TextBox>
                                <asp:TextBox runat="server" ID="upload_category" placeholder="商品分类"></asp:TextBox>
                                <asp:TextBox runat="server" ID="upload_id" placeholder="商品ID"></asp:TextBox>
                                <asp:TextBox runat="server" ID="upload_stock" placeholder="库存"></asp:TextBox>
                                <asp:TextBox runat="server" ID="upload_price" placeholder="价格"></asp:TextBox>
                                <br />
                                <asp:Button runat="server" OnClick="addGoods_Click" Text="添加商品" />
                            </asp:Panel>
                            <asp:Panel runat="server" ID="panel3" Visible="False">
                                <asp:TextBox runat="server" placeholder="商品分类"></asp:TextBox>
                                <asp:TextBox runat="server" placeholder="商品ID"></asp:TextBox>
                                <br />
                                <asp:Button runat="server" OnClick="delGoods_Click" Text="删除该商品" />
                            </asp:Panel>
                            <asp:Panel runat="server" ID="panel4" Visible="False">
                                <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                                <asp:TextBox runat="server" placeholder="商品标题"></asp:TextBox>
                                <asp:TextBox runat="server" placeholder="商品信息"></asp:TextBox>
                                <asp:TextBox runat="server" placeholder="商品分类"></asp:TextBox>
                                <asp:TextBox runat="server" placeholder="商品ID"></asp:TextBox>
                                <asp:TextBox runat="server" placeholder="库存"></asp:TextBox>
                                <asp:TextBox runat="server" placeholder="价格"></asp:TextBox>
                                <br />
                                <asp:Button runat="server" OnClick="updateGoods_Click" Text="修改商品" />
                            </asp:Panel>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="all" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="add" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="del" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="udt" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>




            <script type="text/javascript">
                $(".th-i").click(function () {
                    $(".th-i").removeClass("selected")
                    $(this).addClass("selected")
                })
            </script>
        </div>
    </form>
</body>
</html>
