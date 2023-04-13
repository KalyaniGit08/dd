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
    public partial class ProfileEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    if (Session["userid"] != null)
            //    {
            //        long userid = Convert.ToInt64(Session["userid"]);
            //    }
            //    else
            //    {
            //        Response.Redirect("Login.aspx");
            //    }
            //}
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            long userid = Convert.ToInt64(Session["userid"]);
            DataTable dt = UserDetailsMaster.Getall(userid);

            int count = (from r in dt.AsEnumerable() where Convert.ToInt64(r["userid"]) == userid select r).Count();
            if (count > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Update Your Details')", true);
            }
            else
            {
                //if (flupImage.PostedFile != null)
                //{
                //    string FileName = Path.GetFileName(flupImage.PostedFile.FileName);
                //    flupImage.SaveAs(Server.MapPath("/Images/Profile" + FileName));

                UserDetailsMaster um = new UserDetailsMaster();
                um.user_id = userid;
                // um.profile = "/Images/Profile" + FileName;
                um.username = uname.Value;
                um.mobile = cname.Value;
                if (male.Checked)
                {
                    um.gender = "male";
                }
                if (female.Checked)
                {
                    um.gender = "female";
                }
                um.birthday = dob.Value;
                um.country = txt_country.Value;
                um.state = txt_state.Value;
                um.address = txt_address.Value;
                um.Add();
                if (um.id > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User Details Added!')", true);
                }
                //  }
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {

        }
        protected void btnPreview_Click(object sender, EventArgs e)
        {
            //Stream strm = upload1.PostedFile.InputStream;
            string FileName = Path.GetFileName(flupImage.FileName);
            flupImage.SaveAs(Server.MapPath("/Images/Profile/" + FileName));
        }
        protected void btn_submit_ServerClick(object sender, EventArgs e)
        {

            long userid = Convert.ToInt64(Session["userid"]);
            DataTable dt = UserDetailsMaster.Getall(userid);

            int count = (from r in dt.AsEnumerable() where Convert.ToInt64(r["userid"]) == userid select r).Count();
            if (count > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Update Your Details')", true);
            }
            else
            {
                if (flupImage.HasFile)
                {
                    var img = ImgPrv.ImageUrl;
                    //var filename = Path.GetFileName(flupImage.FileName);
                    //var path = Path.Combine(Server.MapPath("~/Images/Profile/"), filename);
                    //flupImage.SaveAs(path);


                    var imdg = Request.Form["output"];

                    string FileName = Path.GetFileName(flupImage.FileName);
                    flupImage.SaveAs(Server.MapPath("/Images/Profile/" + FileName));

                    UserDetailsMaster um = new UserDetailsMaster();
                    um.user_id = userid;
                    // um.profile = "/Images/Profile" + FileName;
                    um.username = uname.Value;
                    um.mobile = cname.Value;
                    if (male.Checked)
                    {
                        um.gender = "male";
                    }
                    if (female.Checked)
                    {
                        um.gender = "female";
                    }
                    um.birthday = dob.Value;
                    um.country = txt_country.Value;
                    um.state = txt_state.Value;
                    um.address = txt_address.Value;
                    um.Add();
                    if (um.id > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User Details Added!')", true);
                    }
               }
            }
        }

        protected void btnPreview_ServerClick(object sender, EventArgs e)
        {
            string FileName = Path.GetFileName(flupImage.FileName);
            flupImage.SaveAs(Server.MapPath("/Images/Profile/" + FileName));
            ImgPrv.Visible = true;
            ImgPrv.ImageUrl = "/Images/Profile/" + FileName;

        }
    }
}