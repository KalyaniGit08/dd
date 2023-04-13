using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialMedia
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string filenam = imageUpload.FileName.ToString();
            imageUpload.SaveAs(Server.MapPath("/Images/Profile/" + filenam));

            imagePreview.ImageUrl = "/Images/Profile/" + filenam;
        }

        
    }
}