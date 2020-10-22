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
        conn.Open();
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
}