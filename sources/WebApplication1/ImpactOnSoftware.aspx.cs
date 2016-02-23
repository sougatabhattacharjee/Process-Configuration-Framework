using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data.SqlServerCe;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ImpactOnSoftware : System.Web.UI.Page
    {
        ArrayList isoValue = new ArrayList();
        int ImpactId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            String mode = "";
            mode = Request.QueryString.Get("mode");

            if (!String.IsNullOrEmpty(mode) && mode.Equals("Insert"))
            {
                FormView1.ChangeMode(FormViewMode.Insert);
                Page.Title = "Insert Impact";
            }
            if (!String.IsNullOrEmpty(mode) && mode.Equals("Edit"))
            {
                FormView1.ChangeMode(FormViewMode.Edit);
                Page.Title = "Edit Impact";
                SqlDataSource1.UpdateParameters["ID"].DefaultValue = Request.QueryString.Get("i");
            }

            BulletedList L1 = FormView1.FindControl("BulletedList1") as BulletedList;
            String query = "SELECT Impacts.* FROM Impacts";
            try
            {
                String i = Request.QueryString.Get("i");
                if (i != null)
                {
                    query = query + " where Impacts.ID =" + i; // +"where...";
                    SqlDataSource1.SelectCommand = query;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            DataView dv = (DataView)selectMaxImpactId.Select(DataSourceSelectArguments.Empty);
            ImpactId = (int)dv.Table.Rows[0][0];

            foreach (String i in isoValue)
            {
                InsertDataISO_IMPACT.InsertParameters["ISO_ID"].DefaultValue = i.ToString();
                InsertDataISO_IMPACT.InsertParameters["IMPACT_ID"].DefaultValue = ImpactId.ToString();
                InsertDataISO_IMPACT.Insert();

            }

            String TechnologyId = "";
            String ContextId = "";
            TechnologyId = (String)Request.QueryString["t"];
            ContextId = (String)Request.QueryString["c"];

            InsertTCI.InsertParameters["Technology"].DefaultValue = TechnologyId;
            InsertTCI.InsertParameters["Context"].DefaultValue = ContextId;
            InsertTCI.InsertParameters["Impact"].DefaultValue = ImpactId.ToString();

            if (!String.IsNullOrEmpty(TechnologyId) && !String.IsNullOrEmpty(ContextId) && !String.IsNullOrEmpty(ImpactId.ToString()))
                InsertTCI.Insert();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ListBox iso = FormView1.FindControl("ISO25010TextBox") as ListBox;
            string strItemValue = "";

            int i = 0;
            foreach (ListItem listItem in iso.Items)
            {
                i = i + 1;
                if (listItem.Selected == true)
                {
                    strItemValue += listItem.Value + ",";
                    isoValue.Add(listItem.Value);
                }
            }
        }

        protected void UpdateButton1_Click(object sender, EventArgs e)
        {
            ListBox iso = FormView1.FindControl("ISO25010TextBox") as ListBox;
            string strItemValue = "";

            int i = 0;
            foreach (ListItem listItem in iso.Items)
            {
                i = i + 1;
                if (listItem.Selected == true)
                {
                    strItemValue += listItem.Value + ",";
                    isoValue.Add(listItem.Value);
                }
            }

        }

        protected void InsertDataISO_IMPACT_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            //foreach (String i in isoValue)
            //{
            //    Response.Write("i<<<<<<<<<" + i + ">>>>>>>>>>>>>");
            //    InsertDataISO_IMPACT.InsertParameters["ISO_ID"].DefaultValue = i.ToString();
            //    InsertDataISO_IMPACT.InsertParameters["IMPACT_ID"].DefaultValue = Request.QueryString.Get("i").ToString();
            //    InsertDataISO_IMPACT.Insert();

            //}
       }


        protected void FormView_ModeChanged(Object sender, EventArgs e)
        {
            // Display the current mode in the header row.
            switch (FormView1.CurrentMode)
            {
                case FormViewMode.Insert:
                    Page.Title = "Insert Impact";
                    //FormView1.HeaderStyle.BackColor = System.Drawing.Color.Red;
                    break;
                case FormViewMode.ReadOnly:
                    Page.Title = "Impact Details";
                    //FormView1.HeaderStyle.BackColor = System.Drawing.Color.Green;
                    break;
                case FormViewMode.Edit:
                    Page.Title = "Edit Impact";
                    //FormView1.HeaderStyle.BackColor = System.Drawing.Color.Green;
                    break;
                default:
                    FormView1.HeaderText = "Unsupported mode.";
                    //FormView1.HeaderStyle.BackColor = System.Drawing.Color.Yellow;
                    break;
            }
        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            using (SqlCeConnection conn = new SqlCeConnection())
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PCF_CONNECTION"].ConnectionString;


                String deleteISO = "delete from  ISO_IMPACT where " +
                "IMPACT_ID=@Id;";

                SqlCeCommand command = new SqlCeCommand(deleteISO, conn);
                command.Parameters.Add("@ID", SqlDbType.Int).Value = Request.QueryString.Get("i");
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
                    Response.Write(ee.Message);
                }

                foreach (String i in isoValue)
                {
                    // Response.Write("i<<<<<<<<<" + i + ">>>>>>>>>>>>>");
                    InsertDataISO_IMPACT.InsertParameters["ISO_ID"].DefaultValue = i.ToString();
                    InsertDataISO_IMPACT.InsertParameters["IMPACT_ID"].DefaultValue = Request.QueryString.Get("i").ToString();
                    InsertDataISO_IMPACT.Insert();
                }
                SqlDataSource1.DataBind();
            }
        }
    }
}
