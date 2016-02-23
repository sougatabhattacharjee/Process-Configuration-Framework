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
    public partial class showContext : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {               
                String query = "SELECT Contexts.Name as Name,IndustrialSector.Name as Industrial_Sector, [Project_Size], [Project_Kind], [Development_Process], Contexts.ID as ID FROM [Contexts],IndustrialSector where contexts.Industrial_Sector=IndustrialSector.ID";
                String tName = Request.QueryString.Get("tName");
                String iName = Request.QueryString.Get("iName");

                Label testLb = (Label)Label1;

                if (!string.IsNullOrEmpty(tName))
                {
                    GridView1.Columns[7].Visible = true;
                    Label1.Text = "Related Contexts for Technology : ";
                    Label2.Text = tName;
                    A1.HRef = "Technology.aspx?t=" + Request.QueryString.Get("t");
                }

                if (!string.IsNullOrEmpty(iName))
                {
                    Label1.Text = "Related Contexts for Impact : ";
                    Label2.Text = iName;
                    A1.HRef = "ImpactOnSoftware.aspx?i=" + Request.QueryString.Get("i");
                }

                try
                {

                    String t = Request.QueryString.Get("t");

                    if (t != null)
                    {

                        query = query + " and Contexts.ID in (SELECT Context FROM TCI WHERE Technology =" + t + ")"; // +"where...";
                        //Response.Write(query);
                        SqlDataSource1.SelectCommand = query;
                    }
                    else
                    {
                        String i = Request.QueryString.Get("i");
                        //Response.Write("Context related to Impact " + i);

                        if (i != null)
                        {
                            query = query + " and Contexts.ID in (SELECT Context FROM TCI WHERE Impact =" + i + ")"; // +"where...";
                            SqlDataSource1.SelectCommand = query;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //protected void b1_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect(prevPage);
        //}
        protected void DeleteContext(object sender, EventArgs e)
        {

            LinkButton lnkRemove = (LinkButton)sender;


            using (SqlCeConnection conn = new SqlCeConnection())
            {
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PCF_CONNECTION"].ConnectionString;


                String deleteContext = "delete from  Contexts where " +
                "Id=@Id and @ID not in (select context from tci where impact <> -1);";

                String deleteContextTCI = "DELETE from TCI where " +
                "context=@Id ;";

                SqlCeCommand command = new SqlCeCommand(deleteContext, conn);
                command.Parameters.Add("@ID", SqlDbType.Int).Value = lnkRemove.CommandArgument;

                SqlCeCommand command1 = new SqlCeCommand(deleteContextTCI, conn);
                command1.Parameters.Add("@ID", SqlDbType.Int).Value = lnkRemove.CommandArgument;

                try
                {

                    conn.Open();
                    SqlCeDataReader reader = command.ExecuteReader();
                    //Response.Write(">>>>>>>>>>"+reader.RecordsAffected);


                    if (reader.RecordsAffected == 0)
                        lblMessage.Text = "Context Cannot Be Deleted!!";
                    else
                    {
                        SqlCeDataReader reader1 = command1.ExecuteReader();
                        lblMessage.Text = "Context Deleted successfully!!";
                        reader1.Close();
                    }
                    reader.Close();


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