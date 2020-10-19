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
}