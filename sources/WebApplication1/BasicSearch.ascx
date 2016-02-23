<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BasicSearch.ascx.cs" Inherits="WebApplication1.BasicSearch" %>

  <table cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 30px; height: 30px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 30px"><img src="imgs/abstr_lev_label.png"/></td>
                    <td>
            <asp:Table ID="TableViewAbstr" runat="server" style="width: 632px; text-align: center; vertical-align:top" border="1" BackColor="#990000" BorderColor="Maroon" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" CellSpacing="0">
               <%-- <asp:TableRow ID="TableRow6">
                     <asp:TableCell ID="TableCell35" ColumnSpan="7">View Point</asp:TableCell>
                    <asp:TableCell ID="TableCell36">View Point</asp:TableCell>
                    <asp:TableCell ID="TableCell37"></asp:TableCell>
                    <asp:TableCell ID="TableCell38"></asp:TableCell>
                    <asp:TableCell ID="TableCell39"></asp:TableCell>
                    <asp:TableCell ID="TableCell40"></asp:TableCell>
                </asp:TableRow>--%>
                 <asp:TableRow ID="TableRow1">
                      <asp:TableCell ID="TableCell5">&nbsp;</asp:TableCell>
                    <asp:TableCell ID="TableCell6" ForeColor="White">Operational Perspective</asp:TableCell>
                    <asp:TableCell ID="TableCell7" ForeColor="White">Functional Perspective</asp:TableCell>
                    <asp:TableCell ID="TableCell8" ForeColor="White">Logical Perspective</asp:TableCell>
                    <asp:TableCell ID="TableCell9" ForeColor="White">Technical Perspective</asp:TableCell>
                    <asp:TableCell ID="TableCell10" ForeColor="White">Other Perspective</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="r1">
                     <asp:TableCell ID="TableCell4" ForeColor="White">Computer</asp:TableCell>
                    <asp:TableCell ID="cas11"><asp:CheckBox ID="cc11" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="cc12"><asp:CheckBox ID="CheckBox26" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell1"><asp:CheckBox ID="CheckBox27" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell2"><asp:CheckBox ID="CheckBox28" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell3"><asp:CheckBox ID="CheckBox29" runat="server"></asp:CheckBox></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow ID="TableRow2">
                     <asp:TableCell ID="TableCell11" ForeColor="White">Chip</asp:TableCell>
                    <asp:TableCell ID="TableCell12"><asp:CheckBox ID="CheckBox35" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell13"><asp:CheckBox ID="CheckBox36" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell14"><asp:CheckBox ID="CheckBox37" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell15"><asp:CheckBox ID="CheckBox38" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell16"><asp:CheckBox ID="CheckBox39" runat="server"></asp:CheckBox></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow ID="TableRow3">
                     <asp:TableCell ID="TableCell17" ForeColor="White">Board</asp:TableCell>
                    <asp:TableCell ID="TableCell18"><asp:CheckBox ID="CheckBox40" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell19"><asp:CheckBox ID="CheckBox41" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell20"><asp:CheckBox ID="CheckBox42" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell21"><asp:CheckBox ID="CheckBox43" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell22"><asp:CheckBox ID="CheckBox44" runat="server"></asp:CheckBox></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow ID="TableRow4">
                     <asp:TableCell ID="TableCell23" ForeColor="White">IP</asp:TableCell>
                    <asp:TableCell ID="TableCell24"><asp:CheckBox ID="CheckBox45" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell25"><asp:CheckBox ID="CheckBox46" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell26"><asp:CheckBox ID="CheckBox47" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell27"><asp:CheckBox ID="CheckBox48" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell28"><asp:CheckBox ID="CheckBox49" runat="server"></asp:CheckBox></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow ID="TableRow5">
                     <asp:TableCell ID="TableCell29" ForeColor="White">Other</asp:TableCell>
                    <asp:TableCell ID="TableCell30"><asp:CheckBox ID="CheckBox50" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell31"><asp:CheckBox ID="CheckBox51" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell32"><asp:CheckBox ID="CheckBox52" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell33"><asp:CheckBox ID="CheckBox53" runat="server"></asp:CheckBox></asp:TableCell>
                    <asp:TableCell ID="TableCell34"><asp:CheckBox ID="CheckBox54" runat="server"></asp:CheckBox></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
                    </td>
                </tr>
      </table>


                                    <table class="table_form">
                                        <tr>
                                            <td class="col1">
                                                <asp:Label ID="Label54" runat="server" CssClass="label" Text="SE phase:"></asp:Label>
                                            </td>

                                            <td class="col2">
                                                  <asp:SqlDataSource ID="All_SEPhase" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT SEphase.* FROM SEphase order by ID"></asp:SqlDataSource>
                                                <asp:DropDownList OnDataBound="Select_SE_Phase" ID="SEPhase" runat="server" DataSourceID="All_SEPhase" DataTextField="Name" DataValueField="ID" Height="22px" Width="200px">
                                                    
                                                </asp:DropDownList>
                                            </td>

                                        </tr>
                                       <tr>
                                            <td class="col1">
                                                <asp:Label ID="Label1" runat="server" CssClass="label" Text="Industrial Sector:"></asp:Label>
                                            </td>

                                            <td class="col2">


                                                  <asp:CheckBoxList ID="Industrial_sector" runat="server" DataSourceID="SqlDataSourceIndustrialSector" DataTextField="Name" DataValueField="ID">
                                                  </asp:CheckBoxList>

                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="col1">
                                                <asp:Label ID="Label2" runat="server" CssClass="label" Text="Size (PM):"></asp:Label>
                                            </td>

                                            <td class="col2">
                                                 
                                            &nbsp;&nbsp; Between
                                                
&nbsp;&nbsp;<asp:TextBox ID="ProcessSize1" runat="server" Height="22px" Width="31px"/> &nbsp; And&nbsp;&nbsp;
                                                <asp:TextBox ID="ProcessSize2" runat="server" Height="22px" Width="31px"></asp:TextBox>
                                                 
                                            </td>

                                        </tr>
                                        </table>
         

                                                  <asp:SqlDataSource ID="SqlDataSourceIndustrialSector" runat="server" ConnectionString="<%$ ConnectionStrings:PCF_CONNECTION %>" InsertCommand="INSERT INTO IndustrialSector(Name, Specification) VALUES (@Name, @Specification)" ProviderName="<%$ ConnectionStrings:PCF_CONNECTION.ProviderName %>" SelectCommand="SELECT IndustrialSector.* FROM IndustrialSector" OnSelecting="SqlDataSourceIndustrialSector_Selecting">
                                            <InsertParameters>
                                                <asp:Parameter Name="Name" />
                                                <asp:Parameter Name="Specification" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>

            <br />
            <%--<asp:Button ID="Button1" runat="server" Text="Insert" class="button gray" Width="83px"></asp:Button>--%>
               
            
            <asp:Button ID="Button1" runat="server" Text="Search" class="button gray" Width="89px" OnClick="Button2_Click"></asp:Button>

<asp:Button ID="Button3" runat="server" Text="RTP/Matrix" class="button gray" Width="89px" OnClick="showRTP"></asp:Button>

