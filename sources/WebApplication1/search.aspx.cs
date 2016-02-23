using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void abstrLev_Click(object sender, EventArgs e)
        {
            contextPanel.Visible = false;
            matrixPanel.Visible = true;
           
        }

        protected void Label1_Click(object sender, EventArgs e)
        {
            matrixPanel.Visible = false;
            contextPanel.Visible = true;
           
        }
    }
}