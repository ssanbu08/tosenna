using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
namespace SchoolNet
{
    public partial class Print : SchoolNetBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                Control ctrl = (Control)Session["ctrl"];
                PrintHelper.PrintWebControl(ctrl);
            }
        }
    }
}