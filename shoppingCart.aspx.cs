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

    protected void Unnamed3_Click(object sender, EventArgs e)
    {

    }
}