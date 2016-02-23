using System;
using System.Collections.Generic;
using System.Data.SqlServerCe;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class InsertNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Label lbl = (Label)this.impactControlPanel.FindControl("Impact_Name");
                if(lbl!=null)
                selectedImpact.Text = lbl.Text;
            }  
        }
        protected void InsertTech_Click(object sender, EventArgs e)
        {
            //ListofTech.Visible = false;
            //ListofContext.Visible = false;
            //technologyList.Visible = false;
            //contextList.Visible = false;
            technologyControlPanel.Visible = true;
            //Session["mode"] = "Insert";
            contextControlPanel.Visible = false;
            impactControlPanel.Visible = false;
        }
        protected void InsertCont_Click(object sender, EventArgs e)
        {
            //ListofTech.Visible = true;
            //ListofContext.Visible = false;
            //technologyList.Visible = true;
            //contextList.Visible = false;
            technologyControlPanel.Visible = false;
            contextControlPanel.Visible = true;
            impactControlPanel.Visible = false;
        }
        protected void InsertImp_Click(object sender, EventArgs e)
        {
            //ListofTech.Visible = true;
            //ListofContext.Visible = true;
            //technologyList.Visible = true;
            //contextList.Visible = true;
            technologyControlPanel.Visible = false;
            contextControlPanel.Visible = false;
            impactControlPanel.Visible = true;
        }

        protected void technologyList_DataBound(object sender, EventArgs e)
        {
            technologyList.Items.Insert(0, new ListItem("--- Select Technology---", String.Empty));
        }


        protected void contextList_DataBound1(object sender, EventArgs e)
        {
            contextList.Items.Insert(0, new ListItem("--- Select Context---", String.Empty));
        }
        protected void ButtonNext_Click(object sender, EventArgs e)
        {
            contextList.Visible = true;
            //InsertImp.Visible = true;
        }
        protected void technologyList_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            int t_ID = 0;

            if (!technologyList.SelectedValue.Equals(""))
                t_ID = Convert.ToInt32(technologyList.SelectedValue);
            //Response.Write("t_ID>>>>>>>>" + t_ID);
            
            String selectContext = "select ID, Name from Contexts where Contexts.ID in (SELECT Context FROM TCI WHERE Technology =" + t_ID + ")";
            //Response.Write("selectContext>>>>>>>>" + selectContext);
            ALL_Context.SelectCommand = selectContext;
            contextList.DataBind();
            selectedTech.Text = technologyList.SelectedItem+"";
           
            InsertCont.Visible = (!technologyList.SelectedValue.Equals(""));
            ButtonNext.Visible = (!technologyList.SelectedValue.Equals(""));

            if (contextList.Visible==true && technologyList.SelectedValue.Equals(""))
            contextList.Visible = (!technologyList.SelectedValue.Equals(""));
            if (InsertImp.Visible == true && technologyList.SelectedValue.Equals(""))
            InsertImp.Visible = (!technologyList.SelectedValue.Equals(""));

            Session["tech"] = t_ID;

          //  Response.Write(">>>>" + Session["tech"]);

           // contextControl = t_ID;

           // contextControl ctrl = new contextControl();
            //ctrl.myIntValue = 5;
        }
        protected void contextList_SelectedIndexChanged(object sender, EventArgs e)
        {
            InsertImp.Visible = true;
            selectedContext.Text = contextList.SelectedItem + "";

            int c_ID = 0;

            if (!contextList.SelectedValue.Equals(""))
                c_ID = Convert.ToInt32(contextList.SelectedValue);

            Session["context"] = c_ID;
        }
}
}