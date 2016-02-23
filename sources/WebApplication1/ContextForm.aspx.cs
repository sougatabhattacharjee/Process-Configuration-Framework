using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlServerCe;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ContextForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                String mode = "";
                mode = Request.QueryString.Get("mode");
                if (!String.IsNullOrEmpty(mode) && mode.Equals("Insert"))
                {
                    FormView1.ChangeMode(FormViewMode.Insert);
                    //Page.Title = "Insert Context related to Technology :" + Request.QueryString.Get("TechName");
                    Page.Title = "Insert Context";
                }
                if (!String.IsNullOrEmpty(mode) && mode.Equals("Edit"))
                {
                    FormView1.ChangeMode(FormViewMode.Edit);
                    Page.Title = "Edit Context";
                    SqlDataSource1.UpdateParameters["Id"].DefaultValue = Request.QueryString.Get("c");
                    RelatedTechnology.SelectParameters["cID"].DefaultValue = Request.QueryString.Get("c");
                    ALLTechnology.SelectParameters["cID"].DefaultValue = Request.QueryString.Get("c");
                    ALLImpact.SelectParameters["tID"].DefaultValue = Request.QueryString.Get("t");
                    ALLImpact.SelectParameters["cID"].DefaultValue = Request.QueryString.Get("c");
                    RelatedImpact.SelectParameters["tID"].DefaultValue = Request.QueryString.Get("t");
                    RelatedImpact.SelectParameters["cID"].DefaultValue = Request.QueryString.Get("c");

                }


              
                String query = "SELECT Contexts.* FROM Contexts";
                try
                {

                    String c = Request.QueryString.Get("c");
                    if (c != null)
                    {

                        query = query + " where Contexts.ID =" + c; // +"where...";
                        SqlDataSource1.SelectCommand = query;
                    }

                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }

            }
            
            
            
            
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            DropDownList Industrial_Sector = FormView1.FindControl("Industrial_Sector") as DropDownList;
            SqlDataSource1.UpdateParameters["Industrial_Sector"].DefaultValue = Industrial_Sector.SelectedValue;

            
            
            String TechnologyId = "";
            try
            {
              TechnologyId=(String)  Request.QueryString["t"];
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            HiddenField contextIdField = FormView1.FindControl("ContextID") as HiddenField;
            Response.Redirect("ImpactOnSoftware.aspx?t="+TechnologyId+"&c="+contextIdField.Value+"&mode=Insert");
            //Response.Redirect("ImpactOnSoftware.aspx?t=15&c=24");
        }

        protected void ListExistingTechnology_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {

            DataView dv = (DataView)selectMaxContextId.Select(DataSourceSelectArguments.Empty);
            int ContextId = (int)dv.Table.Rows[0][0];
            
            
            String TechnologyId = "";
            TechnologyId = (String)Request.QueryString["t"];
           // HiddenField contextIdField = FormView1.FindControl("ContextID") as HiddenField;
           
            InsertTCI.InsertParameters["Technology"].DefaultValue = TechnologyId;
            InsertTCI.InsertParameters["Context"].DefaultValue = ContextId.ToString();
            InsertTCI.InsertParameters["Impact"].DefaultValue = "-1";

            //Response.Write(">>>>>." + ContextId.ToString());


            if (!String.IsNullOrEmpty(TechnologyId) && !String.IsNullOrEmpty(ContextId.ToString()))
                InsertTCI.Insert();
        }

        protected void FormView_ModeChanged(Object sender, EventArgs e)
        {

            // Display the current mode in the header row.
            switch (FormView1.CurrentMode)
            {
                case FormViewMode.Insert:
                    Page.Title = "Insert Context";
                    //FormView1.HeaderStyle.BackColor = System.Drawing.Color.Red;
                    break;
                case FormViewMode.ReadOnly:
                    Page.Title = "Context Details";
                    //FormView1.HeaderStyle.BackColor = System.Drawing.Color.Green;
                    break;
                case FormViewMode.Edit:
                    Page.Title = "Edit Context";
                    //FormView1.HeaderStyle.BackColor = System.Drawing.Color.Green;
                    break;
                default:
                    FormView1.HeaderText = "Unsupported mode.";
                    //FormView1.HeaderStyle.BackColor = System.Drawing.Color.Yellow;
                    break;
            }

        }
        protected void UpdateButton_Click(object sender, EventArgs e)
        {

            DropDownList Industrial_Sector = FormView1.FindControl("Industrial_Sector") as DropDownList;
            SqlDataSource1.UpdateParameters["Industrial_Sector"].DefaultValue = Industrial_Sector.SelectedValue;

        }



        protected void DeleteTechnology(object sender, EventArgs e)
        {

            LinkButton lnkRemove = (LinkButton)sender;
            Label lblMessage = FormView1.FindControl("lblMessage") as Label;
            GridView grd1 = FormView1.FindControl("GridView1") as GridView;
            //UpdatePanel upd1 = FormView1.FindControl("AddContextUpdatePanel") as UpdatePanel;

            UpdatePanel upd1 = FormView1.FindControl("UpdatePanel2") as UpdatePanel;
            using (SqlCeConnection conn = new SqlCeConnection())
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PCF_CONNECTION"].ConnectionString;


                String deleteTechnology = "delete from  TCI where " +
                "Technology=@ID and Context=@cID and impact = -1;";



                SqlCeCommand command = new SqlCeCommand(deleteTechnology, conn);
                command.Parameters.Add("@ID", SqlDbType.Int).Value = lnkRemove.CommandArgument;
                command.Parameters.Add("@cID", SqlDbType.Int).Value = Request.QueryString.Get("c");


                try
                {

                    conn.Open();
                    SqlCeDataReader reader = command.ExecuteReader();
                    //Response.Write(">>>>>>>>>>"+reader.RecordsAffected);


                    if (reader.RecordsAffected == 0)
                        lblMessage.Text = "Technology Cannot Be Deleted!!";
                    else
                    {

                        lblMessage.Text = "Technology Deleted successfully!!";

                    }
                    reader.Close();


                    conn.Close();

                }
                catch (Exception ee)
                {
                    //lblMessage.Text = ee.Message;
                    Response.Write(ee.StackTrace);
                }


                grd1.DataBind();
                upd1.DataBind();
                // upd1.Update();
            }
        }

        protected void AddRelTech(object sender, EventArgs e)
        {

            Panel p = FormView1.FindControl("AddTechnologyUpdatePanel") as Panel;
            Button Button2 = FormView1.FindControl("Button2") as Button;
            if (p.Visible == false)
            {
                FormView1.FindControl("AddTechnologyUpdatePanel").Visible = true;

                Button2.Text = "Cancel";
            }

            else
            {
                FormView1.FindControl("AddTechnologyUpdatePanel").Visible = false;

                Button2.Text = "Add Related Technology";
            }


        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //insert data into the database
            Button Button3 = (Button)sender;
            Label lblMessage = FormView1.FindControl("lblMessage") as Label;
            GridView grd1 = FormView1.FindControl("GridView1") as GridView;
            UpdatePanel upd1 = FormView1.FindControl("UpdatePanel2") as UpdatePanel;
            //UpdatePanel upd1 = FormView1.FindControl("AddContextUpdatePanel") as UpdatePanel;
            DropDownList DropDownList1 = FormView1.FindControl("DropDownList1") as DropDownList;

            //DropDownList DropDownList1 = (DropDownList)sender;


            using (SqlCeConnection conn = new SqlCeConnection())
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PCF_CONNECTION"].ConnectionString;


                String AddContext = "insert into TCI(Technology,Context,Impact) values(@tID,@ID,-1) ";

                SqlCeCommand command = new SqlCeCommand(AddContext, conn);
                //Response.Write(DropDownList1.SelectedValue);
                command.Parameters.Add("@ID", SqlDbType.Int).Value = Request.QueryString.Get("c");
                command.Parameters.Add("@tID", SqlDbType.Int).Value = DropDownList1.SelectedValue;


                try
                {

                    conn.Open();
                    SqlCeDataReader reader = command.ExecuteReader();
                    //Response.Write(">>>>>>>>>>"+reader.RecordsAffected);
                    lblMessage.Text = "Technology Added Successfully!!";


                    reader.Close();


                    conn.Close();

                }
                catch (Exception ee)
                {
                    Response.Write(ee.StackTrace);
                }


                grd1.DataBind();

                upd1.DataBind();

            }





            //UpdatePanel pnl = FormView1.FindControl("AddContextUpdatePanel") as UpdatePanel;
            // upd1.Visible = false;



        }

        protected void DeleteImpact(object sender, EventArgs e)
        {

            LinkButton lnkRemove = (LinkButton)sender;
            Label lblMessage = FormView1.FindControl("Label11") as Label;
            GridView grd1 = FormView1.FindControl("GridView1") as GridView;
            //UpdatePanel upd1 = FormView1.FindControl("AddContextUpdatePanel") as UpdatePanel;

            UpdatePanel upd1 = FormView1.FindControl("UpdatePanel1") as UpdatePanel;
            using (SqlCeConnection conn = new SqlCeConnection())
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PCF_CONNECTION"].ConnectionString;


                int count = 0;
                String AddContextCount = "select count(*) from TCI where Context=@cID and Technology=@tID ;";
                SqlCeCommand commandCnt = new SqlCeCommand(AddContextCount, conn);
                //command.Parameters.Add("@ID", SqlDbType.Int).Value = DropDownList1.SelectedValue;
                commandCnt.Parameters.Add("@tID", SqlDbType.Int).Value = Request.QueryString.Get("t");
                commandCnt.Parameters.Add("@cID", SqlDbType.Int).Value = Request.QueryString.Get("c");

                try
                {
                    conn.Open();
                    SqlCeDataReader reader = commandCnt.ExecuteReader();
                    while (reader.Read())
                    {
                        count = (int)reader[0];
                    }
                    reader.Close();
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Console.Write(ex.StackTrace);
                }   



                
                String deleteImpact="";
                
                if(count>1)
                     deleteImpact = "delete from TCI where " +
                " Context=@cID and impact = @ID and Technology=@tID;";

                else
                    deleteImpact = "Update TCI SET Impact = -1 where " +
                    " Context=@cID and impact = @ID and Technology=@tID;";
                   


                SqlCeCommand command = new SqlCeCommand(deleteImpact, conn);
                command.Parameters.Add("@ID", SqlDbType.Int).Value = lnkRemove.CommandArgument;
                command.Parameters.Add("@cID", SqlDbType.Int).Value = Request.QueryString.Get("c");
                command.Parameters.Add("@tID", SqlDbType.Int).Value = Request.QueryString.Get("t");


                try
                {

                    conn.Open();
                    SqlCeDataReader reader = command.ExecuteReader();
                    //Response.Write(">>>>>>>>>>"+reader.RecordsAffected);


                    if (reader.RecordsAffected == 0)
                        lblMessage.Text = "Impact Cannot Be Deleted!!";
                    else
                    {

                        lblMessage.Text = "Impact Deleted successfully!!";

                    }
                    reader.Close();


                    conn.Close();

                }
                catch (Exception ee)
                {
                    //lblMessage.Text = ee.Message;
                    Response.Write(ee.StackTrace);
                }


                grd1.DataBind();
                upd1.DataBind();
                // upd1.Update();
            }
        }

        protected void AddRelImp(object sender, EventArgs e)
        {

            Panel p = FormView1.FindControl("AddImpactUpdatePanel") as Panel;
            Button Button5 = FormView1.FindControl("Button5") as Button;
            if (p.Visible == false)
            {
                FormView1.FindControl("AddImpactUpdatePanel").Visible = true;

                Button5.Text = "Cancel";
            }

            else
            {
                FormView1.FindControl("AddImpactUpdatePanel").Visible = false;

                Button5.Text = "Add Related Impact";
            }


        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            //insert data into the database
            Button Button6 = (Button)sender;
            Label lblMessage = FormView1.FindControl("Label11") as Label;
            GridView grd1 = FormView1.FindControl("GridView1") as GridView;
            UpdatePanel upd1 = FormView1.FindControl("UpdatePanel1") as UpdatePanel;
            //UpdatePanel upd1 = FormView1.FindControl("AddContextUpdatePanel") as UpdatePanel;
            DropDownList DropDownList1 = FormView1.FindControl("DropDownList3") as DropDownList;

            //DropDownList DropDownList1 = (DropDownList)sender;


            using (SqlCeConnection conn = new SqlCeConnection())
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PCF_CONNECTION"].ConnectionString;

                int count = 0;
                String AddContextCount = "select count(*) from TCI where Context=@cID and Technology=@tID and impact = -1;";
                SqlCeCommand commandCnt = new SqlCeCommand(AddContextCount, conn);
                //command.Parameters.Add("@ID", SqlDbType.Int).Value = DropDownList1.SelectedValue;
                commandCnt.Parameters.Add("@tID", SqlDbType.Int).Value = Request.QueryString.Get("t");
                commandCnt.Parameters.Add("@cID", SqlDbType.Int).Value = Request.QueryString.Get("c");

                try
                {
                    conn.Open();
                    SqlCeDataReader reader = commandCnt.ExecuteReader();
                    while (reader.Read())
                    {
                        count = (int)reader[0];
                    }
                    reader.Close();
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Console.Write(ex.StackTrace);
                }   


                String AddContext = "";


                if(count==1)
                    AddContext = "Update TCI Set Impact = @ID where Context=@cID and Technology=@tID and impact = -1;";
                else
                    AddContext = "insert into TCI(technology,context,impact)  values(@tID,@cID,@ID);";



                SqlCeCommand command = new SqlCeCommand(AddContext, conn);
                command.Parameters.Add("@ID", SqlDbType.Int).Value = DropDownList1.SelectedValue;
                command.Parameters.Add("@tID", SqlDbType.Int).Value = Request.QueryString.Get("t");
                command.Parameters.Add("@cID", SqlDbType.Int).Value = Request.QueryString.Get("c");

                try
                {

                    conn.Open();
                    SqlCeDataReader reader = command.ExecuteReader();
                    //Response.Write(">>>>>>>>>>"+reader.RecordsAffected);



                    reader.Close();


                    conn.Close();

                }
                catch (Exception ee)
                {
                    Response.Write(ee.StackTrace);
                }


                grd1.DataBind();

                upd1.DataBind();

            }





            //UpdatePanel pnl = FormView1.FindControl("AddContextUpdatePanel") as UpdatePanel;
            // upd1.Visible = false;



        }

        protected void insertImpact_Click(object sender, EventArgs e)
        {
            HiddenField lb1 = (HiddenField)FormView1.FindControl("HiddenField1");
            //Label NameLabel = FormView1.FindControl("NameLabel") as Label;
            ////Response.Redirect("ContextExample.aspx?t=" + lb1.Value);
            //Label bx = FormView1.FindControl("Label31") as Label;
            Response.Redirect("ImpactOnSoftware.aspx?t=" + Request.QueryString.Get("t") + "&mode=Insert&c=" + lb1.Value);


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DropDownList Industrial_Sector = FormView1.FindControl("Industrial_Sector") as DropDownList;
            SqlDataSource1.InsertParameters["Industrial_Sector"].DefaultValue = Industrial_Sector.SelectedValue;
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {

            Response.Redirect("ContextForm.aspx?t=" + Request.QueryString.Get("t") + "&mode=Edit&c=" + Request.QueryString.Get("c"));


        }
}
}