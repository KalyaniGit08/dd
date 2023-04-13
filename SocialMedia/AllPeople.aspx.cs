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
    public partial class FriendList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
        }

        public void GetList(long uid)
        {
            DataTable dt = RequestMaster.GetallId(uid);
            if (dt.Rows.Count > 0)
            {
                //dt = (from r in dt.AsEnumerable() where  r["status"].ToString() == "" && Convert.ToInt64(r["senderid"]) == uid select r).CopyToDataTable();
                rpt_friendlist.DataSource = dt;
                rpt_friendlist.DataBind();
            }
        }

        protected void rpt_friendlist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Request")
            {
                //string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                long friendd = Convert.ToInt64(e.CommandArgument);
                //string status = commandArgs[1];

                RequestMaster rm = new RequestMaster();
                rm.senderid = Convert.ToInt64(Session["userid"]);
                rm.recieverid = friendd;
                rm.status = "Request Send";
                rm.isactive = true;
                rm.created_by = 1;
                rm.created_date = DateTime.Now;
                rm.Add();
                if (rm.id > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Request Send Successfully')", true);
                    
                }
            }
        }

        protected void rpt_friendlist_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton button = (LinkButton)e.Item.FindControl("btn_req");
               // button.Visible = false;
                if(button.Text == "Request Send")
                {
                    button.Text = "Request Sent";
                    button.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}