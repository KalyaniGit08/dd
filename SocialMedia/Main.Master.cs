using SocialMedia.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialMedia
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null)
                {
                    long userid = Convert.ToInt64(Session["userid"]);
                    GetData(userid);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        public void GetData(long uid)
        {
            DataTable dt = UserDetailsMaster.Getall(uid);
            if (dt.Rows.Count > 0)
            {
                img_url.Src = dt.Rows[0]["profile"].ToString();
                user_name.InnerText = dt.Rows[0]["username"].ToString();
                username.InnerText = dt.Rows[0]["username"].ToString();
            }
            else
            {
                img_url.Src = "/Images/avatar.jpg";
            }

            DataTable dt1 = RequestMaster.GetallId(uid);
            if (dt.Rows.Count > 0)
            {
                rpt_friendlist.DataSource = dt1;
                rpt_friendlist.DataBind();
            }
        }

        protected void btn_signout_ServerClick(object sender, EventArgs e)
        {
            Session["userid"] = "";
            Response.Redirect("Login.aspx");
        }
    }
}