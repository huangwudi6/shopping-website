using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class order : System.Web.UI.Page
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
        conn.Open();
        selectcmd.CommandText = "select * from order1";
        //cmd = new SqlCommand("Select * from Comment Order By Post_Date desc", con);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(selectcmd);
        da.Fill(ds);
        orderRP.DataSource = ds;
        orderRP.DataBind();
        conn.Close();
        
    }



    protected void orderRP_ItemDataBound(object source, RepeaterItemEventArgs e)
    {
        if (conn.State == System.Data.ConnectionState.Closed)
        {
            conn.Open();
        }
        else
        {
            conn.Close();
            conn.Open();
        }
        

        Repeater orderGoods = e.Item.FindControl("orderGoods") as Repeater;
        DataRowView rowv = (DataRowView)e.Item.DataItem;
        string orderid = Convert.ToString(rowv["orderid"]);

        //string[] id = new string[100];
        //string[] category = new string[100];
        //string[] quantity = new string[100];
        
        //int i = 0;
        //selectcmd.CommandText = "select * from order2 where orderid='" + orderid + "'";
        //SqlDataReader dr = selectcmd.ExecuteReader();
        //if (dr.HasRows)
        //{
        //    while (dr.Read())
        //    {
        //        id[i] = dr["id"].ToString();
        //        category[i] = dr["category"].ToString();
        //        quantity[i] = dr["quantity"].ToString();
        //        i++;
        //    }

        //}
        //conn.Close();

       // conn.Open();
        selectcmd.CommandText = "select g_name,g_imgurl,quantity from goods,order2 where g_id=id and g_category=category and orderid='" + orderid + "';";

        DataSet ds2 = new DataSet();
        SqlDataAdapter da2 = new SqlDataAdapter(selectcmd);
        da2.Fill(ds2);
        orderGoods.DataSource = ds2;
        orderGoods.DataBind();
        conn.Close();
    }
}