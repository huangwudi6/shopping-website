using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    static string str = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\dzy.mdf;Integrated Security=True";
    static SqlConnection conn = new SqlConnection(str);

    //select
    SqlCommand selectcmd = conn.CreateCommand();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public static void Alert(System.Web.UI.Page page, string msg)
    {
        page.ClientScript.RegisterStartupScript(page.GetType(), "message", "<script type='text/javascript'>alert('" + msg.ToString() + "');</script>");
    }

    protected void login_Click(object sender, EventArgs e)
    {
        string username1 = username.Text;
        string password1 = password.Text;
        selectcmd.CommandText = "select password from users where username='" + username1 + "';";
        if(conn.State == System.Data.ConnectionState.Closed)
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
            if (password1 == dr["password"].ToString())
            {
                Session["username"] = username1;
                Response.Redirect("./Default.aspx");
            }
            else
            {
                Alert(this, "用户名或密码错误！");
            }
        }

        conn.Close();
    }
}