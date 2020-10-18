using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            //已登录
            login.Visible = false;
            register.Visible = false;
            user_welcome.Text = Session["username"] + "，欢迎您！";
            user_welcome.Visible = true;
            logout.Visible = true;


        }
        else
        {
            //未登录
            login.Visible = true;
            register.Visible = true;
            user_welcome.Visible = false;
            logout.Visible = false;


        }
    }


    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Remove("username");
        //解决点击一次注销不刷新的问题
        Response.Redirect(".");
    }

    
}