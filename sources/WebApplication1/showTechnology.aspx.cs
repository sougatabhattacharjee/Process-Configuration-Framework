using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlServerCe;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

 
namespace WebApplication1
{
     
    public partial class showTechnology : System.Web.UI.Page
    {
        public static string prevPage = string.Empty;
        String queryParameter = "";
        Boolean chk = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            {

                if (!IsPostBack)
                {
                    prevPage = Request.UrlReferrer.ToString();
                    //Response.Write(prevPage);
                }
                //Button B1 = GridView1.FindControl("b1") as Button;
                //B1.Attributes.Add("OnClick", "JavaScript:history.back(-1); return false;");

                String parameter = Request.QueryString.Get("p");
               
                String[] arrayParameter = new String[25] ;
               
                if (!String.IsNullOrEmpty(parameter))
                    arrayParameter = parameter.Split(',');
                
                    //if(arrayParameter.l)
                queryParameter = "SELECT Technologies.Name,Technologies.Abbreviation, Technologies.Family, Technologies.TechnologyId, SEphase.Name SE_Phase , Author.Name as Author FROM Technologies INNER JOIN Author ON Technologies.Author = Author.ID INNER JOIN SEphase ON Technologies.SE_Phase = SEphase.ID where";
                    
                    foreach (String item in arrayParameter)
                    {
                        //Response.Write("<br/>"+item);
                        switch (item)
                        {
                            case "11":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a1_v1 = 'true'";
                                chk = false;
                                break;
                            case "12":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a1_v2 = 'true' ";
                                chk = false;
                                break;

                            case "13":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a1_v3 = 'true'";
                                chk = false;
                                break;
                            
                            case "14":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a1_v4 = 'true'";
                                chk = false;
                                break;

                            

                            //case "15":
                            //    if (!chk)
                            //    {
                            //        queryParameter += " and ";
                            //    }
                            //    queryParameter += "  TECH_AL_COMPONENT = 'true' and TECH_VP_OTHER='true'";
                            //    chk = false;
                            //    break;

                            case "21":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a2_v1 = 'true'";
                                chk = false;
                                break;

                            case "22":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a2_v2 = 'true'";
                                chk = false;
                                break;

                            case "23":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a2_v3 = 'true'";
                                chk = false;
                                break;
                            
                            case "24":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a2_v4 = 'true'";
                                chk = false;
                                break;

                           

                            //case "25":
                            //    if (!chk)
                            //    {
                            //        queryParameter += " and ";
                            //    }
                            //    queryParameter += "  TECH_AL_CHIP = 'true' and TECH_VP_OTHER='true'";
                            //    chk = false;
                            //    break;

                            case "31":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a3_v1 = 'true'";
                                chk = false;
                                break;

                            case "32":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a3_v2 = 'true'";
                                chk = false;
                                break;

                            case "33":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a3_v3 = 'true'";
                                chk = false;
                                break;
                            
                            case "34":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a3_v4 = 'true'";
                                chk = false;
                                break;

                           

                            //case "35":
                            //    if (!chk)
                            //    {
                            //        queryParameter += " and ";
                            //    }
                            //    queryParameter += "  TECH_AL_BOARD = 'true' and TECH_VP_OTHER='true'";
                            //    chk = false;
                            //    break;

                            case "41":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a4_v1 = 'true'";
                                chk = false;
                                break;

                            case "42":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a4_v2 = 'true'";
                                chk = false;
                                break;

                            case "43":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a4_v3 = 'true'";
                                chk = false;
                                break;
                            
                            case "44":
                                if (!chk)
                                {
                                    queryParameter += " and ";
                                }
                                queryParameter += "  ap_a4_v4 = 'true'";
                                chk = false;
                                break;

                            

                            //case "45":
                            //    if (!chk)
                            //    {
                            //        queryParameter += " and ";
                            //    }
                            //    queryParameter += "  TECH_AL_IP = 'true' and TECH_VP_OTHER='true'";
                            //    chk = false;
                            //    break;

                            //case "51":
                            //    if (!chk)
                            //    {
                            //        queryParameter += " and ";
                            //    }
                            //    queryParameter += "  TECH_AL_OTHER = 'true' and TECH_VP_REQUIREMENT='true'";
                            //    chk = false;
                            //    break;

                            //case "52":
                            //    if (!chk)
                            //    {
                            //        queryParameter += " and ";
                            //    }
                            //    queryParameter += "  TECH_AL_OTHER = 'true' and TECH_VP_FUNCTIONAL='true'";
                            //    chk = false;
                            //    break;

                            //case "53":
                            //    if (!chk)
                            //    {
                            //        queryParameter += " and ";
                            //    }
                            //    queryParameter += "  TECH_AL_OTHER = 'true' and TECH_VP_LOGICAL='true'";
                            //    chk = false;
                            //    break;
                            
                            //case "54":
                            //    if (!chk)
                            //    {
                            //        queryParameter += " and ";
                            //    }
                            //    queryParameter += "  TECH_AL_OTHER = 'true' and TECH_VP_TECHNICAL='true'";
                            //    chk = false;
                            //    break;

                            

                            //case "55":
                            //    if (!chk)
                            //    {
                            //        queryParameter += " and ";
                            //    }
                            //    queryParameter += "  TECH_AL_OTHER = 'true' and TECH_VP_OTHER='true'";
                            //    chk = false;
                            //    break;




                            default:
                                queryParameter = "SELECT Technologies.Name,Technologies.Abbreviation, Technologies.Family, Technologies.TechnologyId, SEphase.Name SE_Phase , Author.Name as Author FROM Technologies INNER JOIN Author ON Technologies.Author = Author.ID INNER JOIN SEphase ON Technologies.SE_Phase = SEphase.ID ";
                                break;

                        }

                    }

                     
                   //  Response.Write(">>>>>>>>."+chk);
                     if (!String.IsNullOrEmpty(Request.QueryString.Get("sePhase")))
                     {
                         if (chk)
                         {
                             queryParameter += " where SE_Phase=" + Request.QueryString.Get("sePhase");
                             chk = false;
                         }
                         else
                             queryParameter += " and SE_Phase=" + Request.QueryString.Get("sePhase");
                            
                     }

                     if (!String.IsNullOrEmpty(Request.QueryString.Get("Industrial_sector_Value")))
                     {
                         if (chk)
                         {
                             queryParameter += " where Technologies.TechnologyId in (SELECT DISTINCT Technology FROM TCI WHERE (Context IN (SELECT ID FROM Contexts WHERE (Industrial_Sector in (" + Request.QueryString.Get("Industrial_sector_Value") + ")))))";
                             chk = false;
                         }
                         else
                             queryParameter += " and Technologies.TechnologyId in (SELECT DISTINCT Technology FROM TCI WHERE (Context IN (SELECT ID FROM Contexts WHERE (Industrial_Sector in (" + Request.QueryString.Get("Industrial_sector_Value") + ")))))";
                     }

                     if (!String.IsNullOrEmpty(Request.QueryString.Get("Prosize1")) && !String.IsNullOrEmpty(Request.QueryString.Get("Prosize2")))
                     {
                         if (chk)
                         {
                             queryParameter += " where Technologies.TechnologyId in (SELECT DISTINCT Technology FROM TCI WHERE (Context IN (SELECT ID FROM Contexts WHERE (Project_Size between " + Request.QueryString.Get("Prosize1") + " and " + Request.QueryString.Get("Prosize2") + "))))";
                             chk = false;
                         }
                         else
                             queryParameter += " and Technologies.TechnologyId in (SELECT DISTINCT Technology FROM TCI WHERE (Context IN (SELECT ID FROM Contexts WHERE (Project_Size between " + Request.QueryString.Get("Prosize1") + " and " + Request.QueryString.Get("Prosize2") + "))))";
                     }
               
                    try
                    {
                       // Response.Write(queryParameter);
                        SqlDataSource1.SelectCommand = queryParameter;
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.ToString());
                    }



                String cName = Request.QueryString.Get("cName");
                
                Label testLb = (Label)Label1;

                if (!string.IsNullOrEmpty(cName))
                {
                    Label1.Text = "Related Technologies for Context : " ;
                    Label2.Text = cName;
                    A1.HRef = "ContextForm.aspx?c=" + Request.QueryString.Get("c");
                }

                String query = "SELECT Technologies.Name,Technologies.Abbreviation, Technologies.Family, Technologies.TechnologyId, SEphase.Name SE_Phase , Author.Name as Author FROM Technologies INNER JOIN Author ON Technologies.Author = Author.ID INNER JOIN SEphase ON Technologies.SE_Phase = SEphase.ID";
                try
                {

                    String c = Request.QueryString.Get("c");
                    if (c != null)
                    {
                       
                        query = query + " where Technologies.TECHNOLOGYID in (SELECT Technology FROM TCI WHERE Context =" + c + ")"; // +"where...";
                        SqlDataSource1.SelectCommand = query;
                    }

                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }

            }
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            e.Row.Attributes.Add("onMouseOver", "this.style.background='#eeff00'");
            e.Row.Attributes.Add("onMouseOut", "this.style.background='#ffffff'");   
        }

        protected void b1_Click(object sender, EventArgs e)
        {
            Response.Redirect(prevPage);
        }



        protected void DeleteTechnology(object sender, EventArgs e)
        {

            LinkButton lnkRemove = (LinkButton)sender;

         
            using (SqlCeConnection conn = new SqlCeConnection()){
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PCF_CONNECTION"].ConnectionString;


            String deleteTech = "delete from  Technologies where " +
            "TechnologyId=@TechnologyId and @TechnologyId not in (select technology from TCI);";
            SqlCeCommand command = new SqlCeCommand(deleteTech, conn);
            command.Parameters.Add("@TECHNOLOGYID", SqlDbType.Int).Value = lnkRemove.CommandArgument;

            try
            {

                conn.Open();
                SqlCeDataReader reader = command.ExecuteReader();
                //Response.Write(">>>>>>>>>>"+reader.RecordsAffected);
                if (reader.RecordsAffected==0)
                    lblMessage.Text = "Technology Cannot Be Deleted!!";
                else
                    lblMessage.Text = "Technology Deleted successfully!!";
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

        protected void showRTP(object sender, EventArgs e)
        {
            if(!chk)
                Response.Redirect("rtpMatrix.aspx?q="+queryParameter);
            else
                Response.Redirect("rtpMatrix.aspx");

        }
      
    }
}