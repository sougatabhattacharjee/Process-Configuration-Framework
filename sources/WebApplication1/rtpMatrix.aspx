<%@ Page Title="RTP Matrix" Language="C#" MasterPageFile="~/oneColumn.Master" AutoEventWireup="true" CodeFile="rtpMatrix.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
   <script type="text/javascript">
       function ddl_changed(ddl) {
           //alert(ddl.value);
           if (ddl.value == '2') 
               {
               
               document.getElementById("<%=TableRow11.ClientID %>").style.visibility = 'visible';
           document.getElementById("<%=TableRow1.ClientID %>").style.visibility = 'hidden';
           }
           else
           {
               document.getElementById("<%=TableRow1.ClientID %>").style.visibility = 'visible';
               document.getElementById("<%=TableRow11.ClientID %>").style.visibility = 'hidden';
              
           }

       }
    </script>
    
<style type="text/css">
    ul.BList li a{color:black ;
                  background-color: #CCCCCC;
                  list-style-type: none;
                  padding-left: 5px;
                  padding-right: 5px;
                  list-style-image: none;
list-style-type: none;
                 
    }
    ul.BList a:hover{color:black;
                     background-color:#FFFFFF;
                    
    }

    .bullet-list { list-style: none; padding: 0; margin: 0;}
</style>

          
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
     <div class="form_domain_100" style="grid-column-align:center; vertical-align:middle;">
                     <table class="table_form_100" style="vertical-align:middle;" >
                         <thead style="text-align:center;"> Select : &nbsp;
                              <%--OnSelectedIndexChanged="DropDownListTable_SelectedIndexChanged" AutoPostBack="true" onchange="ddl_changed(this)"--%>
                             <asp:DropDownList ID="DropDownListTable" runat="server" Enabled="true" OnSelectedIndexChanged="DropDownListTable_SelectedIndexChanged" AutoPostBack="true" >
                                 <asp:ListItem Value="1">Automotive</asp:ListItem>
                                <asp:ListItem Value="2"  Selected="True">Avionic</asp:ListItem>
                                 <asp:ListItem Value="3">Railway</asp:ListItem>
                             </asp:DropDownList></thead>
<tr>
                    <td style="width: 30px"><img src="imgs/abstr_lev_label.png"/></td>
                    <td>
                        
            <asp:Table ID="TableViewAbstr" runat="server" style="width: 932px; text-align: center; text-decoration:none; color:white; vertical-align:top; vertical-align:middle" border="1"  BorderColor="Maroon" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" CellSpacing="0">
               <%-- <asp:TableRow ID="TableRow6">
                     <asp:TableCell ID="TableCell35" ColumnSpan="7">View Point</asp:TableCell>
                    <asp:TableCell ID="TableCell36">View Point</asp:TableCell>
                    <asp:TableCell ID="TableCell37"></asp:TableCell>
                    <asp:TableCell ID="TableCell38"></asp:TableCell>
                    <asp:TableCell ID="TableCell39"></asp:TableCell>
                    <asp:TableCell ID="TableCell40"></asp:TableCell>
                </asp:TableRow>--%>
                
                 <asp:TableRow ID="TableRow1" BackColor="#990000" Visible="false">
                      <asp:TableCell ID="TableCell5" ForeColor="White">&nbsp;</asp:TableCell>
                    <asp:TableCell ID="TableCell6" ForeColor="White" Font-Bold="true">Operational Perspective</asp:TableCell>
                    <asp:TableCell ID="TableCell7" ForeColor="White" Font-Bold="true">Functional Perspective</asp:TableCell>
                    <asp:TableCell ID="TableCell8" ForeColor="White" Font-Bold="true">Logical Perspective</asp:TableCell>
                    <asp:TableCell ID="TableCell9" ForeColor="White" Font-Bold="true">Technical Perspective</asp:TableCell>
                    <%--<asp:TableCell ID="TableCell10" ForeColor="White" Font-Bold="true">Geometrical Perspective</asp:TableCell>--%>
                </asp:TableRow>
                 <asp:TableRow ID="TableRow11" BackColor="#990000" Visible="true">
                      <asp:TableCell ID="TableCell35" ForeColor="White">&nbsp;</asp:TableCell>
                    <asp:TableCell ID="TableCell36" ForeColor="White" Font-Bold="true">Requirement</asp:TableCell>
                    <asp:TableCell ID="TableCell37" ForeColor="White" Font-Bold="true">Functional</asp:TableCell>
                    <asp:TableCell ID="TableCell38" ForeColor="White" Font-Bold="true">Logical</asp:TableCell>
                    <asp:TableCell ID="TableCell39" ForeColor="White" Font-Bold="true">Technical</asp:TableCell>
                    
                </asp:TableRow>
                <asp:TableRow ID="r1" BackColor="#FFFBD6">
                     <asp:TableCell ID="TableCell4" ForeColor="White" Font-Bold="true" BackColor="#990000" Visible="true">Aircraft</asp:TableCell>
                    <asp:TableCell ID="TableCell41" ForeColor="White" Font-Bold="true" BackColor="#990000" Visible="false">Supersystem</asp:TableCell>
                    <asp:TableCell ID="cas11" ForeColor="Black"  HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ForeColor="Black" CssClass="BList" ID="B11" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B111" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <asp:TableCell ID="cc12" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B12" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B121" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <asp:TableCell ID="TableCell1" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B13" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B131" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <asp:TableCell ID="TableCell2" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B14" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B141" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <%--<asp:TableCell ID="TableCell3" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B15" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList></asp:TableCell>--%>
                </asp:TableRow>
                 <asp:TableRow ID="TableRow2" BackColor="White">
                     <asp:TableCell ID="TableCell11" ForeColor="White" Font-Bold="true" BackColor="#990000" Visible="true">System</asp:TableCell>
                    <asp:TableCell ID="TableCell12" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B21" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B211" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <asp:TableCell ID="TableCell13" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B22" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B221" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <asp:TableCell ID="TableCell14" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B23" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B231" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <asp:TableCell ID="TableCell15" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B24" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B241" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <%--<asp:TableCell ID="TableCell16" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B25" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList></asp:TableCell>--%>
                </asp:TableRow>
                 <asp:TableRow ID="TableRow3" BackColor="#FFFBD6">
                     <asp:TableCell ID="TableCell17" ForeColor="White" Font-Bold="true" BackColor="#990000" Visible="true">Equipment</asp:TableCell>
                     <asp:TableCell ID="TableCell171" ForeColor="White" Font-Bold="true" BackColor="#990000" Visible="false">Component</asp:TableCell>
                    <asp:TableCell ID="TableCell18" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B31" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B311" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <asp:TableCell ID="TableCell19" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B32" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B321" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <asp:TableCell ID="TableCell20" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B33" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B331" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <asp:TableCell ID="TableCell21" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B34" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B341" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <%--<asp:TableCell ID="TableCell22" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B35" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList></asp:TableCell>--%>
                </asp:TableRow>
                 <asp:TableRow ID="TableRow4" BackColor="White">
                     <asp:TableCell ID="TableCell23" ForeColor="White" Font-Bold="true" BackColor="#990000" Visible="true">Item(SW/HW)</asp:TableCell>
                     <asp:TableCell ID="TableCell231" ForeColor="White" Font-Bold="true" BackColor="#990000" Visible="false">Unit</asp:TableCell>
                    <asp:TableCell ID="TableCell24" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B41" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B411" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <asp:TableCell ID="TableCell25" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B42" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B421" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <asp:TableCell ID="TableCell26" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B43" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B431" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <asp:TableCell ID="TableCell27" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B44" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                        <asp:BulletedList runat="server" ID="B441" ForeColor="Black" CssClass="BList" DisplayMode="HyperLink" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList>
                    </asp:TableCell>
                    <%--<asp:TableCell ID="TableCell28" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B45" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList></asp:TableCell>--%>
                </asp:TableRow>
                <%-- <asp:TableRow ID="TableRow5" BackColor="#FFFBD6">
                     <asp:TableCell ID="TableCell29" ForeColor="White" Font-Bold="true" BackColor="#990000">Other</asp:TableCell>
                    <asp:TableCell ID="TableCell30" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B51" DisplayMode="HyperLink" ForeColor="White" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList></asp:TableCell>
                    <asp:TableCell ID="TableCell31" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B52" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList></asp:TableCell>
                    <asp:TableCell ID="TableCell32" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B53" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList></asp:TableCell>
                    <asp:TableCell ID="TableCell33" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B54" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList></asp:TableCell>
                    <asp:TableCell ID="TableCell34" ForeColor="Black" HorizontalAlign="Left" Wrap="false"><asp:BulletedList runat="server" ID="B55" DisplayMode="HyperLink" ForeColor="Black" CssClass="BList" datavaluefield="Url" datatextfield="Text" Target="_self"></asp:BulletedList></asp:TableCell>
                </asp:TableRow>--%>
            </asp:Table>
                    </td>
                </tr>


                          </table>         
                     </div>

   
              
</asp:Content>

