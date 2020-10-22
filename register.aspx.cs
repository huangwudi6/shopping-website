using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }

    protected void CvCheckCode_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string myCode = args.Value;
        string CheckCode = Session["checkcode"].ToString();
        args.IsValid = true;
        if (myCode.ToString() != CheckCode) args.IsValid = false;
    }

    public static void Alert(System.Web.UI.Page page, string msg)
    {
        page.ClientScript.RegisterStartupScript(page.GetType(), "message", "<script type='text/javascript'>alert('" + msg.ToString() + "');</script>");
    }

    protected void register_btn_Click(object sender, EventArgs e)
    {
        string un = username.Text;
        string pwd = password.Text;
        string pwd2 = password2.Text;

        if (!Page.IsValid)
        {
            Alert(this, "验证码错误！");
            password.Text = pwd;
            password2.Text = pwd2;
        }
        else
        {
            if (pwd == pwd2)
            {
                Alert(this, "两次密码一致");
            }
            else
            {
                Alert(this, "两次密码不一致");
            }
        }

        
    }
}