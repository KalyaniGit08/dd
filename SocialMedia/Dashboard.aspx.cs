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
    public partial class Dashoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userid"] != null)
            {
                long userid = Convert.ToInt64(Session["userid"]);
                GetList();
                GetData(userid);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        public void GetData(long uid)
        {
            DataTable dt = UserDetailsMaster.Getall(uid);
            if (dt.Rows.Count > 0)
            {
                user_img.Src = dt.Rows[0]["profile"].ToString();

            }
            else
            {
                user_img.Src = "/Images/avatar.jpg";
            }
        }
        public void GetList()
        {
            DataTable dt = PostMaster.Getall();
            if (dt.Rows.Count > 0)
            {
                rpt_postlist.DataSource = dt;
                rpt_postlist.DataBind();
            }
            else
            {
                nopost.Visible = true;
            }
            //DataTable dt1 = LikeCommentMaster.GetLikeCount();
            //if (dt1.Rows.Count > 0)
            //{ 
            //}
        }

        protected void rpt_postlist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "like")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                long uid = Convert.ToInt64(commandArgs[0]);
                long pid = Convert.ToInt64(commandArgs[1]);

                long userid = Convert.ToInt64(Session["userid"]);

                DataTable dt = LikeCommentMaster.Getall();
             
                if (dt.Rows.Count > 0)
                {
                    int count = (from r in dt.AsEnumerable() where Convert.ToInt64(r["given_by"]) == userid && Convert.ToInt64(r["post_id"])==pid select r).Count();
                    if (count > 0)
                    {
                    }
                    else
                    {
                        LikeCommentMaster lm = new LikeCommentMaster();
                        lm.user_like = true;
                        lm.post_id = pid;
                        lm.given_by = userid;
                        lm.status = "Like";
                        lm.isactive = true;
                        lm.created_by = 1;
                        lm.created_date = DateTime.Now;
                        lm.Add();
                        if (lm.id > 0)
                        {
                            GetList();
                        }
                    }
                }
                else
                {
                    LikeCommentMaster lm = new LikeCommentMaster();
                    lm.user_like = true;
                    lm.post_id = pid;
                    lm.given_by = userid;
                    lm.status = "Like";
                    lm.isactive = true;
                    lm.created_by = 1;
                    lm.created_date = DateTime.Now;
                    lm.Add();
                    if (lm.id > 0)
                    {
                    }
                }
               
            }
            if (e.CommandName == "comment")
            {
                foreach (RepeaterItem item in rpt_postlist.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                        TextBox textBox = item.FindControl("txt_comment") as TextBox;
                        if (textBox != null)
                        {
                            string textBoxValue = textBox.Text;
                            // do something with the textbox value
                        }
                    }
                }

                
                //RepeaterItem item = (RepeaterItem)e.Item; // cast the sender object to RepeaterItem
                //TextBox txt_comment = (TextBox)item.FindControl("txt_com"); // find the TextBox control in the RepeaterItem
                //string commentText = txt_comment.Text;

                TextBox tbAmount = (TextBox)e.Item.FindControl("txt_comment");




                long pid = Convert.ToInt64(e.CommandArgument);
                long userid = Convert.ToInt64(Session["userid"]);

                LikeCommentMaster lm = new LikeCommentMaster();
                lm.comment = "";
                lm.post_id = pid;
                lm.given_by = userid;
                lm.status = "Comment";
                lm.isactive = true;
                lm.created_by = 1;
                lm.created_date = DateTime.Now;
                lm.Add();
                if (lm.id > 0)
                {
                    GetList();
                }

            }
        }

        public void get()
        {
            foreach (RepeaterItem item in rpt_postlist.Items)
            {
                TextBox box = (TextBox)item.FindControl("txt_comment");
                string b = box.Text; 
            }
        }
        protected void rpt_postlist_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Label like = (Label)e.Item.FindControl("like_count");

               
                //DataTable dt = LikeCommentMaster.GetLikeCount();
                //if (dt.Rows.Count > 0)
                //{
                //    int count = (from r in dt.AsEnumerable() where Convert.ToBoolean(r["column1"]) == true select r).Count();
                //    like.Text = count.ToString();
                //}
            }
        }

        protected void btn_sendmsg_ServerClick(object sender, EventArgs e)
        {
  
        }
    }
}