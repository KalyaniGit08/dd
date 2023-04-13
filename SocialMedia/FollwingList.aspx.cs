using SocialMedia.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialMedia
{
    public partial class FriendRequestList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                long userid = Convert.ToInt64(Session["userid"]);
                GetList(userid);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        public void GetList(long uid)
        {
            DataTable dt = RequestMaster.GetFollwingList(uid);
            if (dt.Rows.Count > 0)
            {
                rpt_followingist.DataSource = dt;
                rpt_followingist.DataBind();
            }
            else
            {
                nomsg.Visible = true;
            }
        }
    }
}