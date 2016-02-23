using System;
using System.Collections.Generic;
using System.Data.SqlServerCe;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //B11.ForeColor = System.Drawing.Color.White;

            //if (!IsPostBack)
            {
                using (SqlCeConnection conn = new SqlCeConnection())
                {
                    conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PCF_CONNECTION"].ConnectionString;

                    string queryString = "";
                    String queryParameter = "";

                    if (!string.IsNullOrEmpty(Request.QueryString.Get("q")))
                    {
                        queryParameter = Request.QueryString.Get("q");

                        int length = queryParameter.Length;
                        int pos = queryParameter.IndexOf("where");
                        //string part = "";

                        if (queryParameter.IndexOf("where", StringComparison.OrdinalIgnoreCase) > 0)
                            queryParameter = queryParameter.Remove(0, queryParameter.IndexOf("where"));

                        queryString = "select technologyID,name,METHOD,abbreviation," +
                                     "ap_a1_v1, ap_a1_v2, ap_a1_v3,ap_a1_v4, ap_a2_v1, ap_a2_v2, ap_a2_v3, ap_a2_v4, ap_a3_v1, ap_a3_v2, ap_a3_v3, ap_a3_v4, ap_a4_v1, ap_a4_v2, ap_a4_v3, ap_a4_v4 " +
                                     "from technologies " +queryParameter;


                       
                        //Response.Write("<<<<,len"+length);
                        //Response.Write("pos"+pos);
                    }

                    //Response.Write(">>" + DropDownListTable.SelectedValue);
                    /*clear all the bulletedlist before creation*/
                    B11.Items.Clear();
                    B111.Items.Clear();
                    B12.Items.Clear();
                    B121.Items.Clear();
                    B13.Items.Clear();
                    B131.Items.Clear();
                    B14.Items.Clear();
                    B141.Items.Clear();
                    B21.Items.Clear();
                    B211.Items.Clear();
                    B22.Items.Clear();
                    B221.Items.Clear();
                    B23.Items.Clear();
                    B231.Items.Clear();
                    B24.Items.Clear();
                    B241.Items.Clear();
                    B31.Items.Clear();
                    B311.Items.Clear();
                    B32.Items.Clear();
                    B321.Items.Clear();
                    B33.Items.Clear();
                    B331.Items.Clear();
                    B34.Items.Clear();
                    B341.Items.Clear();
                    B41.Items.Clear();
                    B411.Items.Clear();
                    B42.Items.Clear();
                    B421.Items.Clear();
                    B43.Items.Clear();
                    B431.Items.Clear();
                    B44.Items.Clear();
                    B441.Items.Clear();






                    String Industrial_sector_Value = "";
                    if (!string.IsNullOrEmpty(Request.QueryString.Get("Industrial_sector_Value")))
                    {
                        Industrial_sector_Value = Request.QueryString.Get("Industrial_sector_Value");
                        DropDownListTable.SelectedValue = Industrial_sector_Value;
                        if (DropDownListTable.SelectedValue.Equals("2"))
                        {
                            TableRow11.Visible = true;
                            TableCell4.Visible = true;
                            TableCell17.Visible = true;
                            TableCell23.Visible = true;

                            TableRow1.Visible = false;
                            TableCell41.Visible = false;
                            TableCell171.Visible = false;
                            TableCell231.Visible = false;

                        }
                        else
                        {
                            TableRow11.Visible = false;
                            TableCell4.Visible = false;
                            TableCell17.Visible = false;
                            TableCell23.Visible = false;

                            TableRow1.Visible = true;
                            TableCell41.Visible = true;
                            TableCell171.Visible = true;
                            TableCell231.Visible = true;
                        }

                    }


                    String queryClause = " where Technologies.TechnologyId in (SELECT DISTINCT Technology FROM TCI WHERE (Context IN (SELECT ID FROM Contexts WHERE (Industrial_Sector in (" + DropDownListTable.SelectedValue + ")))))"; 

                    if (string.IsNullOrEmpty(Request.QueryString.Get("q")))
                        queryString = "select technologyID,name,METHOD,abbreviation," +
                                     "ap_a1_v1, ap_a1_v2, ap_a1_v3,ap_a1_v4, ap_a2_v1, ap_a2_v2, ap_a2_v3, ap_a2_v4, ap_a3_v1, ap_a3_v2, ap_a3_v3, ap_a3_v4, ap_a4_v1, ap_a4_v2, ap_a4_v3, ap_a4_v4 "+
                                     "from technologies" +queryClause;


                   // Response.Write(">>>>>>>>>>>" + queryString);

                    SqlCeCommand command = new SqlCeCommand(queryString, conn);

                    /* reader[2] = METHOD
                     * reader[3] = abbreviation
                     * 
                     * reader[4] = ap_a1_v1
                     * reader[5] = ap_a1_v2
                     * reader[6] = ap_a1_v3
                     * reader[7] = ap_a1_v4
                     * reader[8] = ap_a2_v1
                     * reader[9] = ap_a2_v2
                     * reader[10] = ap_a2_v3
                     * reader[11] = ap_a2_v4
                     * reader[12] = ap_a3_v1
                     * reader[13] = ap_a3_v2
                     * reader[14] = ap_a3_v3
                     * reader[15] = ap_a3_v4
                     * reader[16] = ap_a4_v1
                     * reader[17] = ap_a4_v2
                     * reader[18] = ap_a4_v3
                     * reader[19] = ap_a4_v4
                     
                    */

                    try
                    {
                        conn.Open();
                        SqlCeDataReader reader = command.ExecuteReader();
                        String path = "";
                        while (reader.Read())
                        {

                            if ((string.Equals(reader[4].ToString(), "true", StringComparison.OrdinalIgnoreCase)) )
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                             
                                    B11.BulletStyle = BulletStyle.CustomImage;
                                    B11.BulletImageUrl = "imgs/icons/method.png";
                                    B11.ToolTip = "Method";
                                    B11.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {

                                    B111.BulletStyle = BulletStyle.CustomImage;
                                    B111.BulletImageUrl = "imgs/icons/tool.png";
                                    B111.ToolTip = "Tool";
                                    B111.Items.Add(item);
                                }

                                B11.DataBind();
                                B111.DataBind();
                            }

                            if ((string.Equals(reader[5].ToString(), "true", StringComparison.OrdinalIgnoreCase)) )
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B12.BulletStyle = BulletStyle.CustomImage;
                                    B12.BulletImageUrl = "imgs/icons/method.png";
                                    B12.ToolTip = "Method";
                                    B12.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B121.BulletStyle = BulletStyle.CustomImage;
                                    B121.BulletImageUrl = "imgs/icons/tool.png";
                                    B121.ToolTip = "Tool";
                                    B121.Items.Add(item);
                                }

                                B12.DataBind();
                                B121.DataBind();
                            }

                            if ((string.Equals(reader[6].ToString(), "true", StringComparison.OrdinalIgnoreCase)))
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B13.BulletStyle = BulletStyle.CustomImage;
                                    B13.BulletImageUrl = "imgs/icons/method.png";
                                    B13.ToolTip = "Method";
                                    B13.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B131.BulletStyle = BulletStyle.CustomImage;
                                    B131.BulletImageUrl = "imgs/icons/tool.png";
                                    B131.ToolTip = "Tool";
                                    B131.Items.Add(item);
                                }

                                B13.DataBind();
                                B131.DataBind();
                            }

                            if ((string.Equals(reader[7].ToString(), "true", StringComparison.OrdinalIgnoreCase)) )
                            {

                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());
                                //item.Attributes.Add("list-style-image", "url("+imagePath+")");

                                //B14.Items.Add(item);

                                // Response.Write(">>>>>" + imagePath);

                                //ListItem listItem = new ListItem("Picture 1", "../adGallery/images/pictures/1.jpg");
                                //listItem.Attributes.Add("class", "Image");
                                //B14.Items.Add(listItem);
                                //listItem = new ListItem("Picture 2", "../adGallery/images/pictures/2.jpg");
                                //listItem.Attributes.Add("class", "image1");
                                //listItem.Attributes.Add("title", "A title for 10.jpg");
                                //B14.Items.Add(listItem);






                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B14.BulletStyle = BulletStyle.CustomImage;
                                    B14.BulletImageUrl = "imgs/icons/method.png";
                                    B14.ToolTip = "Method";
                                    B14.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B141.BulletStyle = BulletStyle.CustomImage;
                                    B141.BulletImageUrl = "imgs/icons/tool.png";
                                    B141.ToolTip = "Tool";
                                    B141.Items.Add(item);
                                }


                                B14.DataBind();
                                B141.DataBind();
                            }

                            //if ((string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase)) && (string.Equals(reader[11].ToString(), "true", StringComparison.OrdinalIgnoreCase)))
                            //{
                            //    ListItem item = new ListItem(reader[1].ToString(), "Technology.aspx?t=" + reader[0].ToString());
                            //    B15.Items.Add(item);

                            //    B15.DataBind();
                            //}


                            if ((string.Equals(reader[8].ToString(), "true", StringComparison.OrdinalIgnoreCase)) )
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B21.BulletStyle = BulletStyle.CustomImage;
                                    B21.BulletImageUrl = "imgs/icons/method.png";
                                    B21.ToolTip = "Method";
                                    B21.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B211.BulletStyle = BulletStyle.CustomImage;
                                    B211.BulletImageUrl = "imgs/icons/tool.png";
                                    B211.ToolTip = "Tool";
                                    B211.Items.Add(item);
                                }

                                B21.DataBind();
                                B211.DataBind();
                            }

                            if ((string.Equals(reader[9].ToString(), "true", StringComparison.OrdinalIgnoreCase)))
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B22.BulletStyle = BulletStyle.CustomImage;
                                    B22.BulletImageUrl = "imgs/icons/method.png";
                                    B22.ToolTip = "Method";
                                    B22.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B221.BulletStyle = BulletStyle.CustomImage;
                                    B221.BulletImageUrl = "imgs/icons/tool.png";
                                    B221.ToolTip = "Tool";
                                    B221.Items.Add(item);
                                }

                                B22.DataBind();
                                B221.DataBind();
                            }

                            if ((string.Equals(reader[10].ToString(), "true", StringComparison.OrdinalIgnoreCase)) )
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B23.BulletStyle = BulletStyle.CustomImage;
                                    B23.BulletImageUrl = "imgs/icons/method.png";
                                    B23.ToolTip = "Method";
                                    B23.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B231.BulletStyle = BulletStyle.CustomImage;
                                    B231.BulletImageUrl = "imgs/icons/tool.png";
                                    B231.ToolTip = "Tool";
                                    B231.Items.Add(item);
                                }

                                B23.DataBind();
                                B231.DataBind();
                            }

                            if ((string.Equals(reader[11].ToString(), "true", StringComparison.OrdinalIgnoreCase)) )
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B24.BulletStyle = BulletStyle.CustomImage;
                                    B24.BulletImageUrl = "imgs/icons/method.png";
                                    B24.ToolTip = "Method";
                                    B24.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B241.BulletStyle = BulletStyle.CustomImage;
                                    B241.BulletImageUrl = "imgs/icons/tool.png";
                                    B241.ToolTip = "Tool";
                                    B241.Items.Add(item);
                                }

                                B24.DataBind();
                                B241.DataBind();
                            }

                            //if ((string.Equals(reader[3].ToString(), "true", StringComparison.OrdinalIgnoreCase)) && (string.Equals(reader[11].ToString(), "true", StringComparison.OrdinalIgnoreCase)))
                            //{
                            //    ListItem item = new ListItem(reader[1].ToString(), "Technology.aspx?t=" + reader[0].ToString());
                            //    B25.Items.Add(item);

                            //    B25.DataBind();
                            //}


                            if ((string.Equals(reader[12].ToString(), "true", StringComparison.OrdinalIgnoreCase)) )
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B31.BulletStyle = BulletStyle.CustomImage;
                                    B31.BulletImageUrl = "imgs/icons/method.png";
                                    B31.ToolTip = "Method";
                                    B31.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B311.BulletStyle = BulletStyle.CustomImage;
                                    B311.BulletImageUrl = "imgs/icons/tool.png";
                                    B311.ToolTip = "Tool";
                                    B311.Items.Add(item);
                                }

                                B31.DataBind();
                                B311.DataBind();
                            }

                            if ((string.Equals(reader[13].ToString(), "true", StringComparison.OrdinalIgnoreCase)) )
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B32.BulletStyle = BulletStyle.CustomImage;
                                    B32.BulletImageUrl = "imgs/icons/method.png";
                                    B32.ToolTip = "Method";
                                    B32.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B321.BulletStyle = BulletStyle.CustomImage;
                                    B321.BulletImageUrl = "imgs/icons/tool.png";
                                    B321.ToolTip = "Tool";
                                    B321.Items.Add(item);
                                }

                                B32.DataBind();
                                B321.DataBind();
                            }

                            if ((string.Equals(reader[14].ToString(), "true", StringComparison.OrdinalIgnoreCase)) )
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B33.BulletStyle = BulletStyle.CustomImage;
                                    B33.BulletImageUrl = "imgs/icons/method.png";
                                    B33.ToolTip = "Method";
                                    B33.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B331.BulletStyle = BulletStyle.CustomImage;
                                    B331.BulletImageUrl = "imgs/icons/tool.png";
                                    B331.ToolTip = "Tool";
                                    B331.Items.Add(item);
                                }

                                B33.DataBind();
                                B331.DataBind();
                            }

                            if ((string.Equals(reader[15].ToString(), "true", StringComparison.OrdinalIgnoreCase)) )
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B34.BulletStyle = BulletStyle.CustomImage;
                                    B34.BulletImageUrl = "imgs/icons/method.png";
                                    B34.ToolTip = "Method";
                                    B34.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B341.BulletStyle = BulletStyle.CustomImage;
                                    B341.BulletImageUrl = "imgs/icons/tool.png";
                                    B341.ToolTip = "Tool";
                                    B341.Items.Add(item);
                                }

                                B34.DataBind();
                                B341.DataBind();
                            }

                            //if ((string.Equals(reader[4].ToString(), "true", StringComparison.OrdinalIgnoreCase)) && (string.Equals(reader[11].ToString(), "true", StringComparison.OrdinalIgnoreCase)))
                            //{
                            //    ListItem item = new ListItem(reader[1].ToString(), "Technology.aspx?t=" + reader[0].ToString());
                            //    B35.Items.Add(item);

                            //    B35.DataBind();
                            //}

                            if ((string.Equals(reader[16].ToString(), "true", StringComparison.OrdinalIgnoreCase)) )
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B41.BulletStyle = BulletStyle.CustomImage;
                                    B41.BulletImageUrl = "imgs/icons/method.png";
                                    B41.ToolTip = "Method";
                                    B41.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B411.BulletStyle = BulletStyle.CustomImage;
                                    B411.BulletImageUrl = "imgs/icons/tool.png";
                                    B141.ToolTip = "Tool";
                                    B411.Items.Add(item);
                                }

                                B41.DataBind();
                                B411.DataBind();
                            }

                            if ((string.Equals(reader[17].ToString(), "true", StringComparison.OrdinalIgnoreCase)) )
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B42.BulletStyle = BulletStyle.CustomImage;
                                    B42.BulletImageUrl = "imgs/icons/method.png";
                                    B42.ToolTip = "Method";
                                    B42.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B421.BulletStyle = BulletStyle.CustomImage;
                                    B421.BulletImageUrl = "imgs/icons/tool.png";
                                    B421.ToolTip = "Tool";
                                    B421.Items.Add(item);
                                }

                                B42.DataBind();
                                B421.DataBind();
                            }

                            if ((string.Equals(reader[18].ToString(), "true", StringComparison.OrdinalIgnoreCase)) )
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B43.BulletStyle = BulletStyle.CustomImage;
                                    B43.BulletImageUrl = "imgs/icons/method.png";
                                    B43.ToolTip = "Method";
                                    B43.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B431.BulletStyle = BulletStyle.CustomImage;
                                    B431.BulletImageUrl = "imgs/icons/tool.png";
                                    B431.ToolTip = "Tool";
                                    B431.Items.Add(item);
                                }

                                B43.DataBind();
                                B431.DataBind();
                            }

                            if ((string.Equals(reader[19].ToString(), "true", StringComparison.OrdinalIgnoreCase)) )
                            {
                                path = "";
                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                    path = "\"" + "imgs/icons/method.png" + "\"";
                                else
                                    path = "\"" + "imgs/icons/tool.png" + "\"";

                                String imagePath = "<img src= " + path + "/>";

                                ListItem item = new ListItem(reader[3].ToString(), "Technology.aspx?t=" + reader[0].ToString());

                                if (string.Equals(reader[2].ToString(), "true", StringComparison.OrdinalIgnoreCase))
                                {
                                    B44.BulletStyle = BulletStyle.CustomImage;
                                    B44.BulletImageUrl = "imgs/icons/method.png";
                                    B44.ToolTip = "Method";
                                    B44.Items.Add(item);
                                }
                                else if (string.Equals(reader[2].ToString(), "false", StringComparison.OrdinalIgnoreCase))
                                {
                                    B441.BulletStyle = BulletStyle.CustomImage;
                                    B441.BulletImageUrl = "imgs/icons/tool.png";
                                    B441.ToolTip = "Tool";
                                    B441.Items.Add(item);
                                }

                                B44.DataBind();
                                B441.DataBind();
                            }

                            //if ((string.Equals(reader[5].ToString(), "true", StringComparison.OrdinalIgnoreCase)) && (string.Equals(reader[11].ToString(), "true", StringComparison.OrdinalIgnoreCase)))
                            //{
                            //    ListItem item = new ListItem(reader[1].ToString(), "Technology.aspx?t=" + reader[0].ToString());
                            //    B45.Items.Add(item);

                            //    B45.DataBind();
                            //}


                            //if ((string.Equals(reader[6].ToString(), "true", StringComparison.OrdinalIgnoreCase)) && (string.Equals(reader[7].ToString(), "true", StringComparison.OrdinalIgnoreCase)))
                            //{
                            //    ListItem item = new ListItem(reader[1].ToString(), "Technology.aspx?t=" + reader[0].ToString());
                            //    B51.Items.Add(item);

                            //    B51.DataBind();
                            //}

                            //if ((string.Equals(reader[6].ToString(), "true", StringComparison.OrdinalIgnoreCase)) && (string.Equals(reader[8].ToString(), "true", StringComparison.OrdinalIgnoreCase)))
                            //{
                            //    ListItem item = new ListItem(reader[1].ToString(), "Technology.aspx?t=" + reader[0].ToString());
                            //    B52.Items.Add(item);

                            //    B52.DataBind();
                            //}

                            //if ((string.Equals(reader[6].ToString(), "true", StringComparison.OrdinalIgnoreCase)) && (string.Equals(reader[9].ToString(), "true", StringComparison.OrdinalIgnoreCase)))
                            //{
                            //    ListItem item = new ListItem(reader[1].ToString(), "Technology.aspx?t=" + reader[0].ToString());
                            //    B53.Items.Add(item);

                            //    B53.DataBind();
                            //}

                            //if ((string.Equals(reader[6].ToString(), "true", StringComparison.OrdinalIgnoreCase)) && (string.Equals(reader[10].ToString(), "true", StringComparison.OrdinalIgnoreCase)))
                            //{
                            //    ListItem item = new ListItem(reader[1].ToString(), "Technology.aspx?t=" + reader[0].ToString());
                            //    B54.Items.Add(item);

                            //    B54.DataBind();
                            //}

                            //if ((string.Equals(reader[6].ToString(), "true", StringComparison.OrdinalIgnoreCase)) && (string.Equals(reader[11].ToString(), "true", StringComparison.OrdinalIgnoreCase)))
                            //{
                            //    ListItem item = new ListItem(reader[1].ToString(), "Technology.aspx?t=" + reader[0].ToString());
                            //    B55.Items.Add(item);

                            //    B55.DataBind();
                            //}

                        }
                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(">>>>>>>>>>>" + ex.StackTrace.ToString());
                        //ex.StackTrace.ToString();
                    }
                }
            }
        }


        protected void DropDownListTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListTable.SelectedValue.Equals("2"))
            {
                TableRow11.Visible = true;
                TableCell4.Visible = true;
                TableCell17.Visible = true;
                TableCell23.Visible = true;

                TableRow1.Visible = false;
                TableCell41.Visible = false;
                TableCell171.Visible = false;
                TableCell231.Visible = false;

            }
            else
            {
                TableRow11.Visible = false;
                TableCell4.Visible = false;
                TableCell17.Visible = false;
                TableCell23.Visible = false;

                TableRow1.Visible = true;
                TableCell41.Visible = true;
                TableCell171.Visible = true;
                TableCell231.Visible = true;
            }
        }
}
}