using SocialMedia.DAL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialMedia
{
    public partial class CreatePost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null)
                {
                    long userid = Convert.ToInt64(Session["userid"]);            
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
       

        protected void btn_post_ServerClick(object sender, EventArgs e)
        {
            //var img = Request.Form["output"];

            PostMaster pm = new PostMaster();
            pm.user_id = Convert.ToInt64(Session["userid"]);
            pm.image_url = imagePreview.ImageUrl;
            pm.post_text = txt_posttext.Value;
            pm.location = txt_location.Value;
            pm.isactive = true;
            pm.created_by = Convert.ToInt64(Session["userid"]);
            pm.created_date = DateTime.Now;
            pm.Add();
            if (pm.post_id > 0)
            {
                Response.Redirect("Dashboard.aspx");
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string filenam = imageUpload.FileName.ToString();
            if(filenam != "")
            {

                imageUpload.SaveAs(Server.MapPath("/Images/Post/" + filenam));

                imagePreview.ImageUrl = "/Images/Post/" + filenam;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Upload Image!')", true);

            }
        }
    }
}