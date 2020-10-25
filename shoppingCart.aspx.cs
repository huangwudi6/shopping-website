using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shoppingCart : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            conn.Open();
            selectcmd.CommandText = "select * from shoppingcart,goods where shoppingcart.id = goods.g_id and shoppingcart.category = goods.g_category and shoppingcart.username = '" + Session["username"] + "';";
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(selectcmd);
            da.Fill(ds);
            shopping_cart.DataSource = ds;
            shopping_cart.DataBind();
            conn.Close();
        }

    }

    protected void jian_Click(object sender, EventArgs e)
    {
        string[] estr = (((Button)sender).CommandArgument.ToString()).ToString().Split(',');

        int id = Convert.ToInt32(estr[0]);
        string category = Convert.ToString(estr[1]);
        int quantity = Convert.ToInt32(estr[2]);
        quantity -= 1;
        updatecmd.CommandText = "update shoppingcart set quantity =" + quantity + " where id=" + id + " and category='" + category + "';";
        conn.Open();
        updatecmd.ExecuteNonQuery();

        conn.Close();

        conn.Open();
        selectcmd.CommandText = "select * from shoppingcart,goods where shoppingcart.id = goods.g_id and shoppingcart.category = goods.g_category and shoppingcart.username = '" + Session["username"] + "';";
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(selectcmd);
        da.Fill(ds);
        shopping_cart.DataSource = ds;
        shopping_cart.DataBind();
        conn.Close();
    }

    protected void jia_Click(object sender, EventArgs e)
    {
        string[] estr = (((Button)sender).CommandArgument.ToString()).ToString().Split(',');

        int id = Convert.ToInt32(estr[0]);
        string category = Convert.ToString(estr[1]);
        int quantity = Convert.ToInt32(estr[2]);
        quantity += 1;
        updatecmd.CommandText = "update shoppingcart set quantity =" + quantity + " where id=" + id + " and category='" + category + "';";
        conn.Open();
        updatecmd.ExecuteNonQuery();

        conn.Close();

        conn.Open();
        selectcmd.CommandText = "select * from shoppingcart,goods where shoppingcart.id = goods.g_id and shoppingcart.category = goods.g_category and shoppingcart.username = '" + Session["username"] + "';";
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(selectcmd);
        da.Fill(ds);
        shopping_cart.DataSource = ds;
        shopping_cart.DataBind();
        conn.Close();
    }

    protected void item_del_Click(object sender, EventArgs e)
    {
        string[] estr = (((Button)sender).CommandArgument.ToString()).ToString().Split(',');

        int id = Convert.ToInt32(estr[0]);
        string category = Convert.ToString(estr[1]);

        deletecmd.CommandText = "delete from shoppingcart where id=" + id + " and category='" + category + "';";
        conn.Open();
        deletecmd.ExecuteNonQuery();
        conn.Close();

        conn.Open();
        selectcmd.CommandText = "select * from shoppingcart,goods where shoppingcart.id = goods.g_id and shoppingcart.category = goods.g_category and shoppingcart.username = '" + Session["username"] + "';";
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(selectcmd);
        da.Fill(ds);
        shopping_cart.DataSource = ds;
        shopping_cart.DataBind();
        conn.Close();
    }

    public static void Alert(System.Web.UI.Page page, string msg)
    {
        page.ClientScript.RegisterStartupScript(page.GetType(), "message", "<script type='text/javascript'>alert('" + msg.ToString() + "');</script>");
    }

    protected void settle_Click(object sender, EventArgs e)
    {
        TimeSpan ts = DateTime.Now - new DateTime(1970, 1, 1, 0, 0, 0, 0);
        string orderid = Convert.ToInt64(ts.TotalSeconds).ToString();

        insertcmd.CommandText = "insert into order1 values('" + orderid + "','" + Session["username"] + "')";
        conn.Open();
        insertcmd.ExecuteNonQuery();
        conn.Close();

        conn.Open();
        selectcmd.CommandText = "select * from shoppingcart,goods where shoppingcart.id = goods.g_id and shoppingcart.category = goods.g_category and shoppingcart.username = '" + Session["username"] + "';";
        SqlDataReader dr = selectcmd.ExecuteReader();

        string[] id = new string[100];
        string[] category = new string[100];
        string[] quantity = new string[100];
        int i = 0;
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                id[i] = dr["id"].ToString();
                category[i] = dr["category"].ToString();
                quantity[i] = dr["quantity"].ToString();
                i++;
            }

        }
        conn.Close();

        for(int j = 0; j < i; j++)
        {
            conn.Open();
            insertcmd.CommandText = "insert into order2 values('" + id[j] + "','" + category[j] + "','" + orderid + "','" + quantity[j] + "')";
            insertcmd.ExecuteNonQuery();
            conn.Close();
        }
        

        deletecmd.CommandText = "delete from shoppingcart";
        conn.Open();
        deletecmd.ExecuteNonQuery();
        conn.Close();

        conn.Open();
        selectcmd.CommandText = "select * from shoppingcart,goods where shoppingcart.id = goods.g_id and shoppingcart.category = goods.g_category and shoppingcart.username = '" + Session["username"] + "';";
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(selectcmd);
        da.Fill(ds);
        shopping_cart.DataSource = ds;
        shopping_cart.DataBind();
        conn.Close();

        Alert(this, "下单成功！");
    }
}