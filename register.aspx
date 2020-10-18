<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注册 | 啦啦书屋</title>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
			






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
			//点击小人消失

			//          $(".music-qd").focus(function(){
			//          	$(".music-lgin-all").removeClass("block")
			//          })


			//注册正则 简单判断
			 
            $('.music-qd').click(function(){
                if(($('.inputname').val()=='')){
                    $(".music-news").html("请输入名称")      
                }else if(($('.mima').val()=='')){
                	 $(".music-news").html("请输入密码")
                    $(".music-news").addClass("block")
                }else{
                	alert('提交ajax')
                }      
            })
     

			
			
            </script>
        </div>
    </form>
</body>
</html>
