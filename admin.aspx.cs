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

    public static void Alert(System.Web.UI.Page page, string msg)
    {
        page.ClientScript.RegisterStartupScript(page.GetType(), "message", "<script type='text/javascript'>alert('" + msg.ToString() + "');</script>");
    }

    protected void addGoods_Click(object sender, EventArgs e)
    {
        string tempurl = "./images/" + upload_category.Text + "/" + upload_id.Text + ".jpg";
        string imgurl = Server.MapPath(tempurl);
        if (FileUpload1.HasFile)
        {
            string endpath = Server.MapPath(imgurl);//映射绝对路径
            upload_img.SaveAs(endpath);
        }
        else
        {
            Alert(this, "error");
        }

        insertcmd.CommandText = "insert into goods values(N'" + upload_title.Text + "'," + decimal.Parse(upload_price.Text) + ", " + int.Parse(upload_stock.Text) + " ,'" + upload_category.Text + "','" + tempurl + "'," + int.Parse(upload_id.Text) + ",N'" + upload_info.Text + "')";
        conn.Open();
        insertcmd.ExecuteNonQuery();

        conn.Close();
    }

    protected void updateGoods_Click(object sender, EventArgs e)
    {
        
    }

    protected void delGoods_Click(object sender, EventArgs e)
    {
        string category = del_category.Text;
        int id = int.Parse(del_id.Text);
        deletecmd.CommandText = "delete from goods where g_id="+ id +" and g_category = '" + category + "';";
        conn.Open();
        deletecmd.ExecuteNonQuery();

        conn.Close();
    }
}