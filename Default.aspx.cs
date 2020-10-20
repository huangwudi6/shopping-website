using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    string category = "ts";
    static int start = 1;
    static int end = 6;
    static string str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\dzy.mdf;Integrated Security=True";
    static SqlConnection conn = new SqlConnection(str);
    //add
    SqlCommand insertcmd = conn.CreateCommand();
    //select
    SqlCommand selectcmd = conn.CreateCommand();
    //delete
    SqlCommand deletecmd = conn.CreateCommand();
    //update
    SqlCommand updatecmd = conn.CreateCommand();
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
        if (!IsPostBack)
        {
            conn.Open();
            selectcmd.CommandText = "select * from goods where g_category = '" + category + "' and g_id between " + start + " and " + end + "; ";
            //cmd = new SqlCommand("Select * from Comment Order By Post_Date desc", con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(selectcmd);
            da.Fill(ds);
            goods.DataSource = ds;
            goods.DataBind();
            conn.Close();
        }
    }


    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Remove("username");
        //解决点击一次注销不刷新的问题
        Response.Redirect(".");
    }



    protected void next_page_Click(object sender, EventArgs e)
    {
        start += 6;
        end += 6;

        conn.Open();
        selectcmd.CommandText = "select * from goods where g_category = '" + category + "' and g_id between " + start + " and " + end + "; ";
        // Response.Write(selectcmd.CommandText);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(selectcmd);
        da.Fill(ds);
        goods.DataSource = ds;
        goods.DataBind();
        conn.Close();
    }

    protected void last_page_Click(object sender, EventArgs e)
    {
        start -= 6;
        end -= 6;

        conn.Open();
        selectcmd.CommandText = "select * from goods where g_category = '" + category + "' and g_id between " + start + " and " + end + "; ";
        // Response.Write(selectcmd.CommandText);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(selectcmd);
        da.Fill(ds);
        goods.DataSource = ds;
        goods.DataBind();
        conn.Close();
    }

    protected void changeTo_Click(object sender, EventArgs e)
    {
        //category = e.CommandArgument.ToString();
        category = (((LinkButton)sender).CommandArgument.ToString()).ToString();
        //Response.Write(category);

        start = 1;
        end = 6;
        conn.Open();
        selectcmd.CommandText = "select * from goods where g_category = '" + category + "' and g_id between " + start + " and " + end + "; ";
        // Response.Write(selectcmd.CommandText);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(selectcmd);
        da.Fill(ds);
        goods.DataSource = ds;
        goods.DataBind();
        conn.Close();
    }
}