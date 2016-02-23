using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace WebApplication1
{
    public partial class BasicSearch1 : System.Web.UI.Page
    {
        String Prosize1 = "";
        String Prosize2 = "";
        String result = "";
        String sePhase = "";
        String Ind_sector = "";
        String queryParameter = "";
        Boolean chk = true;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void Button2_Click(object sender, EventArgs e)
        {

            ArrayList Industrial_sector_Value = new ArrayList();
            
            sePhase = SEPhase.SelectedValue;
            //string strItemValue = "";
            for (int i = 0; i < Industrial_sector.Items.Count; i++)
            {
                if (Industrial_sector.Items[i].Selected)
                {

                    Industrial_sector_Value.Add(Industrial_sector.Items[i]);
                    Ind_sector += "" + Industrial_sector.Items[i].Value.ToString() + ",";
                }
            }
            if (!string.IsNullOrEmpty(Ind_sector))
                Ind_sector = Ind_sector.Remove(Ind_sector.Length - 1);
            String Prosize1 = ProcessSize1.Text;
            String Prosize2 = ProcessSize2.Text;




            TableRowCollection rows = TableViewAbstr.Rows;
           


            for (int i = 0; i < rows.Count; i++)
            {
                TableCellCollection cells = rows[i].Cells;
                for (int j = 0; j < cells.Count; j++)
                {
                    if (cells[j].Controls != null)
                    {
                        foreach (Control co in cells[j].Controls)
                        {
                            CheckBox cb = (CheckBox)co;
                            if (cb.Checked)
                            {
                                result += i + "" + j + ",";
                            }
                        }
                    }
                }

            }
           // Response.Write(">>>>>>>>" + result);
            if (!String.IsNullOrEmpty(result))
                result = result.Remove(result.Length - 1);
            //Response.Write(">>>>>>>>"+result);
            Response.Redirect("showTechnology.aspx?p=" + result + "&sePhase=" + sePhase + "&Industrial_sector_Value=" + Ind_sector + "&Prosize1=" + Prosize1 + "&Prosize2=" + Prosize2 + "&search=search");


        }
        protected void SqlDataSourceIndustrialSector_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
        protected void Select_SE_Phase(Object sender, EventArgs e)
        {
            SEPhase.Items.Insert(0, new ListItem("All Phases", String.Empty));
        }

        protected void showRTP(object sender, EventArgs e)
        {

            ArrayList Industrial_sector_Value = new ArrayList();

            sePhase = SEPhase.SelectedValue;
            //string strItemValue = "";
            for (int i = 0; i < Industrial_sector.Items.Count; i++)
            {
                if (Industrial_sector.Items[i].Selected)
                {

                    Industrial_sector_Value.Add(Industrial_sector.Items[i]);
                    Ind_sector += "" + Industrial_sector.Items[i].Value.ToString() + ",";
                }
            }
            if (!string.IsNullOrEmpty(Ind_sector))
                Ind_sector = Ind_sector.Remove(Ind_sector.Length - 1);
            String Prosize1 = ProcessSize1.Text;
            String Prosize2 = ProcessSize2.Text;




            TableRowCollection rows = TableViewAbstr.Rows;



            for (int i = 0; i < rows.Count; i++)
            {
                TableCellCollection cells = rows[i].Cells;
                for (int j = 0; j < cells.Count; j++)
                {
                    if (cells[j].Controls != null)
                    {
                        foreach (Control co in cells[j].Controls)
                        {
                            CheckBox cb = (CheckBox)co;
                            if (cb.Checked)
                            {
                                result += i + "" + j + ",";
                            }
                        }
                    }
                }

            }
            // Response.Write(">>>>>>>>" + result);
            if (!String.IsNullOrEmpty(result))
                result = result.Remove(result.Length - 1);
            
            
            
            
            String parameter = result;

            String[] arrayParameter = new String[25];

            if (!String.IsNullOrEmpty(parameter))
            {
                arrayParameter = parameter.Split(',');
                queryParameter += " where ";
            }
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

            if (!String.IsNullOrEmpty(sePhase))
            {
                if (chk)
                {
                    queryParameter += " where SE_Phase=" + sePhase;
                    chk = false;
                }
                else
                    queryParameter += " and SE_Phase=" +sePhase;

            }

            if (!String.IsNullOrEmpty(Ind_sector))
            {
                if (chk)
                {
                    queryParameter += " where Technologies.TechnologyId in (SELECT DISTINCT Technology FROM TCI WHERE (Context IN (SELECT ID FROM Contexts WHERE (Industrial_Sector in (" + Ind_sector.Trim() + ")))))";
                    chk = false;
                }
                else
                    queryParameter += " and Technologies.TechnologyId in (SELECT DISTINCT Technology FROM TCI WHERE (Context IN (SELECT ID FROM Contexts WHERE (Industrial_Sector in (" + Ind_sector + ")))))";
            }

            if (!String.IsNullOrEmpty(Prosize1) && !String.IsNullOrEmpty(Prosize2))
            {
                if (chk)
                {
                    queryParameter += " where Technologies.TechnologyId in (SELECT DISTINCT Technology FROM TCI WHERE (Context IN (SELECT ID FROM Contexts WHERE (Project_Size between " + Prosize1 + " and " + Prosize2 + "))))";
                    chk = false;
                }
                else
                    queryParameter += " and Technologies.TechnologyId in (SELECT DISTINCT Technology FROM TCI WHERE (Context IN (SELECT ID FROM Contexts WHERE (Project_Size between " + Prosize1 + " and " + Prosize2 + "))))";
            }




            if (!chk)
                Response.Redirect("rtpMatrix.aspx?q=" + queryParameter + "&Industrial_sector_Value=" + Ind_sector);
            else
                Response.Redirect("rtpMatrix.aspx");
        }
        protected void Industrial_sector_DataBound(object sender, EventArgs e)
        {
            
               // Industrial_sector.Items[0].Enabled = true;
               // Industrial_sector.Items[2].Enabled = true;
            
        }


        protected void Industrial_sector_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
}
}