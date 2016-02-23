using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class BasicSearch : System.Web.UI.UserControl
    {
        String Prosize1 = "";
        String Prosize2 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

           ArrayList Industrial_sector_Value = new ArrayList();
           String Ind_sector = "";
           String sePhase = SEPhase.SelectedValue;
           //string strItemValue = "";
           for (int i = 0; i < Industrial_sector.Items.Count; i++)
           {
               if (Industrial_sector.Items[i].Selected)
               {

                   Industrial_sector_Value.Add(Industrial_sector.Items[i]);
                   Ind_sector += ""+Industrial_sector.Items[i].Value.ToString()+",";
               }
           }
            if(!string.IsNullOrEmpty(Ind_sector))
           Ind_sector = Ind_sector.Remove(Ind_sector.Length - 1);
           String Prosize1 = ProcessSize1.Text;
           String Prosize2 = ProcessSize2.Text;




            TableRowCollection rows = TableViewAbstr.Rows;
            String result = "";

            
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
            Response.Write(">>>>>>>>" + result);
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
            Response.Redirect("rtpMatrix.aspx");
        }
}
}