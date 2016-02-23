using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlServerCe;
using System.Data;

namespace WebApplication1
{
    public partial class showImpact : System.Web.UI.Page
    {
 
        protected void Page_Load(object sender, EventArgs e)
        {
            {


  


                String cName = Request.QueryString.Get("cName");

                Label testLb = (Label)Label1;

                if (!string.IsNullOrEmpty(cName))
                {
                    GridView1.Columns[5].Visible = true;
                    Label1.Text = "Related Impacts for Context : ";
                    Label2.Text = cName;
                    A1.HRef = "ContextForm.aspx?c=" + Request.QueryString.Get("c");
                }

              
                String query = "SELECT ID,[Name], [Total_Cost], [Total_Schedule] FROM [Impacts]";
                try
                {

                    String c = Request.QueryString.Get("c");
                    String t = Request.QueryString.Get("t");
                    if (!String.IsNullOrEmpty(c) && !String.IsNullOrEmpty(t))
                    {
                      
                        query = query + "where Impacts.ID in (SELECT Impact FROM TCI WHERE Context =" + c + " and Technology = "+ t +")"; // +"where...";
                        SqlDataSource1.SelectCommand = query;
                    }
                    if (!String.IsNullOrEmpty(c) && String.IsNullOrEmpty(t))
                    {

                        query = query + "where Impacts.ID in (SELECT Impact FROM TCI WHERE Context =" + c + ")"; // +"where...";
                        SqlDataSource1.SelectCommand = query;
                    }
                   
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }

            }
        }

        protected void DeleteImpact(object sender, EventArgs e)
        {

            LinkButton lnkRemove = (LinkButton)sender;


            using (SqlCeConnection conn = new SqlCeConnection())
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PCF_CONNECTION"].ConnectionString;


                String deleteImpact = "delete from  impacts where " +
                "Id=@Id ;";
                String deleteImpactTCI = "Update TCI SET   Impact = -1 where " +
                "Impact=@Id ;";

                SqlCeCommand command = new SqlCeCommand(deleteImpact, conn);
                command.Parameters.Add("@ID", SqlDbType.Int).Value = lnkRemove.CommandArgument;

                SqlCeCommand command1 = new SqlCeCommand(deleteImpactTCI, conn);
                command1.Parameters.Add("@ID", SqlDbType.Int).Value = lnkRemove.CommandArgument;

                try
                {

                    conn.Open();
                    SqlCeDataReader reader = command.ExecuteReader();
                    //Response.Write(">>>>>>>>>>"+reader.RecordsAffected);
                    SqlCeDataReader reader1 = command1.ExecuteReader();

                    if (reader.RecordsAffected == 0)
                        lblMessage.Text = "Impact Cannot Be Deleted!!";
                    else
                        lblMessage.Text = "Impact Deleted successfully!!";
                    reader.Close();
                    reader1.Close();
                    conn.Close();

                }
                catch (Exception ee)
                {
                    lblMessage.Text = ee.Message;
                }


                GridView1.DataBind();
            }
        }
    }
}