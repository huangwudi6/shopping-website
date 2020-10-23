using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
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
            selectcmd.CommandText = "select * from goods";
            //cmd = new SqlCommand("Select * from Comment Order By Post_Date desc", con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(selectcmd);
            da.Fill(ds);
            goods.DataSource = ds;
            goods.DataBind();
            conn.Close();
        }
    }

    protected void changePanel_Click(object sender, EventArgs e)
    {
        string pnl = (((LinkButton)sender).CommandArgument.ToString()).ToString();

        panel1.Visible = false;
        panel2.Visible = false;
        panel3.Visible = false;
        panel4.Visible = false;

        //Panel a = (Panel)this.Controls.Find(pnl, true)[0]; ;
        //a.Visible = true;
        if(pnl == "panel1")
        {
            panel1.Visible = true;
        }
        else if(pnl == "panel2")
        {
            panel2.Visible = true;
        }
        else if (pnl == "panel3")
        {
            panel3.Visible = true;
        }
        else
        {
            panel4.Visible = true;
        }
    }

    protected void addGoods_Click(object sender, EventArgs e)
    {
        
        string imgurl = Server.MapPath("./images/") + upload_category.Text + "\\" + upload_id.Text + ".jpg";
        upload_img.SaveAs("C:\\Users\\83425\\source\\repos\\dzy\\images\\ts\\789.jpg");

        insertcmd.CommandText = "insert into goods values('" + upload_title.Text + "'," + decimal.Parse(upload_price.Text) + ", " + int.Parse(upload_stock.Text) + " ,'" + upload_category.Text + "','" + imgurl + "'," + int.Parse(upload_id.Text) + ",'" + upload_info.Text + "')";
        conn.Open();
        insertcmd.ExecuteNonQuery();

        conn.Close();
    }

    protected void updateGoods_Click(object sender, EventArgs e)
    {

    }

    protected void delGoods_Click(object sender, EventArgs e)
    {

    }
}