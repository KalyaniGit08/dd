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
    public partial class WebForm1 : System.Web.UI.Page
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
        public void GetData(long id)
        {
            DataTable dt = UserDetailsMaster.Getall(id);
            if (dt.Rows.Count > 0)
            {
                imagePreview.ImageUrl = dt.Rows[0]["profile"].ToString();
                uname.Value = dt.Rows[0]["username"].ToString();
                cname.Value = dt.Rows[0]["mobile"].ToString();
                dob.Value = dt.Rows[0]["birthday"].ToString();
                txt_state.Value = dt.Rows[0]["state"].ToString();
                txt_country.Value = dt.Rows[0]["country"].ToString();
                txt_address.Value = dt.Rows[0]["address"].ToString();

                if (dt.Rows[0]["gender"].ToString() == "male")
                {
                    male.Checked = true;
                }
                if (dt.Rows[0]["gender"].ToString() == "female")
                {
                    male.Checked = true;
                }
            }
        }

        protected void btn_sumbit_Click(object sender, EventArgs e)
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
                UserDetailsMaster um = new UserDetailsMaster();
                um.user_id = userid;
                um.profile = imagePreview.ImageUrl;
                um.username = uname.Value;
                um.mobile = cname.Value;
                if (male.Checked == true)
                {
                    um.gender = "male";
                }
                if (female.Checked == true)
                {
                    um.gender = "female";
                }
                um.birthday = dob.Value;
                um.country = txt_country.Value;
                um.state = txt_state.Value;
                um.address = txt_address.Value;
                um.isactive = true;
                um.created_by = 1;
                um.created_date = DateTime.Now;
                um.Add();
                if (um.id > 0)
                {
                    Response.Redirect("Profile.aspx");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User Details Added!')", true);
                }

            }

        }

        protected void btn_updatedata_Click(object sender, EventArgs e)
        {
            UserDetailsMaster um = new UserDetailsMaster();
            um.user_id = Convert.ToInt64(Session["userid"]);
            um.profile = imagePreview.ImageUrl;
            um.username = uname.Value;
            um.mobile = cname.Value;
            if (male.Checked == true)
            {
                um.gender = "male";
            }
            if (female.Checked == true)
            {
                um.gender = "female";
            }
            um.birthday = dob.Value;
            um.country = txt_country.Value;
            um.state = txt_state.Value;
            um.address = txt_address.Value;
            //um.isactive = true;
            //um.created_by = 1;
            //um.created_date = DateTime.Now;
            um.Update();
            if (um.user_id > 0)
            {
                Response.Redirect("Profile.aspx");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User Details Updated!')", true);
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string filenam = imageUpload.FileName.ToString();
            imageUpload.SaveAs(Server.MapPath("/Images/Profile/" + filenam));

            imagePreview.ImageUrl = "/Images/Profile/" + filenam;
        }
    }
}