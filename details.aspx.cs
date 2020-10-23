using System;
using System.Activities;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class details : System.Web.UI.Page
{
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
        string id = Request.QueryString["id"];
        string category = Request.QueryString["category"];
        //Response.Write(id + "---" + category);

        selectcmd.CommandText = "select * from goods where g_id=" + id + " and g_category='" + category + "'";
        if (conn.State == System.Data.ConnectionState.Closed)
        {
            conn.Open();
        }
        else
        {
            conn.Close();
            conn.Open();
        }
        SqlDataReader dr = selectcmd.ExecuteReader();
        if (dr.HasRows)
        {
            dr.Read();
            string name = dr["g_name"].ToString();
            string price = dr["g_price"].ToString();
            string imgurl = dr["g_imgurl"].ToString();
            string info = dr["g_info"].ToString();

            book_img.ImageUrl = imgurl;
            book_title.Text = name;
            book_info.Text = info;
            book_price.Text = price;
        }

        conn.Close();
    }

    public static void Alert(System.Web.UI.Page page, string msg)
    {
        page.ClientScript.RegisterStartupScript(page.GetType(), "message", "<script type='text/javascript'>alert('" + msg.ToString() + "');</script>");
    }

    protected void addToShoppingcart_Click(object sender, EventArgs e)
    {
        if(Session["username"] == null)
        {
            Alert(this, "请登录！");
            return;
        }
        
        string id = Request.QueryString["id"];
        string category = Request.QueryString["category"];
        decimal total = 0;
        selectcmd.CommandText = "select g_price from goods where g_id=" + id + " and g_category='" + category + "'";
        conn.Open();
        SqlDataReader dr = selectcmd.ExecuteReader();
        if (dr.HasRows)
        {
            dr.Read();

            string price = dr["g_price"].ToString();
            total = decimal.Parse(price);

        }

        conn.Close();

        insertcmd.CommandText = "insert into shoppingcart values('" + id + "','" + category + "', 1 ," + total + ",'" + Session["username"] + "')";
        conn.Open();
        insertcmd.ExecuteNonQuery();

        conn.Close();
        Alert(this, "添加成功");
    }
}