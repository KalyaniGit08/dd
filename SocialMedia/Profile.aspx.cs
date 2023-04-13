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
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null)
                {
                    long userid = Convert.ToInt64(Session["userid"]);
                    GetData(userid);
                    GetFriendList();
                    GetList(userid);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        public void GetList(long userid)
        {
            DataTable dt = PostMaster.Getall();
            int count = (from r in dt.AsEnumerable() where Convert.ToInt64(r["user_id"]) == userid select r).Count();
            if(count > 0)
            {
                dt = (from r in dt.AsEnumerable() where Convert.ToInt64(r["user_id"]) == userid select r).CopyToDataTable();
                if (dt.Rows.Count > 0)
                {
                    rpt_postlist.DataSource = dt;
                    rpt_postlist.DataBind();
                }  
            }
            else
            {
                nopost.Visible = true;
            }

            DataTable dt1 = PostMaster.GetPostList(userid);
            if(dt1.Rows.Count>0)
            {
                rpt_photo.DataSource = dt1;
                rpt_photo.DataBind();
            }
            else
            {
                error_msg.Visible = true;
            }


            DataTable dt2 = PostMaster.GetCount(userid);
            if (dt2.Rows.Count > 0)
            {
                post.InnerText = dt2.Rows[0]["post_count"].ToString();
                friend.InnerText = dt2.Rows[0]["friend"].ToString();
            }

            DataTable dt3 = RequestMaster.GetFriendList(userid);
            if (dt.Rows.Count > 0)
            {
                rpt_friendlist.DataSource = dt3;
                rpt_friendlist.DataBind();
            }
            else
            {
                msg.Visible = true;
            }
        }
 
        public void GetData(long uid)
        {
            DataTable dt = UserDetailsMaster.Getall(uid);
            if (dt.Rows.Count > 0)
            {
                uimg.Src = dt.Rows[0]["profile"].ToString();
                uname.InnerText = dt.Rows[0]["username"].ToString();
                mobile.InnerText = dt.Rows[0]["mobile"].ToString();
                dob.InnerText = dt.Rows[0]["birthday"].ToString();
                //email.InnerHtml = dt.Rows[0]["email"].ToString();         
                address.InnerText = dt.Rows[0]["address"].ToString();
                gender.InnerText = dt.Rows[0]["gender"].ToString();
                img_user.Src = dt.Rows[0]["profile"].ToString();
            }
            else
            {
                uimg.Src = "/Images/avatar.jpg";
                img_user.Src = "/Images/avatar.jpg";
            }
        }
    }
}