using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Insert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void InsertTech_Click(object sender, EventArgs e)
        {
            ListofTech.Visible = false;
            ListofContext.Visible = false;
            technologyList.Visible = false;
            contextList.Visible = false;
            technologyControlPanel.Visible = true;
            Session["mode"] = "Insert";
            contextControlPanel.Visible = false;
            impactControlPanel.Visible = false;
        }
        protected void InsertCont_Click(object sender, EventArgs e)
        {
            ListofTech.Visible = true;
            ListofContext.Visible = false;
            technologyList.Visible = true;
            contextList.Visible = false;
            technologyControlPanel.Visible = false;
            contextControlPanel.Visible = true;
            impactControlPanel.Visible = false;
        }
        protected void InsertImp_Click(object sender, EventArgs e)
        {
            ListofTech.Visible = true;
            ListofContext.Visible = true;
            technologyList.Visible = true;
            contextList.Visible = true;
            technologyControlPanel.Visible = false;
            contextControlPanel.Visible = false;
            impactControlPanel.Visible = true;
        }
       
}
}