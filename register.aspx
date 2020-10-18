<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注册 | 啦啦书屋</title>
    <link href="./css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
			<div class="music-lgin">

			<div class="music-lgin-all">
				<!--左手-->
				<div class="music-lgin-left ovhd">
					<div class="music-hand">
						<div class="music-lgin-hara"></div>
						<div class="music-lgin-hars"></div>
					</div>
				</div>

				<!--脑袋-->
				<div class="music-lgin-dh">
					<div class="music-lgin-alls">
						<div class="music-lgin-eyeleft">
							<div class="music-left-eyeball yeball-l"></div>
						</div>
						<div class="music-lgin-eyeright">
							<div class="music-right-eyeball yeball-r"></div>
						</div>
						<div class="music-lgin-cl"></div>
					</div>
					<!--鼻子-->
					<div class="music-nose"></div>
					<!--嘴-->
					<div class="music-mouth music-mouth-ds"></div>
					<!--肩-->
					<div class="music-shoulder-l">
						<div class="music-shoulder"></div>
					</div>
					<div class="music-shoulder-r">
						<div class="music-shoulder"></div>
					</div>
					<!--消息框-->
					<div class="music-news">来了,老弟！</div>
				</div>

				<!--右手-->
				<div class="music-lgin-right ovhd">
					<div class="music-hand">
						<div class="music-lgin-hara"></div>
						<div class="music-lgin-hars"></div>
					</div>
				</div>

			</div>

			<!--1-->
			<div class="music-lgin-text">
				<asp:TextBox ID="username" runat="server" CssClass="inputname inputs" placeholder="username"></asp:TextBox>
			</div>
			<!--2-->
			<div class="music-lgin-text">
				<asp:TextBox ID="password" runat="server" CssClass="mima inputs" placeholder="password" TextMode="Password"></asp:TextBox>
			</div>
			<!--3-->
			<div class="music-lgin-text">
				<asp:TextBox ID="password2" runat="server" CssClass="mima inputs" placeholder="password confirm" TextMode="Password"></asp:TextBox>
			</div>
			<!--4-->
			<div class="music-lgin-text">
				<asp:TextBox ID="checkcode" runat="server" CssClass="mima inputs" placeholder="checkcode"></asp:TextBox>
			</div>
			<!--5-->
			<div class="music-lgin-text">
				<asp:Button ID="register_btn" runat="server" CssClass="music-qd inputs" Text="注册"/>
			</div>

		</div>






            <script src="https://lib.sinaapp.com/js/jquery/3.1.0/jquery-3.1.0.min.js"></script>
            <script type="text/javascript">
			//眼睛 密码部分
			$(".mima").focus(function() {
				$(".music-lgin-left").addClass("left-dh").removeClass("rmleft-dh");
				$(".music-lgin-right").addClass("right-dh").removeClass("right-rmdh");
				$(".music-hand").addClass("no");
			}).blur(function() {
				$(".music-lgin-left").removeClass("left-dh").addClass("rmleft-dh");
				$(".music-lgin-right").removeClass("right-dh").addClass("right-rmdh");
				$(".music-hand").removeClass("no");

			})
			//点击小人出来
			$(".inputname").focus(function() {
				$(".music-lgin-all").addClass("block");
				$(".music-news").addClass("no")
			})

            </script>
        </div>
    </form>
</body>
</html>
