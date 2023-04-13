using SocialMedia.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialMedia
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
        }

        protected void btn_sihnin_Click(object sender, EventArgs e)
        {
            UserRegMaster um = UserRegMaster.Get(txt_email.Value, txt_pass.Value);
            if(um.email != null && um.password != null)
            {
                Session["userid"] = um.id;
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User Credential Incorrect')", true);

            }
        }
    }
}