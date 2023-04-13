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
    public partial class FriendRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null)
                {
                    long userid = Convert.ToInt64(Session["userid"]);
                    Getall(userid);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        public void Getall(long id)
        {
            DataTable dt = RequestMaster.Getall(id);
            if (dt.Rows.Count > 0)
            {
                rpt_reqlist.DataSource = dt;
                rpt_reqlist.DataBind();
            }
            else
            {
                lbl_error.Visible = true;
            }
        }

        protected void rpt_reqlist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            RequestMaster rm = new RequestMaster();
            bool result = true;
            if (e.CommandName == "confirm")
            {
                long id = Convert.ToInt64(e.CommandArgument);
                rm.status = "Confirm";
                rm.id = id;
                result= Convert.ToBoolean( rm.Update());
                if(result == true)
                {
                    Getall(id);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Request Accepted!')", true);

                }
            }
            if(e.CommandName== "delete")
            {
                long id = Convert.ToInt64(e.CommandArgument);
                rm.status = "Reject";
                rm.id = id;
                result = Convert.ToBoolean(rm.Update());
                if (result == true)
                {
                    Getall(id);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Request Rejected!')", true);
                }
            }
        }
    }
}