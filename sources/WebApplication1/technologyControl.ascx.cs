using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlServerCe;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class technologyControl : System.Web.UI.UserControl
    {
        int TechnologyId = 0;
        int authorID = 0;
        int flagChk = 0;
        ArrayList AbstractionLabelInputArray = new ArrayList();
        ArrayList ViewPointInputArray = new ArrayList();
        ArrayList AbstractionLabelOutputArray = new ArrayList();
        ArrayList ViewPointOutputArray = new ArrayList();
        ArrayList AbstractionName = new ArrayList();
        ArrayList ViewPointName = new ArrayList();
        ArrayList methodTool = new ArrayList();
        ArrayList Alternatives = new ArrayList();
        ArrayList Complements = new ArrayList();
        static public int flag = 0;
        static public String auhtorNameStr = String.Empty;
        static public String authorEmailStr = String.Empty;
        static public String authorAffiliationStr = String.Empty;
        String authorList1;


        protected void Page_Load(object sender, EventArgs e)
        {
            {


                String mode = "";
               // mode = Request.QueryString.Get("mode");
                mode = "Insert";
                if (Session["mode"]!=null)
                mode = Session["mode"].ToString();
              //  Response.Write("mode>>>>>>>"+mode);
                if (!String.IsNullOrEmpty(mode) && mode.Equals("Insert"))
                {
                    FormView1.ChangeMode(FormViewMode.Insert);
                    //Page.Title = "Insert Technology";
                }
                if (!String.IsNullOrEmpty(mode) && mode.Equals("Edit"))
                {
                    FormView1.ChangeMode(FormViewMode.Edit);
                    //Page.Title = "Edit Technology";
                    SqlDataSource1.UpdateParameters["TechnologyId"].DefaultValue = Request.QueryString.Get("t");
                    RelatedContext.SelectParameters["tID"].DefaultValue = Request.QueryString.Get("t");
                    ALLContext.SelectParameters["tID"].DefaultValue = Request.QueryString.Get("t");
                }


                String query = "SELECT Technologies.Name as Name, Abbreviation, Objectives, Author,Author.Name as AuthorName, Complements, Alternatives, Literature, Background, Qualification, Training, Experience, Input_Artifact, Output_Artifact, " +
                         "Applied_By_Role, Shoert_Description, SPEM_Model, SE_Phase,SEphase.Name as SE_PhaseName, TechnologyId, Method, Family, Input_AL_COMPONENT, Input_AL_CHIP, Input_AL_BOARD, " +
                         "Input_AL_IP, Input_AL_OTHER, Input_VP_REQUIREMENT, Input_VP_FUNCTIONAL, Input_VP_TECHNICAL, Input_VP_LOGICAL, Input_VP_OTHER, " +
                         "Output_AL_COMPONENT, Output_AL_CHIP, Output_AL_BOARD, Output_AL_IP, Output_AL_OTHER, Output_VP_REQUIREMENT, Output_VP_FUNCTIONAL, " +
                         "Output_VP_TECHNICAL, Output_VP_LOGICAL, Output_VP_OTHER, TECH_AL_COMPONENT, TECH_AL_CHIP, TECH_AL_BOARD, TECH_AL_IP, TECH_AL_OTHER, " +
                         "TECH_VP_REQUIREMENT, TECH_VP_FUNCTIONAL, TECH_VP_TECHNICAL, TECH_VP_LOGICAL, TECH_VP_OTHER FROM Technologies,Author,SEphase where Technologies.Author=Author.ID and Technologies.SE_Phase=SEphase.ID";

                try
                {

                    String t = Request.QueryString.Get("t");
                    if (!String.IsNullOrEmpty(t))
                    {

                        query = query + " and Technologies.TechnologyId =" + t; // +"where...";
                        //Response.Write(query);
                        SqlDataSource1.SelectCommand = query;
                        SqlDataSourceRelatedContext.SelectParameters["tID"].DefaultValue = Request.QueryString.Get("t");

                    }


                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HiddenField lb1 = (HiddenField)FormView1.FindControl("TechnologyId");
            Label NameLabel = FormView1.FindControl("NameLabel") as Label;
            //Response.Redirect("ContextExample.aspx?t=" + lb1.Value);
            Label bx = FormView1.FindControl("Label31") as Label;
            Response.Redirect("ContextForm.aspx?t=" + bx.Text + "&mode=Insert&TechName=" + NameLabel.Text);


        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label lbMethod = (Label)FormView1.FindControl("MethodLabel");
            Label lbTool = (Label)FormView1.FindControl("ToolLabel");
            //TextBox txbMethod = (TextBox)FormView1.FindControl("TextAreaMethod");
            //TextBox txbTool = (TextBox)FormView1.FindControl("TextAreaTool");
            //DropDownList txbMethod = (DropDownList)FormView1.FindControl("MethodTechnology11");
            //DropDownList txbTool = (DropDownList)FormView1.FindControl("ToolTechnology11");
            ListBox txbMethod = (ListBox)FormView1.FindControl("MethodTechnology11");
            ListBox txbTool = (ListBox)FormView1.FindControl("ToolTechnology11");


            String choosen = ((RadioButtonList)FormView1.FindControl("RadioButtonList1")).SelectedValue;
            if (choosen == "true")
            {
                lbTool.Visible = false;
                txbTool.Visible = false;
                lbMethod.Visible = true;
                txbMethod.Visible = true;
                //txbTool.Text = "";

                //lbMethod.Text = "Selected Index: <b>" + ((RadioButtonList)FormView1.FindControl("RadioButtonList1")).SelectedValue;
            }
            else
            {
                lbTool.Visible = true;
                txbTool.Visible = true;
                lbMethod.Visible = false;
                txbMethod.Visible = false;
                //txbMethod.Text = "";
            }
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            DropDownList Author = FormView1.FindControl("AuthorList") as DropDownList;
            SqlDataSource1.InsertParameters["Author"].DefaultValue = Author.SelectedValue;

            DropDownList AuthorList = FormView1.FindControl("AuthorList") as DropDownList;

            authorList1 = AuthorList.SelectedValue.ToString();



            Label lbMethod = (Label)FormView1.FindControl("MethodLabel");
            Label lbTool = (Label)FormView1.FindControl("ToolLabel");
            //TextBox txbMethod = (TextBox)FormView1.FindControl("TextAreaMethod");
            //TextBox txbTool = (TextBox)FormView1.FindControl("TextAreaTool");
            //DropDownList txbMethod = (DropDownList)FormView1.FindControl("MethodTechnology11");
            //DropDownList txbTool = (DropDownList)FormView1.FindControl("ToolTechnology11");
            ListBox txbMethod = (ListBox)FormView1.FindControl("MethodTechnology11");
            ListBox txbTool = (ListBox)FormView1.FindControl("ToolTechnology11");


            String choosen = ((RadioButtonList)FormView1.FindControl("RadioButtonList1")).SelectedValue;
            if (choosen == "true")
            {
                ListBox iso = FormView1.FindControl("MethodTechnology11") as ListBox;
                string strItemValue = "";

                int i = 0;
                foreach (ListItem listItem in iso.Items)
                {
                    i = i + 1;
                    if (listItem.Selected == true)
                    {
                        strItemValue += listItem.Value + ",";
                        methodTool.Add(listItem.Value);
                    }
                }
            }
            else
            {
                ListBox iso = FormView1.FindControl("ToolTechnology11") as ListBox;
                string strItemValue = "";

                int i = 0;
                foreach (ListItem listItem in iso.Items)
                {
                    i = i + 1;
                    if (listItem.Selected == true)
                    {
                        strItemValue += listItem.Value + ",";
                        methodTool.Add(listItem.Value);
                    }
                }
            }


            ListBox al = FormView1.FindControl("Alternatives") as ListBox;
            string alt = "";

            int j = 0;
            foreach (ListItem listItem in al.Items)
            {
                j = j + 1;
                if (listItem.Selected == true)
                {
                    alt += listItem.Value + ",";
                    Alternatives.Add(listItem.Value);
                }
            }

            ListBox cm = FormView1.FindControl("Complements") as ListBox;
            string cmp = "";

            int k = 0;
            foreach (ListItem listItem in cm.Items)
            {
                k = k + 1;
                if (listItem.Selected == true)
                {
                    cmp += listItem.Value + ",";
                    Complements.Add(listItem.Value);
                }
            }


        }



        protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            Label testLb = (Label)Label21;
            string uploadFolder = Request.PhysicalApplicationPath + "UploadFile\\";
            FileUpload img = (FileUpload)FormView1.FindControl("FileUpload1");
            if (img.HasFile)
            {
                string extension = img.PostedFile.FileName;
                img.SaveAs(uploadFolder + extension);
                //Label21.Text = "File uploaded successfully as: " + "Test" + extension;
                e.Command.Parameters["@SPEM_Model"].Value = extension;
            }

            String choosen = ((RadioButtonList)FormView1.FindControl("RadioButtonList1")).SelectedValue;
            if (choosen == "true")
            {
                e.Command.Parameters["@Method"].Value = true;
            }
            else
            {
                e.Command.Parameters["@Method"].Value = false;
            }
           
            // set SE Phase
            DropDownList lstBoxPhase = ((DropDownList)FormView1.FindControl("ListBox4"));
           
            e.Command.Parameters["SE_Phase"].Value = lstBoxPhase.SelectedValue;


        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            Label lbMethod = (Label)FormView1.FindControl("MethodLabel");
            Label lbTool = (Label)FormView1.FindControl("ToolLabel");
            // TextBox txbMethod = (TextBox)FormView1.FindControl("TextAreaMethod");
            //TextBox txbTool = (TextBox)FormView1.FindControl("TextAreaTool");
            String choosen = ((RadioButtonList)FormView1.FindControl("RadioButtonList1")).SelectedValue;
            if (choosen == "true")
            {
                lbTool.Visible = false;
                // txbTool.Visible = false;
                lbMethod.Visible = true;
                //   txbMethod.Visible = true;
                // txbTool.Text = "";

                //lbMethod.Text = "Selected Index: <b>" + ((RadioButtonList)FormView1.FindControl("RadioButtonList1")).SelectedValue;
            }
            else
            {
                lbTool.Visible = true;
                // txbTool.Visible = true;
                lbMethod.Visible = false;
                // txbMethod.Visible = false;
                //txbMethod.Text = "";
            }
        }


        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            DataView dv = (DataView)selectMaxTechnologyId.Select(DataSourceSelectArguments.Empty);
            TechnologyId = (int)dv.Table.Rows[0][0];



            if (flag == 1)
            {
                ALL_AUTHOR.InsertParameters["Name"].DefaultValue = auhtorNameStr;
                ALL_AUTHOR.InsertParameters["Affiliaction"].DefaultValue = authorAffiliationStr;
                ALL_AUTHOR.InsertParameters["Email"].DefaultValue = authorEmailStr;
                ALL_AUTHOR.Insert();
            }



            if (authorList1.Equals("-1"))
            {
                DataView dvAuth = (DataView)selectMaxAuthorID.Select(DataSourceSelectArguments.Empty);
                authorID = (int)dvAuth.Table.Rows[0][0];

                UpdateAuthorTechnologiesTable.UpdateParameters["Author"].DefaultValue = authorID.ToString();
                UpdateAuthorTechnologiesTable.Update();

            }


            DataView dv12 = (DataView)selectMaxTechID.Select(DataSourceSelectArguments.Empty);
            int Id = (int)dv12.Table.Rows[0][0];


            String choosen = ((RadioButtonList)FormView1.FindControl("RadioButtonList1")).SelectedValue;
            if (choosen == "true")
            {

                foreach (String i in methodTool)
                {
                    // Response.Write("i<<<<<<<<<" + i + ">>>>>>>>>>>>>");
                    Insert_IMPLEMENTS.InsertParameters["METHOD_ID"].DefaultValue = Id.ToString();
                    Insert_IMPLEMENTS.InsertParameters["TOOL_ID"].DefaultValue = i.ToString();
                    Insert_IMPLEMENTS.Insert();

                }
            }
            else
            {
                foreach (String i in methodTool)
                {
                    // Response.Write("i<<<<<<<<<" + i + ">>>>>>>>>>>>>");
                    Insert_IMPLEMENTS.InsertParameters["METHOD_ID"].DefaultValue = i.ToString();
                    Insert_IMPLEMENTS.InsertParameters["TOOL_ID"].DefaultValue = Id.ToString();
                    Insert_IMPLEMENTS.Insert();

                }
            }

            foreach (String i in Alternatives)
            {
                // Response.Write("i<<<<<<<<<" + i + ">>>>>>>>>>>>>");
                Insert_Alternative_Technologies.InsertParameters["Technology"].DefaultValue = Id.ToString();
                Insert_Alternative_Technologies.InsertParameters["Alternatives_Technology"].DefaultValue = i.ToString();
                Insert_Alternative_Technologies.Insert();

            }

            foreach (String i in Complements)
            {
                // Response.Write("i<<<<<<<<<" + i + ">>>>>>>>>>>>>");
                Insert_Compliment_Technologies.InsertParameters["Technology"].DefaultValue = Id.ToString();
                Insert_Compliment_Technologies.InsertParameters["Compliment_Technology"].DefaultValue = i.ToString();
                Insert_Compliment_Technologies.Insert();

            }


        }

        protected void ButtonAuthorClick(object sender, EventArgs e)
        {
            Button ButtonAuthor = FormView1.FindControl("ButtonAuthor") as Button;
            Panel p = FormView1.FindControl("Panel1") as Panel;
            //String b = ButtonAuthor.Text;

            //Response.Write(p.Visible);
            if (p.Visible == false)
            {
                FormView1.FindControl("Panel1").Visible = true;

                ButtonAuthor.Text = "Cancel";
            }

            else
            {
                FormView1.FindControl("Panel1").Visible = false;

                ButtonAuthor.Text = "Add Author";
            }

            //ButtonAuthor.OnClientClick.cButtonAuthorClick1();


        }


        protected void ButtonAuthorSaveClick(object sender, EventArgs e)
        {
            //DataView dvAuth = (DataView)selectMaxAuthorID.Select(DataSourceSelectArguments.Empty);
            //authorID = (int)dvAuth.Table.Rows[0][0];
            //Response.Write(">>>>>>>>>>>>"+authorID);

            Button ButtonAuthor = FormView1.FindControl("ButtonAuthor") as Button;
            TextBox auhtorName = (TextBox)FormView1.FindControl("auhtorName");
            TextBox authorEmail = (TextBox)FormView1.FindControl("authorEmail");
            TextBox authorAffiliation = (TextBox)FormView1.FindControl("authorAffiliation");
            DropDownList AuthorList = FormView1.FindControl("AuthorList") as DropDownList;
            Label Label13 = FormView1.FindControl("Label13") as Label;

            if (flagChk == 0) //checking if more than 1 author inserted at a time
            {
                ListItem l = new ListItem(auhtorName.Text, "-1");
                AuthorList.Items.Add(l);
                AuthorList.SelectedIndex = AuthorList.Items.Count - 1;
            }
            auhtorNameStr = auhtorName.Text;
            authorEmailStr = authorEmail.Text;
            authorAffiliationStr = authorAffiliation.Text;


            flagChk = 1; //cannot insert more than 1 author at a time
            auhtorName.Text = "";
            authorEmail.Text = "";
            authorAffiliation.Text = "";

            FormView1.FindControl("Panel1").Visible = false;
            flag = 1;   //new author inserted
            ButtonAuthor.Text = "Add Author";

        }

        protected void FormView_ModeChanged(Object sender, EventArgs e)
        {

            // Display the current mode in the header row.
            switch (FormView1.CurrentMode)
            {
                case FormViewMode.Insert:
                    Page.Title = "Insert Technology";
                    //FormView1.HeaderStyle.BackColor = System.Drawing.Color.Red;
                    break;
                case FormViewMode.ReadOnly:
                    Page.Title = "Technology Details";
                    //FormView1.HeaderStyle.BackColor = System.Drawing.Color.Green;
                    break;
                case FormViewMode.Edit:
                    Page.Title = "Edit Technology";
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
            DropDownList Author = FormView1.FindControl("AuthorList") as DropDownList;
            SqlDataSource1.UpdateParameters["Author"].DefaultValue = Author.SelectedValue;

            DropDownList AllSEPhaseList = FormView1.FindControl("AllSEPhaseList") as DropDownList;
            SqlDataSource1.UpdateParameters["SE_Phase"].DefaultValue = AllSEPhaseList.SelectedValue;

            CheckBox Input_AL_COMPONENT = FormView1.FindControl("Input_AL_COMPONENT") as CheckBox;
            SqlDataSource1.UpdateParameters["Input_AL_COMPONENT"].DefaultValue = Input_AL_COMPONENT.Checked.ToString();

            CheckBox Input_AL_CHIP = FormView1.FindControl("Input_AL_CHIP") as CheckBox;
            SqlDataSource1.UpdateParameters["Input_AL_CHIP"].DefaultValue = Input_AL_CHIP.Checked.ToString();

            CheckBox Input_AL_BOARD = FormView1.FindControl("Input_AL_BOARD") as CheckBox;
            SqlDataSource1.UpdateParameters["Input_AL_BOARD"].DefaultValue = Input_AL_BOARD.Checked.ToString();

            CheckBox Input_AL_IP = FormView1.FindControl("Input_AL_IP") as CheckBox;
            SqlDataSource1.UpdateParameters["Input_AL_IP"].DefaultValue = Input_AL_IP.Checked.ToString();

            CheckBox Input_AL_OTHER = FormView1.FindControl("Input_AL_OTHER") as CheckBox;
            SqlDataSource1.UpdateParameters["Input_AL_OTHER"].DefaultValue = Input_AL_OTHER.Checked.ToString();

            CheckBox Input_VP_REQUIREMENT = FormView1.FindControl("Input_VP_REQUIREMENT") as CheckBox;
            SqlDataSource1.UpdateParameters["Input_VP_REQUIREMENT"].DefaultValue = Input_VP_REQUIREMENT.Checked.ToString();

            CheckBox Input_VP_FUNCTIONAL = FormView1.FindControl("Input_VP_FUNCTIONAL") as CheckBox;
            SqlDataSource1.UpdateParameters["Input_VP_FUNCTIONAL"].DefaultValue = Input_VP_FUNCTIONAL.Checked.ToString();

            CheckBox Input_VP_TECHNICAL = FormView1.FindControl("Input_VP_TECHNICAL") as CheckBox;
            SqlDataSource1.UpdateParameters["Input_VP_TECHNICAL"].DefaultValue = Input_VP_TECHNICAL.Checked.ToString();

            CheckBox Input_VP_LOGICAL = FormView1.FindControl("Input_VP_LOGICAL") as CheckBox;
            SqlDataSource1.UpdateParameters["Input_VP_LOGICAL"].DefaultValue = Input_VP_LOGICAL.Checked.ToString();

            CheckBox Input_VP_OTHER = FormView1.FindControl("Input_VP_OTHER") as CheckBox;
            SqlDataSource1.UpdateParameters["Input_VP_OTHER"].DefaultValue = Input_VP_OTHER.Checked.ToString();

            CheckBox Output_AL_COMPONENT = FormView1.FindControl("Output_AL_COMPONENT") as CheckBox;
            SqlDataSource1.UpdateParameters["Output_AL_COMPONENT"].DefaultValue = Output_AL_COMPONENT.Checked.ToString();

            CheckBox Output_AL_CHIP = FormView1.FindControl("Output_AL_CHIP") as CheckBox;
            SqlDataSource1.UpdateParameters["Output_AL_CHIP"].DefaultValue = Output_AL_CHIP.Checked.ToString();

            CheckBox Output_AL_BOARD = FormView1.FindControl("Output_AL_BOARD") as CheckBox;
            SqlDataSource1.UpdateParameters["Output_AL_BOARD"].DefaultValue = Output_AL_BOARD.Checked.ToString();

            CheckBox Output_AL_IP = FormView1.FindControl("Output_AL_IP") as CheckBox;
            SqlDataSource1.UpdateParameters["Output_AL_IP"].DefaultValue = Output_AL_IP.Checked.ToString();

            CheckBox Output_AL_OTHER = FormView1.FindControl("Output_AL_OTHER") as CheckBox;
            SqlDataSource1.UpdateParameters["Output_AL_OTHER"].DefaultValue = Output_AL_OTHER.Checked.ToString();

            CheckBox Output_VP_REQUIREMENT = FormView1.FindControl("Output_VP_REQUIREMENT") as CheckBox;
            SqlDataSource1.UpdateParameters["Output_VP_REQUIREMENT"].DefaultValue = Output_VP_REQUIREMENT.Checked.ToString();

            CheckBox Output_VP_FUNCTIONAL = FormView1.FindControl("Output_VP_FUNCTIONAL") as CheckBox;
            SqlDataSource1.UpdateParameters["Output_VP_FUNCTIONAL"].DefaultValue = Output_VP_FUNCTIONAL.Checked.ToString();

            CheckBox Output_VP_TECHNICAL = FormView1.FindControl("Output_VP_TECHNICAL") as CheckBox;
            SqlDataSource1.UpdateParameters["Output_VP_TECHNICAL"].DefaultValue = Output_VP_TECHNICAL.Checked.ToString();

            CheckBox Output_VP_LOGICAL = FormView1.FindControl("Output_VP_LOGICAL") as CheckBox;
            SqlDataSource1.UpdateParameters["Output_VP_LOGICAL"].DefaultValue = Output_VP_LOGICAL.Checked.ToString();

            CheckBox Output_VP_OTHER = FormView1.FindControl("Output_VP_OTHER") as CheckBox;
            SqlDataSource1.UpdateParameters["Output_VP_OTHER"].DefaultValue = Output_VP_OTHER.Checked.ToString();

            CheckBox TECH_AL_COMPONENT = FormView1.FindControl("TECH_AL_COMPONENT") as CheckBox;
            SqlDataSource1.UpdateParameters["TECH_AL_COMPONENT"].DefaultValue = TECH_AL_COMPONENT.Checked.ToString();

            CheckBox TECH_AL_CHIP = FormView1.FindControl("TECH_AL_CHIP") as CheckBox;
            SqlDataSource1.UpdateParameters["TECH_AL_CHIP"].DefaultValue = TECH_AL_CHIP.Checked.ToString();

            CheckBox TECH_AL_BOARD = FormView1.FindControl("TECH_AL_BOARD") as CheckBox;
            SqlDataSource1.UpdateParameters["TECH_AL_BOARD"].DefaultValue = TECH_AL_BOARD.Checked.ToString();

            CheckBox TECH_AL_IP = FormView1.FindControl("TECH_AL_IP") as CheckBox;
            SqlDataSource1.UpdateParameters["TECH_AL_IP"].DefaultValue = TECH_AL_IP.Checked.ToString();

            CheckBox TECH_AL_OTHER = FormView1.FindControl("TECH_AL_OTHER") as CheckBox;
            SqlDataSource1.UpdateParameters["TECH_AL_OTHER"].DefaultValue = TECH_AL_OTHER.Checked.ToString();

            CheckBox TECH_VP_REQUIREMENT = FormView1.FindControl("TECH_VP_REQUIREMENT") as CheckBox;
            SqlDataSource1.UpdateParameters["TECH_VP_REQUIREMENT"].DefaultValue = TECH_VP_REQUIREMENT.Checked.ToString();

            CheckBox TECH_VP_FUNCTIONAL = FormView1.FindControl("TECH_VP_FUNCTIONAL") as CheckBox;
            SqlDataSource1.UpdateParameters["TECH_VP_FUNCTIONAL"].DefaultValue = TECH_VP_FUNCTIONAL.Checked.ToString();

            CheckBox TECH_VP_TECHNICAL = FormView1.FindControl("TECH_VP_TECHNICAL") as CheckBox;
            SqlDataSource1.UpdateParameters["TECH_VP_TECHNICAL"].DefaultValue = TECH_VP_TECHNICAL.Checked.ToString();

            CheckBox TECH_VP_LOGICAL = FormView1.FindControl("TECH_VP_LOGICAL") as CheckBox;
            SqlDataSource1.UpdateParameters["TECH_VP_LOGICAL"].DefaultValue = TECH_VP_LOGICAL.Checked.ToString();

            CheckBox TECH_VP_OTHER = FormView1.FindControl("TECH_VP_OTHER") as CheckBox;
            SqlDataSource1.UpdateParameters["TECH_VP_OTHER"].DefaultValue = TECH_VP_OTHER.Checked.ToString();


            Label testLb = (Label)Label21;
            string uploadFolder = Request.PhysicalApplicationPath + "UploadFile\\";
            FileUpload img = FormView1.FindControl("FileUpload1") as FileUpload;
            if (img.HasFile)
            {
                string extension = "";
                extension = img.PostedFile.FileName;
                img.SaveAs(uploadFolder + extension);
                //Label21.Text = "File uploaded successfully as: " + "Test" + extension;
                Response.Write("extension>>" + extension);
                SqlDataSource1.UpdateParameters["SPEM_Model"].DefaultValue = extension;
            }

        }





        protected void Button2_Click(object sender, EventArgs e)
        {

            Panel p = FormView1.FindControl("AddContextUpdatePanel") as Panel;
            Button Button2 = FormView1.FindControl("Button2") as Button;
            if (p.Visible == false)
            {
                FormView1.FindControl("AddContextUpdatePanel").Visible = true;

                Button2.Text = "Cancel";
            }

            else
            {
                FormView1.FindControl("AddContextUpdatePanel").Visible = false;

                Button2.Text = "Add Related Context";
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
                command.Parameters.Add("@ID", SqlDbType.Int).Value = DropDownList1.SelectedValue;
                command.Parameters.Add("@tID", SqlDbType.Int).Value = Request.QueryString.Get("t");


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



        }

        protected void DeleteContext(object sender, EventArgs e)
        {

            LinkButton lnkRemove = (LinkButton)sender;
            Label lblMessage = FormView1.FindControl("lblMessage") as Label;
            GridView grd1 = FormView1.FindControl("GridView1") as GridView;
            //UpdatePanel upd1 = FormView1.FindControl("AddContextUpdatePanel") as UpdatePanel;

            UpdatePanel upd1 = FormView1.FindControl("UpdatePanel2") as UpdatePanel;
            using (SqlCeConnection conn = new SqlCeConnection())
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PCF_CONNECTION"].ConnectionString;


                String deleteContext = "delete from  TCI where " +
                "Context=@ID and technology=@tID and @ID in (select context from tci where impact = -1 and technology=@tID);";



                SqlCeCommand command = new SqlCeCommand(deleteContext, conn);
                command.Parameters.Add("@ID", SqlDbType.Int).Value = lnkRemove.CommandArgument;
                command.Parameters.Add("@tID", SqlDbType.Int).Value = Request.QueryString.Get("t");


                try
                {

                    conn.Open();
                    SqlCeDataReader reader = command.ExecuteReader();
                    //Response.Write(">>>>>>>>>>"+reader.RecordsAffected);


                    if (reader.RecordsAffected == 0)
                        lblMessage.Text = "Context Cannot Be Deleted!!";
                    else
                    {

                        lblMessage.Text = "Context Deleted successfully!!";

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

        protected void EditButton_Click(object sender, EventArgs e)
        {

            Response.Redirect("Technology.aspx?t=" + Request.QueryString.Get("t") + "&mode=Edit");


        }

       

        protected void SqlDataSourceRelatedContext_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               

            }
        }


        protected void Details_Click(object sender, EventArgs e)
        {
            LinkButton DetailsContextByID = (LinkButton)sender;
            //if (FormView2.Visible == false)
            //{
            LinkButton HideFormview2 = FormView1.FindControl("HideFormview2") as LinkButton;

            FormView2.Visible = true;
            HideFormview2.Visible = true;
            ContextDetailsByID.SelectParameters["cID"].DefaultValue = DetailsContextByID.CommandArgument;

            showImpactByID.SelectParameters["cID"].DefaultValue = DetailsContextByID.CommandArgument;
            showImpactByID.SelectParameters["tID"].DefaultValue = Request.QueryString.Get("t");



           
        }







        protected void DetailsImpactsByID_Click(object sender, EventArgs e)
        {
            LinkButton DetailsImpactsByID = (LinkButton)sender;

            //FormView FormViewImpact = (FormView)sender;
            LinkButton HideFormview2 = FormView1.FindControl("HideFormview2") as LinkButton;
            LinkButton HideFormview3 = FormView1.FindControl("HideFormview3") as LinkButton;
            FormView3.Visible = true;
            HideFormview2.Visible = false;
            HideFormview3.Visible = true;
            ImpactDetailsByID.SelectParameters["iID"].DefaultValue = DetailsImpactsByID.CommandArgument;
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            LinkButton HideFormview2 = FormView1.FindControl("HideFormview2") as LinkButton;
            FormView2.Visible = false;
            HideFormview2.Visible = false;
        }
        protected void HideFormview3_Click(object sender, EventArgs e)
        {
            LinkButton HideFormview2 = FormView1.FindControl("HideFormview2") as LinkButton;
            LinkButton HideFormview3 = FormView1.FindControl("HideFormview3") as LinkButton;
            FormView3.Visible = false;
            HideFormview2.Visible = true;
            HideFormview3.Visible = false;
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            Button HideFormview2 = FormView1.FindControl("InsertCancelButton") as Button;
            mainP.Visible = false;
            
        }
}
}