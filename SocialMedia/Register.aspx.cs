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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btn_signup_Click(object sender, EventArgs e)
        {
            DataTable dt = UserRegMaster.Getall();
            if (dt.Rows.Count > 0)
            {
                int count = (from r in dt.AsEnumerable() where r["email"].ToString() == txt_email.Value select r).Count();

                if (count == 0)
                {
                    UserRegMaster um = new UserRegMaster();
                    um.username = txt_uname.Value;
                    um.email = txt_email.Value;
                    um.password = txt_pass.Value;
                    um.isactive = true;
                    um.created_by = 1;
                    um.created_date = DateTime.Now;
                    um.Add();
                    if (um.id > 0)
                    {
                        clear();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User Created Successfully!')", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User Email Already Register')", true);

                }
            }
        }

        public void clear()
        {
            txt_email.Value = txt_pass.Value= txt_uname.Value= "";
        }
    }
}